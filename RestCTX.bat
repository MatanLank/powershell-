@echo off
:menu
set m=="4"
goto RST65715
:RST65
	Mode 55,40
	title Reset Citrix Profile 6.5
	color 1F
	set /p usrname=Enter User Name ? 
	if %usrname% =="" goto menu

	cls
	Echo . 
	Echo . 
	Echo  _______________________________
	Echo (Deleting old Backup in Redirect)
	Echo  -------------------------------
	Echo . 
	Echo . 
	if exist "\\asfs\xenappprof$\Redirect\%usrname%.Bak" GoTo RemoveBk65
	Echo =========================================
	ECHO ---------------No   Backup---------------
	Echo =========================================
	
	goto CLRPRFRD65
	
	:RemoveBk65
	rd "\\asfs\xenappprof$\Redirect\%usrname%.Bak" /s /q
	Echo =========================================
	Echo ------- BackUp    Removed ---------------
	Echo =========================================
	goto CLRPRFRD65

	:CLRPRFRD65
	timeout /t 2
	cls
	Echo . 
	Echo . 
	Echo  ______________________________________________
	Echo (Removing and BackingUp old Profile in redirect)
	Echo  ----------------------------------------------
	Echo . 
	Echo . 
	if exist "\\asfs\xenappprof$\Redirect\%usrname%" goto CLRFRD65
	Echo =========================================
	echo ------ No    Profile---------------------
	Echo =========================================
	goto CLRUPM65

	:CLRFRD65
	ren "\\asfs\xenappprof$\Redirect\%usrname%" %usrname%.Bak
	Echo =========================================
	echo -------Redirect    Profile    Renamed----
	Echo =========================================
	
	:CLRUPM65
	timeout /t 2
	cls
	Echo . 
	Echo . 
	Echo  __________________________
	Echo (Deleting old Backup in UPM)
	Echo  --------------------------
	Echo . 
	Echo . 
	if exist "\\asfs\xenappprof$\UPM\%usrname%.upm.Bak" goto RemoveUPM65
	Echo =========================================
	ECHO ----------No   Backup--------------------
	Echo =========================================
	GOTO UPMRD65
	
	:RemoveUPM65
	rd "\\asfs\xenappprof$\UPM\%usrname%.upm.Bak" /s/q
	Echo =========================================
	Echo -------BackUp      Removed---------------
	Echo =========================================
	
	:UPMRD65
	timeout /t 2
	cls
	Echo Removing and BackingUp old Profile in UPM
	if exist "\\asfs\xenappprof$\UPM\%usrname%.upm" GoTo CLRUPM65
	Echo =========================================
	echo --------No    UPM    PROFILE-------------
	Echo =========================================
	
	goto end65

	:CLRUPM65
	ren "\\asfs\xenappprof$\UPM\%usrname%.upm" %usrname%.upm.Bak
	Echo =========================================
	ECHO --------UPM     PROFILE   RENAMED--------
	Echo =========================================

	:End65
	timeout /t 2
	CLS
	color a0
	Echo ==================================================
	Echo ==================================================
	Echo =========Redirect and Upm profile Renamed=========
	Echo ==================================================
	Echo ==================================================
	
	timeout /t 5
	if %m%=="4" Goto RST715

	goto menu

