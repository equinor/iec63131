# Move sequence and logic parts of SCD to IEC 61131-10 encoding

## Situation

Currently (as of AML Library version 0.0.8), devices and function blocks are both encoded in a single CAEXDocument.
Contrary to this, the intention of IEC 62714 appears to be that logic should be encoded separately from the CAEXDocument, ref. IEC 62714-1 clause 5.1, clause 5.2, clause 5.6, clause 3.1.6.
Quote from clause 5.2 - this is a normative requirement for the storage of logic information:

> Logic information: Logic information shall be stored using the data format PLCopen XML. If  
> logic items, e.g. variables or signals, need to be interconnected within the top level format,  
> they shall be published as CAEX ExternalInterfaces. All items of PLCopen XML that are  
> published within the top level format shall have a unique ID within PLCopen XML.  

Quote of clause 3.1.6:

> **3.1.6**  
> **AML document**  
> certain AML CAEX document following IEC 62714 (all parts) including all referenced sub documents  
> *Note 1 to entry: AML documents may be stored as files, but also e.g. as string or data streams.*  
> *Note 2 to entry: AML documents contain AML objects and/or user-defined objects.*  
> *Note 3 to entry: An AML document may consist of multiple files, with one AML CAEX document as root.*  

## Proposal

1. Use IEC 61131-10 as the digital format for exchange of IEC 63131 SFC design, both vendor agnostic and vendor specific
   - Conforms fully to IEC 62714, when referenced into a top level AML root tree
   - Minor extensions to IEC 61131-10 for IEC 63131 particularities, if any (extensions are supported and recommended)
2. Use IEC 61131-10 as the digital format for exchange of IEC 63131 SCD design, both vendor agnostic and vendor specific
   - Conforms fully to IEC 62714, when referenced into a top level AML root tree
   - Schema extension to IEC 61131-10 for the purpose of IEC 63131 function block types definition/restriction
   - Schema extension to IEC 61131-10 for the specialization of native IEC 61131-10 building blocks (eg, page connectors, shutdown reference triangles as specialized variables/parameters)
   - Vendor specific schema extension
3. Consider the additional extension of IEC 61131-10 with all SCD non-logic parts:
   - Some of the SCD non-logic parts fit well into the CAEX plant topology framework, but process lines, coordinates and page connectors are elements that are foreign to the plant topology concept (they revolve around a highly ordered and purpose built view that is the core value of IEC 63131)
   - Those parts that fit well into the CAEX plant topology framework (devices, instruments) must exist in the AML CAEX root document, for the purpose of anchoring extended information in referenced documents (eg, PLCopen XML for logic)
   - But devices and instruments could also have mirror representations in relevant PLCopen XML files, and the extended information required for visualization (coordinates, size, symbol type, orientation, process lines, page connectors) could then be placed exclusively in the IEC 63131 extension of the IEC 61131-10 schema. This would eliminate the need for extending the AML CAEX document with coordinates, process lines, page connectors.
     - The purpose of this would be to reduce data exchange to and from automation suppliers to only the PLCopen XML files, instead of a larger/whole AML document (AML CAEX files + referenced XML files)
