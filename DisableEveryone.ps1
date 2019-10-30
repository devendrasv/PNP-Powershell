
################################################################################
# Disable Everyone group

# by Devendra Velegandla 
################################################################################

Start-Transcript

Write-Host "################################################################################" -foreground Green

Write-Host "Performing removing everyone" -foreground Green

Write-Host "Performing Disabling everyone group" -foreground Green

$appid = "<AppId>"
$appsecret = "<AppSecret>"
$adminURl =  "<AdminURL>" #https://<Tenant>-admin.sharepoint.com

Connect-PnPOnline -AppId $appid -AppSecret $appsecret -Url $adminURl
    
Write-Host "Disabling Everyone group is in progress" -foreground Green

Set-PnPTenant -ShowEveryoneClaim $false
Write-Host "Everyone group is Disabled" -foreground Green

Disconnect-PnPOnline

Stop-Transcript 
