@Echo off
if not "%1" == "max" start /MAX cmd /c %0 max & exit/b

title Actualizando script,espera...
echo.

echo Descargando,espera...
echo.
powershell -command "& {iwr https://github.com/Pochowan/Instalador-Attract-Mode-Pack-Base-738Gb/raw/refs/heads/main/Paquete-update-3.rar -OutFile Paquete-update-3.rar}"
echo.
cls
echo.
echo Descomprimiendo,espera...

"C:\Program Files\7-Zip\7z.exe" x Paquete-update-3.rar -y > NUL
echo.
cls
echo.
echo Instalado,el script para configurar Lightguns iniciara en 10 segundos...
echo.
timeout /t 10

powershell -command Remove-Item -recurse 'Paquete-update-3.rar' -erroraction 'silentlycontinue'

start "" "Configurar Lightguns.exe"

msg * Actualizado (7 Enero 2025).

exit


