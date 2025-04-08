@echo off
@chcp 1252 > nul
setlocal enabledelayedexpansion

set source="\\Sas-ct-39927\servidor\Nova pasta"
set baseDestination="D:\SERVIDOR\backup"

:: Formatar a data e a hora
for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
    set day=%%i
    set month=%%j
    set year=%%k
)

for /f "tokens=1-3 delims=:. " %%i in ("%time%") do (
    set hour=%%i
    set minute=%%j
    set second=%%k
)

:: Remover espaços em branco na variável hour
if "!hour:~0,1!"==" " set hour=0!hour:~1,1!

:: Construir o destino final no formato desejado
set formattedDate=!year!-!month!-!day! !hour!;!minute!;!second!
set destination=!baseDestination!\Nova pasta !formattedDate!

:: Executar o robocopy
robocopy %source% "%destination%" /E

endlocal
