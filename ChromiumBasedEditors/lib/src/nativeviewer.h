#ifndef APPLICATION_NATIVEVIEWER_H
#define APPLICATION_NATIVEVIEWER_H

#include "../../../../core/DesktopEditor/graphics/TemporaryCS.h"
#include "../../../../core/DesktopEditor/graphics/BaseThread.h"
#include "../../../../core/DesktopEditor/graphics/Timer.h"
#include "../../../../core/DesktopEditor/common/File.h"
#include "../../../../core/DesktopEditor/common/Directory.h"
#include "../../../../core/DesktopEditor/fontengine/ApplicationFonts.h"
#include "../../../../core/DesktopEditor/graphics/GraphicsRenderer.h"
#include "../../../../core/DesktopEditor/raster/BgraFrame.h"

#include "../../../../core/Common/OfficeFileFormatChecker.h"
#include "../../../../core/PdfReader/PdfReader.h"
#include "../../../../core/DjVuFile/DjVu.h"
#include "../../../../core/XpsFile/XpsFile.h"
#include "../../../../core/HtmlRenderer/include/HTMLRenderer3.h"

#include "Logger.h"

#include <list>

class INativeViewer_Events
{
public:
    virtual void OnDocumentOpened(const std::string& sBase64) = 0;
    virtual void OnPageSaved(const std::wstring& sUrl, const int& nPageNum, const int& nPageW, const int& nPageH) = 0;
    virtual void OnPageText(const int& page, const int& paragraphs, const int& words, const int& symbols, const int& spaces, const std::string& sBase64Data) = 0;
};

class CNativeViewerPageInfo
{
public:
    int Page;
    int W;
    int H;

public:
    CNativeViewerPageInfo()
    {
        Clear();
    }

    bool operator==(const CNativeViewerPageInfo& other) const {
      return ((Page == other.Page) && (W == other.W) && (H == other.H));
    }

    void Clear()
    {
        Page = -1;
        W = 0;
        H = 0;
    }
};

class CNativeViewer : public NSTimers::CTimer
{
private:
    int                     m_nFileType;

    IOfficeDrawingFile*     m_pReader;

    std::wstring            m_sFileDir;
    std::wstring            m_sFontsDir;

    std::list<CNativeViewerPageInfo> m_arTasks;
    CNativeViewerPageInfo m_oCurrentTask;
    NSCriticalSection::CRITICAL_SECTION m_oCS;

    CApplicationFonts       m_oFonts;

    int                     m_lPagesCount;

    INativeViewer_Events*   m_pEvents;

    CFontManager*           m_pFontManager;
    CImageFilesCache*       m_pImageCache;

    std::wstring            m_sOpeningFilePath;
    std::string             m_sBase64File;

    double*                 m_pPageWidths;
    double*                 m_pPageHeights;

    int m_lTextPageCount;
    NSHtmlRenderer::CASCHTMLRenderer3* m_pHtmlRenderer;

    int m_nIntervalTimerDraw;
    int m_nIntervalTimer;

public:
    CNativeViewer() : NSTimers::CTimer()
    {
        m_nFileType = 0;

        m_pReader = NULL;
        m_pEvents = NULL;

        m_pFontManager = NULL;
        m_pImageCache = NULL;

        m_oCS.InitializeCriticalSection();

        m_pPageWidths = NULL;
        m_pPageHeights = NULL;

        m_pHtmlRenderer = NULL;
        m_lTextPageCount = 0;

        m_nIntervalTimer = 1;
        m_nIntervalTimerDraw = 40;
        SetInterval(m_nIntervalTimer);
    }

    virtual ~CNativeViewer()
    {
        Stop();
        CloseFile();

        RELEASEINTERFACE(m_pFontManager);
        RELEASEINTERFACE(m_pImageCache);

        m_oCS.DeleteCriticalSection();

        RELEASEARRAYOBJECTS(m_pPageWidths);
        RELEASEARRAYOBJECTS(m_pPageHeights);
    }

public:

    std::string GetBase64File()
    {
        CTemporaryCS oCS(&m_oCS);
        return m_sBase64File;
    }

    void SetEventListener(INativeViewer_Events* pEvents)
    {
        m_pEvents = pEvents;
    }

    void Init(const std::wstring& sFileDir,
                const std::wstring& sFontsDir,
                const std::wstring& sOpeningFilePath,
                INativeViewer_Events* pEvents)
    {
        m_sFileDir = sFileDir;
        m_sFontsDir = sFontsDir;
        m_sOpeningFilePath = sOpeningFilePath;
        m_pEvents = pEvents;

        this->Start(0);
    }

public:

    void OpenFile(const std::wstring& sFilePath, int nFileType = 0)
    {
        m_nFileType = 0;
        if (0 == nFileType)
        {
            COfficeFileFormatChecker oChecker;
            if (oChecker.isOfficeFile(sFilePath))
                nFileType = oChecker.nFileType;
        }

        if (0 != nFileType)
            m_oFonts.InitializeFromFolder(m_sFontsDir);

        int nFileTypeOpen = 0;

        switch (nFileType)
        {
        case AVS_OFFICESTUDIO_FILE_CROSSPLATFORM_PDF:
        {
            m_pReader = new PdfReader::CPdfReader(&m_oFonts);
            nFileTypeOpen = AVS_OFFICESTUDIO_FILE_CROSSPLATFORM_PDF;
            break;
        }
        case AVS_OFFICESTUDIO_FILE_CROSSPLATFORM_XPS:
        {
            m_pReader = new CXpsFile(&m_oFonts);
            nFileTypeOpen = AVS_OFFICESTUDIO_FILE_CROSSPLATFORM_XPS;
            break;
        }
        case AVS_OFFICESTUDIO_FILE_CROSSPLATFORM_DJVU:
        {
            m_pReader = new CDjVuFile(&m_oFonts);
            nFileTypeOpen = AVS_OFFICESTUDIO_FILE_CROSSPLATFORM_DJVU;
            break;
        }
        default:
            break;
        }

        NSDirectory::CreateDirectory(m_sFileDir + L"/tmp");
        m_pReader->SetTempDirectory(m_sFileDir + L"/tmp");

        if (m_pReader->LoadFromFile(sFilePath))
        {
            m_nFileType = nFileTypeOpen;
            m_pHtmlRenderer = new NSHtmlRenderer::CASCHTMLRenderer3();
        }

        std::string sBase64Info = "";
        if (m_nFileType > 0)
        {
            m_pFontManager = m_oFonts.GenerateFontManager();
            CFontsCache* pFontsCache = new CFontsCache();
            pFontsCache->SetStreams(m_oFonts.GetStreams());
            m_pFontManager->SetOwnerCache(pFontsCache);
            m_pImageCache = new CImageFilesCache(&m_oFonts);
            pFontsCache->SetCacheSize(16);
           // m_pFontManager->SetSubpixelRendering(true, false);

            m_lPagesCount = m_pReader->GetPagesCount();

            if (0 < m_lPagesCount)
            {
                m_pPageWidths = new double[m_lPagesCount];
                m_pPageHeights = new double[m_lPagesCount];
            }

            bool bIsBreak = false;

            //LOGGER_STRING2("pagescount: " + std::to_string(m_lPagesCount))
            if (m_lPagesCount > 0)
            {
                int* pData = new int[1 + m_lPagesCount * 2];
                int* pDataCur = pData;
                *pDataCur++ = m_lPagesCount;
                for (int i = 0; i < m_lPagesCount; ++i)
                {
                    double dWidth = 0, dHeight = 0, dDpiX = 0, dDpiY = 0;
                    m_pReader->GetPageInfo(i, &dWidth, &dHeight, &dDpiX, &dDpiY);

                    if (fabs(dWidth) < 0.1 || fabs(dHeight) < 0.1 || fabs(dDpiX) < 0.1 || fabs(dDpiY) < 0.1)
                    {
                        sBase64Info = "";
                        bIsBreak = true;
                        break;
                    }

                    dWidth = dWidth * 25.4 / dDpiX;
                    dHeight = dHeight * 25.4 / dDpiY;

                    m_pPageWidths[i] = dWidth;
                    m_pPageHeights[i] = dHeight;

                    *pDataCur++ = (int)(dWidth * 10000);
                    *pDataCur++ = (int)(dHeight * 10000);

                    //LOGGER_STRING2("page" + std::to_string(i) + ": " + std::to_string(dWidth) + " - " + std::to_string(dHeight));
                }

                if (!bIsBreak)
                {
                    char* pDataDst = NULL;
                    int nDataDst = 0;
                    NSFile::CBase64Converter::Encode((BYTE*)pData, (1 + 2 * m_lPagesCount) * sizeof(int), pDataDst, nDataDst, NSBase64::B64_BASE64_FLAG_NOCRLF);
                    sBase64Info = std::string(pDataDst, nDataDst);
                    RELEASEARRAYOBJECTS(pDataDst);

                    sBase64Info = std::to_string((1 + 2 * m_lPagesCount) * sizeof(int)) + ";" + sBase64Info;
                }
                else
                {
                    sBase64Info = "error";
                }

                RELEASEARRAYOBJECTS(pData);
            }
        }
        else
        {
            sBase64Info = "error";
        }

        m_oCS.Enter();
        m_sBase64File = sBase64Info;
        m_oCS.Leave();
    }

