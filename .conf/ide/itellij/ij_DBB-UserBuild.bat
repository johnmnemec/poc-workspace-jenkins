@REM Sample script to run an IBM DBB User Build from IntelliJ (IBM zOS DevOps Team - NLopez)
@REM  Notes: Uses the current users SSH credential to logon to zOS and perform the build
@REM         Build logs are returned in the local folder i-dbb-logs
@REM         Assumes the current project is Git Based
@REM --
@REM TODO, convert git clone to work from local to remote to avoid user from having to push at each commit fo a USS clone/pull
@REM IJ CMD.exe  /C "i_DBB-UserBuild.bat $FilePath$ $FileDir$ $FileName$  $ProjectFileDir$"


:setLocals
    @ECHO OFF
    rem echo on
    SETLOCAL enabledelayedexpansion

    set FilePath=%1
    set FileDir=%2
    set FileName=%3
    set ProjectFileDir=%4

    cd %ProjectFileDir%

    REM Set a local log folder for build output
	set ilog=ij_dbb_logs
	mkdir %ilog%  >nul 2>&1

    REM Get the root folder of the current repo
	for /f "usebackq tokens=*" %%a in (`git rev-parse --show-toplevel`) do (set "git_root=%%a")
	cd %git_root%

    REM Get the remote REPO URL for cloing on zOS
	for /f "tokens=*" %%a in ('git config --get remote.origin.url') do (set "remote_url=%%a")

	echo Building  %FileName% ...
    call :getParent %FilePath% parent

:setRemote
	rem Note: dont add extra spaces to end of a var
	set zOS=mywazi
	set SH=SSH %zOS% . ./.profile;

	set wkdir=tmp/intellij-workspace
	set dbb_workspace=poc-workspace
	set dbb_app=poc-app
	set dbb_hlq=IBMUSER.INTELLIJ

	set dbb_build_mode=userBuild
	set dbb_build_cmd="-DBB_DAEMON_HOST 127.0.0.1 -DBB_DAEMON_PORT 8180 $DBB_HOME/dbb-zappbuild/build.groovy"

:clone_on_zOS
    echo pushing your changes to git
    git add .
    git commit -m "DBB Build Push"
    git push

    rem check if a clone was done
    %sh% "if [ -d %wkdir%/%dbb_workspace%  ]; then exit 0; else exit 12; fi"
    if %errorlevel% equ 0 (
        echo refreshing remote zos repo - git pull
        %sh% "cd %wkdir%/%dbb_workspace%; git pull;  git log -n 1"
    ) else (
        echo initializing remote zos repo - git clone
        %sh% "cd %wkdir%; git clone %remote_url%; cd %dbb_workspace%; git log -n 1"
    )

:dbb_User_build
    %sh% "rm %wkdir%/%dbb_workspace%/*.log "
	%sh% "groovyz %dbb_build_cmd% --workspace %wkdir%/%dbb_workspace% --application %dbb_app% -outDir %wkDir%/%dbb_workspace% --hlq %dbb_HLQ%  --logEncoding iso8859-1  --userBuild %dbb_app%/%parent%/%FileName% "

:getBuildLogs
    cd %ProjectFileDir%

    rem Build ftp batch script
    echo get %wkdir%/%dbb_workspace%/*.log         %ilog%   > ftpBat
    echo get %wkdir%/%dbb_workspace%/*.html        %ilog%  >> ftpBat
    echo exit                                              >> ftpBat

    sftp  -b ftpBat %zOS% > nul
    echo Done - DBB build logs added to %ilog%
    del ftpbat


:Done
exit /b 0

REM Functions
:getParent
    setlocal
    for %%a in ("%~p1\.") do set "parent=%%~nxa"
    set filename=%%~n1
    endlocal & set %2=%parent%
    goto :EOF
