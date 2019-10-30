################################################################################
# Lists Provisioning

# by Devendra Velegandla 
################################################################################

Start-Transcript

Write-Host "################################################################################" -foreground Green

$appid = "<AppId>"
$appsecret = "<AppSecret>"
$targetSiteUrl = "<SiteCollectionURL>"
$templatepath = "FilePath" #'C:\Users\devendra.velegandla\Downloads\Monthly Webinar\Demos\4\HelpDesk.xml'


Write-Host "Connect to sites using App Id and appsecret" -foreground Green
# Connect to sites using App Id and appsecret
Connect-PnPOnline -AppId $appid -AppSecret $appsecret -Url $targetSiteUrl

Write-Host "provisoning the lists" -foreground Green

# Set-PnPTraceLog -On -LogFile traceoutput.txt

Apply-PnPProvisioningTemplate -Path $templatepath

# Set-PnPTraceLog -Off

Write-Host "HelpDesk List Provisioned successfully" -foreground Green

Write-Host "hide the lists from UI" -foreground Green

Set-PnPList -Identity "Help Desk Ticket List" -Hidden $true

Write-Host "hiding the lists from UI completed" -foreground Green

Write-Host "################################################################################" -foreground Green

Stop-Transcript 

