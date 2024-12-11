@echo off

:: Change directory to the location of the batch file
cd /d "%~dp0"

:: Get the current date and time in a locale-independent way
for /f "tokens=2 delims==" %%a in ('wmic os get LocalDateTime /value ^| find "="') do set datetime_raw=%%a

:: Extract components from the raw datetime string (format: YYYYMMDDHHMMSS...)
set yyyy=%datetime_raw:~0,4%
set mm=%datetime_raw:~4,2%
set dd=%datetime_raw:~6,2%
set hh=%datetime_raw:~8,2%
set nn=%datetime_raw:~10,2%

:: Combine into the desired format
set datetime=%yyyy%%mm%%dd%_%hh%%nn%

:: Create the new folder
mkdir %datetime%

:: Optional: Output the folder name for confirmation
echo Created folder: %datetime%