    void CloseFile()
    {
        CTemporaryCS oCS(&m_oCS);

        Stop();
        if (m_nFileType > 0)
        {
            m_pReader->Close();
            RELEASEOBJECT(m_pReader);
        }

        m_nFileType = 0;
    }

    std::wstring AddTask(const CNativeViewerPageInfo& oInfo, int nPageStart, int nPageEnd)
    {
        CTemporaryCS oCS(&m_oCS);

        // 1) удаляем из очереди все страницы, которых уже нет на экране
        // а также страницу с таким же индексом
        std::list<CNativeViewerPageInfo>::iterator find = m_arTasks.begin();
        while (find != m_arTasks.end())
        {
            if (find->Page < nPageStart || find->Page > nPageEnd || find->Page == oInfo.Page)
                find = m_arTasks.erase(find);
            else
                find++;
        }
        // 2) теперь нужно понять, есть ли такая страница на диске
        if (oInfo == m_oCurrentTask)
            return L"";

        // 3) проверяем, есть ли нужный файл.
        std::wstring sPath = GetPathPageImage(oInfo);
        if (NSFile::CFileBinary::Exists(sPath))
            return sPath;

        // 4) ничего не подходит, добавляем задачу
        m_arTasks.push_back(oInfo);
        return L"";
    }

