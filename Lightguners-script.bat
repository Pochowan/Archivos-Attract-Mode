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
powershell -command "& {iwr https://github.com/Pochowan/Instalador-Attract-Mode-Pack-Base-738Gb/raw/refs/heads/main/Configurar-Lightguners.rar -OutFile Configurar-Lightguners.rar}"
echo.

cls

echo Descomprimiendo,espera...

"C:\Program Files\7-Zip\7z.exe" x Configurar-Lightguners.rar -y > NUL

cls

echo Instalado,el script para configurar el pack Lightguners iniciara en 10 segundos...

timeout /t 10

powershell -command Remove-Item -recurse 'Configurar-Lightguners.rar' -erroraction 'silentlycontinue'

start "" "Configurar Lightguns.exe"

msg * Actualizado script (10 de Marzo 2025)

exit


