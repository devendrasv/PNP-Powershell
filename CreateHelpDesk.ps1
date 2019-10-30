# connect
# Connect-PnPOnline -Url <SiteCollectionURL> -Credentials (Get-Credential)
$appid = "<AppId>"
$appsecret = "<AppSecret>"
$siteURL = "<SiteCollectionURL>"

Connect-PnPOnline -AppId $appid -AppSecret $appsecret -Url $siteURL

# create site columns
Add-PnPField -DisplayName Requestor -InternalName Requestor -Group "Help Desk Group" -Type Text -Required
Add-PnPField -DisplayName Assignee -InternalName Assignee -Group "Help Desk Group" -Type Text -Required
Add-PnPField -DisplayName "Created On" -InternalName CreatedOn -Group "Help Desk Group" -Type DateTime -Required


# OOB field already exists
# Add-PnPField -DisplayName Priority -InternalName Priority -Group "Test Group" -Type Choice -Choices "High", "Medium", "Low" -Required
Add-PnPField -DisplayName Approver -InternalName Approver -Group "Help Desk Group" -Type Text -Required
# comments already exists as OOB

#get Parent content Type 
$ct = Get-PnPContentType -Identity "Item"

# create content type
Add-PnPContentType -Name HelpDeskTicket -Description "Help Desk System Content Type" -Group "Help Desk Content Types" -ParentContentType $ct

# add site columns to content type
Add-PnPFieldToContentType -Field Subject -ContentType HelpDeskTicket -Required
Add-PnPFieldToContentType -Field Requestor -ContentType HelpDeskTicket -Required
Add-PnPFieldToContentType -Field Assignee -ContentType HelpDeskTicket -Required
Add-PnPFieldToContentType -Field CreatedOn -ContentType HelpDeskTicket -Required
Add-PnPFieldToContentType -Field Priority -ContentType HelpDeskTicket -Required
Add-PnPFieldToContentType -Field Approver -ContentType HelpDeskTicket -Required
Add-PnPFieldToContentType -Field Comments -ContentType HelpDeskTicket

# create list
New-PnPList -Title "Help Desk Ticket List" -Url "HelpDeskTicketList" -Template GenericList

# add content type to list and set it as default
Add-PnPContentTypeToList -ContentType "HelpDeskTicket" -List "HelpDeskTicketList" -DefaultContentType
