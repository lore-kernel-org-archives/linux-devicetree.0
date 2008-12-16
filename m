From: Christian Rund <Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Subject: Reminder 1: Device Tree documentation discussion for Cell/B.E. binding
	DRAFT - see Digest Vol 6, Issue 1
Date: Tue, 16 Dec 2008 15:03:44 +0100
Message-ID: <OF89278B7C.B7D060FF-ONC1257521.004C9E27-C1257521.004D3F55@de.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0796359202=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
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
--===============0796359202==
Content-Type: multipart/related; boundary="=_related 004D3F52C1257521_="

This is a multipart message in MIME format.
--=_related 004D3F52C1257521_=
Content-Type: multipart/alternative; boundary="=_alternative 004D3F54C1257521_="


--=_alternative 004D3F54C1257521_=
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear Subscribers and Readers,

this is a reminder for review. Feedback appreciated!
For convenience I removed the disclaimer etc.

On dec 5th I posted our (complete) draft version of the Cell/B.E. device=20
tree documentation.
See also in devicetree-discuss Digest, Vol 6, Issue 1.

Goal of these review should be to finally establish the document as=20
Power.org=20
PAPR Binding for the Cell/B.E. processor.

Please review and give us feedback.

Thanks.
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F

DRAFT Power.org Standard for the Cell Broadband Engine architecture device
tree

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
   the device tree     7

  4.1  "be" node  7

   4.1.1    ioc node   10

   4.1.2    "bic0" node     11

   4.1.3    "bic1" node     11

   4.1.4    "mic-tm" node   12

   4.1.5    "pervasive" node      12

   4.1.6    "ppe-mmio" node 14

   4.1.7    "interrupt-controller" node 15

   4.1.8    "spe" nodes     16


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

"device-type" property


             Standard property name which specifies the type of the node.


             Encoded as with encode-string.


             Default value is { "be" }.



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

Default value is { 0x00510000 0x00001000 0x00511000 0x00001000 }.



"device=5Ftype" property

Standard property name: Specify the type of this node

Encoded as with encode-string

Default value is { "ioc" }



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
MMIO register space controlling the BIC0.

"reg" property

Default property name: Property to specify the MMIO offset of the BIC0,
which is one set of registers representing an < offset, size > pair.

prop-encoded-array: Encoded as with encode-phys for the offset value,
encode-int for the size.

Default value is { 0x00512000 0x00001000 }



"device=5Ftype" property

Standard property name: Property to specify the type of this node.

Encoded as with encode-string.

Default value is { "bic0" }.



3 "bic1" node


The Bus Interface Controller (BIC) 1 node describes the address range of
MMIO register space controlling the BIC1.

"reg" property

Default property name: Property to specify the MMIO offset of the BIC1,
which is one set of registers representing an < offset, size > pair.

prop-encoded-array: Encoded as with encode-phys for the offset value,
encode-int for the size.

 Default value is { 0x00513000 0x00001000 }



"device=5Ftype" property

Standard property name: Property to pecify the type of this node.

Encoded as with encode-string.

Default value is { "bic1" }.



4 "mic-tm" node


The "mic-tm" node represents the Memory Interface Controller (MIC) in the
device tree. The main property value is the address range of MMIO register
space controlling the MIC.

"reg" property

Default property name: Property to specify the MMIO offset of the BIC1,
which is one set of registers representing an < offset, size > pair.

prop-encoded-array: Encoded as with encode-phys for the offset value,
encode-int for the size.

Default value is { 0x0050a000 0x00001000 }.



"device=5Ftype" property

Standard property name: Specify the type of this node.

Encoded as with encode-string.

Default value is { "mic-tm" }.



5 "pervasive" node


The pervasive node node represents the  pervasive unit in the device tree.
T>he main property value is the address range of MMIO register space
controlling the pervasive unit.

"reg" property

Default property name: Property to specify the MMIO offset of the BIC1,
which is one set of registers representing an < offset, size > pair.

prop-encoded-array: Encoded as with encode-phys for the offset value,
encode-int for the size.

Default value is { 0x00509000 0x00001000 }.



"device=5Ftype" property

Standard property name: Property to specify the type of this node.

Encoded as with encode-string.

Default value is { "pervasive" }.



"ppe-throttle-temp" property

property name: Property to specify the minimum temperature the PPE is
throttled.

Temperature in =B0C, encoded as with encode-int.

Default value is { 0x65 } for 101=B0C



"ppe-end-throttle-temp" property

Standard property name: Property to specify the temperature below the PPE
throttling is exited.

Temperature in =B0C, encoded as with encode-int.

Default value is { 0x5b } for 91=B0C



"ppe-full-throttle-temp" property

property name:  Property to specify the minimum temperature the PPE is
stopped.

Temperature in =B0C, encoded as with encode-int.

Default value is { 0x7f } for 127=B0C



"spe-throttle-temp" property

property name: :  Property to specify the minimum temperature the SPEs are
throttled.

Temperature in =B0C, encoded as with encode-int.

Default value is { 0x65 } for 101=B0C



"spe-end-throttle-temp" property

property name: :  Property to specify the temperature below the SPEs
throttling is exited.

Temperature in =B0C, encoded as with encode-int.

Default value is { 0x5b } for 91=B0C



"spe-full-throttle-temp" property

property name: Property to specify the minimum temperature the PPE is
stopped.

Temperature in =B0C, encoded as with encode-int.

Default value is { 0x6f } for 111=B0C



6 "ppe-mmio" node


The "ppe-mmio" node represents the PowerPC Processing Element (PPE) in the
device tree. The main property is the address range of MMIO register space
controlling the PPE part of the Cell Broadband Engine processor.



