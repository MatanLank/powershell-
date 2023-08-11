   mstsc /v Object

   Start-Sleep -s 5

    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")

    Start-Sleep -s 5
     
    [System.Windows.Forms.SendKeys]::SendWait("{UserName}")

    Start-Sleep -s 5

    [System.Windows.Forms.SendKeys]::SendWait("{Password}")

    Start-Sleep -s 5

    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
