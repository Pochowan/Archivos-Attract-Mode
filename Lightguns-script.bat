@Echo off
if not "%1" == "max" start /MAX cmd /c %0 max & exit/b

title Actualizando script,espera...
echo.

echo Descargando,espera...

reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v HotkeyOnly /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v InitialToggle /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Sound /t REG_DWORD /d 0 /f

echo.
echo Descargando script,espera...
echo.
powershell -command "& {iwr https://github.com/Pochowan/Instalador-Attract-Mode-Pack-Base-738Gb/raw/refs/heads/main/Configurar-Lightguns.rar -OutFile Configurar-Lightguns.rar}"
echo.

cls

echo Descomprimiendo,espera...

"C:\Program Files\7-Zip\7z.exe" x Configurar-Lightguns.rar -y > NUL

cls

echo Instalado,el script iniciara en 10 segundos...

timeout /t 10

powershell -command Remove-Item -recurse 'Configurar-Lightguns.rar' -erroraction 'silentlycontinue'

start "" "Configurar Lightguns.exe"

msg * Actualizado script (1 de Julio 2025)

exit


