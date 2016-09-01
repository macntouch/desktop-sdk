#ifndef APPLICATION_CEF_H
#define APPLICATION_CEF_H

#include "base.h"

class CApplicationCEF_Private;
class CAscApplicationManager;
class Q_DECL_EXPORT CApplicationCEF
{
protected:
    CApplicationCEF_Private* m_pInternal;

public:

    CApplicationCEF();

    int Init_CEF(CAscApplicationManager* , int argc = 0, char* argv[] = NULL);
    virtual ~CApplicationCEF();
    void Close();

    int RunMessageLoop(bool& is_runned);
    void DoMessageLoopEvent();
    bool ExitMessageLoop();

    bool IsChromiumSubprocess();

    static bool IsMainProcess(int argc = 0, char* argv[] = NULL);
};

#endif // APPLICATION_CEF_H