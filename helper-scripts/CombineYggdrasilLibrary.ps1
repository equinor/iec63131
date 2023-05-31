<#  
.SYNOPSIS
Combines IEC AML library and partial Yggdrasil AML library into full Yggdrasil AML library
.DESCRIPTION
1. Replaces IEC library version identifier by Yggdrasil library identifier
2. Combines contents of YggdrasilPartialLibrary.aml and NorsokSCDLibrary.aml
3. Saves resulting AML to YggdrasilAMLLibrary.aml
.NOTES
Made based on AML version 2.1
..\YggdrasilAMLLibrary.aml (with any content) shall exist in file system prior running script
#>
#Requires -Version 5.1

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$iecFileName = "..\NorsokSCDLibrary.aml"
$partialYggdrasilFileName = "..\YggdrasilPartialLibrary.aml"
$resultFileName = "..\YggdrasilAMLLibrary.aml"

function Add-MissingNode {
    param (
        [System.Xml.XmlNode]$SourceNode,
        [System.Xml.XmlNode]$DestinationNode,
        [xml]$DocumentToUpdate,
        $Namespace
    )

    foreach($node in $SourceNode.ChildNodes) {

        if(($node.NodeType -eq [System.Xml.XmlNodeType]::Element) -and ($node.get_name() -ne "AdditionalInformation")) {         
            $path = "//ns:$($node.get_name())[@Name='$($node.Name)']"
            #Write-Host $path
            $existingNode = $DestinationNode.SelectSingleNode($path, $Namespace)

            if ($existingNode) {
                Add-MissingNode -SourceNode $node -DestinationNode $existingNode $DocumentToUpdate $Namespace
            } else {
                $importedNode = $DocumentToUpdate.ImportNode($node, $true)
                $DestinationNode.AppendChild($importedNode)
                Write-Host "Added node <$($importedNode.get_name()) Name='$($importedNode.Name)'>"
            }
        }       
    }
}


$iecFilePath = Resolve-Path $iecFileName
[xml]$resultContent = Get-Content $iecFilePath.Path -Encoding utf8

$partialYggdrasilFilePath = Resolve-Path $partialYggdrasilFileName
[xml]$partialYggdrasilContent = Get-Content $partialYggdrasilFilePath.Path -Encoding utf8

$resultFilePath = Resolve-Path $resultFileName

$ns = New-Object System.Xml.XmlNamespaceManager($resultContent.NameTable)
$ns.AddNamespace("ns", "http://www.dke.de/CAEX")

$libraryIecVersionNode = $resultContent.SelectSingleNode("/ns:CAEXFile/ns:AdditionalInformation/ns:Document", $ns)
$libraryYggdrasilVersionNode = $partialYggdrasilContent.SelectSingleNode("/ns:CAEXFile/ns:AdditionalInformation/ns:Document", $ns)

$importedLibraryVersionNode = $resultContent.ImportNode($libraryYggdrasilVersionNode, $true)
$libraryIecVersionNode.ParentNode.AppendChild($importedLibraryVersionNode)
Write-Host "Added node $($importedLibraryVersionNode.OuterXml)"
$libraryIecVersionNode.ParentNode.RemoveChild($libraryIecVersionNode)
Write-Host "Removed node $($libraryIecVersionNode.OuterXml)"

Add-MissingNode -SourceNode $partialYggdrasilContent.CAEXfile -DestinationNode $resultContent.CAEXfile -DocumentToUpdate $resultContent -Namespace $ns

$resultContent.Save($resultFilePath)

Start-Sleep -Seconds 10
