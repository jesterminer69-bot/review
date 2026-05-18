@echo off
setlocal
cd /d "%~dp0"
set PORT=8873
where py >nul 2>nul
if %errorlevel%==0 (
  start "PMV3 Candles Preview Server" /min py -m http.server %PORT% --bind 127.0.0.1
) else (
  start "PMV3 Candles Preview Server" /min python -m http.server %PORT% --bind 127.0.0.1
)
timeout /t 2 >nul
start "" "http://127.0.0.1:%PORT%/index.html"
echo.
echo Local preview opened at http://127.0.0.1:%PORT%/index.html
echo Keep the small server window open while viewing the page.
pause
