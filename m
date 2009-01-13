From: Christian Rund <Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Subject: Device Tree documentation discussion for Cell/B.E. binding DRAFT - see
	Digest, Vol 6, Issues 1,7,9,10,11
Date: Tue, 13 Jan 2009 23:57:32 +0100
Message-ID: <OF55C5DDBA.0683A31A-ONC125753D.0075E4B1-C125753D.007E1E34@de.ibm.com>
References: <fa686aa40812191524k6ae8fab0r962da830ab159ca0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0071452187=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <fa686aa40812191524k6ae8fab0r962da830ab159ca0-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multipart message in MIME format.
--===============0071452187==
Content-Type: multipart/alternative; boundary="=_alternative 007E1E1EC125753D_="

This is a multipart message in MIME format.
--=_alternative 007E1E1EC125753D_=
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

Working in all feedback I received so far below now find the new version=20
of the=20
Cell/B.E. binding DRAFT including disclaimers etc. You'll find the core
contents right below. Thanks.

I removed any device=5Ftype property specifications where not necessary=20
according
to IEEE Std 1275-1994 page 132 - thanks Grant and Mitch.

I kept the bic0 and bic1 nodes separeate, thus removing the standard=20
properties.
The reason is that the location within the Cell/B.E. processor internal=20
MMIO address space
is fix and needs to be defined.

Ditto for the "mic-tm" and "pervasive" nodes.

I removed the "physical-id" property from the specification.

=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F

DRAFT Power.org Standard for the Cell Broadband Engine architecture device
tree

Draft Version 0.3 - 11 January 2009

=B8 Copyright 2008 Power.org. All rights reserved.



Implementation of certain elements of this  document  may  require=20
licenses
under  third-party   intellectual   property   rights,   including without
limitation, patent rights.  Power.org and its Members  are  not,  and=20
shall
not be held, responsible  in  any  manner  for  identifying  or  failing=20
to
identify any or all such third-party intellectual property rights.

THIS POWER.ORG SPECIFICATION IS PROVIDED "AS IS" AND  WITHOUT  ANY=20
WARRANTY
OF ANY  KIND,  INCLUDING,  WITHOUT  LIMITATION,  ANY  EXPRESSED  OR=20
IMPLIED
WARRANTY OF NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS  FOR  A=20
PARTICULAR
PURPOSE.

IN NO EVENT SHALL POWER.ORG OR ANY MEMBER OF POWER.ORG  BE  LIABLE  FOR=20
ANY
DIRECT, INDIRECT, SPECIAL, EXEMPLARY,  PUNITIVE  OR  CONSEQUENTIAL=20
DAMAGES,
INCLUDING,  WITHOUT  LIMITATION,  LOST  PROFITS,  EVEN  IF  ADVISED  OF=20
THE
POSSIBILITY OF SUCH DAMAGES.

Questions pertaining to this document, or the terms  or  conditions  of=20
its
provision, should be addressed to:


IEEE-ISTO
445 Hoes Lane
Piscataway, NJ 08854
ATTN: Power.org Board Secretary

Introduction

Power.org's mission is to develop, enable and promote Power Architecture=A9
technology as the preferred open standard hardware development platform=20
for
the electronics industry and to administer qualification programs that
optimize interoperability and accelerate innovation for a positive user
experience.  Power.org seeks to solicit the participation of all=20
interested
parties on a fair, equitable and open basis.

Power.org's output includes:
           . Open standards and specifications
           . Business guidelines documents
           . Best practices and education
           . Certifications to validate implementations and drive adoption

Power.org's specifications enable:
           . Interoperability between community members
           . Sustainability built on driving open standards and=20
convergence

Revision History



|Version |Date       |Editor        |Description |
|0.1     |20 Nov 2008|C. Rund       |Initial draft |
|0.2     |26 Nov 2008|C. Rund       |Ready for first internal review |
|0.3     |11 Jan 2009|C.Rund        |Worked in the feedback from |
|        |           |              |devtree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org discussion =

|


Table of Contents



1     Overview   5

  1.1  Scope      5

  1.2  Purpose    5

2     Terminology      5

  2.1  Definitions     5

  2.2  Abbreviations   5

  2.3  Acronyms   5

3     Introduction     6

4     The Cell Broadband Engine  architecture  processor  representation=20
in
the device tree  7

  4.1  "be" node  7

   4.1.1    ioc node   9

   4.1.2    "bic0" node     10

   4.1.3    "bic1" node     11

   4.1.4    "mic-tm" node   11

   4.1.5    "pervasive" node      11

   4.1.6    "ppe-mmio" node 13

   4.1.7    "interrupt-controller" node 13

   4.1.8    "spe" nodes     15


DRAFT Power.org Standard for the Cell Broadband Engine architecture device
tree

   Overview


1 Scope


       This document is intended to apply the Power.org Standard for Power
       Architecture Platform Requirements (Workstation, Server) PAPR on
       Cell Broadband Engine architecture compliant processors. This
       encompasses requirements therein and additional requirements for
       device tree nodes and properties pertaining to Cell Broadband=20
Engine
       architecture compliant processors.

2 Purpose


       This document is intended to indicate the architectural option and
       feature set of Cell Broadband Engine architecture processors to
       software via Open Firmware (OF).

   Terminology


        This document uses definitions, abbreviations and acronyms as
        indicated below or in the PAPR specification [3].

1 Definitions


       Device Tree: Open Firmware data structure representing the set of
                   devices attached to a system. See [1] for details.

2 Abbreviations


        Define key abbreviations here (use "paragraph" plus tab), such as

        l.t.s.f.l.r.   Leaving this section for later revisions of this
        document - to be removed if not used !!!!!!!!!!!!

