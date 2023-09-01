# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Added generic interface classes inherited from NorsokSignalClass/In and NorsokSignalClass/Out (e.g. 'BinaryOut')
- Added 'Tag' and 'Terminal' attributes to 'SignalToShutDownSystem' and 'SignalFromShutDownSystem' classes
- Added 'Annunciation' atrribute to MB.Y terminal
- Added RefAttribyteType='AttributeTypeLib/Parameter' to 'TimerR/F'->'TimeDelay' and 'PulseR/F'->'PulseLength'

### Changed

- Changed MB.Y class from 'BinaryOut' to 'BinaryOutAnnunciated'

### Removed

- Removed all specific interface classes inherited from NorsokSignalClass/In and NorsokSignalClass/Out (e.g. 'LSL')
- Removed 'A' and 'W' terminals from MB

## [0.0.10] - 2022-02-14

### Added

- Added Parameter AttributeType
- Added Parameter AttributeType references to function blocks attributes
- Added RegExp constraints to NoteRef attributes
- Added additional output Y2 to sequence step
- Added SystemUnitClass with Name="SequenceReferenceLegend" under DocumentElementClassLibrary
- Added FailSafePosition attribute to OA block
- Added SystemUnitClass with Name="VendorElementaryFunctionClass" under ElementaryFunctionLibrary with vendor sections

### Changed

- Changed library to CAEX 3
- Changed description of NoteRef attributes
- Changed Y to Y1 on sequence step
- Changed "DocumentReference" to "DrawingReference" on following classes:
  - ProcessOffPage, SignalOffPage, SequenceOffPage, ProcessOnPage, SignalOnPage, DocumentReference, Condition

### Removed

- Removed Context&Hiding classes from main library:
  - Removed SystemUnitClassLib, with Name="ContextHidingStructure"
  - Removed InterfaceClass with Name="ContextHidingFlowClass"
  - Removed SystemUnitClass with Name="ContextHiding" under DocumentClassLibrary
  - Removed SystemUnitClassLib with Name="ContextHidingElementLibrary"
- Removed ManualLimitedByOperatingRange attribute from OA block
- Removed FailSafePosition attribute from CA block

## [0.0.9] - 2021-11-08

### Added

- Added attributes basing on typical SW report, "AML workshop 2 - attributes" conclusions, and IEC 63131 function templates parameters listings
- Added repository scope of work description and some rules around issue creation (and rejection/voiding) in README.md
- Added standard element for AML document version
- New SystemUnitClass with Name="SequenceDiagram" under DocumentClassLibrary
- Added LegalValues constraint to Comparator attribute of SequenceElementLibrary/StandardSequenceElementClass/Condition
- Added ElementaryFunctionLibrary/NorsokElementaryFunctionClass/Selector/MemoryDominantR and MemoryDominantS
- New SystemUnitClassLib, with Name="ContextHidingStructure"
- New InterfaceClass with Name="ContextHidingFlowClass", with members:
  - ContextHidingFlowIn, ContextHidingFlowOut
- New SystemUnitClass with Name="ContextHiding" under DocumentClassLibrary
- New SystemUnitClassLib with Name="ContextHidingElementLibrary", with members:
  - Context, Transition
- Added ControlNode atrribute to SignalOffPage and SignalOnPage classes

### Changed

- Changed Notation attribute to '≠' for "XOR" EFB 

### Removed

- Removed "Layer" attribute from SequenceElementLibrary/StandardSequenceElementClass
- Removed ElementaryFunctionLibrary/NorsokElementaryFunctionClass/Selector/Memory class
- Removed unnecessary inherited attributes overridings
- Removed SignalType attribute
- Removed WriterHeader's from library

## [0.0.8] - 2021-08-01

### Added

- New SystemUnitClassLib, with Name="SequenceElementLibrary"
- New SystemUnitClass with Name="StandardSequenceElementClass", under SequenceElementLibrary, with members:
  - Start, End, Step, Transition, Action, Condition, ParallelSynchronizationStart,
    ParallelSynchronizationEnd, AlternativeBranchStart, AlternativeBranchEnd
- New InterfaceClass with Name="NorsokSequenceFlowClass", with members:
  - SequenceFlowIn, SequenceFlowOut, SequenceFlowTimeout
- New SystemUnitClass with Name="SequenceStructure", under StructureClassLibrary
- New SystemUnitClass with Name="SequenceOffPage", under ToDestination
- New SystemUnitClass with Name="SequenceOnPage", under FromSource

### Changed

- Changed convention for XML elements without element value to self-closing syntax
  - eg, '&lt;XmlElement Attribute="Value"` /`&gt;~~&lt;/XmlElement&gt;~~'

## [0.0.7] - date unknown

### Added

- First version committed to git

[unreleased]: https://github.com/equinor/iec63131/compare/0.0.8...HEAD
[0.0.8]: https://github.com/equinor/iec63131/compare/0.0.7...0.0.8
[0.0.7]: https://github.com/equinor/iec63131/compare/128cce0...0.0.7
