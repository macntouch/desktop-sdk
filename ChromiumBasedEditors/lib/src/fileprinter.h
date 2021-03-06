/*
 * (c) Copyright Ascensio System SIA 2010-2016
 *
 * This program is a free software product. You can redistribute it and/or
 * modify it under the terms of the GNU Affero General Public License (AGPL)
 * version 3 as published by the Free Software Foundation. In accordance with
 * Section 7(a) of the GNU AGPL its Section 15 shall be amended to the effect
 * that Ascensio System SIA expressly excludes the warranty of non-infringement
 * of any third-party rights.
 *
 * This program is distributed WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR  PURPOSE. For
 * details, see the GNU AGPL at: http://www.gnu.org/licenses/agpl-3.0.html
 *
 * You can contact Ascensio System SIA at Lubanas st. 125a-25, Riga, Latvia,
 * EU, LV-1021.
 *
 * The  interactive user interfaces in modified source and object code versions
 * of the Program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU AGPL version 3.
 *
 * Pursuant to Section 7(b) of the License you must retain the original Product
 * logo when distributing the program. Pursuant to Section 7(e) we decline to
 * grant you any rights under trademark law for use of our trademarks.
 *
 * All the Product's GUI elements, including illustrations and icon sets, as
 * well as technical writing content are licensed under the terms of the
 * Creative Commons Attribution-ShareAlike 4.0 International. See the License
 * terms at http://creativecommons.org/licenses/by-sa/4.0/legalcode
 *
 */

#ifndef ASC_CEFCONVERTER_FILEPRINTER_H
#define ASC_CEFCONVERTER_FILEPRINTER_H

#include "./applicationmanager_p.h"
#include "./additional/manager.h"

class CPagePrintData
{
public:
    std::string Base64;
    double      Width;
    double      Height;

    CPagePrintData()
    {
        Width   = 0;
        Height  = 0;
    }
};

class IAscNativePrintDocument
{
public:
    std::wstring        m_sFilePath;
    CApplicationFonts*  m_pApplicationFonts;
    std::wstring        m_sTempFolder;

public:

    virtual void Draw(IRenderer* pRenderer, int nPageIndex) = 0;
    virtual void PreOpen(int nFileType) = 0;
    virtual void Open(const std::wstring& sPath, const std::wstring& sRecoveryDir) = 0;
    virtual void Close() = 0;

    virtual void Check(CArray<CPagePrintData>& arPages) = 0;
};

class CPrintData
{
public:
    CArray<CPagePrintData> m_arPages;
    int m_nCurrentPage;
    std::wstring m_sFrameUrl;
    std::wstring m_sDocumentUrl;
    std::wstring m_sThemesUrl;

    std::map<std::wstring, std::wstring> m_mapImages;
    std::map<std::wstring, std::wstring> m_mapImagesDelete;

    std::wstring m_sDocumentImagesPath;
    std::wstring m_sPresentationThemesPath;

    CFontManager* m_pFontManager;
    CImageFilesCache* m_pCache;

    CApplicationFonts* m_pApplicationFonts;
    AscEditorType m_eEditorType;

    IAscNativePrintDocument* m_pNativePrinter;

    std::wstring m_sTempWaterMark;
    std::wstring m_sRasterWatermark;
    int m_lRasterWatermarkW;
    int m_lRasterWatermarkH;

    CApplicationManagerAdditionalBase* m_pAdditional;

public:
    enum CommandType
    {
        ctPenXML						= 0,
        ctPenColor						= 1,
        ctPenAlpha						= 2,
        ctPenSize						= 3,
        ctPenDashStyle					= 4,
        ctPenLineStartCap				= 5,
        ctPenLineEndCap				    = 6,
        ctPenLineJoin					= 7,
        ctPenDashPatern				    = 8,
        ctPenDashPatternCount			= 9,
        ctPenDashOffset				    = 10,
        ctPenAlign						= 11,
        ctPenMiterLimit				    = 12,