"reg" property

Standard property name: Property to specify the MMIO offset of the mic.

prop-encoded-array: Encoded as with encode-phys for the offset, encode-int
for the size.

Default value is { 0x00500000 0x00001000 }



"device=5Ftype" property

Standard property name: Property to specify the type of this node.

Encoded as with encode-string.

Default value is { "ppe-mmio" }.



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

Default value is
{ 0x00508400 0x00000020 0x00508420 0x00000020 0x00508000 0x00001000 }.



"device=5Ftype" property

Standard property name: Property to specify the type of this node.

Encoded as with encode-string.

Default value is { "CBEA-Internal-Interrupt-Controller" }.



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

The value is {}.



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


"device=5Ftype" property

Standard property name: Specifies the type of this node.

Encoded as with encode-string.

Default value is  {"spe" }.



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


"physical-id" property

property name: Property to specify the physical id of an SPE.

Default values for the physical id is encoded as with encode-int.

The property exists once in each spe node.



|#          |Property Value                                |
|spe@0      |{ 0 }                                         |
|spe@80000  |{ 1 }                                         |
|spe@100000 |{ 2 }                                         |
|spe@180000 |{ 3 }                                         |
|spe@200000 |{ 4 }                                         |
|spe@280000 |{ 5 }                                         |
|spe@300000 |{ 6 }                                         |
|spe@380000 |{ 7 }                                         |
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

Mit freundlichen Gr=FC=DFen / Kind regards
Christian Rund=20
Engineer in Development, SLOF, directCell, Systems Management
IBM Systems & Technology Group, Integrated Systems Development
Open Systems Firmware Development

Phone:
+49-7031-16-3235
 IBM Deutschland

E-Mail:
Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org
 Schoenaicher Str. 220


 71032 Boeblingen
=20
=20
 Germany

IBM Deutschland Research & Development GmbH / Vorsitzender des=20
Aufsichtsrats: Martin Jetter=20
Geschaeftsfuehrung: Erich Baier=20
Sitz der Gesellschaft: Boeblingen / Registergericht: Amtsgericht=20
Stuttgart, HRB 243294
=20
=20
=20
=20
=20

--=_alternative 004D3F54C1257521_=
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable


<br><tt><font size=3D3>Dear Subscribers and Readers,<br>
<br>
this is a reminder for review. Feedback appreciated!</font></tt>
<br><tt><font size=3D3>For convenience I removed the disclaimer etc.</font>=
</tt>
<br>
<br><tt><font size=3D3>On dec 5th I posted our (complete) draft version of
the Cell/B.E. device tree documentation.<br>
See also in devicetree-discuss Digest, Vol 6, Issue 1.</font></tt>
<br>
<br><tt><font size=3D3>Goal of these review should be to finally establish
the document as Power.org <br>
PAPR Binding for the Cell/B.E. processor.<br>
<br>
Please review and give us feedback.<br>
<br>
Thanks.</font></tt>
<br><tt><font size=3D3>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>
<br>
DRAFT Power.org Standard for the Cell Broadband Engine architecture device<=
br>
tree<br>
</font></tt>
<br><tt><font size=3D3>Table of Contents<br>
<br>
<br>
<br>
1 &nbsp; &nbsp; Overview &nbsp; 5<br>
<br>
 &nbsp;1.1 &nbsp;Scope &nbsp; &nbsp; &nbsp;5<br>
<br>
 &nbsp;1.2 &nbsp;Purpose &nbsp; &nbsp;5<br>
<br>
2 &nbsp; &nbsp; Terminology &nbsp; &nbsp; &nbsp;5<br>
<br>
 &nbsp;2.1 &nbsp;Definitions &nbsp; &nbsp; 5<br>
<br>
 &nbsp;2.2 &nbsp;Abbreviations &nbsp; 5<br>
<br>
 &nbsp;2.3 &nbsp;Acronyms &nbsp; 5<br>
<br>
3 &nbsp; &nbsp; Introduction &nbsp; &nbsp; 6<br>
<br>
4 &nbsp; &nbsp; The Cell Broadband Engine &nbsp;architecture &nbsp;processor
&nbsp;representation &nbsp;in<br>
 &nbsp; the device tree &nbsp; &nbsp; 7<br>
<br>
 &nbsp;4.1 &nbsp;&quot;be&quot; node &nbsp;7<br>
<br>
 &nbsp; 4.1.1 &nbsp; &nbsp;ioc node &nbsp; 10<br>
<br>
 &nbsp; 4.1.2 &nbsp; &nbsp;&quot;bic0&quot; node &nbsp; &nbsp; 11<br>
<br>
 &nbsp; 4.1.3 &nbsp; &nbsp;&quot;bic1&quot; node &nbsp; &nbsp; 11<br>
<br>
 &nbsp; 4.1.4 &nbsp; &nbsp;&quot;mic-tm&quot; node &nbsp; 12<br>
<br>
 &nbsp; 4.1.5 &nbsp; &nbsp;&quot;pervasive&quot; node &nbsp; &nbsp; &nbsp;1=
2<br>
<br>
 &nbsp; 4.1.6 &nbsp; &nbsp;&quot;ppe-mmio&quot; node 14<br>
<br>
 &nbsp; 4.1.7 &nbsp; &nbsp;&quot;interrupt-controller&quot; node 15<br>
<br>
 &nbsp; 4.1.8 &nbsp; &nbsp;&quot;spe&quot; nodes &nbsp; &nbsp; 16<br>
<br>
<br>
DRAFT Power.org Standard for the Cell Broadband Engine architecture device<=
br>
tree<br>
<br>
 &nbsp; Overview<br>
