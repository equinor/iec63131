# Krafla AML library

Krafla branch contains library and tools for Krafla project specifics

## Scope of work (SOW) for Krafla branch

Development of Krafla specific AML library parts:
- Context & Hiding
- Shutdown Hierarchies
- Project specific function blocks and elementary functions
- Fire & Gas specifics

## Library files purpose and composition

- NorsokSCDLibrary.aml is common iec63131 library. No project specific additions are allowed in this file.
- KraflaPartialLibrary.aml contains Krafla project specific additions to library.
- KraflaAMLLibrary.aml is combined iec63131 and Krafla library (generated, not to be edited manually).

## Tools

helper-scripts/CombineKraflaLibrary.ps1 script is to be used to combine KraflaPartialLibrary.aml and NorsokSCDLibrary.aml into KraflaAMLLibrary.aml
Resulting KraflaAMLLibrary.aml file should be manually checked (diff with NorsokSCDLibrary.aml) to ensure correct combining