        // brush
        ctBrushXML						= 20,
        ctBrushType					    = 21,
        ctBrushColor1					= 22,
        ctBrushColor2					= 23,
        ctBrushAlpha1					= 24,
        ctBrushAlpha2					= 25,
        ctBrushTexturePath				= 26,
        ctBrushTextureAlpha			    = 27,
        ctBrushTextureMode				= 28,
        ctBrushRectable				    = 29,
        ctBrushRectableEnabled 		    = 30,
        ctBrushGradient                 = 31,

        // font
        ctFontXML						= 40,
        ctFontName						= 41,
        ctFontSize						= 42,
        ctFontStyle					    = 43,
        ctFontPath						= 44,
        ctFontGID						= 45,
        ctFontCharSpace				    = 46,

        // shadow
        ctShadowXML					    = 50,
        ctShadowVisible				    = 51,
        ctShadowDistanceX				= 52,
        ctShadowDistanceY				= 53,
        ctShadowBlurSize				= 54,
        ctShadowColor					= 55,
        ctShadowAlpha					= 56,

        // edge
        ctEdgeXML						= 70,
        ctEdgeVisible					= 71,
        ctEdgeDistance					= 72,
        ctEdgeColor					    = 73,
        ctEdgeAlpha					    = 74,

        // text
        ctDrawText						= 80,
        ctDrawTextEx					= 81,

        // pathcommands
        ctPathCommandMoveTo			    = 91,
        ctPathCommandLineTo			    = 92,
        ctPathCommandLinesTo			= 93,
        ctPathCommandCurveTo			= 94,
        ctPathCommandCurvesTo			= 95,
        ctPathCommandArcTo		        = 96,
        ctPathCommandClose				= 97,
        ctPathCommandEnd				= 98,
        ctDrawPath						= 99,
        ctPathCommandStart				= 100,
        ctPathCommandGetCurrentPoint	= 101,
        ctPathCommandText				= 102,
        ctPathCommandTextEx			    = 103,

        // image
        ctDrawImage					    = 110,
        ctDrawImageFromFile			    = 111,

        ctSetParams					    = 120,

        ctBeginCommand					= 121,
        ctEndCommand					= 122,

        ctSetTransform					= 130,
        ctResetTransform				= 131,

        ctClipMode						= 140,

        ctCommandLong1					= 150,
        ctCommandDouble1				= 151,
        ctCommandString1				= 152,
        ctCommandLong2					= 153,
        ctCommandDouble2				= 154,
        ctCommandString2				= 155,

        ctPageWidth                     = 200,
        ctPageHeight                    = 201,

        ctPageStart                     = 202,
        ctPageEnd                       = 203,

        // gradients

        ctGradientFill					= 220,
        ctGradientFillXML				= 221,

        ctGradientStroke				= 222,
        ctGradientStrokeXML				= 223,

        ctError						    = 255
    };

public:
    CPrintData();
    ~CPrintData();

    void Print_Start();
    void Print_End();

    void Print(NSEditorApi::CAscPrinterContextBase* pContext, const CAscPrintSettings& settings, const int& nPageIndex);
    bool CheckPrintRotate(NSEditorApi::CAscPrinterContextBase* pContext, const CAscPrintSettings& settings, const int& nPageIndex);
    void DrawOnRenderer(CGraphicsRenderer* pRenderer, int nPageIndex);
    void TestSaveToRasterFile(std::wstring sFile, int nWidth, int nHeight, int nPageIndex);
    std::wstring GetImagePath(const std::wstring& sPath);
    void FitToPage(float fSourceWidth, float  fSourceHeight, float  fTargetWidth, float fTargetHeight, float& fResX, float& fResY, float& fResWidth, float& fResHeight);
    std::wstring DownloadImage(const std::wstring& strFile);
    void CalculateImagePaths();
};

#endif // ASC_CEFCONVERTER_FILEPRINTER_H
