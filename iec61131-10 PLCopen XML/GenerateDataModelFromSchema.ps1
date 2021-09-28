$ErrorActionPreference = 'Stop'

function Get-TargetNamespace {
    [CmdLetBinding()]
    param(
        [ValidatePattern('\.xsd$')]
        [string]$SchemaDefinitionFile
    )
    [xml]$document = Get-Content $SchemaDefinitionFile
    $schemaElement = $document.ChildNodes | Where-Object { $_.Name -match ':schema$' }
    $targetNs = $schemaElement.targetNamespace
    return $targetNs
}

function Get-XsdExePath() {
    $programFilesPath = Resolve-Path ${env:ProgramFiles(x86)}
    $sdksPath = Join-Path -Path $programFilesPath -ChildPath "Microsoft SDKs\Windows"
    $latestSdkVerPath = (Get-ChildItem $sdksPath -Directory | Where-Object {$_.Name -imatch 'v\d+\.?\d+?'} | Select-Object -Last 1).FullName
    $binPath = $latestSdkVerPath | Join-Path -ChildPath "bin"
    $latestDotNetPath = (Get-ChildItem $binPath -Directory | Where-Object {$_.Name -imatch 'net.*\d+\.\d+'} | Select-Object -Last 1).FullName
    $xsdExePath = Join-Path -Path $latestDotNetPath -ChildPath "xsd.exe"

    if (!(Test-Path $xsdExePath -PathType Leaf)) {
        throw "error: could not locate xsd.exe"
    }

    return $xsdExePath
}

function Get-BaseSchema() {
    $baseSchemaPath = Read-Host -Prompt "Paste the full path to folder containing 'IEC61131_10_Ed1_0.xsd' and press enter. Or just press enter to get a Folder Browser dialog."
    if ($baseSchemaPath.Length -lt 1) {
        [void][System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")
        $folderdialog = New-Object System.Windows.Forms.FolderBrowserDialog
        $folderdialog.rootfolder = "MyComputer"
        $folderdialog.Description = "Select the folder which contains the base 'IEC61131_10_Ed1_0.xsd' schema"
        if($folderdialog.ShowDialog() -eq "OK") {
        $baseSchemaPath = $folderdialog.SelectedPath
        } else {
        throw "No folder selected, script cancelled"
        }
        $folderdialog.Dispose()
    }
    $baseSchema = Join-Path -Path $baseSchemaPath -ChildPath "IEC61131_10_Ed1_0.xsd"
    if (!(Test-Path $baseSchema -PathType Leaf)) {
        throw "error: could not locate 'IEC61131_10_Ed1_0.xsd'"
    }
    return $baseSchema
}

$baseSchema = Get-BaseSchema
$xsdExe = Get-XsdExePath
$schemas = (Get-ChildItem $PSScriptRoot -File -Filter "*.xsd").FullName

#$targetNamespace = Get-TargetNamespace $selectedSchema.FullName | Split-Path -Leaf
#&$xsdExe /classes /language:CS $baseSchema @schemas /out:$PSScriptRoot /n:$targetNamespace

if ($schemas.Count -gt 1) {
    &$xsdExe /classes /language:CS $baseSchema @schemas /out:$PSScriptRoot /n:tc65iec63131
} else {
    &$xsdExe /classes /language:CS $baseSchema $schemas /out:$PSScriptRoot /n:tc65iec63131
}
