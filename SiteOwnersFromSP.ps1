
################################################################################
# Populate Site owners Information

# by Devendra Velegandla 
################################################################################

Start-Transcript

Write-Host "################################################################################" -foreground Green

$appid = "<AppId>"
$appsecret = "<AppSecret>"
$siteURL = "<SiteCollectionURL>"

Write-Host "Connect to sites using App Id and appsecret" -foreground Green
Write-Host "Site URl: " $siteUrl -foreground Green
Connect-PnPOnline $siteUrl -AppId $appid -AppSecret $appsecret
$associatedOwnerGroup = Get-PnPGroup -AssociatedOwnerGroup
Write-Host "Associate Owner Group : " $associatedOwnerGroup.Title
if ($associatedOwnerGroup -ne $null) {
    $groupMembers = Get-PnPGroupMembers -Identity $associatedOwnerGroup.Title
}
# Write-Host "creating the admin connection" -foreground Green
# Connect-PnPOnline $adminSiteUrl -AppId $appid -AppSecret $appsecret
foreach ($member in $groupMembers) {
    try {
        # $userExist = Get-PnPUserProfileProperty -Account $member.Email 
        # if (-not ([string]::IsNullOrEmpty($userExist))) {
        #     if ($userExist.Title -ne "System Account") {
        #         if (-not ([string]::IsNullOrEmpty($userExist.Email))) {
        #             $listofOwners += $userExist.Email 
        #         }
        #     }
        # } 
        $listofOwners += $member.Email 
    }
    catch {
        Write-Host "user not found" + $member.Email
    }
}
    
Write-Host $listofOwners
Disconnect-PnPOnline
Write-Host "Removing the connection" -foreground Yellow
Stop-Transcript
