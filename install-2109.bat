@echo off
mode 45,5
color 27
rem "\\kits-netapp1\installs$\Workstations\Citrix\CItrix Workspace 2109\CitrixWorkspaceApp.exe"  /silent /uninstall
echo ****************************************
echo *** Installing Citrix WorkSpace 2109 ***
echo ***     this wil take sum time       *** 
echo ****************************************
"\\kits-netapp1\installs$\Workstations\Citrix\CItrix Workspace 2109\CitrixWorkspaceNEW.exe" /silent /includeSSON /AllowAddStore=N /rcu
exit