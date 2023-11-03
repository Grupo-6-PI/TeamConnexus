@REM scrip backup do index.html
@echo off

setlocal enabledelayedexpansion

@REM Defina a pasta de origem e destino
set "source=..\"
set "target=backup"

@REM Obtenha a data e hora atual para criar a pasta de backup
for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set datetime=%%a
set "datestamp=!datetime:~0,8!"
set "timestamp=!datetime:~8,6!"
set "fullstamp=!datestamp:~6,2!-!datestamp:~4,2!-!datestamp:~0,4!_!timestamp:~0,2!-!timestamp:~2,2!-!timestamp:~4,2!"

@REM Crie a pasta de backup com a data e hora formatada
set "folder=%target%\%fullstamp%"
set "folder=!folder: =_!"

md "!folder!"

@REM Use xcopy para copiar as pastas e arquivos para a pasta de backup
xcopy "%source%\index.html" "!folder!\index.html" /E /I /Y

@REM copia a pasta assets, css e js, para o backup
xcopy "%source%\assets" "!folder!\assets" /E /I /Y
xcopy "%source%\css" "!folder!\css" /E /I /Y
@REM xcopy "%source%\js" "!folder!\js" /E /I /Y

echo Backup concluído em: "!folder!"