<br>
<br>
1 Scope<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; This document is intended to apply the Power.org
Standard for Power<br>
 &nbsp; &nbsp; &nbsp; Architecture Platform Requirements (Workstation,
Server) PAPR on<br>
 &nbsp; &nbsp; &nbsp; Cell Broadband Engine architecture compliant processo=
rs.
This<br>
 &nbsp; &nbsp; &nbsp; encompasses requirements therein and additional requi=
rements
for<br>
 &nbsp; &nbsp; &nbsp; device tree nodes and properties pertaining to Cell
Broadband Engine<br>
 &nbsp; &nbsp; &nbsp; architecture compliant processors.<br>
<br>
2 Purpose<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; This document is intended to indicate the architectur=
al
option and<br>
 &nbsp; &nbsp; &nbsp; feature set of Cell Broadband Engine architecture
processors to<br>
 &nbsp; &nbsp; &nbsp; software via Open Firmware (OF).<br>
<br>
 &nbsp; Terminology<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp;This document uses definitions, abbreviations
and acronyms as<br>
 &nbsp; &nbsp; &nbsp; &nbsp;indicated below or in the PAPR specification
[3].<br>
<br>
1 Definitions<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; Device Tree: Open Firmware data structure representing
the set of<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; devices
attached to a system. See [1] for details.<br>
<br>
2 Abbreviations<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp;Define key abbreviations here (use &quot;paragr=
aph&quot;
plus tab), such as<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp;l.t.s.f.l.r. &nbsp; Leaving this section for
later revisions of this<br>
 &nbsp; &nbsp; &nbsp; &nbsp;document - to be removed if not used !!!!!!!!!!=
!!<br>
<br>
3 Acronyms<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp;Define key acronyms here (use &quot;paragraph&q=
uot;
style with tabs&quot;), such as<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp;EIB &nbsp; &nbsp; &nbsp; Element Interconnect
Bus<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp;IIC &nbsp; &nbsp; &nbsp; Internal Interrupt
Controller<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp;IOC &nbsp; &nbsp; &nbsp; Input Output Controlle=
r<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp;MMIO &nbsp; &nbsp; &nbsp;Memory Mapped Input
Output<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp;OF &nbsp; &nbsp; &nbsp; &nbsp;Open Firmware
(see [1]).<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp;PPE &nbsp; &nbsp; &nbsp; PowerPC Processing
Element<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp;SPE &nbsp; &nbsp; &nbsp; Synergistic Processing
Element<br>
<br>
<br>
<br>
 &nbsp; Introduction<br>
<br>
<br>
The specific goals of this specification are as follows:<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; . To provide the address map for the
components in a Cell<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Broadband Engine Architecture
processor. Subcomponent address<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; information is detected by the
OF and passed to the OS in the<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; device tree.<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; . To build upon the OF boot environment
defined in IEEE 1275,<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; IEEE Standard for Boot (Initiali=
zation
Configuration) Firmware:<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Core Requirements and Practices.=
<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; . To provide device tree nodes and
property values necessary for<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; access to and configuration
of the Cell Broadband Engine<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Architecture processor subcompon=
ents.<br>
<br>
The Cell Broadband Engine architecture processors are implemented as<br>
systems on a chip. Besides a PowerPC processor it contains eight<br>
Synergistic Processing Elements (SPEs) in addition. Each SPE has access
to<br>
256kB of associated local store. All logic of the non-processor part is<br>
accessed via MMIO. Mapping and structure of the MMIO space are described<br>
with the &quot;be&quot; node. A &nbsp;nodes' unit address is the MMIO addre=
ss
of that<br>
particular BE. The &quot;be&quot; node is located in the device tree as
child of the<br>
root node '/'.<br>
<br>
 &nbsp; The Cell Broadband Engine architecture processor representation
in the<br>
 &nbsp; device tree<br>
