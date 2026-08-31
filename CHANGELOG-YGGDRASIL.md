# Changelog Yggdrasil

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html)

## 0.0.44

### Added

* Rev09 51PO-05800.100-F-007\_08\_004 #VFL : Virtual Flow

### Updated

* Rev09 51PO-05800.100-F-007\_08\_004 : #CTV, #TIV , #UCC and #SMA
* FUI-SIE-I-SP-0006 : #TIVT : New pin YRSTEPF
* \#APC : Typo is fixed for YSTAT pin



## 0.0.43

### Added

* \#APC : Interface Advanced Process Control



## 0.0.42

### Added

* \#HB1 : Copy of HB with additional pins X\_S1,X\_S2 and X\_S3



## 0.0.41

### Updated

* Rev08 51PO-05800.100-F-007\_08\_004 : #AIV, #TIV , #UCC and #MWS



## 0.0.40

### Updated

* \#UCT: Adjusted to pin naming FUI-SIE-I-SP-00006
* \#TIVT : Adjusted to pin naming in FUI-SIE-I-SP-00006



## 0.0.39

### Updated

* \#CA1: YDEV output pin is added.

## 0.0.38

### Updated

* \#OA1: Y\_MAN output pin is added.
* \#ITOT : new pins XAct1..16 are added.

## 0.0.37

### Updated

* \#CA1: Y output pin is added.

## 0.0.36

### Added

* \#QA1
* \#2OO2D



## 0.0.35

### Updated

* \#MA1: New pins are added PHR and PLR for dynamic high and low range

## 0.0.34

### Added

* \#ITOT

## 0.0.33

### Updated

*  #HT : New pin FDH added to align with SW library and documentation
*  #WPD : Moved from Function block library to Elementary Function block library. New pin added PSampT. DT pin data type is updated as duration.

## 0.0.32

### Updated

* Renaming of #UCCT to #UCT - 03.12.2025

### Updated

* \#AIV , #UCC and #TIV : Description

### Added

* \#AIVT , #UCCT and #TIVT

## 0.0.31

### Updated

* \#OA1 : 2 new pins FH and FL

### Added

* \#CA1

## 0.0.30

### Updated

* \#SCS : 2 new pins XCMDIP and YCMDIP
* \#HB6 : YF pin is added

### Added

* \#OA1 , #AIV , #TIV and #UCC

## 0.0.29

### Updated

* \#SA8 : YF Pin is added for SA8\_HW typical

## 0.0.28

### Updated

* \#SKB : Typo error fix for the pins YV4 and XBCLV7
* \#CTV : Signal type update from digital in to analog out ( YIPRESS\_OS \& YOPRESS\_OS \& YLF\_HF\_OS)
* \#CIM : Typor error fix for the pins Y1TRAN and Y1\_TRANS
* \#WSP : Signal type update from analogue out to digital in (S1,2,3,4....14)



## 0.0.27

### Updated

* \#WSP : P\_EN\_X1..X14 : Signal attributes are updated for String0 and 1

## 0.0.26

### Updated

* \#RB16 : YF pin is added. Pin number correction.

## 0.0.25

### Added

* \#PLGN

## 0.0.24

### Updated

* \#WCA : Pin renaming and 2 new pins
* \#WPD : Pin renaming

## 0.0.23

### Updated

* \#HT : XH1 pin is added

## 0.0.22

### Updated

* \#HA16 : Pin renumbering from X1 to X0 (..X15) and Y1 to Y0(...Y15)

## 0.0.21

### Updated

* \#HA16 : Pin renumbering from X0 to X1 (..X16) and Y0 to Y1(...Y16)
* \#SEL14 : LA,LM and BA pins are added and connection points reduced to 10

## 0.0.20

### Updated

* \#SA - Added Y pin

## 0.0.19

### Updated

* \#SHV , #SEL14 moved to function blocks

### Added

* \#WCA , #WPD and #WSP

## 0.0.18

### Updated

* \#HT , added YHH pin

### Deleted

* F\_TON \& F\_TOF

## 0.0.17

### Updated

* \#CTUD, Subsea Blocks, #CRV

### Added

* \#STU

## 0.0.16

### Updated

* \#CRV

## 0.0.15

### Added

* \#CRV and #W\_BO

## 0.0.14

### Added

* \#ABS and #2003D and #ValRmp
* Corrected pin names for #SEL\_R16,#SEL14, #SEL16,#MB14,#RB16 and #SA8
* Added parameters PSubst and PSubstV for #SEL\_R16

## 0.0.13

### Added

* \#MAFG and #MBFG



## 0.0.12

### Added

* Added additional SequenceFlowTimeout attributes for timeout behaviour descriptions

## 0.0.11

### Added

* \#I\_R

### Moved

\-#SEL\_R16 , #SEL14 and #SEL16 blocks have been moved from function block class to elementary function class

## 0.0.10

### Added

* \#RValSap



## 0.0.9

### Added

* \#HB6 , #Avg , #ValChg , #RDBuf , #ADD8\_R . #SEL16 , #SaplR

## 0.0.8

### Added

* Added subsea specific off-page connectors

## 0.0.7

### Added

* Added Siemens subsea blocks , #SEL\_R16 and #SEL14

## 0.0.6

### Added

* Added Siemens block #CTUD Up and down counter

## 0.0.5

### Added

* Added Siemens block R\_I Converter

## 0.0.4

### Changed

* Updated Siemens blocks AND16L, OR16L

## 0.0.3

### Added

* Base AML Library updated to v.0.0.12
* Added parameter interfaces to Siemens #MA1 FB

## 0.0.2

### Changed

* Base AML Library updated to v.0.0.11
* Updated Siemens interfaces, FB's and EFB's according to base library v.0.0.11

## 0.0.1 - 2023-06-01

### Added

* AML library 'YggdrasilAmlLibrary' as XML merge of iec63131 AML library v0.0.10 ('main') and 'YggdrasilPartialLibrary'
* Added part of Siemens vendor function templates and interface classes

### Changed

* 'CombineYggdrasilLibrary.ps1' script updated to preserve vendor sections
* README-YGGDRASIL updated to allow editing vendor sections of YggdrasilAmlLibrary

