From: Christian Rund <Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Subject: Re: devicetree-discuss Digest, Vol 6, Issue 7
Date: Thu, 18 Dec 2008 15:17:38 +0100
Message-ID: <OF6B36395E.E0A4363C-ONC1257522.0035FA7C-C1257523.004E84FF@de.ibm.com>
References: <mailman.11.1229475607.16627.devicetree-discuss@ozlabs.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0734390067=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <mailman.11.1229475607.16627.devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
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
Cc: devicetree-discuss-bounces+christian.rund=de.ibm.com-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multipart message in MIME format.
--===============0734390067==
Content-Type: multipart/alternative; boundary="=_alternative 004E84FCC1257523_="

This is a multipart message in MIME format.
--=_alternative 004E84FCC1257523_=
Content-Type: text/plain; charset="US-ASCII"

devicetree-discuss-bounces+christian.rund=de.ibm.com-mnsaURCQ41sdnm+yROfE0A@public.gmane.org wrote on 
17.12.2008 02:00:07:

> Send devicetree-discuss mailing list submissions to
>    devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
> 
> To subscribe or unsubscribe via the World Wide Web, visit
>    https://ozlabs.org/mailman/listinfo/devicetree-discuss
> or, via email, send a message with subject or body 'help' to
>    devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
> 
> You can reach the person managing the list at
>    devicetree-discuss-owner-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
> 
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of devicetree-discuss digest..."
> 
> 
> Today's Topics:
> 
>    1. Re: Reminder 1: Device Tree documentation discussion for
>       Cell/B.E.   binding DRAFT - see Digest Vol 6, Issue 1 (Grant 
Likely)
> 
> 
> ----------------------------------------------------------------------
> 
> Message: 1
> Date: Tue, 16 Dec 2008 15:08:17 -0700
> From: "Grant Likely" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Subject: Re: Reminder 1: Device Tree documentation discussion for
>    Cell/B.E.   binding DRAFT - see Digest Vol 6, Issue 1
> To: "Christian Rund" <Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
> Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
> Message-ID:
>    <fa686aa40812161408j3672ba5cs7d8526cd643b69de-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
> Content-Type: text/plain; charset=ISO-8859-1
> 
> On Tue, Dec 16, 2008 at 7:03 AM, Christian Rund
> <Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org> wrote:
> > this is a reminder for review. Feedback appreciated!
> > For convenience I removed the disclaimer etc.
> >
> > On dec 5th I posted our (complete) draft version of the Cell/B.E. 
device
> > tree documentation.
> >
> > Goal of these review should be to finally establish the document as
> > Power.org
> > PAPR Binding for the Cell/B.E. processor.
> >
> > Please review and give us feedback.
> 
> First comments; This document is quite verbose.  Much time is spent
> describing how standard properties work (ie; content of the 'reg' and
> 'ranges' properties).  Reviewing takes more effort when there is a
> large amount of boilerplate to filter.
> 
> Second, very few nodes have a 'compatible' value defined.  Currently,
> the 'compatible' list is the preferred method for device drivers to
> find supported devices in the tree.  Each distinct device should have
> a unique compatible value defined.
> 
> More comments below
> 
> > 1 "be" node
> [...]
> > "device-type" property
> >
> >             Standard property name which specifies the type of the 
node.
> >
> >             Encoded as with encode-string.
> >
> >             Default value is { "be" }.
> 
> Is a new OpenFirmware driver interface being defined for working with
> 'be' devices? 

No

> If not then the device-type property should not be
> defined.

The device-type property instances will be removed where not 
necessary or no OpenFirmware binding recommendations exist
respectively.

> > "model" property
> >             property name: Specifies model of node.
> >             Encoded as with encode-string.
> >             Default value is { "IBM,CBEA" }.
> 
> > "ibm,dt-version" property
> 
> I'm concerned about the usage model of this property.  It is not
> common for driver to go looking for an additional version property
> when interpreting node data.  Are all drivers expected to test the
> value of this property?  What should they do when the major or minor
> values do not match?

This property is meant to be informational. Drivers could check whenever
they require a certain level.
 
> > 1 ioc node
> >
> >
> > The Input/Output Controller (IOC) node contains among others the 
properties
> > specifying the address range of MMIO register space controlling the 
IOC.
> >
> > "reg" property
> >
> > Default property name: Property to specify the MMIO offset of the IOC,
> > which are two sets of registers each represented by an < offset, size 
>
> > pair.
> >
> > prop-encoded-array: Encoded as with encode-phys for the offset values,
> > encode-int for the size values.
> >
> > The array consists of four 32-bit values to represent two < offset, 
size >
> > pairs. Value one in this array corresponds to the first offset value 
within
> > the child address space, encoded as with encode-phys. Value two 
corresponds
> > to the size, encoded as with encode-int. Value three in this array
> > corresponds to the second offset value, value four to the second size.
> >
> > Default value is { 0x00510000 0x00001000 0x00511000 0x00001000 }.
> 
> These spaces are contiguous; what is the reason for the two array 
entries?