<br>
<br>
The following contents are outlined according to the hierarchy of the<br>
components in the sub-tree containing the components of the Cell Broadband<=
br>
Engine processor.<br>
<br>
All device tree nodes detailed below contain a &quot;name&quot; property
in addition<br>
to the mentioned properties as follows<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; . Specifies the name of the node<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; . Encoded as with encode-string<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; . Default is the name of the node<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Throughout the description below
the notation<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; phandle(&lt;expression&gt;)
is used to retrieve the phandle of a<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; node. A phandle of a device
tree node is the cell-sized datum<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; identifying the particular device
tree node.<br>
<br>
1 &quot;be&quot; node<br>
<br>
<br>
The &quot;be&quot; node contains a set of properties and sub-nodes, which
describe<br>
the structure of a Cell Broadband Engine Architecture processor. All the<br>
devices are contained, except the Power PC processor core nodes, which
are<br>
located under the &quot;/cpus&quot; path according to the PowerPC Processor
binding<br>
to the IEEE 1275 standard.<br>
<br>
&quot;reg&quot; property<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Standard property name specifying
the &lt; address, size &gt; pair of<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; the Cell Broadband Engine proces=
sor's
MMIO mapped registers.<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Prop-encoded array: Encoded
as with encode-phys for the<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; address. The size part is encoded
with two encode-ints.<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; The array consists of four 32-bit
values. Value one and two in<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; this array correspond to the
64-bit address value the the Cell<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Broadband Engine Architecture
processor is mapped into. Value<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; three and four correspond to
the 64-bit size. Both pairs<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; represent the &lt; address,
size &gt; pair of MMIO mapped registers<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in the Cell Broadband Engine
processor's MMIO mapped register<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; space.<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Default value is { 0x00000iii
0x00000000 0x00000000 0x000800000<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }, where iii is the offset defin=
ed
by the hardware settings.<br>
<br>
&quot;ranges&quot; property<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Standard property name which
specifies the mapping of the child<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; of the &quot;be&quot; node within
the &nbsp;&quot;be&quot; nodes' parent address space<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; using the &lt; child, parent,
size &gt; triple.<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Prop-encoded array: Encoded
as with encode-int for the childs<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; range, encode-phys for the paren=
ts
range and encode-int for the<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size.<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; The array consists of four 32-bit
values. Value one in this<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; array corresponds to the 32-bit
child address encoded as with<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; encode-int. Value two and three
correspond to the 64-bit parent<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; address encoded as with encode-p=
hys.
Value three in this array<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; corresponds to the 32-bit size.<=
br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Default value is { 0x00000000
0x00000iii 0x00000000 0x00080000<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }, mapping address 0 of child
to 0x00000iii 00000000.<br>
<br>
&quot;device-type&quot; property<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Standard property name which
specifies the type of the node.<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Encoded as with encode-string.<b=
r>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Default value is { &quot;be&quot;
}.<br>
<br>
<br>
<br>
&quot;model&quot; property<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; property name: Specifies model
of node.<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Encoded as with encode-string.<b=
r>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Default value is { &quot;IBM,CBE=
A&quot;
}.<br>
<br>
<br>
<br>
&quot;ibm,dt-version&quot; property<br>
<br>
property name: Specifies the current device tree version number. The<br>
version number format is major.minor.<br>
<br>
Whenever the device tree is changed or extended in a way that OS changes<br>
are required the major version is changed.<br>
<br>
The minor version is changed when at least one new property is added or<br>
removed.<br>
<br>
Encoded as with encode-string<br>
<br>
The default value is { 1.1 }<br>
<br>
<br>
<br>
&quot;#address-cells&quot; property<br>
<br>
<br>
property name which specifies the number of address cells for child nodes<b=
r>
 &nbsp; to the current node.<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Encoded as with encode-int.<br>
<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Default value is { 1 }<br>
<br>
<br>
<br>
&quot;#size-cells&quot; property<br>
<br>
Standard property name which specifies the number of size cells for child<b=
r>
nodes to the current node.<br>
<br>
 Encoded as with encode-int.<br>
<br>
Default value is { 1 }<br>
<br>
<br>
<br>
&quot;ibm,associativity&quot; property<br>
<br>
property name: Property to define the associativity domains for this<br>
resource.<br>
See Power Architecture Platform Requirements (PAPR) [3], Sections<br>
14.11.2.2, 15.2, 15.3, 18.3 and C.6.2.2 for details on this property.<br>
<br>
Set values to { 4 0x00000000, 0x00000000, 0x0000000i, 0x0000000i }; i =3D
0<br>
for associativity to Cell Broadband Engine processor 0, i =3D 1 for<br>
associativity to Cell Broadband Engine processor 1.<br>
<br>
<br>
<br>
&quot;interrupt-parent&quot; property<br>
<br>
property name: Property that specifies the interrupt handler responsible<br>
for this node.<br>
<br>
The value represents a phandle of the interrupt handler node, encoded as<br>
with encode-int.<br>
<br>
Default value is { phandle( my-self/interrupt-controller) }<br>
<br>
<br>
<br>
&quot;cpus&quot; property<br>
<br>
property name: Porperty to specify the PPE component of the Cell Broadband<=
br>
Engine architecture processor chip.<br>
<br>
phandle of the cpu node, encoded as with encode-int.<br>
<br>
Default value is { phandle(/cpus/PowerPC,BE@i) }; i =3D 0 for Cell Broadban=
d<br>
Engine Architecture processor 0, i =3D 1 for Cell Broadband Engine<br>
Architecture processor 1.<br>
<br>
1 ioc node<br>
<br>
<br>
The Input/Output Controller (IOC) node contains among others the properties=
<br>
specifying the address range of MMIO register space controlling the IOC.<br>
<br>
&quot;reg&quot; property<br>
<br>
Default property name: Property to specify the MMIO offset of the IOC,<br>
which are two sets of registers each represented by an &lt; offset, size
&gt;<br>
pair.<br>
<br>
prop-encoded-array: Encoded as with encode-phys for the offset values,<br>
encode-int for the size values.<br>
<br>
The array consists of four 32-bit values to represent two &lt; offset,
size &gt;<br>
pairs. Value one in this array corresponds to the first offset value within=
<br>
the child address space, encoded as with encode-phys. Value two corresponds=
<br>
to the size, encoded as with encode-int. Value three in this array<br>
corresponds to the second offset value, value four to the second size.<br>
<br>
Default value is { 0x00510000 0x00001000 0x00511000 0x00001000 }.<br>
<br>
<br>
<br>
&quot;device=5Ftype&quot; property<br>
<br>
Standard property name: Specify the type of this node<br>
<br>
Encoded as with encode-string<br>
<br>
Default value is { &quot;ioc&quot; }<br>
<br>
<br>
<br>
&quot;interrupts&quot; property<br>
<br>
Standard property name: Property which specifies the interrupt number of<br>
the interrupt issued by the IOC for IIC &quot;IO Exceptions&quot;<br>
<br>
Encoded as with encode-int.<br>
<br>
The property value consists of four bytes each representing a specific<br>
value for a node, an Internal Interrupt Controller Interrupt Service<br>
Routine bit mask, a class and a unit<br>
<br>
 0xNN3d010e (NN=3Dnode, bit 3d (61) in IIC=5FISR, class=3D1, unit=3DE for I=
IC=5FISR<br>
interrupt)<br>
<br>
Default value is { 0i3d010e }, i =3D 0 for Cell Broadband Engine processor
0,<br>
i =3D 1 for Cell Broadband Engine processor 1.<br>
<br>
<br>
<br>
2 &quot;bic0&quot; node<br>
<br>
<br>
The Bus Interface Controller (BIC) 0 node describes the address range of<br>
MMIO register space controlling the BIC0.<br>
<br>
&quot;reg&quot; property<br>
<br>
Default property name: Property to specify the MMIO offset of the BIC0,<br>
which is one set of registers representing an &lt; offset, size &gt; pair.<=
br>
<br>
prop-encoded-array: Encoded as with encode-phys for the offset value,<br>
encode-int for the size.<br>
<br>
Default value is { 0x00512000 0x00001000 }<br>
<br>
<br>
<br>
&quot;device=5Ftype&quot; property<br>
<br>
Standard property name: Property to specify the type of this node.<br>
<br>
Encoded as with encode-string.<br>
<br>
Default value is { &quot;bic0&quot; }.<br>
<br>
<br>
<br>
3 &quot;bic1&quot; node<br>
<br>
<br>
The Bus Interface Controller (BIC) 1 node describes the address range of<br>
MMIO register space controlling the BIC1.<br>
<br>
&quot;reg&quot; property<br>
<br>
Default property name: Property to specify the MMIO offset of the BIC1,<br>
which is one set of registers representing an &lt; offset, size &gt; pair.<=
br>
<br>
prop-encoded-array: Encoded as with encode-phys for the offset value,<br>
encode-int for the size.<br>
<br>
 Default value is { 0x00513000 0x00001000 }<br>
