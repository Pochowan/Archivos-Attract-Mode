@Echo off
if not "%1" == "max" start /MAX cmd /c %0 max & exit/b

title Actualizando script,espera...
echo.

echo Descargando,espera...

powershell -command "& {iwr https://github.com/Pochowan/Instalador-Attract-Mode-Pack-Base-738Gb/raw/refs/heads/main/Paquete-update-3-Lightguners.rar -OutFile Paquete-update-3-Lightguners.rar}"

"C:\Program Files\7-Zip\7z.exe" x Paquete-update-3-Lightguners.rar -y > NUL

timeout /t 10

powershell -command Remove-Item -recurse 'Paquete-update-3-Lightguners.rar' -erroraction 'silentlycontinue'

start "" "Configurar Lightguns.exe"

msg * Actualizado.

exit

