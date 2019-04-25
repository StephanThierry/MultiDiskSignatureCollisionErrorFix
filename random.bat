@echo off
set "x=1"
:SymLoop
    echo select disk %x%
    set rng=%RANDOM%%RANDOM%
    set rng=%rng:~0,8%
    echo uniqueid disk id=%rng%
    if "%x%"=="%1" goto :endLoop
    SET /a "x+=1"
    GOTO :SymLoop
:endLoop

echo exit