<br>
<br>
<br>
&quot;device=5Ftype&quot; property<br>
<br>
Standard property name: Property to pecify the type of this node.<br>
<br>
Encoded as with encode-string.<br>
<br>
Default value is { &quot;bic1&quot; }.<br>
<br>
<br>
<br>
4 &quot;mic-tm&quot; node<br>
<br>
<br>
The &quot;mic-tm&quot; node represents the Memory Interface Controller
(MIC) in the<br>
device tree. The main property value is the address range of MMIO register<=
br>
space controlling the MIC.<br>
<br>
&quot;reg&quot; property<br>
<br>
Default property name: Property to specify the MMIO offset of the BIC1,<br>
which is one set of registers representing an &lt; offset, size &gt; pair.<=
br>
<br>
prop-encoded-array: Encoded as with encode-phys for the offset value,<br>
encode-int for the size.<br>
<br>
Default value is { 0x0050a000 0x00001000 }.<br>
<br>
<br>
<br>
&quot;device=5Ftype&quot; property<br>
<br>
Standard property name: Specify the type of this node.<br>
<br>
Encoded as with encode-string.<br>
<br>
Default value is { &quot;mic-tm&quot; }.<br>
<br>
<br>
<br>
5 &quot;pervasive&quot; node<br>
<br>
<br>
The pervasive node node represents the &nbsp;pervasive unit in the device
tree.<br>
T&gt;he main property value is the address range of MMIO register space<br>
controlling the pervasive unit.<br>
<br>
&quot;reg&quot; property<br>
<br>
Default property name: Property to specify the MMIO offset of the BIC1,<br>
which is one set of registers representing an &lt; offset, size &gt; pair.<=
br>
<br>
prop-encoded-array: Encoded as with encode-phys for the offset value,<br>
encode-int for the size.<br>
<br>
Default value is { 0x00509000 0x00001000 }.<br>
<br>
<br>
<br>
&quot;device=5Ftype&quot; property<br>
<br>
Standard property name: Property to specify the type of this node.<br>
<br>
Encoded as with encode-string.<br>
<br>
Default value is { &quot;pervasive&quot; }.<br>
<br>
<br>
<br>
&quot;ppe-throttle-temp&quot; property<br>
<br>
property name: Property to specify the minimum temperature the PPE is<br>
throttled.<br>
<br>
Temperature in =B0C, encoded as with encode-int.<br>
<br>
Default value is { 0x65 } for 101=B0C<br>
<br>
<br>
<br>
&quot;ppe-end-throttle-temp&quot; property<br>
<br>
Standard property name: Property to specify the temperature below the PPE<b=
r>
throttling is exited.<br>
<br>
Temperature in =B0C, encoded as with encode-int.<br>
<br>
Default value is { 0x5b } for 91=B0C<br>
<br>
<br>
<br>
&quot;ppe-full-throttle-temp&quot; property<br>
<br>
property name: &nbsp;Property to specify the minimum temperature the PPE
is<br>
stopped.<br>
<br>
Temperature in =B0C, encoded as with encode-int.<br>
<br>
Default value is { 0x7f } for 127=B0C<br>
<br>
<br>
<br>
&quot;spe-throttle-temp&quot; property<br>
<br>
property name: : &nbsp;Property to specify the minimum temperature the
SPEs are<br>
throttled.</font></tt>
<br><tt><font size=3D3><br>
Temperature in =B0C, encoded as with encode-int.<br>
<br>
Default value is { 0x65 } for 101=B0C<br>
<br>
<br>
<br>
&quot;spe-end-throttle-temp&quot; property<br>
<br>
property name: : &nbsp;Property to specify the temperature below the SPEs<b=
r>
throttling is exited.<br>
<br>
Temperature in =B0C, encoded as with encode-int.<br>
<br>
Default value is { 0x5b } for 91=B0C<br>
<br>
<br>
<br>
&quot;spe-full-throttle-temp&quot; property<br>
<br>
property name: Property to specify the minimum temperature the PPE is<br>
stopped.<br>
<br>
Temperature in =B0C, encoded as with encode-int.<br>
<br>
Default value is { 0x6f } for 111=B0C<br>
<br>
<br>
<br>
6 &quot;ppe-mmio&quot; node<br>
<br>
<br>
The &quot;ppe-mmio&quot; node represents the PowerPC Processing Element
(PPE) in the<br>
device tree. The main property is the address range of MMIO register space<=
br>
controlling the PPE part of the Cell Broadband Engine processor.<br>
<br>
<br>
<br>
&quot;reg&quot; property<br>
<br>
Standard property name: Property to specify the MMIO offset of the mic.<br>
<br>
prop-encoded-array: Encoded as with encode-phys for the offset, encode-int<=
br>
for the size.<br>
<br>
Default value is { 0x00500000 0x00001000 }<br>
<br>
<br>
<br>
&quot;device=5Ftype&quot; property<br>
<br>
Standard property name: Property to specify the type of this node.<br>
<br>
Encoded as with encode-string.<br>
<br>
Default value is { &quot;ppe-mmio&quot; }.<br>
<br>
<br>
<br>
7 &quot;interrupt-controller&quot; node<br>
<br>
<br>
The Cell Broadband Engine Architecture processor contains an Internal<br>
Interrupt Controller (IIC), which is handling all the interrupts from the<b=
r>
PPE, the SPE and the connected IO.<br>
<br>
&quot;reg&quot; property<br>
<br>
Standard property name: Property to specify the MMIO offset of the IIC,
one<br>
range for each of the two threads contained in each PPE and one range for<b=
r>
the common MMIO.<br>
<br>
prop-encoded-array: Consisting of six 32-bit values. The values form three<=
br>
&lt; offset,length &gt; pairs of the denoted space encoded as with encode-p=
hys<br>
for the offsets and encode-int for the sizes<br>
<br>
 &nbsp; 1. for MMIO space of thread one<br>
