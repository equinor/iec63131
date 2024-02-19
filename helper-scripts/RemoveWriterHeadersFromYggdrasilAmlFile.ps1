<#  
.SYNOPSIS
Strips SourceDocumentInformation nodes from .aml file for cleaner version history
.DESCRIPTION
Purpose: Eliminate non-relevant content from IEC 63131 library version control
.NOTES
Made based on AML version 2.10 (CAEX 3)
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

$amlFileName = "..\YggdrasilAMLLibrary.aml"
$amlFilePath = Resolve-Path $amlFileName

[xml]$amlContent = Get-Content $amlFilePath.Path -Encoding utf8

$sourceDocumentInformationElements = Select-Xml -Xml $amlContent -XPath "/ns:CAEXFile/ns:SourceDocumentInformation" -Namespace @{ns="http://www.dke.de/CAEX"}

$removedSourceDocumentInformationElementsCount = 0
foreach ($sourceDocumentInformationElement in $sourceDocumentInformationElements) {
    $amlContent.CAEXFile.RemoveChild($sourceDocumentInformationElement.Node)
    $removedSourceDocumentInformationElementsCount++
}

$amlContent.Save($amlFilePath.Path)
Write-Host "Removed $removedSourceDocumentInformationElementsCount SourceDocumentInformation elements."
Start-Sleep -Seconds 2
