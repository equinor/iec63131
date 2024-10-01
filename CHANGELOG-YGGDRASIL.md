# Changelog Yggdrasil

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
## 0.0.16

### Updated

- #CRV 
## 0.0.15

### Added

- #CRV and #W_BO

## 0.0.14

### Added

- #ABS and #2003D and #ValRmp
- Corrected pin names for #SEL_R16,#SEL14, #SEL16,#MB14,#RB16 and #SA8
- Added parameters PSubst and PSubstV for #SEL_R16

## 0.0.13

### Added

- #MAFG and #MBFG


## 0.0.12

### Added

- Added additional SequenceFlowTimeout attributes for timeout behaviour descriptions

## 0.0.11

### Added

- #I_R

### Moved
-#SEL_R16 , #SEL14 and #SEL16 blocks have been moved from function block class to elementary function class

## 0.0.10

### Added

- #RValSap


## 0.0.9

### Added

- #HB6 , #Avg , #ValChg , #RDBuf , #ADD8_R . #SEL16 , #SaplR

## 0.0.8

### Added

- Added subsea specific off-page connectors

## 0.0.7

### Added

- Added Siemens subsea blocks , #SEL_R16 and #SEL14

## 0.0.6

### Added

- Added Siemens block #CTUD Up and down counter

## 0.0.5

### Added

- Added Siemens block R_I Converter
## 0.0.4

### Changed

- Updated Siemens blocks AND16L, OR16L

## 0.0.3

### Added

- Base AML Library updated to v.0.0.12
- Added parameter interfaces to Siemens #MA1 FB

## 0.0.2

### Changed

- Base AML Library updated to v.0.0.11
- Updated Siemens interfaces, FB's and EFB's according to base library v.0.0.11

## 0.0.1 - 2023-06-01

### Added

- AML library 'YggdrasilAmlLibrary' as XML merge of iec63131 AML library v0.0.10 ('main') and 'YggdrasilPartialLibrary'
- Added part of Siemens vendor function templates and interface classes

### Changed
- 'CombineYggdrasilLibrary.ps1' script updated to preserve vendor sections
- README-YGGDRASIL updated to allow editing vendor sections of YggdrasilAmlLibrary