<br>
 &nbsp; 2. for MMIO space of thread two<br>
<br>
 &nbsp; 3. for MMIO space of the common PPE MMIO space.<br>
<br>
Default value is<br>
{ 0x00508400 0x00000020 0x00508420 0x00000020 0x00508000 0x00001000 }.<br>
<br>
<br>
<br>
&quot;device=5Ftype&quot; property<br>
<br>
Standard property name: Property to specify the type of this node.<br>
<br>
Encoded as with encode-string.<br>
<br>
Default value is { &quot;CBEA-Internal-Interrupt-Controller&quot; }.<br>
<br>
<br>
<br>
&quot;compatible&quot; property<br>
<br>
property name: Property to specify the compatiblity of this interrupt<br>
controller.<br>
<br>
Encoded as with encode-string.<br>
<br>
Default values is { &quot;IBM,CBEA-Internal-Interrupt-Controller&quot;
}.<br>
<br>
<br>
<br>
&quot;interrupt-controller&quot; property<br>
<br>
property name: Property to specify that this node is an interrupt<br>
controller.<br>
<br>
The mere presence of this property denotes the current node being an<br>
interrupt controller.<br>
<br>
Zero length property.<br>
<br>
The value is {}.<br>
<br>
<br>
<br>
&quot;#interrupt-cells&quot; property<br>
<br>
Standard property name: Property to specify the number of interrupt cells.<=
br>
<br>
Encoded as with encode-int.<br>
<br>
Default value is { 0x1 }.<br>
<br>
<br>
<br>
&quot;ibm,interrupt-server-ranges&quot; property<br>
<br>
property name: Property to specify the threads handled by this interrupt<br>
controller.<br>
<br>
Array of threads, encoded as with encode-int.<br>
<br>
Default values for<br>
<br>
<br>
<br>
|Cell Broadband Engine &nbsp; &nbsp;|Property Value &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; |<br>
|Architecture processor # | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
|0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|{ 0x00000000 0x00000001 }|<br>
|1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|{ 0x00000000 0x00000001 }|<br>
<br>
<br>
8 &quot;spe&quot; nodes<br>
<br>
<br>
The Cell Broadband Engine Architecture processor contains eight SPEs, each<=
br>
consisting of an SPU, 256kB local store and a Memory Flow Controller (MFC).=
<br>
The SPEs are connected to the EIB (Element Interconnect Bus) ring. The<br>
access to the internal devices is done via MMIO reads, with a fixed offset<=
br>
to the Cell Broadband Engine processor base address.<br>
<br>
<br>
<br>
&quot;reg&quot; property<br>
<br>
Standard property name: Specifies the MMIO offset and size of the SPEs<br>
Local Storage, Problem-State, Privilege 2 Area and Privilege 1 Area.<br>
<br>
prop-encoded array: Encoded as four &lt; offset, length &gt; pairs per
SPE<br>
encoded as with encode-phys for the offsets, encode-int for the size. The<b=
r>
pairs define the following SPE units:<br>
<br>
 &nbsp; 1. Local Store (LS)<br>
<br>
 &nbsp; 2. Problem State MMIO Registers<br>
<br>
 &nbsp; 3. Privilege State 2 MMIO Registers<br>
<br>
 &nbsp; 4. Privilege State 1 MMIO Registers<br>