:RST715
	@echo off
	title Reset Citrix Profile 7.15
	color 9F
	if %m%=="4" Goto Skip
	set /p usrname=Enter User Name ? 
	if %usrname% =="" goto menu
	:Skip
	color 60
	cls
	echo **************************************
	echo *** Removing VHD For Outlook Cache ***
	echo **************************************
	if exist \\asfs\XenAppProf715$\OfficeContainers\%UsrName%.Bak goto REMOVEVHDBK
	goto RENVHDLOC
	:removevhdBK
	cls
	echo ***************************
	echo *** Removing VHD Backup ***
	echo ***************************
	RD \\asfs\XenAppProf715$\OfficeContainers\%UsrName%.Bak /s /q
	timeout /t 5 /nobreak
	if exist \\asfs\XenAppProf715$\OfficeContainers\%UsrName%.Bak goto ERRDELVHDOLDLOC
	goto RENVHDLOC
	
		:ERRDELVHDOLDLOC
		cls
		set ERR==""
		color 4e
		mode 55,40
		echo ********************************************
		echo *** VHD Backup Not deleted Close Session ***
		echo ********************************************
		echo **** 1. Rtary ******************************
		echo ********************************************
		echo **** 2. back to Menu ***********************
		echo ********************************************
		CHOICE /C:12 /m "Type :"
		IF ERRORLEVEL 1 set ERR="1"
		IF ERRORLEVEL 2 set ERR="2"
		if %ERR%=="1" Goto removevhdBK
		if %ERR%=="2" Goto menu
		if %ERR%=="" Goto ERRDELVHDOLDLOC
	
	:RENVHDLOC
	cls
	mode 55,10
	color dF
	echo ********************
	echo *** Removing VHD ***
	echo ********************
	ren \\asfs\XenAppProf715$\OfficeContainers\%UsrName% %UsrName%.Bak
	timeout /t 5 /nobreak
	if exist \\asfs\XenAppProf715$\OfficeContainers\%UsrName% goto ERRDELVHDLOC
	cls
	color 2f
	echo *******************
	echo *** VHD Removed ***
	echo *******************
	Timeout /t 5
	goto EndDelVhd
		
		:ERRDELVHDLOC
		color 4e
		Mode 80,25
		echo **************************************************************
		echo *** VHD Folder Not deleted Close Citrix session and try agen *
		echo **************************************************************
		echo *** 1. Rtary *************************************************
		echo **************************************************************
		echo *** 2. back to Menu ******************************************
		echo **************************************************************
		CHOICE /C:12 /m "Type :"
		IF ERRORLEVEL 1 set ERR="1"
		IF ERRORLEVEL 2 set ERR="2"
		if %ERR%=="1" Goto RENVHDLOC
		if %ERR%=="2" Goto menu
		if %ERR%=="" Goto ERRDELVHDLOC
	:EndDelVhd
	
	cls
	color 9F
	Echo . 
	Echo . 
	Echo  __________________________
	Echo (Deleting old Backup in frd)
	Echo  --------------------------
	Echo . 
	Echo . 
	if exist "\\asfs\XenAppProf715$\FRD\%usrname%.Bak" GoTo RemoveBk715
	Echo =========================================
	ECHO ---------------No---Backup---------------
	Echo =========================================
	goto CLRPRFRD715
	
	:RemoveBk715
	rd "\\asfs\XenAppProf715$\FRD\%usrname%.Bak" /s /q
	Echo =========================================
	Echo -------BackUp------Removed---------------
	Echo =========================================
	goto CLRPRFRD715
	
	:CLRPRFRD715
	timeout /t 2
	cls
	Echo . 
	Echo . 
	Echo  _________________________________________
	Echo (Removing and BackingUp old Profile in FRD)
	Echo  -----------------------------------------
	Echo . 
	Echo . 
	if exist "\\asfs\XenAppProf715$\FRD\%usrname%" goto CLRFRD715
	Echo =========================================
	echo ------No-----Profile---------------------
	Echo =========================================
	goto CLRUPM715
	
	:CLRFRD715
	ren "\\asfs\XenAppProf715$\FRD\%usrname%" %usrname%.Bak
	Echo =========================================
	echo -------FRD-------Profile------Renamed----
	Echo =========================================
	:CLRUPM715
	timeout /t 2
	cls
	Echo . 
	Echo . 
	Echo  __________________________
	Echo (Deleting old Backup in UPM)
	Echo  --------------------------
	Echo . 
	Echo . 
	if exist "\\asfs\XenAppProf715$\UPM\%usrname%.upm.Bak" goto RemoveUPM715
	Echo =========================================
	ECHO ----------No---Backup--------------------
	Echo =========================================
	GOTO UPMRD715
	
	:RemoveUPM715
	rd "\\asfs\XenAppProf715$\UPM\%usrname%.upm.Bak" /s/q
	Echo =========================================
	Echo -------BackUp------Removed---------------
	Echo =========================================
	
	:UPMRD715
	timeout /t 2
	cls
	Echo . 
	Echo . 
	Echo  _________________________________________
	Echo (Removing and BackingUp old Profile in UPM)
	Echo  ----------------------------------------
	Echo . 
	Echo . 
	if exist "\\asfs\XenAppProf715$\UPM\%usrname%.upm" GoTo CLRUPM715
	Echo =========================================
	echo --------No----UPM----PROFILE-------------
	Echo =========================================
	timeout /t 2
	goto end715
	
	:CLRUPM715
	ren "\\asfs\XenAppProf715$\UPM\%usrname%.upm" %usrname%.upm.Bak
	Echo =========================================
	ECHO --------UPM-----PROFILE---RENAMED--------
	Echo =========================================
	timeout /t 2
	
	:End715
	CLS
	color a0
	Echo ==================================================
	Echo ==================================================
	Echo ===========FRD and Upm profile Renamed============
	Echo ==================================================
	Echo ==================================================
	
	timeout /t 5
	if %m%=="4" Goto END65715
	GoTo menu

:RST65715

	goto RST65
	
	:END65715
	
	CLS
	color a0
	Echo ==================================================
	Echo ==================================================
	Echo ======6.5 and 7.15 Profiles Reset Completed=======
	Echo ==================================================
	Echo ==================================================
pause	