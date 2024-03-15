<#  
.SYNOPSIS
Combines IEC AML library and partial Yggdrasil AML library into full Yggdrasil AML library
.DESCRIPTION
1. Replaces IEC library version identifier by Yggdrasil library identifier
2. Combines contents of YggdrasilPartialLibrary.aml and NorsokSCDLibrary.aml
3. Restores vendor sections from existing YggdrasilAMLLibrary.aml
4. Saves resulting AML to YggdrasilAMLLibrary.aml
.NOTES
Made based on AML version 2.1
..\YggdrasilAMLLibrary.aml shall exist in file system prior running script
#>
#Requires -Version 5.1

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$iecFileName = "..\NorsokSCDLibrary.aml"
$partialYggdrasilFileName = "..\YggdrasilPartialLibrary.aml"
$resultFileName = "..\YggdrasilAMLLibrary.aml"

$vendorSectionPaths = @(
    "/ns:CAEXFile/ns:InterfaceClassLib[@Name='InterfaceClassLibrary']/ns:InterfaceClass[@Name='VendorSignalClass']"
    "/ns:CAEXFile/ns:SystemUnitClassLib[@Name='FunctionBlockLibrary']/ns:SystemUnitClass[@Name='VendorFunctionBlockClass']"
    "/ns:CAEXFile/ns:SystemUnitClassLib[@Name='ElementaryFunctionLibrary']/ns:SystemUnitClass[@Name='VendorElementaryFunctionClass']"
)

function Add-MissingNode {
    param (
        [System.Xml.XmlNode]$SourceNode,
        [System.Xml.XmlNode]$DestinationNode,
        [xml]$DocumentToUpdate,
        $Namespace
    )

    foreach($node in $SourceNode.ChildNodes) {

        if(($node.NodeType -eq [System.Xml.XmlNodeType]::Element) -and ($node.get_name() -ne "AdditionalInformation")) {         
            $path = "descendant::ns:$($node.get_name())[@Name='$($node.Name)']"
            
            $existingNode = $DestinationNode.SelectSingleNode($path, $Namespace)

            if ($existingNode) {
                Add-MissingNode -SourceNode $node -DestinationNode $existingNode $DocumentToUpdate $Namespace
            } else {
                #Write-Host $path
                $importedNode = $DocumentToUpdate.ImportNode($node, $true)
                [void]$DestinationNode.AppendChild($importedNode)
                Write-Host "Added node <$($importedNode.get_name()) Name='$($importedNode.Name)'>"
            }
        }       
    }
}

function Restore-VendorNode {
    param (
        [xml]$Source,
        [xml]$Destination,
        $Namespace
    )

    foreach($vendorSectionPath in $vendorSectionPaths) {
        $vendorSectionSourceNode = $Source.SelectSingleNode($vendorSectionPath, $Namespace)
        $vendorSectionDestinationNode = $Destination.SelectSingleNode($vendorSectionPath, $Namespace)

        foreach($node in $vendorSectionSourceNode.ChildNodes) {
             if (($node.NodeType -eq [System.Xml.XmlNodeType]::Element) -and ($node.get_name() -in @('SystemUnitClass', 'InterfaceClass'))) {
                $path = "descendant::ns:$($node.get_name())[@Name='$($node.Name)']"
                $existingNode = $vendorSectionDestinationNode.SelectSingleNode($path, $Namespace)
                if ($existingNode) {                  
                    [void]$vendorSectionDestinationNode.RemoveChild($existingNode)
                    Write-Host "Removed node <$($existingNode.get_name()) Name='$($existingNode.Name)'> from $($vendorSectionDestinationNode.ParentNode.Name)"
                }
                $importedNode = $Destination.ImportNode($node, $true)
                [void]$vendorSectionDestinationNode.AppendChild($importedNode)
                Write-Host "Added node <$($importedNode.get_name()) Name='$($importedNode.Name)'> to $($vendorSectionDestinationNode.ParentNode.Name)"
             }
        }
    }   
}

$iecFilePath = Resolve-Path $iecFileName
[xml]$resultContent = Get-Content $iecFilePath.Path -Encoding utf8

$partialYggdrasilFilePath = Resolve-Path $partialYggdrasilFileName
[xml]$partialYggdrasilContent = Get-Content $partialYggdrasilFilePath.Path -Encoding utf8

$yggdrasilFilePath = Resolve-Path $resultFileName
[xml]$existingYggdrasilContent = Get-Content $yggdrasilFilePath.Path -Encoding utf8

$ns = New-Object System.Xml.XmlNamespaceManager($resultContent.NameTable)
$ns.AddNamespace("ns", "http://www.dke.de/CAEX")

$libraryIecVersionNode = $resultContent.SelectSingleNode("/ns:CAEXFile/ns:AdditionalInformation/ns:Document", $ns)
$libraryYggdrasilVersionNode = $partialYggdrasilContent.SelectSingleNode("/ns:CAEXFile/ns:AdditionalInformation/ns:Document", $ns)

$importedLibraryVersionNode = $resultContent.ImportNode($libraryYggdrasilVersionNode, $true)
[void]$libraryIecVersionNode.ParentNode.AppendChild($importedLibraryVersionNode)
Write-Host "Added node $($importedLibraryVersionNode.OuterXml)"
[void]$libraryIecVersionNode.ParentNode.RemoveChild($libraryIecVersionNode)
Write-Host "Removed node $($libraryIecVersionNode.OuterXml)"

Write-Host "Adding nodes from partial library:"
Add-MissingNode -SourceNode $partialYggdrasilContent.CAEXfile -DestinationNode $resultContent.CAEXfile -DocumentToUpdate $resultContent -Namespace $ns

Write-Host "Restoring vendor nodes:"
Restore-VendorNode -Source $existingYggdrasilContent -Destination $resultContent -Namespace $ns

$resultContent.Save($yggdrasilFilePath)
Write-Host 'Done'
Start-Sleep -Seconds 10