<br>
The property exists once in each spe node.<br>
<br>
Default values for SPE<br>
<br>
<br>
<br>
|# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |Property Value &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;|<br>
|spe@0 &nbsp; &nbsp; &nbsp; |{ 0x00000000 0x00040000 0x00040000 &nbsp;
&nbsp; &nbsp; &nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x00020000 &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x00060000 0x00020000 0x00400000
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x00002000 } &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|<br>
|spe@80000 &nbsp; |{ 0x00080000 0x00040000 0x000c0000 &nbsp; &nbsp; &nbsp;
&nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x00020000 &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x000e0000 0x00020000 0x00402000
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x00002000 } &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|<br>
|spe@100000 &nbsp;|{ 0x00100000 0x00040000 0x00140000 &nbsp; &nbsp; &nbsp;
&nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x00020000 &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x00160000 0x00020000 0x00404000
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x00002000 } &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|<br>
|spe@180000 &nbsp;|{ 0x00180000 0x00040000 0x001c0000 &nbsp; &nbsp; &nbsp;
&nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x00020000 &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x001e0000 0x00020000 0x00406000
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x00002000 } &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|<br>
|spe@200000 &nbsp;|{ 0x00200000 0x00040000 0x00240000 &nbsp; &nbsp; &nbsp;
&nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x00020000 &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x00260000 0x00020000 0x00408000
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x00002000 } &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|<br>
|spe@280000 &nbsp;|{ 0x00280000 0x00040000 0x002c0000 &nbsp; &nbsp; &nbsp;
&nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x00020000 &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x002e0000 0x00020000 0x0040a000
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x00002000 } &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|<br>
|spe@300000 &nbsp;|{ 0x00280000 0x00040000 0x002c0000 &nbsp; &nbsp; &nbsp;
&nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x00020000 &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x002e0000 0x00020000 0x0040a000
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x00002000 } &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|<br>
|spe@380000 &nbsp;|{ 0x00380000 0x00040000 0x003c0000 &nbsp; &nbsp; &nbsp;
&nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x00020000 &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x003e0000 0x00020000 0x0040e000
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|0x00002000 } &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|<br>
<br>
<br>
&quot;device=5Ftype&quot; property<br>
<br>
Standard property name: Specifies the type of this node.<br>
<br>
Encoded as with encode-string.<br>
<br>
Default value is &nbsp;{&quot;spe&quot; }.<br>
<br>
<br>
<br>
&quot;interrupts&quot; property<br>
<br>
Standard property name: Property to specify the interrupt numbers of the<br>
interrupts issued by SPE.<br>
<br>
prop-encoded array: List of interrupt numbers issued by the SPE. Each value=
<br>
in the list is encoded as with encode-int.<br>
<br>
The property exists once in each spe node.<br>
<br>
Default values for SPEs are<br>
<br>
<br>
<br>
|# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|Property Value &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|<br>
|spe@0 &nbsp; &nbsp; &nbsp;|{ 0x4, 0x104, 0x204 } &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
|spe@80000 &nbsp;|{ 0x7, 0x107, 0x207 } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
|spe@100000 |{ 0x3, 0x103, 0x203 } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
|spe@180000 |{ 0x8, 0x108, 0x208 } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
|spe@200000 |{ 0x2, 0x102, 0x202 } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
|spe@280000 |{ 0x9, 0x109, 0x209 } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
|spe@300000 |{0x1, 0x101, 0x201 } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
|spe@380000 |{0xa, 0x10a, 0x20a } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
<br>
<br>
&quot;vicinity&quot; property<br>
<br>
property name: Specifies the direct neighbouring componentes on the EIB<br>
ring related to each SPE.<br>
<br>
prop-encoded array: Pairs of phandles ( &lt; phandle, phandle &gt;) of
the<br>
neighbouring nodes, each phandle is encoded as with encode-int.<br>
<br>
The property exists once in each spe node.<br>
<br>
Default values for SPEs<br>
<br>
<br>
<br>
|# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|Property Value &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|<br>
|spe@0 &nbsp; &nbsp; &nbsp;|{ phandle(mic-tm, SPE 3) } &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
|spe@80000 &nbsp;|{ phandle(mic-tm, SPE 2) } &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
|spe@100000 |{ phandle(SPE 0, SPE 4) } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
|spe@180000 |{ phandle(SPE 1, SPE 5) } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
|spe@200000 |{ phandle(SPE 2, SPE 6) } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
|spe@280000 |{ phandle(SPE 3, SPE 7) } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
|spe@300000 |{ phandle(SPE 4, BIC0) } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
|spe@380000 |{ phandle(SPE 5, BIC0) } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
<br>
<br>
&quot;physical-id&quot; property<br>
<br>
property name: Property to specify the physical id of an SPE.<br>
<br>
Default values for the physical id is encoded as with encode-int.<br>
<br>
The property exists once in each spe node.<br>
<br>
<br>
<br>
|# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|Property Value &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;|<br>
|spe@0 &nbsp; &nbsp; &nbsp;|{ 0 } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; |<br>
|spe@80000 &nbsp;|{ 1 } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; |<br>
|spe@100000 |{ 2 } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; |<br>
|spe@180000 |{ 3 } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; |<br>
|spe@200000 |{ 4 } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; |<br>
|spe@280000 |{ 5 } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; |<br>
|spe@300000 |{ 6 } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; |<br>
|spe@380000 |{ 7 } &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; |<br>
 Appendix A - Bibliography<br>
<br>
This section lists documents which were referenced in this specification
&nbsp;or<br>
which provide &nbsp;additional &nbsp;information, &nbsp;and &nbsp;some
&nbsp;useful &nbsp;information &nbsp;for<br>
obtaining these documents. Referenced documents are listed below. &nbsp;When
&nbsp;any<br>
of the following standards are &nbsp;superseded &nbsp;by &nbsp;an &nbsp;app=
roved
&nbsp;revision, &nbsp;the<br>
revision shall apply.<br>
<br>
 &nbsp; 1. IEEE 1275, IEEE Standard for Boot (Initialization Configuration)=
<br>
 &nbsp; &nbsp; &nbsp;Firmware: Core Requirements and Practices<br>
<br>
 &nbsp; &nbsp; &nbsp;IEEE part number DS02683, ISBN 1-55937-426-8<br>
