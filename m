From: "Grant Likely" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Reminder 1: Device Tree documentation discussion for Cell/B.E.
	binding DRAFT - see Digest Vol 6, Issue 1
Date: Tue, 16 Dec 2008 15:08:17 -0700
Message-ID: <fa686aa40812161408j3672ba5cs7d8526cd643b69de@mail.gmail.com>
References: <OF89278B7C.B7D060FF-ONC1257521.004C9E27-C1257521.004D3F55@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <OF89278B7C.B7D060FF-ONC1257521.004C9E27-C1257521.004D3F55-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Christian Rund <Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 16, 2008 at 7:03 AM, Christian Rund
<Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org> wrote:
> this is a reminder for review. Feedback appreciated!
> For convenience I removed the disclaimer etc.
>
> On dec 5th I posted our (complete) draft version of the Cell/B.E. device
> tree documentation.
>
> Goal of these review should be to finally establish the document as
> Power.org
> PAPR Binding for the Cell/B.E. processor.
>
> Please review and give us feedback.

First comments; This document is quite verbose.  Much time is spent
describing how standard properties work (ie; content of the 'reg' and
'ranges' properties).  Reviewing takes more effort when there is a
large amount of boilerplate to filter.

Second, very few nodes have a 'compatible' value defined.  Currently,
the 'compatible' list is the preferred method for device drivers to
find supported devices in the tree.  Each distinct device should have
a unique compatible value defined.

More comments below

> 1 "be" node
[...]
> "device-type" property
>
>             Standard property name which specifies the type of the node.
>
>             Encoded as with encode-string.
>
>             Default value is { "be" }.

Is a new OpenFirmware driver interface being defined for working with
'be' devices?  If not then the device-type property should not be
defined.

> "model" property
>             property name: Specifies model of node.
>             Encoded as with encode-string.
>             Default value is { "IBM,CBEA" }.

> "ibm,dt-version" property

I'm concerned about the usage model of this property.  It is not
common for driver to go looking for an additional version property
when interpreting node data.  Are all drivers expected to test the
value of this property?  What should they do when the major or minor
values do not match?


> 1 ioc node
>
>
> The Input/Output Controller (IOC) node contains among others the properties
> specifying the address range of MMIO register space controlling the IOC.
>
> "reg" property
>
> Default property name: Property to specify the MMIO offset of the IOC,
> which are two sets of registers each represented by an < offset, size >
> pair.
>
> prop-encoded-array: Encoded as with encode-phys for the offset values,
> encode-int for the size values.
>
> The array consists of four 32-bit values to represent two < offset, size >
> pairs. Value one in this array corresponds to the first offset value within
> the child address space, encoded as with encode-phys. Value two corresponds
> to the size, encoded as with encode-int. Value three in this array
> corresponds to the second offset value, value four to the second size.
>
> Default value is { 0x00510000 0x00001000 0x00511000 0x00001000 }.

These spaces are contiguous; what is the reason for the two array entries?

> "device_type" property
>
> Standard property name: Specify the type of this node
>
> Encoded as with encode-string
>
> Default value is { "ioc" }

Again, if an OpenFirmware driver interface is not being defined, then
don't use the device-type property.

> 2 "bic0" node
[...]
> "device_type" property
>
> Standard property name: Property to specify the type of this node.
>
> Encoded as with encode-string.
>
> Default value is { "bic0" }.

ditto on device_type

> 3 "bic1" node

This is identical to bic0

> 4 "mic-tm" node
> 6 "ppe-mmio" node

mic-tm, ppe-mmio, and the bic* node documentation just duplicates the
definition of standard node properties.  In this case is should be
sufficient to describe what device the node describes an that it uses
the standard properties.

> 5 "pervasive" node
>
>
> The pervasive node node represents the  pervasive unit in the device tree.
> T>he main property value is the address range of MMIO register space
> controlling the pervasive unit.

Umm, what is a "pervasive unit"?

> "device_type" property
>
> Standard property name: Property to specify the type of this node.
>
> Encoded as with encode-string.
>
> Default value is { "pervasive" }.

ditto on device_type

> "ppe-throttle-temp" property
> "ppe-end-throttle-temp" property
> "ppe-full-throttle-temp" property
> "spe-throttle-temp" property
> "spe-end-throttle-temp" property
> "spe-full-throttle-temp" property

These properties look good.

