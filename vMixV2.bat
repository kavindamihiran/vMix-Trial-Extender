@echo off
setlocal

:: =====================================================================================
::         EDUCATIONAL SCRIPT: HYPOTHETICAL TRIAL RESET (DESTRUCTIVE)
::
::  PURPOSE: To demonstrate how an analyst might use forensic findings to attempt
::           to reset a software's trial state.
::
::  WARNING: THIS SCRIPT IS DESTRUCTIVE. IT DELETES FILES AND REGISTRY KEYS.
::           IT IS BASED ON A HYPOTHETICAL ANALYSIS.
::
::  ***   DO NOT RUN THIS ON A REAL SYSTEM. USE A VIRTUAL MACHINE SNAPSHOT.   ***
:: =====================================================================================

echo.
echo  *****************************************************************
echo  *              DESTRUCTIVE TRIAL RESET DEMONSTRATION            *
echo  *****************************************************************
echo.
echo  WARNING: This script will attempt to delete specific files and
echo  registry keys based on a forensic analysis.
echo.
echo  This is a high-risk operation. PROCEED ONLY IN A VIRTUAL MACHINE.
echo.
pause

:: --- Make sure the target application is not running ---
echo [+] Attempting to terminate the vMix process to unlock files...
taskkill /f /im vmix.exe >nul 2>&1
if %errorlevel% equ 0 (
    echo    [SUCCESS] vMix process was terminated.
) else (
    echo    [INFO] vMix process was not found running.
)
echo.

:: =====================================================================================
:: STEP 1: Delete the Hypothetical Lock File
:: This path is based on our fictional discovery in Process Monitor.
:: =====================================================================================
set "LockFile=%ProgramData%\vMix\license.lock"

echo [+] Searching for lock file: %LockFile%
if exist "%LockFile%" (
    echo    [FOUND] Attempting to delete the lock file...
    del /f /q "%LockFile%"
    if not exist "%LockFile%" (
        echo    [SUCCESS] The file was deleted.
    ) else (
        echo    [FAIL] Could not delete the file. It may be protected.
    )
) else (
    echo    [CLEAR] The lock file was not found.
)
echo.

:: =====================================================================================
:: STEP 2: Delete the Hypothetical Registry Key
:: This key is based on our fictional discovery in Process Monitor.
:: The /f switch forces deletion without a "Yes/No" prompt.
:: =====================================================================================
set "RegKey=HKEY_CURRENT_USER\SOFTWARE\StudioCoast\vMix\State"

echo [+] Searching for registry key: %RegKey%
reg query "%RegKey%" >nul 2>&1
if %errorlevel% equ 0 (
    echo    [FOUND] Attempting to delete the registry key...
    reg delete "%RegKey%" /f
    
    :: Verify deletion
    reg query "%RegKey%" >nul 2>&1
    if not %errorlevel% equ 0 (
        echo    [SUCCESS] The registry key was deleted.
    ) else (
        echo    [FAIL] Could not delete the registry key. It may be protected.
    )
) else (
    echo    [CLEAR] The registry key was not found.
)
echo.

:: =====================================================================================
:: FINAL MESSAGE
:: =====================================================================================
echo  *****************************************************************
echo  *                       OPERATION COMPLETE                      *
echo  *****************************************************************
echo.
echo  The script has finished its attempt to remove the trial traces.
echo  You can now try running the application again to test the hypothesis.
echo.
echo  If the trial is still expired, it means the software uses more
echo  advanced protection, like Hardware ID (HWID) fingerprinting.
echo.
pause
exit