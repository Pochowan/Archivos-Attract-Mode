@Echo off
if not "%1" == "max" start /MAX cmd /c %0 max & exit/b

title Actualizando script,espera...
echo.

reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v HotkeyOnly /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v InitialToggle /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Sound /t REG_DWORD /d 0 /f

echo.
echo Descargando parches (25Mb),espera...(1 de 5)
echo.
powershell -command "& {iwr https://github.com/Pochowan/Instalador-Attract-Mode-Pack-Base-738Gb/raw/refs/heads/main/Paquete-update-3.rar -OutFile Paquete-update-3.rar}"
echo.
echo Descargando Archivos de contenido (741Mb),espera...(2 de 5)
echo.
powershell -command "& {iwr https://github.com/Pochowan/Archivos-Attract-Mode/releases/download/Archivos/Archivos-Lightguns.rar -OutFile Archivos-Lightguns.rar}"
echo.
echo Descargando contenido extra de Sega Master System (57Mb),espera...(3 de 5)
echo.
powershell -command "& {iwr https://github.com/Pochowan/Archivos-Attract-Mode/releases/download/Archivos/master-Herramientas-Lightguners.rar -OutFile master-Herramientas-Lightguners.rar}"
echo.
echo Descargando contenido extra de Super Nintendo Entertainment System (43Mb),espera...(4 de 5)
echo.
powershell -command "& {iwr https://github.com/Pochowan/Archivos-Attract-Mode/releases/download/Archivos/Snes-Herramientas-Lightguners.rar -OutFile Snes-Herramientas-Lightguners.rar}"
echo.
echo Descargando contenido extra de Nintendo Entertainment System (37Mb),espera...(5 de 5)
echo.
powershell -command "& {iwr https://github.com/Pochowan/Archivos-Attract-Mode/releases/download/Archivos/Nes-Herramientas-Lightguners.rar -OutFile Nes-Herramientas-Lightguners.rar}"
echo.
echo Descargando attract.cfg,espera...
echo.
powershell -command "& {iwr https://github.com/Pochowan/Attract-cfg-update/raw/refs/heads/main/attract-Lightguns.rar -OutFile attract-Lightguns.rar}"
cls
echo Descomprimiendo,espera...

"C:\Program Files\7-Zip\7z.exe" x Archivos-Lightguns.rar -y > NUL
"C:\Program Files\7-Zip\7z.exe" x master-Herramientas-Lightguners.rar -y > NUL
"C:\Program Files\7-Zip\7z.exe" x Snes-Herramientas-Lightguners.rar -y > NUL
"C:\Program Files\7-Zip\7z.exe" x Nes-Herramientas-Lightguners.rar -y > NUL
"C:\Program Files\7-Zip\7z.exe" x Paquete-update-3.rar -y > NUL
"C:\Program Files\7-Zip\7z.exe" x attract-Lightguns.rar -y > NUL

echo.
powershell -Command "(gc 'plugins\RocketLauncher\Settings\Herramientas-master\Emulators.ini') -replace ('Attract Mode Lightguners','Attract Mode') | Set-Content 'plugins\RocketLauncher\Settings\Herramientas-master\Emulators.ini'
powershell -Command "(gc 'plugins\RocketLauncher\Settings\Sega Master System (Lightguns)\Emulators.ini') -replace ('Attract Mode Lightguners','Attract Mode') | Set-Content 'plugins\RocketLauncher\Settings\Sega Master System (Lightguns)\Emulators.ini'
powershell -Command "(gc 'emulators\Herramientas-master.cfg') -replace ('Attract Mode Lightguners','Attract Mode') | Set-Content 'emulators\Herramientas-master.cfg'
echo.

echo.
powershell -Command "(gc 'plugins\RocketLauncher\Settings\Herramientas-snes\Emulators.ini') -replace ('Attract Mode Lightguners','Attract Mode') | Set-Content 'plugins\RocketLauncher\Settings\Herramientas-snes\Emulators.ini'
powershell -Command "(gc 'plugins\RocketLauncher\Settings\Super Nintendo Entertainment System (Lightguns)\Emulators.ini') -replace ('Attract Mode Lightguners','Attract Mode') | Set-Content 'plugins\RocketLauncher\Settings\Super Nintendo Entertainment System (Lightguns)\Emulators.ini'
powershell -Command "(gc 'emulators\Herramientas-snes.cfg') -replace ('Attract Mode Lightguners','Attract Mode') | Set-Content 'emulators\Herramientas-snes.cfg'
echo.

