::if exist .rom\*.nes (timeout 1)
::goto errorMessangeNoRom


::errorMessangeNoRom:
::echo off
::echo copy your Castlevania nes file into the .rom folder.
::pause

::assembleGame:
@echo off 
if exist castlevania.nes (del castlevania.nes)

::copy ..\export\bank_00.asm bank_00.asm
findstr /V "ORG " ..\bank_00.asm > bank_00.asm
findstr /V "ORG " ..\bank_01.asm > bank_01.asm
findstr /V "ORG " ..\bank_02.asm > bank_02.asm
findstr /V "ORG " ..\bank_03.asm > bank_03.asm
findstr /V "ORG " ..\bank_04.asm > bank_04.asm
findstr /V "ORG " ..\bank_05.asm > bank_05.asm
findstr /V "ORG " ..\bank_06.asm > bank_06.asm
findstr /V "ORG " ..\bank_07.asm > bank_07.asm
copy ..\labels.asm labels.asm

::assembleGame
..\asar\asar.exe --fix-checksum=off mainNES.asm

::copy /b "nesHeader.bin" + "mainNES.sfc" castlevania.nes
type nesHeader.bin mainNES.sfc > castlevania.nes				

::cleanup
del mainNES.sfc
timeout 2 
exit