    inline std::wstring GetPathPageImage(const CNativeViewerPageInfo& oInfo)
    {
        return m_sFileDir + L"/media/page" + std::to_wstring(oInfo.Page) + L"_" + std::to_wstring(oInfo.W) + L"x" + std::to_wstring(oInfo.H) + L".png";
    }

protected:
    virtual void OnTimer()
    {
        // функция отрисовки страницы
        if (!m_sOpeningFilePath.empty())
        {
            this->OpenFile(m_sOpeningFilePath);
            m_sOpeningFilePath = L"";
            return;
        }

        m_oCS.Enter();
        if (0 == m_arTasks.size())
        {
            // очередь пуста. Ничего не делаем
            m_oCS.Leave();

            // теперь смотрим, есть ли текстовые задачи
            if (m_pHtmlRenderer)
            {
                if (m_nFileType == AVS_OFFICESTUDIO_FILE_CROSSPLATFORM_DJVU)
                {
                    m_lTextPageCount = m_lPagesCount;
                    m_pEvents->OnPageText(m_lPagesCount - 1, 0, 0, 0, 0, "0;");
                }

                if (m_lTextPageCount >= m_lPagesCount)
                {
                    RELEASEOBJECT(m_pHtmlRenderer);
                }
                else
                {
                    if (0 == m_lTextPageCount)
                    {
                        m_pHtmlRenderer->SetOnlyTextMode(true);
                        m_pHtmlRenderer->CreateOfficeFile(L"temp/temp", m_sFontsDir);
                    }

                    m_pHtmlRenderer->NewPage();
                    m_pHtmlRenderer->BeginCommand(c_nPageType);

                    m_pHtmlRenderer->put_Width(m_pPageWidths[m_lTextPageCount]);
                    m_pHtmlRenderer->put_Height(m_pPageHeights[m_lTextPageCount]);

                    m_pHtmlRenderer->SetAdditionalParam("DisablePageEnd", L"yes");
                    m_pReader->DrawPageOnRenderer(m_pHtmlRenderer, m_lTextPageCount, NULL);
                    m_pHtmlRenderer->SetAdditionalParam("DisablePageEnd", L"no");

                    int paragraphs = 0;
                    int words = 0;
                    int symbols = 0;
                    int spaces = 0;
                    std::string info;
                    m_pHtmlRenderer->GetLastPageInfo(paragraphs, words, symbols, spaces, info);

                    m_pHtmlRenderer->EndCommand(c_nPageType);
                    ++m_lTextPageCount;

                    m_pEvents->OnPageText(m_lTextPageCount - 1, paragraphs, words, symbols, spaces, info);
                }

                if (m_lTextPageCount >= m_lPagesCount)
                {
                    RELEASEOBJECT(m_pHtmlRenderer);
                    SetInterval(m_nIntervalTimerDraw);
                }
            }

            return;
        }

        m_oCurrentTask = m_arTasks.front();
        m_arTasks.pop_front();
        m_oCS.Leave();

        CBgraFrame oFrame;
        int nRasterW = m_oCurrentTask.W;
        int nRasterH = m_oCurrentTask.H;

        int nMax = 4000;
        if (nRasterW > nMax || nRasterH > nMax)
        {
            int nRasterMax = std::max(nRasterW, nRasterH);
            nRasterW = (int)(nRasterW * ((double)nMax / nRasterMax));
            nRasterH = (int)(nRasterH * ((double)nMax / nRasterMax));
        }

        oFrame.put_Width(nRasterW);
        oFrame.put_Height(nRasterH);
        oFrame.put_Stride(4 * nRasterW);

        BYTE* pDataRaster = new BYTE[4 * nRasterW * nRasterH];
        memset(pDataRaster, 0xFF, 4 * nRasterW * nRasterH);
        oFrame.put_Data(pDataRaster);

        CGraphicsRenderer oRenderer;
        oRenderer.SetFontManager(m_pFontManager);
        oRenderer.SetImageCache(m_pImageCache);

        oRenderer.CreateFromBgraFrame(&oFrame);
        oRenderer.SetTileImageDpi(96.0);

        oRenderer.SetSwapRGB(false);
        oRenderer.put_Width(m_pPageWidths[m_oCurrentTask.Page]);
        oRenderer.put_Height(m_pPageHeights[m_oCurrentTask.Page]);

        m_pReader->DrawPageOnRenderer(&oRenderer, m_oCurrentTask.Page, NULL);

        std::wstring sPath = GetPathPageImage(m_oCurrentTask);
        oFrame.SaveFile(sPath, 4);

        if (sPath.c_str()[0] == '/')
            sPath = L"file://" + sPath;
        else
            sPath = L"file:///" + sPath;

        m_pEvents->OnPageSaved(sPath, m_oCurrentTask.Page, m_oCurrentTask.W, m_oCurrentTask.H);

        m_oCS.Enter();
        m_oCurrentTask.Clear();
        m_oCS.Leave();
    }
};

#endif // APPLICATION_NATIVEVIEWER_H