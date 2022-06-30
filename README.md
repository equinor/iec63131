# 1 Introduction

## 1.1 Purpose and Scope

### iec63131

Repository containing library and tools for working with Norsok SCD library (AML), developed based on IEC PAS 63131:2017, which has same content as Norsok I-005 rev.3.

### Scope of work (SOW) for this repository

Facilitation of standardized encoding/decoding and exchange of IEC 63131 designs (SCDs and sequence diagrams SFCs) in machine readable format is the scope of this repository.

Changes to the IEC 63131 standard itself is strictly excluded from the scope of this repository.

### Using Issues on GitHub

Issues shall be strictly limited to the defined scope of work.

If an issue is raised that falls outside the scope of work it shall be closed without further action (ie, void and null).

Standard reply to be given: &quot;This falls outside the scope of this repo, please raise your issue via appropriate channels.&quot;

### Git LFS for binary files

Git LFS is enabled in this repository and set up to track Excel files (.xlsx), see .gitattributes config file.

Git LFS locking is not configured (not expecting multiple people to edit same Excel file).

## 1.2 References

| **Reference** | **Description** |
| --- | --- |
| IEC PAS 63131:2017 | Pre standard &quot;SYSTEM CONTROL DIAGRAM» |
| Norsok I-005 Edition 3, Mar 2013 | System control diagram |
| AutomationML | [https://www.automationml.org/o.red.c/erste-schritte.html](https://www.automationml.org/o.red.c/erste-schritte.html) |
| ISO 5457 | Technical product documentation — Sizesand layout of drawing sheets |
| Norsok Z-005 Rev. 1, October 1997 | 2D-CAD drawing standard |

## 1.3 Definitions and Abbreviations

| **Abbreviation** | **Description** |
| --- | --- |
| AML | AutomationML |
| AML-Writer | The application that create the AML file with instances |
| AML-Reader | The application that read the AML file |
| CAEX | Computer Aided Engineering Exchange |
| DQM | Data Quality Management |
| GUID | Global Unique IDentifier |
| HW | Hardware |
| IEC | International Electrotechnical Commission |
| SAS | Safety and Automation System |
| SCD | System Control Diagram |
| SIS | Safety Instrumented System |
| SW | Software |
| UUID | Universal Unique Identifier |

# 2Workflow

Automation ML is the selected tool and format for exchange of control system information.

The SCD.AML file will only contain information that can be red from the drawing, and the focus is at the logical signal connections.

This project will set up a **class library** based on **Norsok I-005 revision 3 - System Control Diagram (SCD)**

The applied **Norsok SCD-AML class library** shall be used by the engineering company, to generate a AML file for one or several SCD&#39;s. The number of drawings contained in one AML file must be agreed in the individual projects. See recommendation in next sub chapter.

The individual SCD.AML file is shared with to the Control System Vendor, and the file contains the AML-library.

The control system vendor must have some kind of configuration to convert the SCD.AML file to proper control system format. The SCD does not include all information needed to set up the complete control system, so all relevant engineering documentation should be used in the configuration to add additional information that shall be part of the control system file.

![Shape1](https://github.com/johancj/iec63131/blob/Add-readme-for-AML-including-illustrations/illustrations/image001.png) Figure 1 Example of workflow

## 2.1Versioning of SCD and corresponding AML-file

Following a standardized document workflow, each SCD has its own official version.

We recommend to deliver an AML version of the same SCD together in the document archive.

There will exist 2 files that should hold the same information regarding logic. If there are any discrepancies between the two files, then the signed version should be used.

## 2.2SCD - AML discrepancies

AML file that is generated from a SCD contains the SCD and individuals and signal relations.
 It also contains the corresponding class-library, and the receiving application can use this to check the design.

It is recommended that the AML-generator in both **source** and **destination application** , create a log with errors and warnings.

This can be used to correct own design in engineering or configuration at the control system vendor.

It can be used as part of the feedback to the responsible part.

It is recommended to include this as a Data Quality Management - DQM check as part of the SCD check process before the drawing becomes official.

**Proposal** to implement use of [checksum](https://en.wikipedia.org/wiki/Checksum) of the produced AML to check if the AML file was changed after it was produced.

## 2.3SCD – AML Generator

The target for converting SCD to AML is to be able to import Function Block (FB) and Logic with signal connections into a neutral format that can be used by any control system vendor.

The content of what we get in the AML-file should be limited to what is displayed on the drawing.

The SCD is in some cases simplified for drawing purposes. These simplifications should normally be documented in a SCD legend or in the SCD-development guideline for the actual project.

_ **NOTE** _: It is not a topic for the SCD-AML generator to add template information to the AML-file.

## 2.4SCD.AML – Control System Generator

The control system vendor receives SCD.AML file&#39;s and must convert these into their own programming language. Each of the AML files contains the library and this must be mapped to the control system vendor&#39;s internal classes.

Additional missing information in the SCD.AML file can be collected added from relevant project engineering documents.

## 2.5Control System – AML Generator

To be able to check existing control system design against incoming AML file, an extraction of existing design and converting this to the standard AML design will give an option for comparing the two AML files for discrepancies.

It is recommended that the vendor develop such solutions.

# 3Content of a Automation ML file - AML

Editor and information about the tool can be found her:

[https://www.automationml.org/o.red.c/erste-schritte.html](https://www.automationml.org/o.red.c/erste-schritte.html)

- Whitepaper AutomationML Part 1 - Architecture and general requirements
- Whitepaper [Part 2 - Role class libraries](https://www.automationml.org/o.red/uploads/dateien/1485868210-AML_Whitepaper_RoleClassLibraries_V2.0.0.zip)
- Whitepaper [Part 4 - Logic Description](https://www.automationml.org/o.red/uploads/dateien/1490340053-AML_Whitepaper_Logic_V1.5.0.zip)

Introduction to editor: [https://www.youtube.com/watch?v=YBCVM3puKZU](https://www.youtube.com/watch?v=YBCVM3puKZU)

## 3.1AML Editor

![with](https://github.com/johancj/iec63131/blob/Add-readme-for-AML-including-illustrations/illustrations/image002.png)
![](https://github.com/johancj/iec63131/blob/Add-readme-for-AML-including-illustrations/illustrations/image002.png)

## 3.2AML file

Required Structure of AML file is defined in Part-1:

- chapter 5.3 &quot;AML Document versions&quot;
- The AML writer application should fill in the metadata ref chapter 5.4 &quot;Meta information about the AML source tool&quot;

## 3.3Object Identification

Reference Part-1 chapter 5.5

| **AML Classes** | **AML Object Instances** | **CAEX Interfaces** |
| --- | --- | --- |
| RoleClass InterfaceClasseSystemUnitClasse | CAEX InternalElementsCAEX ExternalInterface |
 |

### 3.3.1Rule for Classes:

Identification of AML Classes shall be identified by their CAEX &quot;_Name_&quot;

Name shall be unique within the hierarchy level of the corresponding AML library

Reference to classes shall be done via full path.

### 3.3.2Rule for Instances:

Identification of AML Object Instances shall use CAEX tag: &quot;_ID_&quot;

The &quot;ID&quot; shall be Universal Unique Identifier - UUID

This can be implemented as a Global Unique Identifier – GUID

The UUID shall never change over the life time of the corresponding object within all participating tools.

Referencing instances shall use the &quot;ID&quot; and not the &quot;Name&quot;, as this can change over time.

| Example of Child-Parent relation: AML Class with reference to the owner class full path. | ![](RackMultipart20220630-1-894kmn_html_30762ed88f197dfa.png) |
| --- | --- |
| Example of a InstanceClassLibrary object implemented as an individual in a SystemUnitClass.

This individual has a requirement for use of &quot;ID&quot; and a global unique identifier GUID has been added | ![](RackMultipart20220630-1-894kmn_html_8351a5da2c93c726.png) |
| Example of an Individual in the Instance Hierarchy.

 This object is an individual of a SystemUnitClass and has a requirement for &quot;ID&quot; and a &quot;Name&quot;

 Name = Tag number ID = unique ID in the source system. | ![](RackMultipart20220630-1-894kmn_html_7c81f0871cb7a1be.png) |

### 3.3.3AML Object Relations:

ref Part-1 chapter 5.6

Parent-Child relations between AML object instances use AML &quot;_InternalElement_&quot; to represent hierarchical object structure.

![](RackMultipart20220630-1-894kmn_html_e171793880f6b3c2.png)

Parent-Child relations between AML classes use a parent-child relations:

![](RackMultipart20220630-1-894kmn_html_7d992e19066f6545.png)

Class Inheritance relation to InterfaceClass

![](RackMultipart20220630-1-894kmn_html_1ae0721bd6c535fb.png)

### 3.3.4Class – Instance Relation:

Singleton: AML Individual created without relation to a SystemUnitClass.

Normal AML individuals shall be created based on a SystemUnitClass. And will then get a complete copy of the structure and attributes from the SystemUnitClass object. The SystemUnitClass act as a &quot;copy template&quot; and there is no inheritance from the class to individuals.

_ **Note** _: according to ref 5.6.5 it is allowed to reduce and expand data copied from the SystemUnitClass.

_ **Recommendation for use of the NorsokLibrary** _: keep all function block interfaces as defined in the template library for easy check of changes and consistency.

### 3.3.5Instance – Instance Relation:

ref Part-1 Ref 5.6.6

CAEX InternalLinks object hold relations between two instances. It shall be stored at the CAEX InternalElement which is the lowest common parent of the two connected objects.

**In the Norsok SCD &quot;InstanceHierarchy&quot; model this will be below the SCD-Document.**

| Name syntax: &quot;Link-&quot; + Number References is added to &quot;RefPartnerSideA&quot; and &quot;RefPartnerSideB&quot; Reference syntax: &quot;ID&quot; of the interface Owner + &quot;:&quot; + InterfaceName
 |

 ![](RackMultipart20220630-1-894kmn_html_1cb83ec50173d4b6.png)XML:\&lt;InternalLink Name=&quot;Link35&quot; RefPartnerSideA=&quot;744651ea-66d9-4133-5339-323932573949:Out&quot; RefPartnerSideB=&quot;744651ea-66d9-4133-5341-303454413448:X&quot; /\&gt; Navigator: ![](RackMultipart20220630-1-894kmn_html_889fa1b7ee6aa589.png) |
| --- | --- |

![](RackMultipart20220630-1-894kmn_html_804676765410a2dd.png)

# 4Norsok SCD AML library

StructrueClassLibrary The SCD converted drawing(s) will be represented as an instance hierarchy in AML.

The instance is by default a copy of an AML class and then modified with instance properties and relations.

**Proposed InstanceHierarchy:**

Level 1: InstanceHierarchy individual: Project or Facility Name

Level 2: Document Structure

Level 3: Document Individual

Level 4: InternalLinks between individuals in Level 5

Grouping of SystemUnitClass information.

Level 5: Individuals of the different SystemUnitClasses
 Note: Individuals must have unique names in same folder.

![](RackMultipart20220630-1-894kmn_html_2c18dec123705bbc.png)

The AML-Writer shall add individuals of different SystemUnitClassLib to the structure objects below the DocumentIndividual.

![](RackMultipart20220630-1-894kmn_html_f75b1a6e5bd9af1f.png)

## 4.1Individual

Individuals are defined with a header and properties.

| Field - description |
 |
| --- | --- |
| **ID** : Unique id for the individual from the source application | ![](RackMultipart20220630-1-894kmn_html_6151aac0942ed10c.png) |
| **Name:**&quot;Tag number&quot; in the source application |
| **Description:** Used where applicable e.g at On/OffPage references |
| **RefBaseSystemUnitPath:** Reference to the _SystemUnitClass_ |
| **Attributes** are defined at the AML class and populated with values at the instance level.

 The AML-Writer Some attributes has got constraint and limitations of what can be set. See library for details. | ![](RackMultipart20220630-1-894kmn_html_8956ac23fb8b3d0b.png) ![](RackMultipart20220630-1-894kmn_html_5af8588a6aeb148d.png) |

## 4.2Position and Layer information

If it is required to deliver symbol position:

A 2D-drawing has a Cartesian coordinate system in two dimensions (also called a _rectangular coordinate_ system or an orthogonal coordinate system). Ref [https://en.wikipedia.org/wiki/Cartesian\_coordinate\_system](https://en.wikipedia.org/wiki/Cartesian_coordinate_system)

The definition of the coordinate system and drawing orientation is set in the document individual.

It is mandatory that this is set so that the AML-reader knows how to use the information.

All symbols placed on a drawing has a symbol origo. The Symbol origo has a reference to the drawing origo.

_Note_: SignalInterface (Terminal names) has not got these attributes in this version of the AML.

| **Attributes** | **Value** | **Unit** |
| --- | --- | --- |
| X |
 | mm |
| Y |
 | mm |

If required by the project it is possible to add Layers defined by the standard or additional layers defined by the project.

![](RackMultipart20220630-1-894kmn_html_e0762e43b96bc40a.png)

To be able to hold this information all symbols placed on a drawing has got the following attribute

| **Attributes** | **Value** |
 |
| --- | --- | --- |
| Layer |
 |
 |

## 4.3DocumentClassLibrary

The SCD is an individual in the instance hierarchy with some attributes defined at the SCD – class.

![](RackMultipart20220630-1-894kmn_html_53415c2975137156.png) ![](RackMultipart20220630-1-894kmn_html_fbc888fb2be78f8f.png)

Document properties:

| **Header** | **Value** | **Example** |
| --- | --- | --- |
| Name | _Document Number_ | _C151-AS-J-XZ-43002-01_ |
| Description | _Document Title_ | _LP flare KO drum_ |
| Version | _Current Revision_ | _05_ |
| ID | _UUID_ | _744651ea-66d9-4133-4b44-4e51445a3838_ |
| Attributes | Value | **Restrictions** |
| DrawingSize |
 | A1 |
| Orientation |
 | Landscape |
| CoordinateSystem |
 | Cartesian coordinate system orientation: right-handed_ **Note** _: required if reference to symbol position is used. |
| Scale |
 | NA |
| Area |
 |
 |
| System |
 |
 |

## 4.4DocumentElementClassLibrary

C ![](RackMultipart20220630-1-894kmn_html_a1de7940be8b2c5b.png) lass library of objects related to the document and general objects like Note and Revision Trinagle.

### 4.4.1RevisionRecord Class

The document revision matrix is treated as individual record set in the AML file. The columns in the matrix are properties at the record set.

In the example below this will be represented by 5 individuals in the AML document

![](RackMultipart20220630-1-894kmn_html_9938e9e272f2cc3a.png) ![](RackMultipart20220630-1-894kmn_html_eef499a1d77f6fdc.png)

Properties of RevisionRecord class

| **Header** | **Value** | _ **Example** _ |
| --- | --- | --- |
| Name | &quot;_Rev-&quot; + Version_ | _Rev-01_ |
| Description | &quot;_Reason for issue&quot;_ | _INTER DISCIPLINE CHECK_ |
| Version | _Revision code_ | _01_ |
| ID | _UUID_ | _ffefb00b-987c-47a8-a47c-500c64fed20d_ |
| Attributes | Value |
 |
| RevisionDate |
 | _10.06.2015_ |
| CreatedBy |
 | _PB_ |
| CheckedBy |
 | _Abi_ |
| ApprovedBy |
 | _REK_ |

### 4.4.2Note properties

Note is a text placed somewhere at the drawing.

The individual symbols can have a reference to the note, and has a separate attribute for this purpose.

This can be used to find the actual note.

| **Header** | **Value** |
 |
| --- | --- | --- |
| Name | &quot;_Note-&quot; + Number_ |
 |
| Description | _Note Description_ |
 |
| Version |
 |
 |
| ID | _UUID_ |
 |
| Attributes | Value | Unit |
 |
| X |
 | mm |
 |
| Y |
 | mm |
 |

## 4.5FunctionBlockLibrary

Function Block properties

![](RackMultipart20220630-1-894kmn_html_bd19fd3b45d45add.png) ![](RackMultipart20220630-1-894kmn_html_d3c1f5ed47187f21.png)

Control Function Integration:

![](RackMultipart20220630-1-894kmn_html_cf801bfbdbb66fc3.png) ![](RackMultipart20220630-1-894kmn_html_4eebf59cb4efac2d.png)

| **Header** | **Value** | _ **Example at individual** _ |
| --- | --- | --- |
| Name | _Tag number_ | _A-43LIC0135_ |
| ID | _UUID_ | _744651ea-66d9-4133-4c37-563433325255_ |
| RefBaseSystemUnitPath |
 | _FunctionBlockLibrary/NorsokFunctionBlockClass/CA_ |
| Attributes | Value | Unit | _Example_ |
| Layer |
 |
 |
 |
| X |
 | mm |
 |
| Y |
 | mm |
 |
| ControlMode |
 |
 | _DIR_ |
| ControlNode |
 |
 | _A-U01_ |
| ControlFunctionIntegration |
 |
 | _I_ |
| AdditionalText |
 |
 |
 |
| NoteRef |
 |
 |
 |

The class library is defined based on the definition in the standard and one level where vendor specific Function Blocks can be created. If the AML-writer doesn&#39;t find the correct class in none of these two then the &quot;NonStandardFunctionBlockClass&quot; can be used. It will then be possible to find and handle these individuals.

| Class Library | Attributes |
| --- | --- |
| ![](RackMultipart20220630-1-894kmn_html_2c049c295bc71a74.png) | ![](RackMultipart20220630-1-894kmn_html_7bb8883c0fe7e10e.png)
 |

FunctionBlock Terminal Names defined in the standard are realized in AML with use of ExternalInterface

Attributes belonging to these objects are defined in InterfaceClassLibrary ref. chapter 4.2.

![](RackMultipart20220630-1-894kmn_html_e06ce08594ba80f4.png)

Ref 5.1Issue: SignalInterface – Names are omitted at many symbols

If no project agreement is made then these unnamed terminals at Function Block should be represented by the generic Interface Class &quot;_In_&quot; and &quot;_Out_&quot;. Ref 4.5.5NorsokSignalClass.

![](RackMultipart20220630-1-894kmn_html_e49d1b6f18d882be.png)

## 4.6ElementaryFunctionLibrary

NorsokElementaryFunctionClass and InputParameterClass

| Class Library | Attributes |
| --- | --- |
| ![](RackMultipart20220630-1-894kmn_html_b0ca820c770ed17.png) | ![](RackMultipart20220630-1-894kmn_html_3cc4f9db5efbb100.png)Additional attributes for Pulse and Timer:

 ![](RackMultipart20220630-1-894kmn_html_da6eee9b93323a1c.png) ![](RackMultipart20220630-1-894kmn_html_a0bde1f709982b1.png) |

Some of the NorsokElementary functions can have n-number of input or output terminals.
 The AML-writer shall add additional terminals and use the same RefBaseClassPath as the existing terminals.
 Example:

- Split and Opt: can have one input _ **X** _ and several output _ **Y1, Y2 , &quot;Yn&quot;** _.
- Or, XOR, AND, Add and Mul: can have several input _ **X1, X2 , &quot;Xn&quot;** _ and one output _ **Y** _.

### 4.6.1NodeSplit class

This class is defined as part of the ElementaryFunctionLibrary

| Class Library | Attributes |
| --- | --- |
| ![](RackMultipart20220630-1-894kmn_html_32cc8c08ac47de98.png) | ![](RackMultipart20220630-1-894kmn_html_6e97bae18c884398.png) |

## 4.7ReferenceClassLibrary

![](RackMultipart20220630-1-894kmn_html_fe719a9c81c4f586.png)

**Page reference** symbols exist as a set of symbols pointing to each other.

The Page reference for Signal has a Unique identifier that can be used as Name.

The AML reader application should find the same Page reference Name in the DocumentReference - AML file and then the signal path can be followed at the opposite drawing.

![](RackMultipart20220630-1-894kmn_html_2c04081b592461d.png) ![](RackMultipart20220630-1-894kmn_html_73c457509b6cb93c.png)

| **Header** | **Value** | **Example SignalOffPage** | **Example SignalOnPage** |
| --- | --- | --- | --- |
| Name | _Name_ | A4309 | A4309 |
| Description | _Description_ | A-44XSV0544.XL | Not A-43ESV0046.BCL |
| ID | _UUID_ | ……A.. | …..B.. |
| Attributes | Value |
 |
 |
| DocumentReference | _DrawingNumber_ | C151-AS-J-XZ-44002-01 | C151-AS-J-XZ-43001-01 |

**Shut-Down / SIS - References**

| **Header** | **Value** | **Example** |
| --- | --- | --- |
| Name | _Name_ | SIS-1 |
| ID | _UUID_ | ……. |
| Attributes | Value |
 |
| SIS-Notation | _Control system Character_ | E |
| Reference | _Reference to SIS-Level_ | 1.2 |

![](RackMultipart20220630-1-894kmn_html_a5f56e3fdcf81363.png)

**Sequence References** :

![](RackMultipart20220630-1-894kmn_html_83d145619a66ea0b.png)

| **Header** | **Value** | **Example** |
| --- | --- | --- |
| Name | _Name_ | SEQ.03 |
| ID | _UUID_ | ……. |
| Attributes | Value |
 |
| Reference | _Reference to sequence step numbers_ | 1 |

![](RackMultipart20220630-1-894kmn_html_757bf034d8a1f7f5.png)

**Reference to Electrical Equipment Control**

| ![](RackMultipart20220630-1-894kmn_html_6f27e542393dc910.png) | ![](RackMultipart20220630-1-894kmn_html_1646f21eedb08434.png) |
| --- | --- |
| Header | Value | Example |
 |
| Name | _Name_ | MCC-Ref-TagNumber |
 |
| ID | _UUID_ | ……. |
 |
| Attributes | Value |
 |
 |
| ReferenceTagNo | Power reference Tag number |
 |
 |
| ReferenceSystem | _Power or Succeeding function_ | MCC |
 |
| Typical |
 |
 |
 |

## 4.8DeviceClassLibrary

The current version of the AML library has defined some common devices used by the SCD.

If devices shall be represented in the InstanceHierarchy or not is not decided yet.

| **Header** | **Value** | **Example** |
| --- | --- | --- |
| Name | _Name_ | A-43VD002 |
| ID | _UUID_ | ……. |

| ![](RackMultipart20220630-1-894kmn_html_852e4be6b0151be2.png) | **Default properties for all Devices**![](RackMultipart20220630-1-894kmn_html_f246309d5b7cec13.png) |
| --- | --- |

Some devices with additional properties

| **Device with additional attributes** | **Device with additional attributes** |
| --- | --- |
| **Damper**![](RackMultipart20220630-1-894kmn_html_d50276cc6903db5c.png) | Actuated Damper ![](RackMultipart20220630-1-894kmn_html_1b3ba68433c9c308.png) |
| **Valve**![](RackMultipart20220630-1-894kmn_html_143b91da811197b8.png) | **Actuated Valve**![](RackMultipart20220630-1-894kmn_html_5de31010a4e36d64.png) |

![](RackMultipart20220630-1-894kmn_html_d5c97396e4f66ea8.png)

![](RackMultipart20220630-1-894kmn_html_a81202a1b9ee7c53.png) ![](RackMultipart20220630-1-894kmn_html_575f41c72f53e64d.png)

## 4.9InterfaceClassLibrary - Connections and Terminal Names

![](RackMultipart20220630-1-894kmn_html_2fe75f6af6b1c615.png)At the SCD, Termination points are given by name and signal directions are given by arrow.

![](RackMultipart20220630-1-894kmn_html_aabf084fc8a77f81.png) ![](RackMultipart20220630-1-894kmn_html_266c0c6ac126087a.png)

In AML the termination point is defined as a &quot;Signal Interface Class&quot;

The individual Function Block and Logic classes are populated with legal combination of Signal Interface Classes.

### 4.9.1Consistency check

The restrictions in the attributes can be used for quality check of the connections between two Interface Classes.

It is recommended that the AML-Writer do such quality check when creating InternalLink between Iterface Classes.

The AML-Reader should also perform such check to ensure legal connection.

### 4.9.2Attribute &quot;Active&quot;

This is a Boolean datatype and is used to indicate that the terminal is in use at the SCD.

When creating an instance of e.g. a Function Block then all interface classes from the library is copied to the individual. To know if e.g a warning is used is not possible without additional flag.

&quot;Active = true&quot; give an easy way to find terminals that the AML-Reader should evaluate.

### 4.9.3Attribute &quot;CommunicationType&quot;

This is type of information is additional information about the connection between the terminals. ![](RackMultipart20220630-1-894kmn_html_d6b7acc5a94fb893.png)

The InternalLinks cannot have additional attributes. That is why this is added at each of the connectors. ![](RackMultipart20220630-1-894kmn_html_c6db89a7d6e6f487.png)

### 4.9.4Attribute &quot;InvertSignal&quot;

Ref to Norsok I-005 &quot;Positive logic&quot;:

_The positive logic shall always be applied for function terminals i.e. there shall be no parameters to invert the signals inside the functions which negate the terminal meaning._

_An exception is made for input X on MB where_ _an inverter is added to make it possible to adapt to normally energised or non-energised input signal._ The Attribute InvertSignal is used for this purpose and a variant of the &quot;X&quot; is created in the library.

![](RackMultipart20220630-1-894kmn_html_62a40e0edb701f5.png)

This special class is then added to the MB function Block

![](RackMultipart20220630-1-894kmn_html_a7d6cc98440c8cb2.png)

Invert is also used at device and reference object and is indicated with double arrows at the SCD.

![](RackMultipart20220630-1-894kmn_html_e2cb7603caef11ee.png) ![](RackMultipart20220630-1-894kmn_html_c336e72f78e103cc.png) ![](RackMultipart20220630-1-894kmn_html_306a2aee4756d70d.png)

### 4.9.5NorsokSignalClass

The library is developed with hierarchical structure with inheritance of attributes.

Attribute restriction are added at the different levels.

![](RackMultipart20220630-1-894kmn_html_bb450a29664bf6cd.png)

### 4.9.6VendorSignalClass

This class is created to be able to populate VendorFucntionBlockClass with vendor specific signalInterfaceClasses.

This library should use the same structure and restrictions as in the NorsokSignalClass library.

This is done to be able to run standard consistency checks at attribute level.

#### 4.9.6.1How to assign a InterfaceClass to a SystemUnitClass

1. Define the SystemUnitClass if it does not exist. E.g. a vendor specific function block
2. Define InterfaceClass object if it don&#39;t exist
3. Drag a InterfaceClass object onto the object a)
4. Change name and description of the new object c)
5. check that attribute definition for then new object is correct.

### 4.9.7SignalReferenceClass

This interface Class is intended to be used by SystemUnitClass: ReferenceClassLibrary

These objects are passing signals and has limited attributes.

![](RackMultipart20220630-1-894kmn_html_2bf917b226c75837.png)

![](RackMultipart20220630-1-894kmn_html_77f04c2ea1c36bd8.png)

### 4.9.8DeviceConnection

This connection class is of AutomationMLInterfaceClassLib PPRConnector.

Ref Part1 6.3: This class is intended for _&quot;Connector for interlinking products, resources or processes &quot;_

Modelling of Process Flow (Pipes) is not done in this AML library yet.

![](RackMultipart20220630-1-894kmn_html_42d2265b144b637a.png)

Some example classes is linked to these interface classes, must be developed more it this shall be used.

![](RackMultipart20220630-1-894kmn_html_961ebe988528b0f2.png)

# 5Sequential Function Chart

## 5.1SFC

Sequential Function Chart – SFC, is defined in the Norsok standard.

Section under work

![Shape2](RackMultipart20220630-1-894kmn_html_8364f73a6574c228.gif)
