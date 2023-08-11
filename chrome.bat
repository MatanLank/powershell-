Dim iURL
Dim objShell
Dim SendKeys

iURL = "https://storefront.asuta.co.il/Citrix/AsutaWeb/"

set objShell = CreatObject("Shell.Application")
objShell.ShellExecute "chrome.exe", iURL, "StoreFrontURL"

WSH.Sleep 4000

Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.SendKeys "{ENTER}"


