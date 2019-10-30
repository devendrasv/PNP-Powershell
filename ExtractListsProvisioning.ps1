################################################################################
# Extract Lists

# by Devendra Velegandla 
################################################################################

Start-Transcript

Write-Host "################################################################################" -foreground Green


$appid = "<AppId>"
$appsecret = "<AppSecret>"
$siteURL = "<SiteCollectionURL>"

Write-Host "Connect to sites using App Id and appsecret" -foreground Green
# Connect to sites using App Id and appsecret
Connect-PnPOnline -AppId $appid -AppSecret $appsecret -Url $siteUrl

Write-Host "Extracting the lists" -foreground Green

Get-PnPProvisioningTemplate -Out HelpDesk.xml -Handlers Lists

Write-Host "Completed extraction of the lists" -foreground Green

Write-Host "################################################################################" -foreground Green

Stop-Transcript
