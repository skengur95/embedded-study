@echo off
cd /d "%~dp0"

echo ========================================
echo   embedded-study : commit ^& push
echo ========================================
echo.

git status --short
echo.

set /p msg="오늘 한 일: "

if "%msg%"=="" (
    echo.
    echo [취소] 메시지가 비어 있습니다.
    pause
    exit /b
)

echo.
git add .
git commit -m "%msg%"

if errorlevel 1 (
    echo.
    echo [알림] 커밋할 변경사항이 없습니다.
    pause
    exit /b
)

git push

if errorlevel 1 (
    echo.
    echo [오류] 푸시 실패. 네트워크나 인증을 확인하세요.
) else (
    echo.
    echo [완료] 푸시되었습니다.
)

echo.
pause