> 7 "interrupt-controller" node
>
> The Cell Broadband Engine Architecture processor contains an Internal
> Interrupt Controller (IIC), which is handling all the interrupts from the
> PPE, the SPE and the connected IO.
>
> "reg" property
>
> Standard property name: Property to specify the MMIO offset of the IIC, one
> range for each of the two threads contained in each PPE and one range for
> the common MMIO.
>
> prop-encoded-array: Consisting of six 32-bit values. The values form three
> < offset,length > pairs of the denoted space encoded as with encode-phys
> for the offsets and encode-int for the sizes
>
>   1. for MMIO space of thread one
>
>   2. for MMIO space of thread two
>
>   3. for MMIO space of the common PPE MMIO space.
>
> Default value is
> { 0x00508400 0x00000020 0x00508420 0x00000020 0x00508000 0x00001000 }.
>
>
>
> "device_type" property
>
> Standard property name: Property to specify the type of this node.
>
> Encoded as with encode-string.
>
> Default value is { "CBEA-Internal-Interrupt-Controller" }.

ditto on device_type.  In fact, you should not be inventing new values
for device_type at all.  Either use an already established
device_type, or don't assign the property at all.  And, if you do use
device_type, you are claiming that OpenFirmware has a driver interface
for the device.

> 8 "spe" nodes
>
> The Cell Broadband Engine Architecture processor contains eight SPEs, each
> consisting of an SPU, 256kB local store and a Memory Flow Controller (MFC).
> The SPEs are connected to the EIB (Element Interconnect Bus) ring. The
> access to the internal devices is done via MMIO reads, with a fixed offset
> to the Cell Broadband Engine processor base address.
>
> "reg" property
>
> Standard property name: Specifies the MMIO offset and size of the SPEs
> Local Storage, Problem-State, Privilege 2 Area and Privilege 1 Area.
>
> prop-encoded array: Encoded as four < offset, length > pairs per SPE
> encoded as with encode-phys for the offsets, encode-int for the size. The
> pairs define the following SPE units:
>
>   1. Local Store (LS)
>
>   2. Problem State MMIO Registers
>
>   3. Privilege State 2 MMIO Registers
>
>   4. Privilege State 1 MMIO Registers
>
> The property exists once in each spe node.

I like the above description.  It provides good information about how
data is organized in the reg property.

> "device_type" property
>
> Standard property name: Specifies the type of this node.
>
> Encoded as with encode-string.
>
> Default value is  {"spe" }.

ditto on device_type


> "interrupts" property
>
> Standard property name: Property to specify the interrupt numbers of the
> interrupts issued by SPE.
>
> prop-encoded array: List of interrupt numbers issued by the SPE. Each value
> in the list is encoded as with encode-int.
>
> The property exists once in each spe node.
>
> Default values for SPEs are
>
>
>
> |#          |Property Value                                |
> |spe@0      |{ 0x4, 0x104, 0x204 }                         |
> |spe@80000  |{ 0x7, 0x107, 0x207 }                         |
> |spe@100000 |{ 0x3, 0x103, 0x203 }                         |
> |spe@180000 |{ 0x8, 0x108, 0x208 }                         |
> |spe@200000 |{ 0x2, 0x102, 0x202 }                         |
> |spe@280000 |{ 0x9, 0x109, 0x209 }                         |
> |spe@300000 |{0x1, 0x101, 0x201 }                          |
> |spe@380000 |{0xa, 0x10a, 0x20a }                          |
>
>
> "vicinity" property
>
> property name: Specifies the direct neighbouring componentes on the EIB
> ring related to each SPE.
>
> prop-encoded array: Pairs of phandles ( < phandle, phandle >) of the
> neighbouring nodes, each phandle is encoded as with encode-int.
>
> The property exists once in each spe node.
>
> Default values for SPEs
>
>
>
> |#          |Property Value                                |
> |spe@0      |{ phandle(mic-tm, SPE 3) }                    |
> |spe@80000  |{ phandle(mic-tm, SPE 2) }                    |
> |spe@100000 |{ phandle(SPE 0, SPE 4) }                     |
> |spe@180000 |{ phandle(SPE 1, SPE 5) }                     |
> |spe@200000 |{ phandle(SPE 2, SPE 6) }                     |
> |spe@280000 |{ phandle(SPE 3, SPE 7) }                     |
> |spe@300000 |{ phandle(SPE 4, BIC0) }                      |
> |spe@380000 |{ phandle(SPE 5, BIC0) }                      |
>
>
> "physical-id" property
>
> property name: Property to specify the physical id of an SPE.
>
> Default values for the physical id is encoded as with encode-int.

Unless there is some shared register set that needs the SPE physical
id to operate then I encourage you not to define this property.  If it
is just a logical number, the I think it is better to rely on the node
name instead of an arbitrarily defined logical number.  However, if
there is a register set shared between the SPEs that needs the SPE
number, then you should follow the lead of other existing bindings and
use the property name "cell-index" instead of physical-id.

Cheers,
g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
