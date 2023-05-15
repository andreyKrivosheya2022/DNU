@echo off
chcp 65001

setlocal enabledelayedexpansion

set "rootDirectory=C:\Users\hp\Лабораторные\Группа\ФИО\batch"

for /d %%D in ("%rootDirectory%\*") do (
    set "subDirectory=%%D"
    for /f %%F in ('dir /a-d /b /s "%%D" ^| find /v /c "::"') do (
        set "fileCount=%%F"
    )
    echo Кількість файлів в підкаталозі "!subDirectory!" = !fileCount!
)

pause 
endlocal
