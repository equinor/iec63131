<#  
.SYNOPSIS
Combines IEC AML library and partial Krafla AML library into full Krafla AML library
.DESCRIPTION
1. Replaces IEC library version identifier by Krafla library identifier
2. Combines contents of KraflaPartialLibrary.aml and NorsokSCDLibrary.aml
3. Saves resulting AML to KraflaAMLLibrary.aml
.NOTES
Made based on AML version 2.1
..\KraflaAMLLibrary.aml (with any content) shall exist in file system prior running script
#>
#Requires -Version 5.1

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$iecFileName = "..\NorsokSCDLibrary.aml"
$partialKraflaFileName = "..\KraflaPartialLibrary.aml"
$resultFileName = "..\KraflaAMLLibrary.aml"

function Add-Missing-Nodes {
    param (
        [System.Xml.XmlNode]$kraflaNode,
        [System.Xml.XmlNode]$resultNode,
        [xml]$resultContent,
        $namespace
    )

    foreach($node in $kraflaNode.ChildNodes) {

        if(($node.NodeType -eq [System.Xml.XmlNodeType]::Element) -and ($node.get_name() -ne "AdditionalInformation")) {         
            $path = "//ns:$($node.get_name())[@Name='$($node.Name)']"
            #Write-Host $path
            $existingNode = $resultNode.SelectSingleNode($path, $namespace)

            if ($existingNode) {
                Add-Missing-Nodes $node $existingNode $resultContent $namespace
            } else {
                $importedNode = $resultContent.ImportNode($node, $true)
                $resultNode.AppendChild($importedNode)
                Write-Host "Added node <$($importedNode.get_name()) Name='$($importedNode.Name)'>"
            }
        }       
    }
}


$iecFilePath = Resolve-Path $iecFileName
[xml]$resultContent = Get-Content $iecFilePath.Path -Encoding utf8

$partialKraflaFilePath = Resolve-Path $partialKraflaFileName
[xml]$partialKraflaContent = Get-Content $partialKraflaFilePath.Path -Encoding utf8

$resultFilePath = Resolve-Path $resultFileName

$ns = New-Object System.Xml.XmlNamespaceManager($resultContent.NameTable)
$ns.AddNamespace("ns", "http://www.dke.de/CAEX")

$libraryIecVersionNode = $resultContent.SelectSingleNode("/ns:CAEXFile/ns:AdditionalInformation/ns:Document", $ns)
$libraryKraflaVersionNode = $partialKraflaContent.SelectSingleNode("/ns:CAEXFile/ns:AdditionalInformation/ns:Document", $ns)

$importedLibraryVersionNode = $resultContent.ImportNode($libraryKraflaVersionNode, $true)
$libraryIecVersionNode.ParentNode.AppendChild($importedLibraryVersionNode)
Write-Host "Added node $($importedLibraryVersionNode.OuterXml)"
$libraryIecVersionNode.ParentNode.RemoveChild($libraryIecVersionNode)
Write-Host "Removed node $($libraryIecVersionNode.OuterXml)"

Add-Missing-Nodes $partialKraflaContent.CAEXfile $resultContent.CAEXfile $resultContent $ns

$resultContent.Save($resultFilePath)

Start-Sleep -Seconds 10
