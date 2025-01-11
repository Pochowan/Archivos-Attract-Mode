@Echo off
if not "%1" == "max" start /MAX cmd /c %0 max & exit/b

title Actualizando script,espera...
echo.

echo Descargando,espera...

reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v HotkeyOnly /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v InitialToggle /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Sound /t REG_DWORD /d 0 /f

powershell -command "& {iwr https://github.com/Pochowan/Instalador-Attract-Mode-Pack-Base-738Gb/raw/refs/heads/main/Paquete-update-3-Lightguners.rar -OutFile Paquete-update-3-Lightguners.rar}"

cls

echo Descomprimiendo,espera...

"C:\Program Files\7-Zip\7z.exe" x Paquete-update-3-Lightguners.rar -y > NUL

cls

echo Instalado,el script para configurar Lightguns iniciara en 10 segundos...

timeout /t 10

powershell -command Remove-Item -recurse 'Paquete-update-3-Lightguners.rar' -erroraction 'silentlycontinue'

start "" "Configurar Lightguns.exe"

msg * Modo Arcade The House Of The Dead 3 instalado.
msg * Teclas especiales Rshift desactivadas (no se pulsara accidentalmente)
msg * Bezels Sega Model 2 corregidos.
msg * (Super Nintendo) Lethal Enforcers ahora se puede jugar a 2 jugadores.
msg * (Super Nintendo) T2 Arcade ahora se puede jugar a 2 jugadores (mira acelerada)
msg * (Super Nintendo) Operation Thunderbolt modo para 2 jugadores,tiene un bug al iniciar,mira paralizada.
msg * Nuevas opciones disponibles para añadir contenido extra (Activar/desactivar mira ,cabmio de formato,todo dentro de AttracT Mode)
msg * Actualizado script (12 de Enero 2025)

exit