<br>
 &nbsp; 2. PowerPC Processor binding &nbsp;to: &nbsp;IEEE &nbsp;1275, &nbsp=
;IEEE
&nbsp;Standard &nbsp;for &nbsp;Boot<br>
 &nbsp; &nbsp; &nbsp;(Initialization &nbsp;Configuration) &nbsp;Firmware:
&nbsp; Core &nbsp; Requirements &nbsp; and<br>
 &nbsp; &nbsp; &nbsp;Practices<br>
<br>
 &nbsp; 3. &nbsp;Power.org &nbsp;Standard &nbsp;for &nbsp;Power &nbsp;Archi=
tecture
&nbsp;Platform &nbsp;Requirements<br>
 &nbsp; &nbsp; &nbsp;(Workstation, Server) Version 2.2, 9th Oct 2007</font>=
</tt>
<br><font size=3D2 face=3D"sans-serif"><br>
</font><font size=3D1 face=3D"Arial">Mit freundlichen Gr=FC=DFen / Kind reg=
ards</font><font size=3D2 face=3D"Arial"><b><br>
Christian Rund</b></font><font size=3D3> </font>
<table>
<tr>
<td colspan=3D4><font size=3D1 color=3D#0060a0 face=3D"Arial">Engineer in D=
evelopment,
SLOF, directCell, Systems Management</font>
<tr>
<td colspan=3D4><font size=3D1 color=3D#0060a0 face=3D"Arial">IBM Systems &=
amp;
Technology Group, Integrated Systems Development</font>
<tr>
<td colspan=3D4><font size=3D1 color=3D#0060a0 face=3D"Arial">Open Systems =
Firmware
Development</font>
<tr>
<td colspan=3D4>
<hr>
<tr>
<td><font size=3D1 color=3D#0060a0 face=3D"Arial">Phone:</font>
<td><font size=3D1 color=3D#0060a0 face=3D"Arial">+49-7031-16-3235</font>
<td><font size=3D1 color=3D#0060a0 face=3D"Arial">&nbsp;IBM Deutschland</fo=
nt>
<td rowspan=3D4>
<div align=3Dright><img src=3Dcid:=5F1=5F06FE8AA806FE86EC004D3F4EC1257521><=
/div>
<tr>
<td><font size=3D1 color=3D#0060a0 face=3D"Arial">E-Mail:</font>
<td><font size=3D1 color=3D#0060a0 face=3D"Arial">Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org=
</font>
<td><font size=3D1 color=3D#0060a0 face=3D"Arial">&nbsp;Schoenaicher Str. 2=
20</font>
<tr>
<td>
<td>
<td><font size=3D1 color=3D#0060a0 face=3D"Arial">&nbsp;71032 Boeblingen</f=
ont>
<tr>
<td><font size=3D1 color=3D#0060a0 face=3D"Arial">&nbsp;</font>
<td><font size=3D1 color=3D#0060a0 face=3D"Arial">&nbsp;</font>
<td><font size=3D1 color=3D#0060a0 face=3D"Arial">&nbsp;Germany</font>
<tr>
<td colspan=3D4>
<hr>
<tr>
<td colspan=3D4><font size=3D1 color=3D#a2a2a2 face=3D"Arial">IBM Deutschla=
nd Research
&amp; Development GmbH / Vorsitzender des Aufsichtsrats: Martin Jetter
<br>
Geschaeftsfuehrung: Erich Baier <br>
Sitz der Gesellschaft: Boeblingen / Registergericht: Amtsgericht Stuttgart,
HRB 243294</font>
<tr>
<td colspan=3D4><font size=3D1 face=3D"Arial">&nbsp;</font>
<tr>
<td><font size=3D3>&nbsp;</font>
<td><font size=3D3>&nbsp;</font>
<td><font size=3D3>&nbsp;</font>
<td><font size=3D3>&nbsp;</font></table>
<br>
--=_alternative 004D3F54C1257521_=--

--=_related 004D3F52C1257521_=
Content-Type: image/gif
Content-ID: <_1_06FE8AA806FE86EC004D3F4EC1257521>
Content-Transfer-Encoding: base64

R0lGODlhVwAeAPcAAAAAAIAAAACAAICAAAAAgIAAgACAgMDAwMDcwKbK8ER3u8bGxv///wAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAP/78KCgpICAgP8AAAD/AP//AAAA//8A/wD//////yH5BAAAAAAALAAAAABXAB4A
hwAAAIAAAACAAICAAAAAgIAAgACAgMDAwMDcwKbK8ER3u8bGxv///wAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP/7
8KCgpICAgP8AAAD/AP//AAAA//8A/wD//////wj+ABcoGEiwYMEFDAQaXGhwAUIGEBMyLBixIsSJ
By1qVIiRIEKOHRc+hAiS4ciKJU1qXMmypcuXMGPKnEmzps2bLlNO/Biy40OdBlf2VHByJVCREoeq
TOrT4tGMOKNKnUq1qtWrDBjmDIoSacWOFpve1NqypNOFGsUyXYq1rdu3cOO2JMvyKdq0Te0WnUnX
qFKiQkUebOhVruHDiBPD7Lvx796sDddmLFyT8dm/gaFOvBhZsefPoN9a7kqRdOmvnVNGpExzdESz
pj2G7QxZNmeooXPr3o1aAUmlPP/ePToSZG+2F1dLxhhcuG3ivU+qzZpVIHXecH0PTI5dNHXtdmUZ
h9/5mnnXotOvUx8PmP3Bk9C/4iU/2zeDgAA7
--=_related 004D3F52C1257521_=--

--===============0796359202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============0796359202==--