3 Acronyms


        Define key acronyms here (use "paragraph" style with tabs"), such=20
as

        EIB       Element Interconnect Bus

        IIC       Internal Interrupt Controller

        IOC       Input Output Controller

        MMIO      Memory Mapped Input Output

        OF        Open Firmware (see [1]).

        PPE       PowerPC Processing Element

        SPE       Synergistic Processing Element



   Introduction


The specific goals of this specification are as follows:

           . To provide the address map for the components in a Cell
             Broadband Engine Architecture processor. Subcomponent address
             information is detected by the OF and passed to the OS in the
             device tree.


           . To build upon the OF boot environment defined in IEEE 1275,
             IEEE Standard for Boot (Initialization Configuration)=20
Firmware:
             Core Requirements and Practices.


           . To provide device tree nodes and property values necessary=20
for
             access to and configuration of the Cell Broadband Engine
             Architecture processor subcomponents.

The Cell Broadband Engine architecture processors are implemented as
systems on a chip. Besides a PowerPC processor it contains eight
Synergistic Processing Elements (SPEs) in addition. Each SPE has access to
256kB of associated local store. All logic of the non-processor part is
accessed via MMIO. Mapping and structure of the MMIO space are described
with the "be" node. A  nodes' unit address is the MMIO address of that
particular BE. The "be" node is located in the device tree as child of the
root node '/'.

   The Cell Broadband Engine architecture processor representation in the
   device tree


The following contents are outlined according to the hierarchy of the
components in the sub-tree containing the components of the Cell Broadband
Engine processor.

All device tree nodes detailed below contain a "name" property in addition
to the mentioned properties as follows

           . Specifies the name of the node


           . Encoded as with encode-string


           . Default is the name of the node


             Throughout the description below the notation
             phandle(<expression>) is used to retrieve the phandle of a
             node. A phandle of a device tree node is the cell-sized datum
             identifying the particular device tree node.

1 "be" node


The "be" node contains a set of properties and sub-nodes, which describe
the structure of a Cell Broadband Engine Architecture processor. All the
devices are contained, except the Power PC processor core nodes, which are
located under the "/cpus" path according to the PowerPC Processor binding
to the IEEE 1275 standard.

"reg" property

             Standard property name specifying the < address, size > pair=20
of
             the Cell Broadband Engine processor's MMIO mapped registers.


             Prop-encoded array: Encoded as with encode-phys for the
             address. The size part is encoded with two encode-ints.


             The array consists of four 32-bit values. Value one and two=20
in
             this array correspond to the 64-bit address value the the=20
Cell
             Broadband Engine Architecture processor is mapped into. Value
             three and four correspond to the 64-bit size. Both pairs
             represent the < address, size > pair of MMIO mapped registers
             in the Cell Broadband Engine processor's MMIO mapped register
             space.


             Default value is { 0x00000iii 0x00000000 0x00000000=20
0x000800000
             }, where iii is the offset defined by the hardware settings.

"ranges" property

             Standard property name which specifies the mapping of the=20
child
             of the "be" node within the  "be" nodes' parent address space
             using the < child, parent, size > triple.


             Prop-encoded array: Encoded as with encode-int for the childs
             range, encode-phys for the parents range and encode-int for=20
the
             size.


             The array consists of four 32-bit values. Value one in this
             array corresponds to the 32-bit child address encoded as with
             encode-int. Value two and three correspond to the 64-bit=20
parent
             address encoded as with encode-phys. Value three in this=20
array
             corresponds to the 32-bit size.


             Default value is { 0x00000000 0x00000iii 0x00000000=20
0x00080000
             }, mapping address 0 of child to 0x00000iii 00000000.

"model" property


             property name: Specifies model of node.


             Encoded as with encode-string.


             Default value is { "IBM,CBEA" }.



"ibm,dt-version" property

property name: Specifies the current device tree version number. The
version number format is major.minor.

Whenever the device tree is changed or extended in a way that OS changes
are required the major version is changed.

The minor version is changed when at least one new property is added or
removed.

Encoded as with encode-string

The default value is { 1.1 }



"#address-cells" property


property name which specifies the number of address cells for child nodes
   to the current node.


             Encoded as with encode-int.


             Default value is { 1 }



"#size-cells" property

Standard property name which specifies the number of size cells for child
nodes to the current node.

Encoded as with encode-int.

Default value is { 1 }



"ibm,associativity" property

property name: Property to define the associativity domains for this
resource.
See Power Architecture Platform Requirements (PAPR) [3], Sections
14.11.2.2, 15.2, 15.3, 18.3 and C.6.2.2 for details on this property.

Set values to { 4 0x00000000, 0x00000000, 0x0000000i, 0x0000000i }; i =3D 0
for associativity to Cell Broadband Engine processor 0, i =3D 1 for
associativity to Cell Broadband Engine processor 1.



"interrupt-parent" property

property name: Property that specifies the interrupt handler responsible
for this node.

The value represents a phandle of the interrupt handler node, encoded as
with encode-int.

Default value is { phandle( my-self/interrupt-controller) }



"cpus" property

property name: Porperty to specify the PPE component of the Cell Broadband
Engine architecture processor chip.

phandle of the cpu node, encoded as with encode-int.

Default value is { phandle(/cpus/PowerPC,BE@i) }; i =3D 0 for Cell Broadband
Engine Architecture processor 0, i =3D 1 for Cell Broadband Engine
Architecture processor 1.

1 ioc node


The Input/Output Controller (IOC) node contains among others the=20
properties
specifying the address range of MMIO register space controlling the IOC.

"reg" property

Default property name: Property to specify the MMIO offset of the IOC,
which are two sets of registers each represented by an < offset, size >
pair.

prop-encoded-array: Encoded as with encode-phys for the offset values,
encode-int for the size values.

The array consists of four 32-bit values to represent two < offset, size >
pairs. Value one in this array corresponds to the first offset value=20
within
the child address space, encoded as with encode-phys. Value two=20
corresponds
to the size, encoded as with encode-int. Value three in this array
corresponds to the second offset value, value four to the second size.
The spaces belong to two different units:

   1. 0x00510xxx covers the IOC Address Translation MMIO Registers,=20
whereras
   2. 0x00511xxx covers the I/O Command MMIO Registers.

Value is { 0x00510000 0x00001000 0x00511000 0x00001000 }.



"interrupts" property

Standard property name: Property which specifies the interrupt number of
the interrupt issued by the IOC for IIC "IO Exceptions"

Encoded as with encode-int.

The property value consists of four bytes each representing a specific
value for a node, an Internal Interrupt Controller Interrupt Service
Routine bit mask, a class and a unit

 0xNN3d010e (NN=3Dnode, bit 3d (61) in IIC=5FISR, class=3D1, unit=3DE for I=
IC=5FISR
interrupt)

Default value is { 0i3d010e }, i =3D 0 for Cell Broadband Engine processor =

0,
i =3D 1 for Cell Broadband Engine processor 1.



2 "bic0" node

The Bus Interface Controller (BIC) 0 node describes the address range of
MMIO register space controlling the BIC0. Besides the standard properties
the following property is available.

"reg" property

Default property name: Property to specify the MMIO offset of the BIC0,
which is one set of registers representing an < offset, size > pair.

prop-encoded-array: Encoded as with encode-phys for the offset value,
encode-int for the size.

Value is { 0x00512000 0x00001000 }

3 "bic1" node


The Bus Interface Controller (BIC) 1 node describes the address range of
MMIO register space controlling the BIC1.

"reg" property

Default property name: Property to specify the MMIO offset of the BIC1,
which is one set of registers representing an < offset, size > pair.

prop-encoded-array: Encoded as with encode-phys for the offset value,
encode-int for the size.

 Value is { 0x00513000 0x00001000 }



4 "mic-tm" node


The "mic-tm" node represents the Memory Interface Controller (MIC) in the
device tree. The main property value is the address range of MMIO register
space controlling the MIC.

"reg" property

Default property name: Property to specify the MMIO offset of the BIC1,
which is one set of registers representing an < offset, size > pair.

prop-encoded-array: Encoded as with encode-phys for the offset value,
encode-int for the size.

Value is { 0x0050a000 0x00001000 }.



5 "pervasive" node


The pervasive node represents the 'Pervasive MMIO Registers' in the device
tree (i.e. Pervasive Monitor, Power Management and Thermal Management
described in the Cell/B.E. public register spec. The main property value=20
is
the address range of MMIO register space controlling the pervasive unit



"reg" property

Default property name: Property to specify the MMIO offset of the BIC1,
which is one set of registers representing an < offset, size > pair.

prop-encoded-array: Encoded as with encode-phys for the offset value,
encode-int for the size.

Value is { 0x00509000 0x00001000 }.



"ppe-throttle-temp" property

property name: Property to specify the minimum temperature the PPE is
throttled.

Temperature in =F8C, encoded as with encode-int.

Default value is { 0x65 } for 101=F8C



"ppe-end-throttle-temp" property

Standard property name: Property to specify the temperature below the PPE
throttling is exited.

Temperature in =F8C, encoded as with encode-int.

Default value is { 0x5b } for 91=F8C



"ppe-full-throttle-temp" property

property name:  Property to specify the minimum temperature the PPE is
stopped.

Temperature in =F8C, encoded as with encode-int.

Default value is { 0x7f } for 127=F8C



"spe-throttle-temp" property

property name: :  Property to specify the minimum temperature the SPEs are
throttled.

Temperature in =F8C, encoded as with encode-int.

Default value is { 0x65 } for 101=F8C



"spe-end-throttle-temp" property

property name: :  Property to specify the temperature below the SPEs
throttling is exited.

Temperature in =F8C, encoded as with encode-int.

Default value is { 0x5b } for 91=F8C



"spe-full-throttle-temp" property

property name: Property to specify the minimum temperature the PPE is
stopped.

Temperature in =F8C, encoded as with encode-int.

Default value is { 0x6f } for 111=F8C



6 "ppe-mmio" node


The "ppe-mmio" node represents the PowerPC Processing Element (PPE) in the
device tree. The main property is the address range of MMIO register space
controlling the PPE part of the Cell Broadband Engine processor.



"reg" property

Standard property name: Property to specify the MMIO offset of the mic.

prop-encoded-array: Encoded as with encode-phys for the offset, encode-int
for the size.

Default value is { 0x00500000 0x00001000 }



7 "interrupt-controller" node


The Cell Broadband Engine Architecture processor contains an Internal
Interrupt Controller (IIC), which is handling all the interrupts from the
PPE, the SPE and the connected IO.

"reg" property

Standard property name: Property to specify the MMIO offset of the IIC,=20
one
range for each of the two threads contained in each PPE and one range for
the common MMIO.

prop-encoded-array: Consisting of six 32-bit values. The values form three
< offset,length > pairs of the denoted space encoded as with encode-phys
for the offsets and encode-int for the sizes

   1. for MMIO space of thread one

   2. for MMIO space of thread two

   3. for MMIO space of the common PPE MMIO space.

Value is
{ 0x00508400 0x00000020 0x00508420 0x00000020 0x00508000 0x00001000 }.



"compatible" property

property name: Property to specify the compatiblity of this interrupt
controller.

Encoded as with encode-string.

Default values is { "IBM,CBEA-Internal-Interrupt-Controller" }.



"interrupt-controller" property

property name: Property to specify that this node is an interrupt
controller.

The mere presence of this property denotes the current node being an
interrupt controller.

Zero length property.

The value is { }.



"#interrupt-cells" property

Standard property name: Property to specify the number of interrupt cells.

Encoded as with encode-int.

Default value is { 0x1 }.



"ibm,interrupt-server-ranges" property

property name: Property to specify the threads handled by this interrupt
controller.

Array of threads, encoded as with encode-int.

Default values for



|Cell Broadband Engine    |Property Value           |
|Architecture processor # |                         |
|0                        |{ 0x00000000 0x00000001 }|
|1                        |{ 0x00000000 0x00000001 }|


8 "spe" nodes


The Cell Broadband Engine Architecture processor contains eight SPEs, each
consisting of an SPU, 256kB local store and a Memory Flow Controller=20
(MFC).
The SPEs are connected to the EIB (Element Interconnect Bus) ring. The
access to the internal devices is done via MMIO reads, with a fixed offset
to the Cell Broadband Engine processor base address.



"reg" property

Standard property name: Specifies the MMIO offset and size of the SPEs
Local Storage, Problem-State, Privilege 2 Area and Privilege 1 Area.

prop-encoded array: Encoded as four < offset, length > pairs per SPE
encoded as with encode-phys for the offsets, encode-int for the size. The
pairs define the following SPE units:

   1. Local Store (LS)

   2. Problem State MMIO Registers

   3. Privilege State 2 MMIO Registers

   4. Privilege State 1 MMIO Registers

The property exists once in each spe node.

Default values for SPE



|#           |Property Value                            |
|spe@0       |{ 0x00000000 0x00040000 0x00040000        |
|            |0x00020000                                |
|            |0x00060000 0x00020000 0x00400000          |
|            |0x00002000 }                              |
|spe@80000   |{ 0x00080000 0x00040000 0x000c0000        |
|            |0x00020000                                |
|            |0x000e0000 0x00020000 0x00402000          |
|            |0x00002000 }                              |
|spe@100000  |{ 0x00100000 0x00040000 0x00140000        |
|            |0x00020000                                |
|            |0x00160000 0x00020000 0x00404000          |
|            |0x00002000 }                              |
|spe@180000  |{ 0x00180000 0x00040000 0x001c0000        |
|            |0x00020000                                |
|            |0x001e0000 0x00020000 0x00406000          |
|            |0x00002000 }                              |
|spe@200000  |{ 0x00200000 0x00040000 0x00240000        |
|            |0x00020000                                |
|            |0x00260000 0x00020000 0x00408000          |
|            |0x00002000 }                              |
|spe@280000  |{ 0x00280000 0x00040000 0x002c0000        |
|            |0x00020000                                |
|            |0x002e0000 0x00020000 0x0040a000          |
|            |0x00002000 }                              |
|spe@300000  |{ 0x00280000 0x00040000 0x002c0000        |
|            |0x00020000                                |
|            |0x002e0000 0x00020000 0x0040a000          |
|            |0x00002000 }                              |
|spe@380000  |{ 0x00380000 0x00040000 0x003c0000        |
|            |0x00020000                                |
|            |0x003e0000 0x00020000 0x0040e000          |
|            |0x00002000 }                              |


"interrupts" property

Standard property name: Property to specify the interrupt numbers of the
interrupts issued by SPE.

prop-encoded array: List of interrupt numbers issued by the SPE. Each=20
value
in the list is encoded as with encode-int.

The property exists once in each spe node.

Default values for SPEs are



|#          |Property Value                                |
|spe@0      |{ 0x4, 0x104, 0x204 }                         |
|spe@80000  |{ 0x7, 0x107, 0x207 }                         |
|spe@100000 |{ 0x3, 0x103, 0x203 }                         |
|spe@180000 |{ 0x8, 0x108, 0x208 }                         |
|spe@200000 |{ 0x2, 0x102, 0x202 }                         |
|spe@280000 |{ 0x9, 0x109, 0x209 }                         |
|spe@300000 |{0x1, 0x101, 0x201 }                          |
|spe@380000 |{0xa, 0x10a, 0x20a }                          |


"vicinity" property

property name: Specifies the direct neighbouring componentes on the EIB
ring related to each SPE.

prop-encoded array: Pairs of phandles ( < phandle, phandle >) of the
neighbouring nodes, each phandle is encoded as with encode-int.

The property exists once in each spe node.

Default values for SPEs



|#          |Property Value                                |
|spe@0      |{ phandle(mic-tm, SPE 3) }                    |
|spe@80000  |{ phandle(mic-tm, SPE 2) }                    |
|spe@100000 |{ phandle(SPE 0, SPE 4) }                     |
|spe@180000 |{ phandle(SPE 1, SPE 5) }                     |
|spe@200000 |{ phandle(SPE 2, SPE 6) }                     |
|spe@280000 |{ phandle(SPE 3, SPE 7) }                     |
|spe@300000 |{ phandle(SPE 4, BIC0) }                      |
|spe@380000 |{ phandle(SPE 5, BIC0) }                      |


Appendix A - Bibliography

This section lists documents which were referenced in this specification=20
or
which provide  additional  information,  and  some  useful  information=20
for
obtaining these documents. Referenced documents are listed below.  When=20
any
of the following standards are  superseded  by  an  approved  revision,=20
the
revision shall apply.

   1. IEEE 1275, IEEE Standard for Boot (Initialization Configuration)
      Firmware: Core Requirements and Practices

      IEEE part number DS02683, ISBN 1-55937-426-8

   2. PowerPC Processor binding  to:  IEEE  1275,  IEEE  Standard  for=20
Boot
      (Initialization  Configuration)  Firmware:   Core   Requirements and
      Practices

   3.  Power.org  Standard  for  Power  Architecture  Platform=20
Requirements
      (Workstation, Server) Version 2.2, 9th Oct 2007

--=_alternative 007E1E1EC125753D_=
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable


<br><tt><font size=3D2>Working in all feedback I received so far below now
find the new version of the </font></tt>
<br><tt><font size=3D2>Cell/B.E. binding DRAFT including disclaimers etc.
You'll find the core</font></tt>
<br><tt><font size=3D2>contents right below. Thanks.</font></tt>
<br>
<br><tt><font size=3D2>I removed any device=5Ftype property specifications
where not necessary according</font></tt>
<br><tt><font size=3D2>to IEEE Std 1275-1994 page 132 - thanks Grant and
Mitch.</font></tt>
<br>
<br><tt><font size=3D2>I kept the bic0 and bic1 nodes separeate, thus remov=
ing
the standard properties.</font></tt>
<br><tt><font size=3D2>The reason is that the location within the Cell/B.E.
processor internal MMIO address space</font></tt>
<br><tt><font size=3D2>is fix and needs to be defined.</font></tt>
<br>
<br><tt><font size=3D2>Ditto for the &quot;mic-tm&quot; and &quot;pervasive=
&quot;
nodes.</font></tt>
<br>
<br><tt><font size=3D2>I removed the &quot;physical-id&quot; property from
the specification.</font></tt>
<br>
<br><tt><font size=3D2>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F</font></tt>
<br>
<br><tt><font size=3D2>DRAFT Power.org Standard for the Cell Broadband Engi=
ne
architecture device</font></tt>
<br><tt><font size=3D2>tree</font></tt>
<br>
<br><tt><font size=3D2>Draft Version 0.3 - 11 January 2009</font></tt>
<br>
<br><tt><font size=3D2>=B8 Copyright 2008 Power.org. All rights reserved.</=
font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>Implementation of certain elements of this &nbsp;doc=
ument
&nbsp;may &nbsp;require &nbsp;licenses</font></tt>
<br><tt><font size=3D2>under &nbsp;third-party &nbsp; intellectual &nbsp;
property &nbsp; rights, &nbsp; including &nbsp; without</font></tt>
<br><tt><font size=3D2>limitation, patent rights. &nbsp;Power.org and its
Members &nbsp;are &nbsp;not, &nbsp;and &nbsp;shall</font></tt>
<br><tt><font size=3D2>not be held, responsible &nbsp;in &nbsp;any &nbsp;ma=
nner
&nbsp;for &nbsp;identifying &nbsp;or &nbsp;failing &nbsp;to</font></tt>
<br><tt><font size=3D2>identify any or all such third-party intellectual
property rights.</font></tt>
<br>
<br><tt><font size=3D2>THIS POWER.ORG SPECIFICATION IS PROVIDED &quot;AS
IS&quot; AND &nbsp;WITHOUT &nbsp;ANY &nbsp;WARRANTY</font></tt>
<br><tt><font size=3D2>OF ANY &nbsp;KIND, &nbsp;INCLUDING, &nbsp;WITHOUT
&nbsp;LIMITATION, &nbsp;ANY &nbsp;EXPRESSED &nbsp;OR &nbsp;IMPLIED</font></=
tt>
<br><tt><font size=3D2>WARRANTY OF NON-INFRINGEMENT, MERCHANTABILITY OR FIT=
NESS
&nbsp;FOR &nbsp;A &nbsp;PARTICULAR</font></tt>
<br><tt><font size=3D2>PURPOSE.</font></tt>
<br>
<br><tt><font size=3D2>IN NO EVENT SHALL POWER.ORG OR ANY MEMBER OF POWER.O=
RG
&nbsp;BE &nbsp;LIABLE &nbsp;FOR &nbsp;ANY</font></tt>
<br><tt><font size=3D2>DIRECT, INDIRECT, SPECIAL, EXEMPLARY, &nbsp;PUNITIVE
&nbsp;OR &nbsp;CONSEQUENTIAL &nbsp;DAMAGES,</font></tt>
<br><tt><font size=3D2>INCLUDING, &nbsp;WITHOUT &nbsp;LIMITATION, &nbsp;LOST
&nbsp;PROFITS, &nbsp;EVEN &nbsp;IF &nbsp;ADVISED &nbsp;OF &nbsp;THE</font><=
/tt>
<br><tt><font size=3D2>POSSIBILITY OF SUCH DAMAGES.</font></tt>
<br>
<br><tt><font size=3D2>Questions pertaining to this document, or the terms
&nbsp;or &nbsp;conditions &nbsp;of &nbsp;its</font></tt>
<br><tt><font size=3D2>provision, should be addressed to:</font></tt>
<br>
<br>
<br><tt><font size=3D2>IEEE-ISTO</font></tt>
<br><tt><font size=3D2>445 Hoes Lane</font></tt>
<br><tt><font size=3D2>Piscataway, NJ 08854</font></tt>
<br><tt><font size=3D2>ATTN: Power.org Board Secretary</font></tt>
<br>
<br><tt><font size=3D2>Introduction</font></tt>
<br>
<br><tt><font size=3D2>Power.org's mission is to develop, enable and promote
Power Architecture=A9</font></tt>
<br><tt><font size=3D2>technology as the preferred open standard hardware
development platform for</font></tt>
<br><tt><font size=3D2>the electronics industry and to administer qualifica=
tion
programs that</font></tt>
<br><tt><font size=3D2>optimize interoperability and accelerate innovation
for a positive user</font></tt>
<br><tt><font size=3D2>experience. &nbsp;Power.org seeks to solicit the par=
ticipation
of all interested</font></tt>
<br><tt><font size=3D2>parties on a fair, equitable and open basis.</font><=
/tt>
<br>
<br><tt><font size=3D2>Power.org's output includes:</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;. Open stan=
dards
and specifications</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;. Business
guidelines documents</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;. Best prac=
tices
and education</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;. Certifica=
tions
to validate implementations and drive adoption</font></tt>
<br>
<br><tt><font size=3D2>Power.org's specifications enable:</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;. Interoper=
ability
between community members</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;. Sustainab=
ility
built on driving open standards and convergence</font></tt>
<br>
<br><tt><font size=3D2>Revision History</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>|Version |Date &nbsp; &nbsp; &nbsp; |Editor &nbsp;
&nbsp; &nbsp; &nbsp;|Description &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |</font></tt>
<br><tt><font size=3D2>|0.1 &nbsp; &nbsp; |20 Nov 2008|C. Rund &nbsp; &nbsp;
&nbsp; |Initial draft &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |</font></tt>
<br><tt><font size=3D2>|0.2 &nbsp; &nbsp; |26 Nov 2008|C. Rund &nbsp; &nbsp;
&nbsp; |Ready for first internal review &nbsp; &nbsp; &nbsp; |</font></tt>
<br><tt><font size=3D2>|0.3 &nbsp; &nbsp; |11 Jan 2009|C.Rund &nbsp; &nbsp;
&nbsp; &nbsp;|Worked in the feedback from &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|devtree-di=
scuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
discussion |</font></tt>
<br>
<br>
<br><tt><font size=3D2>Table of Contents</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>1 &nbsp; &nbsp; Overview &nbsp; 5</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; 1.1 &nbsp;Scope &nbsp; &nbsp; &nbsp;5</font><=
/tt>
<br>
<br><tt><font size=3D2>&nbsp; 1.2 &nbsp;Purpose &nbsp; &nbsp;5</font></tt>
<br>
<br><tt><font size=3D2>2 &nbsp; &nbsp; Terminology &nbsp; &nbsp; &nbsp;5</f=
ont></tt>
<br>
<br><tt><font size=3D2>&nbsp; 2.1 &nbsp;Definitions &nbsp; &nbsp; 5</font><=
/tt>
<br>
<br><tt><font size=3D2>&nbsp; 2.2 &nbsp;Abbreviations &nbsp; 5</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; 2.3 &nbsp;Acronyms &nbsp; 5</font></tt>
<br>
<br><tt><font size=3D2>3 &nbsp; &nbsp; Introduction &nbsp; &nbsp; 6</font><=
/tt>
<br>
<br><tt><font size=3D2>4 &nbsp; &nbsp; The Cell Broadband Engine &nbsp;arch=
itecture
&nbsp;processor &nbsp;representation &nbsp;in</font></tt>
<br><tt><font size=3D2>the device tree &nbsp;7</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; 4.1 &nbsp;&quot;be&quot; node &nbsp;7</font><=
/tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;4.1.1 &nbsp; &nbsp;ioc node &nbsp; 9</f=
ont></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;4.1.2 &nbsp; &nbsp;&quot;bic0&quot; node
&nbsp; &nbsp; 10</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;4.1.3 &nbsp; &nbsp;&quot;bic1&quot; node
&nbsp; &nbsp; 11</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;4.1.4 &nbsp; &nbsp;&quot;mic-tm&quot;
node &nbsp; 11</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;4.1.5 &nbsp; &nbsp;&quot;pervasive&quot;
node &nbsp; &nbsp; &nbsp;11</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;4.1.6 &nbsp; &nbsp;&quot;ppe-mmio&quot;
node 13</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;4.1.7 &nbsp; &nbsp;&quot;interrupt-cont=
roller&quot;
node 13</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;4.1.8 &nbsp; &nbsp;&quot;spe&quot; nodes
&nbsp; &nbsp; 15</font></tt>
<br>
<br>
<br><tt><font size=3D2>DRAFT Power.org Standard for the Cell Broadband Engi=
ne
architecture device</font></tt>
<br><tt><font size=3D2>tree</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;Overview</font></tt>
<br>
<br>
<br><tt><font size=3D2>1 Scope</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp;This document is intended
to apply the Power.org Standard for Power</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp;Architecture Platform Req=
uirements
(Workstation, Server) PAPR on</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp;Cell Broadband Engine arc=
hitecture
compliant processors. This</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp;encompasses requirements
therein and additional requirements for</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp;device tree nodes and pro=
perties
pertaining to Cell Broadband Engine</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp;architecture compliant
processors.</font></tt>
<br>
<br><tt><font size=3D2>2 Purpose</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp;This document is intended
to indicate the architectural option and</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp;feature set of Cell Broad=
band
Engine architecture processors to</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp;software via Open Firmware
(OF).</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;Terminology</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; This document uses defin=
itions,
abbreviations and acronyms as</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; indicated below or in
the PAPR specification [3].</font></tt>
<br>
<br><tt><font size=3D2>1 Definitions</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp;Device Tree: Open Firmware
data structure representing the set of</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;
&nbsp; &nbsp;devices attached to a system. See [1] for details.</font></tt>
<br>
<br><tt><font size=3D2>2 Abbreviations</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; Define key abbreviations
here (use &quot;paragraph&quot; plus tab), such as</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; l.t.s.f.l.r. &nbsp; Leav=
ing
this section for later revisions of this</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; document - to be removed
if not used !!!!!!!!!!!!</font></tt>
<br>
<br><tt><font size=3D2>3 Acronyms</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; Define key acronyms here
(use &quot;paragraph&quot; style with tabs&quot;), such as</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; EIB &nbsp; &nbsp; &nbsp;
Element Interconnect Bus</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; IIC &nbsp; &nbsp; &nbsp;
Internal Interrupt Controller</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; IOC &nbsp; &nbsp; &nbsp;
Input Output Controller</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; MMIO &nbsp; &nbsp; &nbsp=
;Memory
Mapped Input Output</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; OF &nbsp; &nbsp; &nbsp;
&nbsp;Open Firmware (see [1]).</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; PPE &nbsp; &nbsp; &nbsp;
PowerPC Processing Element</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; SPE &nbsp; &nbsp; &nbsp;
Synergistic Processing Element</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;Introduction</font></tt>
<br>
<br>
<br><tt><font size=3D2>The specific goals of this specification are as foll=
ows:</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;. To provide
the address map for the components in a Cell</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Broa=
dband
Engine Architecture processor. Subcomponent address</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;info=
rmation
is detected by the OF and passed to the OS in the</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;devi=
ce
tree.</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;. To build
upon the OF boot environment defined in IEEE 1275,</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;IEEE
Standard for Boot (Initialization Configuration) Firmware:</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Core
Requirements and Practices.</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;. To provide
device tree nodes and property values necessary for</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;acce=
ss
to and configuration of the Cell Broadband Engine</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Arch=
itecture
processor subcomponents.</font></tt>
<br>
<br><tt><font size=3D2>The Cell Broadband Engine architecture processors
are implemented as</font></tt>
<br><tt><font size=3D2>systems on a chip. Besides a PowerPC processor it
contains eight</font></tt>
<br><tt><font size=3D2>Synergistic Processing Elements (SPEs) in addition.
Each SPE has access to</font></tt>
<br><tt><font size=3D2>256kB of associated local store. All logic of the
non-processor part is</font></tt>
<br><tt><font size=3D2>accessed via MMIO. Mapping and structure of the MMIO
space are described</font></tt>
<br><tt><font size=3D2>with the &quot;be&quot; node. A &nbsp;nodes' unit
address is the MMIO address of that</font></tt>
<br><tt><font size=3D2>particular BE. The &quot;be&quot; node is located
in the device tree as child of the</font></tt>
<br><tt><font size=3D2>root node '/'.</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;The Cell Broadband Engine architecture
processor representation in the</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp;device tree</font></tt>
<br>
<br>
<br><tt><font size=3D2>The following contents are outlined according to the
hierarchy of the</font></tt>
<br><tt><font size=3D2>components in the sub-tree containing the components
of the Cell Broadband</font></tt>
<br><tt><font size=3D2>Engine processor.</font></tt>
<br>
<br><tt><font size=3D2>All device tree nodes detailed below contain a &quot=
;name&quot;
property in addition</font></tt>
<br><tt><font size=3D2>to the mentioned properties as follows</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;. Specifies
the name of the node</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;. Encoded
as with encode-string</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;. Default
is the name of the node</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Thro=
ughout
the description below the notation</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;phan=
dle(&lt;expression&gt;)
is used to retrieve the phandle of a</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;node.
A phandle of a device tree node is the cell-sized datum</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;iden=
tifying
the particular device tree node.</font></tt>
<br>
<br><tt><font size=3D2>1 &quot;be&quot; node</font></tt>
<br>
<br>
<br><tt><font size=3D2>The &quot;be&quot; node contains a set of properties
and sub-nodes, which describe</font></tt>
<br><tt><font size=3D2>the structure of a Cell Broadband Engine Architecture
processor. All the</font></tt>
<br><tt><font size=3D2>devices are contained, except the Power PC processor
core nodes, which are</font></tt>
<br><tt><font size=3D2>located under the &quot;/cpus&quot; path according
to the PowerPC Processor binding</font></tt>
<br><tt><font size=3D2>to the IEEE 1275 standard.</font></tt>
<br>
<br><tt><font size=3D2>&quot;reg&quot; property</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Stan=
dard
property name specifying the &lt; address, size &gt; pair of</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;the
Cell Broadband Engine processor's MMIO mapped registers.</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Prop=
-encoded
array: Encoded as with encode-phys for the</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;addr=
ess.
The size part is encoded with two encode-ints.</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;The
array consists of four 32-bit values. Value one and two in</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;this
array correspond to the 64-bit address value the the Cell</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Broa=
dband
Engine Architecture processor is mapped into. Value</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;three
and four correspond to the 64-bit size. Both pairs</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;repr=
esent
the &lt; address, size &gt; pair of MMIO mapped registers</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;in
the Cell Broadband Engine processor's MMIO mapped register</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;spac=
e.</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Defa=
ult
value is { 0x00000iii 0x00000000 0x00000000 0x000800000</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;},
where iii is the offset defined by the hardware settings.</font></tt>
<br>
<br><tt><font size=3D2>&quot;ranges&quot; property</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Stan=
dard
property name which specifies the mapping of the child</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;of
the &quot;be&quot; node within the &nbsp;&quot;be&quot; nodes' parent addre=
ss
space</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;using
the &lt; child, parent, size &gt; triple.</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Prop=
-encoded
array: Encoded as with encode-int for the childs</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rang=
e,
encode-phys for the parents range and encode-int for the</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size=
.</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;The
array consists of four 32-bit values. Value one in this</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;array
corresponds to the 32-bit child address encoded as with</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enco=
de-int.
Value two and three correspond to the 64-bit parent</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;addr=
ess
encoded as with encode-phys. Value three in this array</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;corr=
esponds
to the 32-bit size.</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Defa=
ult
value is { 0x00000000 0x00000iii 0x00000000 0x00080000</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;},
mapping address 0 of child to 0x00000iii 00000000.</font></tt>
<br>
<br><tt><font size=3D2>&quot;model&quot; property</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;prop=
erty
name: Specifies model of node.</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Enco=
ded
as with encode-string.</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Defa=
ult
value is { &quot;IBM,CBEA&quot; }.</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&quot;ibm,dt-version&quot; property</font></tt>
<br>
<br><tt><font size=3D2>property name: Specifies the current device tree ver=
sion
number. The</font></tt>
<br><tt><font size=3D2>version number format is major.minor.</font></tt>
<br>
<br><tt><font size=3D2>Whenever the device tree is changed or extended in
a way that OS changes</font></tt>
<br><tt><font size=3D2>are required the major version is changed.</font></t=
t>
<br>
<br><tt><font size=3D2>The minor version is changed when at least one new
property is added or</font></tt>
<br><tt><font size=3D2>removed.</font></tt>
<br>
<br><tt><font size=3D2>Encoded as with encode-string</font></tt>
<br>
<br><tt><font size=3D2>The default value is { 1.1 }</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&quot;#address-cells&quot; property</font></tt>
<br>
<br>
<br><tt><font size=3D2>property name which specifies the number of address
cells for child nodes</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp;to the current node.</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Enco=
ded
as with encode-int.</font></tt>
<br>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Defa=
ult
value is { 1 }</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&quot;#size-cells&quot; property</font></tt>
<br>
<br><tt><font size=3D2>Standard property name which specifies the number
of size cells for child</font></tt>
<br><tt><font size=3D2>nodes to the current node.</font></tt>
<br>
<br><tt><font size=3D2>Encoded as with encode-int.</font></tt>
<br>
<br><tt><font size=3D2>Default value is { 1 }</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&quot;ibm,associativity&quot; property</font></tt>
<br>
<br><tt><font size=3D2>property name: Property to define the associativity
domains for this</font></tt>
<br><tt><font size=3D2>resource.</font></tt>
<br><tt><font size=3D2>See Power Architecture Platform Requirements (PAPR)
[3], Sections</font></tt>
<br><tt><font size=3D2>14.11.2.2, 15.2, 15.3, 18.3 and C.6.2.2 for details
on this property.</font></tt>
<br>
<br><tt><font size=3D2>Set values to { 4 0x00000000, 0x00000000, 0x0000000i,
0x0000000i }; i =3D 0</font></tt>
<br><tt><font size=3D2>for associativity to Cell Broadband Engine processor
0, i =3D 1 for</font></tt>
<br><tt><font size=3D2>associativity to Cell Broadband Engine processor 1.<=
/font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&quot;interrupt-parent&quot; property</font></tt>
<br>
<br><tt><font size=3D2>property name: Property that specifies the interrupt
handler responsible</font></tt>
<br><tt><font size=3D2>for this node.</font></tt>
<br>
<br><tt><font size=3D2>The value represents a phandle of the interrupt hand=
ler
node, encoded as</font></tt>
<br><tt><font size=3D2>with encode-int.</font></tt>
<br>
<br><tt><font size=3D2>Default value is { phandle( my-self/interrupt-contro=
ller)
}</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&quot;cpus&quot; property</font></tt>
<br>
<br><tt><font size=3D2>property name: Porperty to specify the PPE component
of the Cell Broadband</font></tt>
<br><tt><font size=3D2>Engine architecture processor chip.</font></tt>
<br>
<br><tt><font size=3D2>phandle of the cpu node, encoded as with encode-int.=
</font></tt>
<br>
<br><tt><font size=3D2>Default value is { phandle(/cpus/PowerPC,BE@i) };
i =3D 0 for Cell Broadband</font></tt>
<br><tt><font size=3D2>Engine Architecture processor 0, i =3D 1 for Cell Br=
oadband
Engine</font></tt>
<br><tt><font size=3D2>Architecture processor 1.</font></tt>
<br>
<br><tt><font size=3D2>1 ioc node</font></tt>
<br>
<br>
<br><tt><font size=3D2>The Input/Output Controller (IOC) node contains among
others the properties</font></tt>
<br><tt><font size=3D2>specifying the address range of MMIO register space
controlling the IOC.</font></tt>
<br>
<br><tt><font size=3D2>&quot;reg&quot; property</font></tt>
<br>
<br><tt><font size=3D2>Default property name: Property to specify the MMIO
offset of the IOC,</font></tt>
<br><tt><font size=3D2>which are two sets of registers each represented by
an &lt; offset, size &gt;</font></tt>
<br><tt><font size=3D2>pair.</font></tt>
<br>
<br><tt><font size=3D2>prop-encoded-array: Encoded as with encode-phys for
the offset values,</font></tt>
<br><tt><font size=3D2>encode-int for the size values.</font></tt>
<br>
<br><tt><font size=3D2>The array consists of four 32-bit values to represent
two &lt; offset, size &gt;</font></tt>
<br><tt><font size=3D2>pairs. Value one in this array corresponds to the
first offset value within</font></tt>
<br><tt><font size=3D2>the child address space, encoded as with encode-phys.
Value two corresponds</font></tt>
<br><tt><font size=3D2>to the size, encoded as with encode-int. Value three
in this array</font></tt>
<br><tt><font size=3D2>corresponds to the second offset value, value four
to the second size.</font></tt>
<br><tt><font size=3D2>The spaces belong to two different units:</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;1. 0x00510xxx covers the IOC Address
Translation MMIO Registers, whereras</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp;2. 0x00511xxx covers the I/O Command
MMIO Registers.</font></tt>
<br>
<br><tt><font size=3D2>Value is { 0x00510000 0x00001000 0x00511000 0x000010=
00
}.</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&quot;interrupts&quot; property</font></tt>
<br>
<br><tt><font size=3D2>Standard property name: Property which specifies the
interrupt number of</font></tt>
<br><tt><font size=3D2>the interrupt issued by the IOC for IIC &quot;IO Exc=
eptions&quot;</font></tt>
<br>
<br><tt><font size=3D2>Encoded as with encode-int.</font></tt>
<br>
<br><tt><font size=3D2>The property value consists of four bytes each repre=
senting
a specific</font></tt>
<br><tt><font size=3D2>value for a node, an Internal Interrupt Controller
Interrupt Service</font></tt>
<br><tt><font size=3D2>Routine bit mask, a class and a unit</font></tt>
<br>
<br><tt><font size=3D2>&nbsp;0xNN3d010e (NN=3Dnode, bit 3d (61) in IIC=5FIS=
R,
class=3D1, unit=3DE for IIC=5FISR</font></tt>
<br><tt><font size=3D2>interrupt)</font></tt>
<br>
<br><tt><font size=3D2>Default value is { 0i3d010e }, i =3D 0 for Cell Broa=
dband
Engine processor 0,</font></tt>
<br><tt><font size=3D2>i =3D 1 for Cell Broadband Engine processor 1.</font=
></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>2 &quot;bic0&quot; node</font></tt>
<br>
<br><tt><font size=3D2>The Bus Interface Controller (BIC) 0 node describes
the address range of</font></tt>
<br><tt><font size=3D2>MMIO register space controlling the BIC0. Besides
the standard properties</font></tt>
<br><tt><font size=3D2>the following property is available.</font></tt>
<br>
<br><tt><font size=3D2>&quot;reg&quot; property</font></tt>
<br>
<br><tt><font size=3D2>Default property name: Property to specify the MMIO
offset of the BIC0,</font></tt>
<br><tt><font size=3D2>which is one set of registers representing an &lt;
offset, size &gt; pair.</font></tt>
<br>
<br><tt><font size=3D2>prop-encoded-array: Encoded as with encode-phys for
the offset value,</font></tt>
<br><tt><font size=3D2>encode-int for the size.</font></tt>
<br>
<br><tt><font size=3D2>Value is { 0x00512000 0x00001000 }</font></tt>
<br>
<br><tt><font size=3D2>3 &quot;bic1&quot; node</font></tt>
<br>
<br>
<br><tt><font size=3D2>The Bus Interface Controller (BIC) 1 node describes
the address range of</font></tt>
<br><tt><font size=3D2>MMIO register space controlling the BIC1.</font></tt>
<br>
<br><tt><font size=3D2>&quot;reg&quot; property</font></tt>
<br>
<br><tt><font size=3D2>Default property name: Property to specify the MMIO
offset of the BIC1,</font></tt>
<br><tt><font size=3D2>which is one set of registers representing an &lt;
offset, size &gt; pair.</font></tt>
<br>
<br><tt><font size=3D2>prop-encoded-array: Encoded as with encode-phys for
the offset value,</font></tt>
<br><tt><font size=3D2>encode-int for the size.</font></tt>
<br>
<br><tt><font size=3D2>&nbsp;Value is { 0x00513000 0x00001000 }</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>4 &quot;mic-tm&quot; node</font></tt>
<br>
<br>
<br><tt><font size=3D2>The &quot;mic-tm&quot; node represents the Memory
Interface Controller (MIC) in the</font></tt>
<br><tt><font size=3D2>device tree. The main property value is the address
range of MMIO register</font></tt>
<br><tt><font size=3D2>space controlling the MIC.</font></tt>
<br>
<br><tt><font size=3D2>&quot;reg&quot; property</font></tt>
<br>
<br><tt><font size=3D2>Default property name: Property to specify the MMIO
offset of the BIC1,</font></tt>
<br><tt><font size=3D2>which is one set of registers representing an &lt;
offset, size &gt; pair.</font></tt>
<br>
<br><tt><font size=3D2>prop-encoded-array: Encoded as with encode-phys for
the offset value,</font></tt>
<br><tt><font size=3D2>encode-int for the size.</font></tt>
<br>
<br><tt><font size=3D2>Value is { 0x0050a000 0x00001000 }.</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>5 &quot;pervasive&quot; node</font></tt>
<br>
<br>
<br><tt><font size=3D2>The pervasive node represents the 'Pervasive MMIO
Registers' in the device</font></tt>
<br><tt><font size=3D2>tree (i.e. Pervasive Monitor, Power Management and
Thermal Management</font></tt>
<br><tt><font size=3D2>described in the Cell/B.E. public register spec. The
main property value is</font></tt>
<br><tt><font size=3D2>the address range of MMIO register space controlling
the pervasive unit</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&quot;reg&quot; property</font></tt>
<br>
<br><tt><font size=3D2>Default property name: Property to specify the MMIO
offset of the BIC1,</font></tt>
<br><tt><font size=3D2>which is one set of registers representing an &lt;
offset, size &gt; pair.</font></tt>
<br>
<br><tt><font size=3D2>prop-encoded-array: Encoded as with encode-phys for
the offset value,</font></tt>
<br><tt><font size=3D2>encode-int for the size.</font></tt>
<br>
<br><tt><font size=3D2>Value is { 0x00509000 0x00001000 }.</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&quot;ppe-throttle-temp&quot; property</font></tt>
<br>
<br><tt><font size=3D2>property name: Property to specify the minimum tempe=
rature
the PPE is</font></tt>
<br><tt><font size=3D2>throttled.</font></tt>
<br>
<br><tt><font size=3D2>Temperature in =F8C, encoded as with encode-int.</fo=
nt></tt>
<br>
<br><tt><font size=3D2>Default value is { 0x65 } for 101=F8C</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&quot;ppe-end-throttle-temp&quot; property</font></t=
t>
<br>
<br><tt><font size=3D2>Standard property name: Property to specify the temp=
erature
below the PPE</font></tt>
<br><tt><font size=3D2>throttling is exited.</font></tt>
<br>
<br><tt><font size=3D2>Temperature in =F8C, encoded as with encode-int.</fo=
nt></tt>
<br>
<br><tt><font size=3D2>Default value is { 0x5b } for 91=F8C</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&quot;ppe-full-throttle-temp&quot; property</font></=
tt>
<br>
<br><tt><font size=3D2>property name: &nbsp;Property to specify the minimum
temperature the PPE is</font></tt>
<br><tt><font size=3D2>stopped.</font></tt>
<br>
<br><tt><font size=3D2>Temperature in =F8C, encoded as with encode-int.</fo=
nt></tt>
<br>
<br><tt><font size=3D2>Default value is { 0x7f } for 127=F8C</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&quot;spe-throttle-temp&quot; property</font></tt>
<br>
<br><tt><font size=3D2>property name: : &nbsp;Property to specify the minim=
um
temperature the SPEs are</font></tt>
<br><tt><font size=3D2>throttled.</font></tt>
<br>
<br><tt><font size=3D2>Temperature in =F8C, encoded as with encode-int.</fo=
nt></tt>
<br>
<br><tt><font size=3D2>Default value is { 0x65 } for 101=F8C</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&quot;spe-end-throttle-temp&quot; property</font></t=
t>
<br>
<br><tt><font size=3D2>property name: : &nbsp;Property to specify the tempe=
rature
below the SPEs</font></tt>
<br><tt><font size=3D2>throttling is exited.</font></tt>
<br>
<br><tt><font size=3D2>Temperature in =F8C, encoded as with encode-int.</fo=
nt></tt>
<br>
<br><tt><font size=3D2>Default value is { 0x5b } for 91=F8C</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&quot;spe-full-throttle-temp&quot; property</font></=
tt>
<br>
<br><tt><font size=3D2>property name: Property to specify the minimum tempe=
rature
the PPE is</font></tt>
<br><tt><font size=3D2>stopped.</font></tt>
<br>
<br><tt><font size=3D2>Temperature in =F8C, encoded as with encode-int.</fo=
nt></tt>
<br>
<br><tt><font size=3D2>Default value is { 0x6f } for 111=F8C</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>6 &quot;ppe-mmio&quot; node</font></tt>
<br>
<br>
<br><tt><font size=3D2>The &quot;ppe-mmio&quot; node represents the PowerPC
Processing Element (PPE) in the</font></tt>
<br><tt><font size=3D2>device tree. The main property is the address range
of MMIO register space</font></tt>
<br><tt><font size=3D2>controlling the PPE part of the Cell Broadband Engine
processor.</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&quot;reg&quot; property</font></tt>
<br>
<br><tt><font size=3D2>Standard property name: Property to specify the MMIO
offset of the mic.</font></tt>
<br>
<br><tt><font size=3D2>prop-encoded-array: Encoded as with encode-phys for
the offset, encode-int</font></tt>
<br><tt><font size=3D2>for the size.</font></tt>
<br>
<br><tt><font size=3D2>Default value is { 0x00500000 0x00001000 }</font></t=
t>
<br>
<br>
<br>
<br><tt><font size=3D2>7 &quot;interrupt-controller&quot; node</font></tt>
<br>
<br>
<br><tt><font size=3D2>The Cell Broadband Engine Architecture processor con=
tains
an Internal</font></tt>
<br><tt><font size=3D2>Interrupt Controller (IIC), which is handling all
the interrupts from the</font></tt>
<br><tt><font size=3D2>PPE, the SPE and the connected IO.</font></tt>
<br>
<br><tt><font size=3D2>&quot;reg&quot; property</font></tt>
<br>
<br><tt><font size=3D2>Standard property name: Property to specify the MMIO
offset of the IIC, one</font></tt>
<br><tt><font size=3D2>range for each of the two threads contained in each
PPE and one range for</font></tt>
<br><tt><font size=3D2>the common MMIO.</font></tt>
<br>
<br><tt><font size=3D2>prop-encoded-array: Consisting of six 32-bit values.
The values form three</font></tt>
<br><tt><font size=3D2>&lt; offset,length &gt; pairs of the denoted space
encoded as with encode-phys</font></tt>
<br><tt><font size=3D2>for the offsets and encode-int for the sizes</font><=
/tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;1. for MMIO space of thread one</font><=
/tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;2. for MMIO space of thread two</font><=
/tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;3. for MMIO space of the common PPE MMIO
space.</font></tt>
<br>
<br><tt><font size=3D2>Value is</font></tt>
<br><tt><font size=3D2>{ 0x00508400 0x00000020 0x00508420 0x00000020 0x0050=
8000
0x00001000 }.</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&quot;compatible&quot; property</font></tt>
<br>
<br><tt><font size=3D2>property name: Property to specify the compatiblity
of this interrupt</font></tt>
<br><tt><font size=3D2>controller.</font></tt>
<br>
<br><tt><font size=3D2>Encoded as with encode-string.</font></tt>
<br>
<br><tt><font size=3D2>Default values is { &quot;IBM,CBEA-Internal-Interrup=
t-Controller&quot;
}.</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&quot;interrupt-controller&quot; property</font></tt>
<br>
<br><tt><font size=3D2>property name: Property to specify that this node
is an interrupt</font></tt>
<br><tt><font size=3D2>controller.</font></tt>
<br>
<br><tt><font size=3D2>The mere presence of this property denotes the curre=
nt
node being an</font></tt>
<br><tt><font size=3D2>interrupt controller.</font></tt>
<br>
<br><tt><font size=3D2>Zero length property.</font></tt>
<br>
<br><tt><font size=3D2>The value is { }.</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&quot;#interrupt-cells&quot; property</font></tt>
<br>
<br><tt><font size=3D2>Standard property name: Property to specify the numb=
er
of interrupt cells.</font></tt>
<br>
<br><tt><font size=3D2>Encoded as with encode-int.</font></tt>
<br>
<br><tt><font size=3D2>Default value is { 0x1 }.</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&quot;ibm,interrupt-server-ranges&quot; property</fo=
nt></tt>
<br>
<br><tt><font size=3D2>property name: Property to specify the threads handl=
ed
by this interrupt</font></tt>
<br><tt><font size=3D2>controller.</font></tt>
<br>
<br><tt><font size=3D2>Array of threads, encoded as with encode-int.</font>=
</tt>
<br>
<br><tt><font size=3D2>Default values for</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>|Cell Broadband Engine &nbsp; &nbsp;|Property Value
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |</font></tt>
<br><tt><font size=3D2>|Architecture processor # | &nbsp; &nbsp; &nbsp; &nb=
sp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |</font></tt>
<br><tt><font size=3D2>|0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|{ 0x00000000 0x00000001 }|</font></tt>
<br><tt><font size=3D2>|1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|{ 0x00000000 0x00000001 }|</font></tt>
<br>
<br>
<br><tt><font size=3D2>8 &quot;spe&quot; nodes</font></tt>
<br>
<br>
<br><tt><font size=3D2>The Cell Broadband Engine Architecture processor con=
tains
eight SPEs, each</font></tt>
<br><tt><font size=3D2>consisting of an SPU, 256kB local store and a Memory
Flow Controller (MFC).</font></tt>
<br><tt><font size=3D2>The SPEs are connected to the EIB (Element Interconn=
ect
Bus) ring. The</font></tt>
<br><tt><font size=3D2>access to the internal devices is done via MMIO read=
s,
with a fixed offset</font></tt>
<br><tt><font size=3D2>to the Cell Broadband Engine processor base address.=
</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>&quot;reg&quot; property</font></tt>
<br>
<br><tt><font size=3D2>Standard property name: Specifies the MMIO offset
and size of the SPEs</font></tt>
<br><tt><font size=3D2>Local Storage, Problem-State, Privilege 2 Area and
Privilege 1 Area.</font></tt>
<br>
<br><tt><font size=3D2>prop-encoded array: Encoded as four &lt; offset, len=
gth
&gt; pairs per SPE</font></tt>
<br><tt><font size=3D2>encoded as with encode-phys for the offsets, encode-=
int
for the size. The</font></tt>
<br><tt><font size=3D2>pairs define the following SPE units:</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;1. Local Store (LS)</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;2. Problem State MMIO Registers</font><=
/tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;3. Privilege State 2 MMIO Registers</fo=
nt></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;4. Privilege State 1 MMIO Registers</fo=
nt></tt>
<br>
<br><tt><font size=3D2>The property exists once in each spe node.</font></t=
t>
<br>
<br><tt><font size=3D2>Default values for SPE</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>|# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |Property Value
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>|spe@0 &nbsp; &nbsp; &nbsp; |{ 0x00000000 0x00040000
0x00040000 &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x000200=
00
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x000600=
00
0x00020000 0x00400000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x000020=
00
} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>|spe@80000 &nbsp; |{ 0x00080000 0x00040000 0x000c0000
&nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x000200=
00
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x000e00=
00
0x00020000 0x00402000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x000020=
00
} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>|spe@100000 &nbsp;|{ 0x00100000 0x00040000 0x00140000
&nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x000200=
00
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x001600=
00
0x00020000 0x00404000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x000020=
00
} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>|spe@180000 &nbsp;|{ 0x00180000 0x00040000 0x001c0000
&nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x000200=
00
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x001e00=
00
0x00020000 0x00406000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x000020=
00
} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>|spe@200000 &nbsp;|{ 0x00200000 0x00040000 0x00240000
&nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x000200=
00
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x002600=
00
0x00020000 0x00408000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x000020=
00
} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>|spe@280000 &nbsp;|{ 0x00280000 0x00040000 0x002c0000
&nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x000200=
00
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x002e00=
00
0x00020000 0x0040a000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x000020=
00
} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>|spe@300000 &nbsp;|{ 0x00280000 0x00040000 0x002c0000
&nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x000200=
00
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x002e00=
00
0x00020000 0x0040a000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x000020=
00
} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>|spe@380000 &nbsp;|{ 0x00380000 0x00040000 0x003c0000
&nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x000200=
00
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x003e00=
00
0x00020000 0x0040e000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x000020=
00
} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br>
<br>
<br><tt><font size=3D2>&quot;interrupts&quot; property</font></tt>
<br>
<br><tt><font size=3D2>Standard property name: Property to specify the inte=
rrupt
numbers of the</font></tt>
<br><tt><font size=3D2>interrupts issued by SPE.</font></tt>
<br>
<br><tt><font size=3D2>prop-encoded array: List of interrupt numbers issued
by the SPE. Each value</font></tt>
<br><tt><font size=3D2>in the list is encoded as with encode-int.</font></t=
t>
<br>
<br><tt><font size=3D2>The property exists once in each spe node.</font></t=
t>
<br>
<br><tt><font size=3D2>Default values for SPEs are</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>|# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|Property Value
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>|spe@0 &nbsp; &nbsp; &nbsp;|{ 0x4, 0x104, 0x204 }
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; |</font></tt>
<br><tt><font size=3D2>|spe@80000 &nbsp;|{ 0x7, 0x107, 0x207 } &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |</fo=
nt></tt>
<br><tt><font size=3D2>|spe@100000 |{ 0x3, 0x103, 0x203 } &nbsp; &nbsp; &nb=
sp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |</font></tt>
<br><tt><font size=3D2>|spe@180000 |{ 0x8, 0x108, 0x208 } &nbsp; &nbsp; &nb=
sp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |</font></tt>
<br><tt><font size=3D2>|spe@200000 |{ 0x2, 0x102, 0x202 } &nbsp; &nbsp; &nb=
sp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |</font></tt>
<br><tt><font size=3D2>|spe@280000 |{ 0x9, 0x109, 0x209 } &nbsp; &nbsp; &nb=
sp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |</font></tt>
<br><tt><font size=3D2>|spe@300000 |{0x1, 0x101, 0x201 } &nbsp; &nbsp; &nbs=
p;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</fon=
t></tt>
<br><tt><font size=3D2>|spe@380000 |{0xa, 0x10a, 0x20a } &nbsp; &nbsp; &nbs=
p;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</fon=
t></tt>
<br>
<br>
<br><tt><font size=3D2>&quot;vicinity&quot; property</font></tt>
<br>
<br><tt><font size=3D2>property name: Specifies the direct neighbouring com=
ponentes
on the EIB</font></tt>
<br><tt><font size=3D2>ring related to each SPE.</font></tt>
<br>
<br><tt><font size=3D2>prop-encoded array: Pairs of phandles ( &lt; phandle,
phandle &gt;) of the</font></tt>
<br><tt><font size=3D2>neighbouring nodes, each phandle is encoded as with
encode-int.</font></tt>
<br>
<br><tt><font size=3D2>The property exists once in each spe node.</font></t=
t>
<br>
<br><tt><font size=3D2>Default values for SPEs</font></tt>
<br>
<br>
<br>
<br><tt><font size=3D2>|# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|Property Value
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>|spe@0 &nbsp; &nbsp; &nbsp;|{ phandle(mic-tm, SPE
3) } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|=
</font></tt>
<br><tt><font size=3D2>|spe@80000 &nbsp;|{ phandle(mic-tm, SPE 2) } &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>|spe@100000 |{ phandle(SPE 0, SPE 4) } &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |</font></tt>
<br><tt><font size=3D2>|spe@180000 |{ phandle(SPE 1, SPE 5) } &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |</font></tt>
<br><tt><font size=3D2>|spe@200000 |{ phandle(SPE 2, SPE 6) } &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |</font></tt>
<br><tt><font size=3D2>|spe@280000 |{ phandle(SPE 3, SPE 7) } &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |</font></tt>
<br><tt><font size=3D2>|spe@300000 |{ phandle(SPE 4, BIC0) } &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br><tt><font size=3D2>|spe@380000 |{ phandle(SPE 5, BIC0) } &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</font></tt>
<br>
<br>
<br><tt><font size=3D2>Appendix A - Bibliography</font></tt>
<br>
<br><tt><font size=3D2>This section lists documents which were referenced
in this specification &nbsp;or</font></tt>
<br><tt><font size=3D2>which provide &nbsp;additional &nbsp;information,
&nbsp;and &nbsp;some &nbsp;useful &nbsp;information &nbsp;for</font></tt>
<br><tt><font size=3D2>obtaining these documents. Referenced documents are
listed below. &nbsp;When &nbsp;any</font></tt>
<br><tt><font size=3D2>of the following standards are &nbsp;superseded &nbs=
p;by
&nbsp;an &nbsp;approved &nbsp;revision, &nbsp;the</font></tt>
<br><tt><font size=3D2>revision shall apply.</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;1. IEEE 1275, IEEE Standard for Boot
(Initialization Configuration)</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; Firmware: Core Requirements and
Practices</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; IEEE part number DS02683, ISBN
1-55937-426-8</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;2. PowerPC Processor binding &nbsp;to:
&nbsp;IEEE &nbsp;1275, &nbsp;IEEE &nbsp;Standard &nbsp;for &nbsp;Boot</font=
></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; (Initialization &nbsp;Configura=
tion)
&nbsp;Firmware: &nbsp; Core &nbsp; Requirements &nbsp; and</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; Practices</font></tt>
<br>
<br><tt><font size=3D2>&nbsp; &nbsp;3. &nbsp;Power.org &nbsp;Standard &nbsp=
;for
&nbsp;Power &nbsp;Architecture &nbsp;Platform &nbsp;Requirements</font></tt>
<br><tt><font size=3D2>&nbsp; &nbsp; &nbsp; (Workstation, Server) Version
2.2, 9th Oct 2007</font></tt>
<br>
--=_alternative 007E1E1EC125753D_=--

--===============0071452187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============0071452187==--