The spaces are in fact contiguous, but belong to two different units.
0x00510xxx covers the IOC Address Translation MMIO Registers, whereras
0x00511xxx covers the I/O Command MMIO Registers.
Despite, Linux is mapping the two ranges in one single step, which means
the range can well be summarized to 
        Default value is { 0x00510000 0x00002000 }.

> 
> > "device_type" property
> >
> > Standard property name: Specify the type of this node
> >
> > Encoded as with encode-string
> >
> > Default value is { "ioc" }
> 
> Again, if an OpenFirmware driver interface is not being defined, then
> don't use the device-type property.

see comment above.

> > 2 "bic0" node
> [...]
> > "device_type" property
> >
> > Standard property name: Property to specify the type of this node.
> >
> > Encoded as with encode-string.
> >
> > Default value is { "bic0" }.
> 
> ditto on device_type

see comment above

> 
> > 3 "bic1" node
> 
> This is identical to bic0
> 
> > 4 "mic-tm" node
> > 6 "ppe-mmio" node
> 
> mic-tm, ppe-mmio, and the bic* node documentation just duplicates the
> definition of standard node properties.  In this case is should be
> sufficient to describe what device the node describes an that it uses
> the standard properties.

I will change the documentation to describe only one of a kind.

> 
> > 5 "pervasive" node
> >
> >
> > The pervasive node node represents the  pervasive unit in the device 
tree.
> > T>he main property value is the address range of MMIO register space
> > controlling the pervasive unit.
> 
> Umm, what is a "pervasive unit"?

