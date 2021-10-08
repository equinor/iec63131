<#  
.SYNOPSIS
Strips WriterHeader and parent AdditionalInformation nodes from .aml file for cleaner version history
.DESCRIPTION
Purpose: Eliminate non-relevant content from IEC 63131 library version control
.NOTES
Made based on AML version 2.0
#>
#Requires -Version 5.1

# param(
#   # The aml file name
#   [Parameter(Mandatory)]
#   [ValidateNotNullOrEmpty()]
#   [string]$AmlFileName
# )

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

# if (-not (Test-Path $AmlFileName -Leaf)) {
#     Write-Error "File not found"
#     exit
# }
#$amlFile = Resolve-Path $AmlFileName

$amlFileName = "..\NorsokSCDLibrary.aml"
$amlFilePath = Resolve-Path $amlFileName

[xml]$amlContent = Get-Content $amlFilePath.Path

$writerHeaders = Select-Xml -Xml $amlContent -XPath "/CAEXFile/AdditionalInformation/WriterHeader"

$removedCount = 0
foreach ($writerHeader in $writerHeaders) {
    $amlContent.CAEXFile.RemoveChild($writerHeader.Node.ParentNode)
    $removedCount++
}

$amlContent.Save($amlFilePath.Path)
Write-Host "Removed $removedCount WriterHeader elements, including their parent AdditionalInformation node."
Start-Sleep -Seconds 2