echo.
powershell -Command "(gc 'plugins\RocketLauncher\Settings\Herramientas-nes\Emulators.ini') -replace ('Attract Mode Lightguners','Attract Mode') | Set-Content 'plugins\RocketLauncher\Settings\Herramientas-nes\Emulators.ini'
powershell -Command "(gc 'plugins\RocketLauncher\Settings\Nintendo Entertainment System (Lightguns)\Emulators.ini') -replace ('Attract Mode Lightguners','Attract Mode') | Set-Content 'plugins\RocketLauncher\Settings\Nintendo Entertainment System (Lightguns)\Emulators.ini'
powershell -Command "(gc 'emulators\Herramientas-nes.cfg') -replace ('Attract Mode Lightguners','Attract Mode') | Set-Content 'emulators\Herramientas-nes.cfg'
echo.

cls

echo Instalado,el script para configurar el pack Lightguns iniciara en 10 segundos...

timeout /t 10

powershell -command Remove-Item -recurse 'Paquete-update-3.rar' -erroraction 'silentlycontinue'
powershell -command Remove-Item -recurse 'Archivos-Lightguns.rar' -erroraction 'silentlycontinue'
powershell -command Remove-Item -recurse 'master-Herramientas-Lightguners.rar' -erroraction 'silentlycontinue'
powershell -command Remove-Item -recurse 'snes-Herramientas-Lightguners.rar' -erroraction 'silentlycontinue'
powershell -command Remove-Item -recurse 'Nes-Herramientas-Lightguners.rar' -erroraction 'silentlycontinue'
powershell -command Remove-Item -recurse 'attract-Lightguns.rar' -erroraction 'silentlycontinue'

start "" "Configurar Lightguns.exe"

msg * (Super Nintendo) Lethal Enforcers ahora se puede jugar a 2 jugadores.
msg * (Super Nintendo) T2 Arcade ahora se puede jugar a 2 jugadores (mira acelerada)
msg * (Super Nintendo) Operation Thunderbolt modo para 2 jugadores,tiene un bug al iniciar,mira paralizada.
msg * (Super Nintendo) Tin Star y Battle Clash,ahora se puede salir despues de calibrar (boton izquierdo o derecho)
msg * (Nintendo) A�adido botones para saltar subtitulos en Laser Invasion (para jugar elegir Laser Scope desde el menu de opciones)
msg * (Sega Master System) Core actualizado y funcional,2 jugadores en Gangter Town.
msg * (The House Of The Dead 3) Arreglo de carga del juego y controles.
msg * (Modulos y scripts actualizados) Carga mas rapida de juegos , archivos para nuevas configuraciones en los Emuladores.
msg * Nuevas opciones disponibles para a�adir contenido extra (Activar/desactivar mira ,cambio de formato,todo dentro de Attract Mode)
msg * (Sinden Lightguns) A�adidos mapeos faltantes para coins. (22 de Febrero 2025)
msg * (Configurador actualizado) Se elimino las rutas portables,ahora las rutas son completas. (22 de Febrero 2025)
msg * (Virtua Cop 3) Arreglo para detectar pistola y arreglo de ruta en modulo. (27 de Febrero 2025)
msg * (Extreme Hunter) Arreglo para carga de video. (27 de Febrero 2025)
msg * (Extreme Hunter 2) Boton de recarga arreglado. (27 de Febrero 2025)
msg * (Sega Naomi) Arreglo para moverse en modo test (boton derecho) , hay que cambiar a Controller en Retroarch. (27 de Febrero 2025)
msg * (OpenFire TeknoParrot) Corregido nombres por defecto y mapeos,instalacion individual para OpenFIRE y Gun4ir. (19 de Junio 2025)
msg * (PlayStation) A�adido emulador Duckstation con soporte para 2 Lightguns,modulo autochequeo de ID. (28 de Junio 2025)
msg * (Sony Playstation 3) Scripts corregidos para detectar las pistolas. (1 de Julio 2025)
msg * Actualizado script (1 de Julio 2025)

exit


