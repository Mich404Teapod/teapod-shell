@echo off
echo by epiost
title teapod
echo reward tutorial in epicprograms website
:CONFIRM
echo Do you want to program the teapod? (Y/N)
set/p "cho=>"
if %cho%==Y goto Teapod
if %cho%==y goto Teapod
if %cho%==n goto END
if %cho%==N goto END
echo bad choice type Y for yes and N for no.
goto CONFIRM
:Teapod
set/p "import=>"
if %import%==import.System12 goto VALIDATE
echo error:System12 not exist
pause
goto Teapod
:VALIDATE
echo System12 load
goto COMMAND
:COMMAND
set/p "Command=>"
if %Command%==delete set/p "docdelete=>"
del %docdelete%
if %Command%==attrib set/p "ControlPanel=>"
attrib h+ s+  %ControlPanel%
goto COMMAND
:END