The pervasive node represents the 'Pervasive MMIO Registers' (i.e.
Pervasive Monitor, Power Management and Thermal Management described
in the Cell/B.E. public register spec.

> 
> > "device_type" property
> >
> > Standard property name: Property to specify the type of this node.
> >
> > Encoded as with encode-string.
> >
> > Default value is { "pervasive" }.
> 
> ditto on device_type

See comment above.

> > "ppe-throttle-temp" property
> > "ppe-end-throttle-temp" property
> > "ppe-full-throttle-temp" property
> > "spe-throttle-temp" property
> > "spe-end-throttle-temp" property
> > "spe-full-throttle-temp" property
> 
> These properties look good.
> 
> > 7 "interrupt-controller" node
> >
> > The Cell Broadband Engine Architecture processor contains an Internal
> > Interrupt Controller (IIC), which is handling all the interrupts from 
the
> > PPE, the SPE and the connected IO.
> >
> > "reg" property
> >
> > Standard property name: Property to specify the MMIO offset of the 
IIC, one
> > range for each of the two threads contained in each PPE and one range 
for
> > the common MMIO.
> >
> > prop-encoded-array: Consisting of six 32-bit values. The values form 
three
> > < offset,length > pairs of the denoted space encoded as with 
encode-phys
> > for the offsets and encode-int for the sizes
> >
> >   1. for MMIO space of thread one
> >
> >   2. for MMIO space of thread two
> >
> >   3. for MMIO space of the common PPE MMIO space.
> >
> > Default value is
> > { 0x00508400 0x00000020 0x00508420 0x00000020 0x00508000 0x00001000 }.
> >
> >
> >
> > "device_type" property
> >
> > Standard property name: Property to specify the type of this node.
> >
> > Encoded as with encode-string.
> >
> > Default value is { "CBEA-Internal-Interrupt-Controller" }.
> 
> ditto on device_type.  In fact, you should not be inventing new values
> for device_type at all.  Either use an already established
> device_type, or don't assign the property at all.  And, if you do use
> device_type, you are claiming that OpenFirmware has a driver interface
> for the device.

See comment above.

> > 8 "spe" nodes
> >
> > The Cell Broadband Engine Architecture processor contains eight SPEs, 
each
> > consisting of an SPU, 256kB local store and a Memory Flow Controller 
(MFC).
> > The SPEs are connected to the EIB (Element Interconnect Bus) ring. The
> > access to the internal devices is done via MMIO reads, with a fixed 
offset
> > to the Cell Broadband Engine processor base address.
> >
> > "reg" property
> >
> > Standard property name: Specifies the MMIO offset and size of the SPEs
> > Local Storage, Problem-State, Privilege 2 Area and Privilege 1 Area.
> >
> > prop-encoded array: Encoded as four < offset, length > pairs per SPE
> > encoded as with encode-phys for the offsets, encode-int for the size. 
The
> > pairs define the following SPE units:
> >
> >   1. Local Store (LS)
> >
> >   2. Problem State MMIO Registers
> >
> >   3. Privilege State 2 MMIO Registers
> >
> >   4. Privilege State 1 MMIO Registers
> >
> > The property exists once in each spe node.
> 
> I like the above description.  It provides good information about how
> data is organized in the reg property.
> 
> > "device_type" property
> >
> > Standard property name: Specifies the type of this node.
> >
> > Encoded as with encode-string.
> >
> > Default value is  {"spe" }.
> 
> ditto on device_type

See comment above.

> > "interrupts" property
> >
> > Standard property name: Property to specify the interrupt numbers of 
the
> > interrupts issued by SPE.
> >
> > prop-encoded array: List of interrupt numbers issued by the SPE. Each 
value
> > in the list is encoded as with encode-int.
> >
> > The property exists once in each spe node.
> >
> > Default values for SPEs are
> >
> >
> >
> > |#          |Property Value                                |
> > |spe@0      |{ 0x4, 0x104, 0x204 }                         |
> > |spe@80000  |{ 0x7, 0x107, 0x207 }                         |
> > |spe@100000 |{ 0x3, 0x103, 0x203 }                         |
> > |spe@180000 |{ 0x8, 0x108, 0x208 }                         |
> > |spe@200000 |{ 0x2, 0x102, 0x202 }                         |
> > |spe@280000 |{ 0x9, 0x109, 0x209 }                         |
> > |spe@300000 |{0x1, 0x101, 0x201 }                          |
> > |spe@380000 |{0xa, 0x10a, 0x20a }                          |
> >
> >
> > "vicinity" property
> >
> > property name: Specifies the direct neighbouring componentes on the 
EIB
> > ring related to each SPE.
> >
> > prop-encoded array: Pairs of phandles ( < phandle, phandle >) of the
> > neighbouring nodes, each phandle is encoded as with encode-int.
> >
> > The property exists once in each spe node.
> >
> > Default values for SPEs
> >
> >
> >
> > |#          |Property Value                                |
> > |spe@0      |{ phandle(mic-tm, SPE 3) }                    |
> > |spe@80000  |{ phandle(mic-tm, SPE 2) }                    |
> > |spe@100000 |{ phandle(SPE 0, SPE 4) }                     |
> > |spe@180000 |{ phandle(SPE 1, SPE 5) }                     |
> > |spe@200000 |{ phandle(SPE 2, SPE 6) }                     |
> > |spe@280000 |{ phandle(SPE 3, SPE 7) }                     |
> > |spe@300000 |{ phandle(SPE 4, BIC0) }                      |
> > |spe@380000 |{ phandle(SPE 5, BIC0) }                      |
> >
> >
> > "physical-id" property
> >
> > property name: Property to specify the physical id of an SPE.
> >
> > Default values for the physical id is encoded as with encode-int.
> 
> Unless there is some shared register set that needs the SPE physical
> id to operate then I encourage you not to define this property.  If it
> is just a logical number, the I think it is better to rely on the node
> name instead of an arbitrarily defined logical number.  However, if
> there is a register set shared between the SPEs that needs the SPE
> number, then you should follow the lead of other existing bindings and
> use the property name "cell-index" instead of physical-id.

The "physical-id" property is used by Linux (see information on ppc-patch 
below).

linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Subject: spu_manage: fix spu_unit_number for celleb device tree

From: Christian Krafft <krafft-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>

New device trees provide "physical-id".
Celleb device tree provide the "unit-id".
Legacy device tree used the reg property for the physical id of an spe.
This patch fixes find_spu_unit_number to look for the spu id in that 
order.
The length is checked to avoid misinterpretation in case the attributes
unit-id or reg do not contain the id.

Signed-off-by: Christian Krafft <krafft-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>

Index: linux/arch/powerpc/platforms/cell/spu_manage.c
===================================================================
--- linux.orig/arch/powerpc/platforms/cell/spu_manage.c
+++ linux/arch/powerpc/platforms/cell/spu_manage.c
@@ -48,10 +48,18 @@ static u64 __init find_spu_unit_number(s
 {
                 const unsigned int *prop;
                 int proplen;
+
+                /* new device trees should provide the physical-id 
attribute */
                 prop = of_get_property(spe, "physical-id", &proplen);
                 if (proplen == 4)
                                 return (u64)*prop;
 
+                /* celleb device tree provides the unit-id */
+                prop = of_get_property(spe, "unit-id", &proplen);
+                if (proplen == 4)
+                                return (u64)*prop;
+
+                /* legacy device trees provide the id in the reg 
attribute */
                 prop = of_get_property(spe, "reg", &proplen);
                 if (proplen == 4)
                                 return (u64)*prop;

> Cheers,
> g.

Thanks
Chris

> 
> -- 
> Grant Likely, B.Sc., P.Eng.
> Secret Lab Technologies Ltd.
> 
> 
> ------------------------------
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
> https://ozlabs.org/mailman/listinfo/devicetree-discuss
> 
> 
> End of devicetree-discuss Digest, Vol 6, Issue 7
> ************************************************

--=_alternative 004E84FCC1257523_=
Content-Type: text/html; charset="US-ASCII"


<br><tt><font size=2>devicetree-discuss-bounces+christian.rund=de.ibm.com-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
wrote on 17.12.2008 02:00:07:<br>
<br>
&gt; Send devicetree-discuss mailing list submissions to<br>
&gt; &nbsp; &nbsp;devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org<br>
&gt; <br>
&gt; To subscribe or unsubscribe via the World Wide Web, visit<br>
&gt; &nbsp; &nbsp;https://ozlabs.org/mailman/listinfo/devicetree-discuss<br>
&gt; or, via email, send a message with subject or body 'help' to<br>
&gt; &nbsp; &nbsp;devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org<br>
&gt; <br>
&gt; You can reach the person managing the list at<br>
&gt; &nbsp; &nbsp;devicetree-discuss-owner-mnsaURCQ41sdnm+yROfE0A@public.gmane.org<br>
&gt; <br>
&gt; When replying, please edit your Subject line so it is more specific<br>
&gt; than &quot;Re: Contents of devicetree-discuss digest...&quot;<br>
&gt; <br>
&gt; <br>
&gt; Today's Topics:<br>
&gt; <br>
&gt; &nbsp; &nbsp;1. Re: Reminder 1: Device Tree documentation discussion
for<br>
&gt; &nbsp; &nbsp; &nbsp; Cell/B.E. &nbsp; binding DRAFT - see Digest Vol
6, Issue 1 (Grant Likely)<br>
&gt; <br>
&gt; <br>
&gt; ----------------------------------------------------------------------<br>
&gt; <br>
&gt; Message: 1<br>
&gt; Date: Tue, 16 Dec 2008 15:08:17 -0700<br>
&gt; From: &quot;Grant Likely&quot; &lt;grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org&gt;<br>
&gt; Subject: Re: Reminder 1: Device Tree documentation discussion for<br>
&gt; &nbsp; &nbsp;Cell/B.E. &nbsp; binding DRAFT - see Digest Vol 6, Issue
1<br>
&gt; To: &quot;Christian Rund&quot; &lt;Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org&gt;<br>
&gt; Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org<br>
&gt; Message-ID:<br>
&gt; &nbsp; &nbsp;&lt;fa686aa40812161408j3672ba5cs7d8526cd643b69de-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org&gt;<br>
&gt; Content-Type: text/plain; charset=ISO-8859-1<br>
&gt; <br>
&gt; On Tue, Dec 16, 2008 at 7:03 AM, Christian Rund<br>
&gt; &lt;Christian.Rund-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org&gt; wrote:<br>
&gt; &gt; this is a reminder for review. Feedback appreciated!<br>
&gt; &gt; For convenience I removed the disclaimer etc.<br>
&gt; &gt;<br>
&gt; &gt; On dec 5th I posted our (complete) draft version of the Cell/B.E.
device<br>
&gt; &gt; tree documentation.<br>
&gt; &gt;<br>
&gt; &gt; Goal of these review should be to finally establish the document
as<br>
&gt; &gt; Power.org<br>
&gt; &gt; PAPR Binding for the Cell/B.E. processor.<br>
&gt; &gt;<br>
&gt; &gt; Please review and give us feedback.<br>
&gt; <br>
&gt; First comments; This document is quite verbose. &nbsp;Much time is
spent<br>
&gt; describing how standard properties work (ie; content of the 'reg'
and<br>
&gt; 'ranges' properties). &nbsp;Reviewing takes more effort when there
is a<br>
&gt; large amount of boilerplate to filter.<br>
&gt; <br>
&gt; Second, very few nodes have a 'compatible' value defined. &nbsp;Currently,<br>
&gt; the 'compatible' list is the preferred method for device drivers to<br>
&gt; find supported devices in the tree. &nbsp;Each distinct device should
have<br>
&gt; a unique compatible value defined.<br>
&gt; <br>
&gt; More comments below<br>
&gt; <br>
&gt; &gt; 1 &quot;be&quot; node<br>
&gt; [...]<br>
&gt; &gt; &quot;device-type&quot; property<br>
&gt; &gt;<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Standard property name
which specifies the type of the node.<br>
&gt; &gt;<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Encoded as with encode-string.<br>
&gt; &gt;<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Default value is {
&quot;be&quot; }.<br>
&gt; <br>
&gt; Is a new OpenFirmware driver interface being defined for working with<br>
&gt; 'be' devices? &nbsp;</font></tt>
<br>
<br><tt><font size=2>No</font></tt>
<br>
<br><tt><font size=2>&gt; If not then the device-type property should not
be<br>
&gt; defined.</font></tt>
<br>
<br><tt><font size=2>The device-type property instances will be removed
where not </font></tt>
<br><tt><font size=2>necessary or no OpenFirmware binding recommendations
exist</font></tt>
<br><tt><font size=2>respectively.</font></tt>
<br><tt><font size=2><br>
&gt; &gt; &quot;model&quot; property<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; property name: Specifies
model of node.<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Encoded as with encode-string.<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Default value is {
&quot;IBM,CBEA&quot; }.<br>
&gt; <br>
&gt; &gt; &quot;ibm,dt-version&quot; property<br>
&gt; <br>
&gt; I'm concerned about the usage model of this property. &nbsp;It is
not<br>
&gt; common for driver to go looking for an additional version property<br>
&gt; when interpreting node data. &nbsp;Are all drivers expected to test
the<br>
&gt; value of this property? &nbsp;What should they do when the major or
minor<br>
&gt; values do not match?</font></tt>
<br>
<br><tt><font size=2>This property is meant to be informational. Drivers
could check whenever</font></tt>
<br><tt><font size=2>they require a certain level.</font></tt>
<br><tt><font size=2>&nbsp;<br>
&gt; &gt; 1 ioc node<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; The Input/Output Controller (IOC) node contains among others
the properties<br>
&gt; &gt; specifying the address range of MMIO register space controlling
the IOC.<br>
&gt; &gt;<br>
&gt; &gt; &quot;reg&quot; property<br>
&gt; &gt;<br>
&gt; &gt; Default property name: Property to specify the MMIO offset of
the IOC,<br>
&gt; &gt; which are two sets of registers each represented by an &lt; offset,
size &gt;<br>
&gt; &gt; pair.<br>
&gt; &gt;<br>
&gt; &gt; prop-encoded-array: Encoded as with encode-phys for the offset
values,<br>
&gt; &gt; encode-int for the size values.<br>
&gt; &gt;<br>
&gt; &gt; The array consists of four 32-bit values to represent two &lt;
offset, size &gt;<br>
&gt; &gt; pairs. Value one in this array corresponds to the first offset
value within<br>
&gt; &gt; the child address space, encoded as with encode-phys. Value two
corresponds<br>
&gt; &gt; to the size, encoded as with encode-int. Value three in this
array<br>
&gt; &gt; corresponds to the second offset value, value four to the second
size.<br>
&gt; &gt;<br>
&gt; &gt; Default value is { 0x00510000 0x00001000 0x00511000 0x00001000
}.<br>
&gt; <br>
&gt; These spaces are contiguous; what is the reason for the two array
entries?</font></tt>
<br>
<br><tt><font size=2>The spaces are in fact contiguous, but belong to two
different units.</font></tt>
<br><tt><font size=2>0x00510xxx covers the IOC Address Translation MMIO
Registers, whereras</font></tt>
<br><tt><font size=2>0x00511xxx covers the I/O Command MMIO Registers.</font></tt>
<br><tt><font size=2>Despite, Linux is mapping the two ranges in one single
step, which means</font></tt>
<br><tt><font size=2>the range can well be summarized to </font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; Default value
is { 0x00510000 0x00002000 }.<br>
</font></tt>
<br><tt><font size=2>&gt; <br>
&gt; &gt; &quot;device_type&quot; property<br>
&gt; &gt;<br>
&gt; &gt; Standard property name: Specify the type of this node<br>
&gt; &gt;<br>
&gt; &gt; Encoded as with encode-string<br>
&gt; &gt;<br>
&gt; &gt; Default value is { &quot;ioc&quot; }<br>
&gt; <br>
&gt; Again, if an OpenFirmware driver interface is not being defined, then<br>
&gt; don't use the device-type property.<br>
</font></tt>
<br><tt><font size=2>see comment above.</font></tt>
<br>
<br><tt><font size=2>&gt; &gt; 2 &quot;bic0&quot; node<br>
&gt; [...]<br>
&gt; &gt; &quot;device_type&quot; property<br>
&gt; &gt;<br>
&gt; &gt; Standard property name: Property to specify the type of this
node.<br>
&gt; &gt;<br>
&gt; &gt; Encoded as with encode-string.<br>
&gt; &gt;<br>
&gt; &gt; Default value is { &quot;bic0&quot; }.<br>
&gt; <br>
&gt; ditto on device_type</font></tt>
<br>
<br><tt><font size=2>see comment above</font></tt>
<br><tt><font size=2><br>
&gt; <br>
&gt; &gt; 3 &quot;bic1&quot; node<br>
&gt; <br>
&gt; This is identical to bic0<br>
&gt; <br>
&gt; &gt; 4 &quot;mic-tm&quot; node<br>
&gt; &gt; 6 &quot;ppe-mmio&quot; node<br>
&gt; <br>
&gt; mic-tm, ppe-mmio, and the bic* node documentation just duplicates
the<br>
&gt; definition of standard node properties. &nbsp;In this case is should
be<br>
&gt; sufficient to describe what device the node describes an that it uses<br>
&gt; the standard properties.</font></tt>
<br>
<br><tt><font size=2>I will change the documentation to describe only one
of a kind.</font></tt>
<br><tt><font size=2><br>
&gt; <br>
&gt; &gt; 5 &quot;pervasive&quot; node<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; The pervasive node node represents the &nbsp;pervasive unit in
the device tree.<br>
&gt; &gt; T&gt;he main property value is the address range of MMIO register
space<br>
&gt; &gt; controlling the pervasive unit.<br>
&gt; <br>
&gt; Umm, what is a &quot;pervasive unit&quot;?</font></tt>
<br>
<br><tt><font size=2>The pervasive node represents the 'Pervasive MMIO
Registers' (i.e.</font></tt>
<br><tt><font size=2>Pervasive Monitor, Power Management and Thermal Management
described</font></tt>
<br><tt><font size=2>in the Cell/B.E. public register spec.</font></tt>
<br><tt><font size=2><br>
&gt; <br>
&gt; &gt; &quot;device_type&quot; property<br>
&gt; &gt;<br>
&gt; &gt; Standard property name: Property to specify the type of this
node.<br>
&gt; &gt;<br>
&gt; &gt; Encoded as with encode-string.<br>
&gt; &gt;<br>
&gt; &gt; Default value is { &quot;pervasive&quot; }.<br>
&gt; <br>
&gt; ditto on device_type</font></tt>
<br>
<br><tt><font size=2>See comment above.</font></tt>
<br><tt><font size=2><br>
&gt; &gt; &quot;ppe-throttle-temp&quot; property<br>
&gt; &gt; &quot;ppe-end-throttle-temp&quot; property<br>
&gt; &gt; &quot;ppe-full-throttle-temp&quot; property<br>
&gt; &gt; &quot;spe-throttle-temp&quot; property<br>
&gt; &gt; &quot;spe-end-throttle-temp&quot; property<br>
&gt; &gt; &quot;spe-full-throttle-temp&quot; property<br>
&gt; <br>
&gt; These properties look good.<br>
&gt; <br>
&gt; &gt; 7 &quot;interrupt-controller&quot; node<br>
&gt; &gt;<br>
&gt; &gt; The Cell Broadband Engine Architecture processor contains an
Internal<br>
&gt; &gt; Interrupt Controller (IIC), which is handling all the interrupts
from the<br>
&gt; &gt; PPE, the SPE and the connected IO.<br>
&gt; &gt;<br>
&gt; &gt; &quot;reg&quot; property<br>
&gt; &gt;<br>
&gt; &gt; Standard property name: Property to specify the MMIO offset of
the IIC, one<br>
&gt; &gt; range for each of the two threads contained in each PPE and one
range for<br>
&gt; &gt; the common MMIO.<br>
&gt; &gt;<br>
&gt; &gt; prop-encoded-array: Consisting of six 32-bit values. The values
form three<br>
&gt; &gt; &lt; offset,length &gt; pairs of the denoted space encoded as
with encode-phys<br>
&gt; &gt; for the offsets and encode-int for the sizes<br>
&gt; &gt;<br>
&gt; &gt; &nbsp; 1. for MMIO space of thread one<br>
&gt; &gt;<br>
&gt; &gt; &nbsp; 2. for MMIO space of thread two<br>
&gt; &gt;<br>
&gt; &gt; &nbsp; 3. for MMIO space of the common PPE MMIO space.<br>
&gt; &gt;<br>
&gt; &gt; Default value is<br>
&gt; &gt; { 0x00508400 0x00000020 0x00508420 0x00000020 0x00508000 0x00001000
}.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &quot;device_type&quot; property<br>
&gt; &gt;<br>
&gt; &gt; Standard property name: Property to specify the type of this
node.<br>
&gt; &gt;<br>
&gt; &gt; Encoded as with encode-string.<br>
&gt; &gt;<br>
&gt; &gt; Default value is { &quot;CBEA-Internal-Interrupt-Controller&quot;
}.<br>
&gt; <br>
&gt; ditto on device_type. &nbsp;In fact, you should not be inventing new
values<br>
&gt; for device_type at all. &nbsp;Either use an already established<br>
&gt; device_type, or don't assign the property at all. &nbsp;And, if you
do use<br>
&gt; device_type, you are claiming that OpenFirmware has a driver interface<br>
&gt; for the device.</font></tt>
<br>
<br><tt><font size=2>See comment above.<br>
<br>
&gt; &gt; 8 &quot;spe&quot; nodes<br>
&gt; &gt;<br>
&gt; &gt; The Cell Broadband Engine Architecture processor contains eight
SPEs, each<br>
&gt; &gt; consisting of an SPU, 256kB local store and a Memory Flow Controller
(MFC).<br>
&gt; &gt; The SPEs are connected to the EIB (Element Interconnect Bus)
ring. The<br>
&gt; &gt; access to the internal devices is done via MMIO reads, with a
fixed offset<br>
&gt; &gt; to the Cell Broadband Engine processor base address.<br>
&gt; &gt;<br>
&gt; &gt; &quot;reg&quot; property<br>
&gt; &gt;<br>
&gt; &gt; Standard property name: Specifies the MMIO offset and size of
the SPEs<br>
&gt; &gt; Local Storage, Problem-State, Privilege 2 Area and Privilege
1 Area.<br>
&gt; &gt;<br>
&gt; &gt; prop-encoded array: Encoded as four &lt; offset, length &gt;
pairs per SPE<br>
&gt; &gt; encoded as with encode-phys for the offsets, encode-int for the
size. The<br>
&gt; &gt; pairs define the following SPE units:<br>
&gt; &gt;<br>
&gt; &gt; &nbsp; 1. Local Store (LS)<br>
&gt; &gt;<br>
&gt; &gt; &nbsp; 2. Problem State MMIO Registers<br>
&gt; &gt;<br>
&gt; &gt; &nbsp; 3. Privilege State 2 MMIO Registers<br>
&gt; &gt;<br>
&gt; &gt; &nbsp; 4. Privilege State 1 MMIO Registers<br>
&gt; &gt;<br>
&gt; &gt; The property exists once in each spe node.<br>
&gt; <br>
&gt; I like the above description. &nbsp;It provides good information about
how<br>
&gt; data is organized in the reg property.<br>
&gt; <br>
&gt; &gt; &quot;device_type&quot; property<br>
&gt; &gt;<br>
&gt; &gt; Standard property name: Specifies the type of this node.<br>
&gt; &gt;<br>
&gt; &gt; Encoded as with encode-string.<br>
&gt; &gt;<br>
&gt; &gt; Default value is &nbsp;{&quot;spe&quot; }.<br>
&gt; <br>
&gt; ditto on device_type<br>
</font></tt>
<br><tt><font size=2>See comment above.</font></tt>
<br><tt><font size=2><br>
&gt; &gt; &quot;interrupts&quot; property<br>
&gt; &gt;<br>
&gt; &gt; Standard property name: Property to specify the interrupt numbers
of the<br>
&gt; &gt; interrupts issued by SPE.<br>
&gt; &gt;<br>
&gt; &gt; prop-encoded array: List of interrupt numbers issued by the SPE.
Each value<br>
&gt; &gt; in the list is encoded as with encode-int.<br>
&gt; &gt;<br>
&gt; &gt; The property exists once in each spe node.<br>
&gt; &gt;<br>
&gt; &gt; Default values for SPEs are<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; |# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|Property Value &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;|<br>
&gt; &gt; |spe@0 &nbsp; &nbsp; &nbsp;|{ 0x4, 0x104, 0x204 } &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
&gt; &gt; |spe@80000 &nbsp;|{ 0x7, 0x107, 0x207 } &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
&gt; &gt; |spe@100000 |{ 0x3, 0x103, 0x203 } &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
&gt; &gt; |spe@180000 |{ 0x8, 0x108, 0x208 } &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
&gt; &gt; |spe@200000 |{ 0x2, 0x102, 0x202 } &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
&gt; &gt; |spe@280000 |{ 0x9, 0x109, 0x209 } &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
&gt; &gt; |spe@300000 |{0x1, 0x101, 0x201 } &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
&gt; &gt; |spe@380000 |{0xa, 0x10a, 0x20a } &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &quot;vicinity&quot; property<br>
&gt; &gt;<br>
&gt; &gt; property name: Specifies the direct neighbouring componentes
on the EIB<br>
&gt; &gt; ring related to each SPE.<br>
&gt; &gt;<br>
&gt; &gt; prop-encoded array: Pairs of phandles ( &lt; phandle, phandle
&gt;) of the<br>
&gt; &gt; neighbouring nodes, each phandle is encoded as with encode-int.<br>
&gt; &gt;<br>
&gt; &gt; The property exists once in each spe node.<br>
&gt; &gt;<br>
&gt; &gt; Default values for SPEs<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; |# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|Property Value &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;|<br>
&gt; &gt; |spe@0 &nbsp; &nbsp; &nbsp;|{ phandle(mic-tm, SPE 3) } &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
&gt; &gt; |spe@80000 &nbsp;|{ phandle(mic-tm, SPE 2) } &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
&gt; &gt; |spe@100000 |{ phandle(SPE 0, SPE 4) } &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
&gt; &gt; |spe@180000 |{ phandle(SPE 1, SPE 5) } &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
&gt; &gt; |spe@200000 |{ phandle(SPE 2, SPE 6) } &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
&gt; &gt; |spe@280000 |{ phandle(SPE 3, SPE 7) } &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
&gt; &gt; |spe@300000 |{ phandle(SPE 4, BIC0) } &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
&gt; &gt; |spe@380000 |{ phandle(SPE 5, BIC0) } &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &quot;physical-id&quot; property<br>
&gt; &gt;<br>
&gt; &gt; property name: Property to specify the physical id of an SPE.<br>
&gt; &gt;<br>
&gt; &gt; Default values for the physical id is encoded as with encode-int.<br>
&gt; <br>
&gt; Unless there is some shared register set that needs the SPE physical<br>
&gt; id to operate then I encourage you not to define this property. &nbsp;If
it<br>
&gt; is just a logical number, the I think it is better to rely on the
node<br>
&gt; name instead of an arbitrarily defined logical number. &nbsp;However,
if<br>
&gt; there is a register set shared between the SPEs that needs the SPE<br>
&gt; number, then you should follow the lead of other existing bindings
and<br>
&gt; use the property name &quot;cell-index&quot; instead of physical-id.<br>
</font></tt>
<br><tt><font size=2>The &quot;physical-id&quot; property is used by Linux
(see information on ppc-patch below).</font></tt>
<br>
<br><tt><font size=2>linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org</font></tt>
<br><tt><font size=2>Subject: spu_manage: fix spu_unit_number for celleb
device tree<br>
<br>
From: Christian Krafft &lt;krafft-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org&gt;<br>
<br>
New device trees provide &quot;physical-id&quot;.<br>
Celleb device tree provide the &quot;unit-id&quot;.<br>
Legacy device tree used the reg property for the physical id of an spe.<br>
This patch fixes find_spu_unit_number to look for the spu id in that order.<br>
The length is checked to avoid misinterpretation in case the attributes<br>
unit-id or reg do not contain the id.<br>
<br>
Signed-off-by: Christian Krafft &lt;krafft-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org&gt;<br>
</font></tt>
<br><tt><font size=2>Index: linux/arch/powerpc/platforms/cell/spu_manage.c<br>
===================================================================<br>
--- linux.orig/arch/powerpc/platforms/cell/spu_manage.c<br>
+++ linux/arch/powerpc/platforms/cell/spu_manage.c<br>
@@ -48,10 +48,18 @@ static u64 __init find_spu_unit_number(s<br>
 {<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const
unsigned int *prop;<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int
proplen;<br>
+<br>
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
/* new device trees should provide the physical-id attribute */<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;prop
= of_get_property(spe, &quot;physical-id&quot;, &amp;proplen);<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(proplen == 4)<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return (u64)*prop;<br>
 <br>
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
/* celleb device tree provides the unit-id */<br>
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
prop = of_get_property(spe, &quot;unit-id&quot;, &amp;proplen);<br>
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (proplen == 4)<br>
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
(u64)*prop;<br>
+<br>
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
/* legacy device trees provide the id in the reg attribute */<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;prop
= of_get_property(spe, &quot;reg&quot;, &amp;proplen);<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(proplen == 4)<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return (u64)*prop;</font></tt>
<br><tt><font size=2><br>
&gt; Cheers,<br>
&gt; g.</font></tt>
<br>
<br><tt><font size=2>Thanks</font></tt>
<br><tt><font size=2>Chris</font></tt>
<br><tt><font size=2><br>
&gt; <br>
&gt; -- <br>
&gt; Grant Likely, B.Sc., P.Eng.<br>
&gt; Secret Lab Technologies Ltd.<br>
&gt; <br>
&gt; <br>
&gt; ------------------------------<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; devicetree-discuss mailing list<br>
&gt; devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org<br>
&gt; https://ozlabs.org/mailman/listinfo/devicetree-discuss<br>
&gt; <br>
&gt; <br>
&gt; End of devicetree-discuss Digest, Vol 6, Issue 7<br>
&gt; ************************************************<br>
</font></tt>
--=_alternative 004E84FCC1257523_=--

--===============0734390067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============0734390067==--
