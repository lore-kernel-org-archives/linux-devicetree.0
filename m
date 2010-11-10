From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device tree with early buffer allocations and aliased memory
Date: Tue, 9 Nov 2010 21:25:37 -0700
Message-ID: <20101110042537.GA4110@angua.secretlab.ca>
References: <20101027184908.GA7669@dvomlehn-lnx2.corp.sa.net>
	<AANLkTi=OWBbB8vPNapxkBDiVRCoGS-sZ5-CXcKK0n8iv@mail.gmail.com>
	<20101103205037.GA15096@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101103205037.GA15096-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Device Tree Mailing List <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 03, 2010 at 01:50:37PM -0700, David VomLehn wrote:
> This got eaten as junk mail, so pardon the slow response. Also, Stuart
> Y. has been giving me some feedback, so I think I've made some
> progress.
> =

> On Sat, Oct 30, 2010 at 10:57:34PM -0500, Grant Likely wrote:
> > On Wed, Oct 27, 2010 at 2:49 PM, David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org> wro=
te:
> ...
> > > 3. =A0 =A0 =A0All device registers are at physical addresses < 0x1000=
0000.
> > =

> > Inside of the low memory region?
> =

> Yes. Those wacky hardware guys...
> =

> > > 4. =A0 =A0 =A0Since the processor needs memory to run, the first 0x0f=
c00000
> > > =A0 =A0 =A0 =A0bytes also appear at 0x10000000. Our hardware guys cal=
l this
> > > =A0 =A0 =A0 =A0a memory "alias". These addresses are physical, but no=
t DMA
> > > =A0 =A0 =A0 =A0addresses. (The hole is so we can alias the reset vect=
or)
> > =

> > Not sure I'm clear.  How does the hole work?  It might be useful to
> > draw a map of the various ranges rather than trying to describe it in
> > prose.  So is phys address range 0x00000000-0x0fc00000 aliased to
> > 0x10000000-0x1fc00000?
> =

> I can see I wasn't quite accurate here. The only things in the first
> 0x10000000 bytes of memory are device registers. Real memory starts at
> 0x10000000 and runs for 0x0fc00000 bytes. The same memory also appears
> at 0x20000000-0x2fbfffff. Memory above 0x2fc00000 only appears at one
> address.

Ah, okay.  So start of ram is at 0x10000000 instead of 0.  Not all
that uncommon.

> =

> > You don't need three separate nodes here.  Just do it thusly:
> > =

> > memory@10000000 {
> >         device_type =3D "memory";
> >         reg =3D <0x10000000 0x0fc00000
> >                0x2fc00000 0x10400000
> >                0x60000000 0x20000000>;
> > }
> > =

> > Since (I assume) both #address-cells and #size-cells are 1, the OS can
> > interpret three memory ranges from a single node.
> =

> This is good to know, though I might want to label each node. See below.

Further note:  The memory node must only contain memory ranges that
will actually be used by the operating system as system RAM.  If it is
dedicated to DMA buffers or the like, then you don't want to identify
it as a memory node.  You can create a new binding to describe your
DMA buffer ranges, but make sure it doesn't specify device_type=3D"memory".

> =

> ...
> > dma-ranges is probably what you want.
> =

> I think this is a big part of the solution. My current thinking is to
> have something like:
> =

> 	platform-bus {

It *appears* that you're conflating Linux-kernel internal details (the
name "platform-bus") with the actual layout of the hardware.  I'd be
surprised if your peripheral bus is named "platform-bus" in the
hardware documentation.  Name things for what they are, with
preference for names in the generic names list from ePAPR.

> 		compatible =3D "simple-bus";
> 		#address-cells =3D <1>;
> 		#size-cells =3D <1>;
> 		dma-ranges =3D <0x10000000 0x1000000 0x0fc00000
> 			0x20000000 0x10000000 0x0fc00000
> 			0x2fc00000 0x2fc00000 0x10400000
> 			0x60000000 0x60000000 0x20000000>;

I suspect the length field in the 3rd line is wrong.  Should be
0x400000?  I also suspect the 2nd and 3rd lines could be merged to
give:
			0x20000000 0x20000000 0x10000000

> 		...
> =

> I'm not sure whether I need to specify all those 1:1 mappings or just
> the range starting at 0x20000000 that doesn't map identically to the
> physical address range. Assuming this is correct, my DMA mapping issue
> is solved.

Unless you *actually* want to perform DMAs to both the real and
aliased ranges, then you probably don't want specify both.

> =

> This still leaves the question of buffers. Buffers with statically and
> dynamically assigned addresses need some sort of identifier so that
> they can be referenced by device drivers. There may be more than one
> buffer per device and a single device may use buffers with statically
> assigned addresses and buffers with dynamically assigned addresses.
> Buffers with statically assigned buffers addresses could be handled
> with something like:
> =

> 	device-s {
> 		compatible =3D "cisco,device-s";
> 		cisco,static-buffers =3D =

> 			"device-s-b1",<0x24000000 0x00100000>,
> 			"device-s-b2",<0x60000000 0x00200000>;

Or, simply:
	cisco,static-buffer-b1 =3D <0x24000000 0x00100000>;
	cisco,static-buffer-b2 =3D <0x60000000 0x00200000>;

Try to avoid mixing string and cell values in the same property where
appropriate.  Sometimes doing so is the best binding, but those cases
are rare.

> 	};
> =

> The first buffer, device-s-b1, is in the area where physical and DMA
> address differ. I'm using the DMA address to specify it, but the
> the physical address may make more sense since the device tree is
> more oriented around the processor's view.

Since this sounds very device specific, doing custom properties are
just fine *providing* you document it in the "cisco,device-s" binding.

> =

> Buffers with dynamically assigned addresses must be assigned within
> a given range of memory. Using labeled memory nodes could help:
> =

> 	device-d {
> 		compatible =3D "cisco,device-d";
> 		cisco,dynamic-buffers =3D
> 			"device-d-b1",<&node0-lowmem 0x00210000>,
> 			"device-d-b2",<&node0-highmem 0x00220000>,
> 			"device-d-b3",<&node1-highmem 0x00230000>;

What is the meaning of the second cell in these properties
(0x00210000, 0x220000, and 0x230000)?  This doesn't seem to be an
optimal binding, although that is probably mainly due to the joint
string+cell property values.  Having a phandle to another node is
/okay/, but it might just be simpler and better to explicitly specify
the address ranges that the device is able to DMA to/from.

> 	};
> =

> I could have separate memory nodes and label each:
> =

> 	bank0_lowmem: memory@10000000 {
> 		device_type =3D "memory";
> 		reg =3D <0x10000000 0x0fc00000>;
> 	};
> 	bank0_highmem: memory@2c00000 {
> 		device_type =3D "memory";
> 		reg =3D <0x2fc00000 0x10400000>;
> 	};
> 	bank1_highmem: memory@60000000 {
> 		device_type =3D "memory";
> 		reg =3D <0x60000000 0x20000000>;
> 	};

This would be okay.

> =

> or label the 2-tuple for each node:
> =

> 	memory@10000000 {
> 		device_type =3D "memory";
> 		reg =3D <node0-lowmem: 0x10000000 0x0fc00000
> 		       node0-highmem: 0x2fc00000 0x10400000
> 		       node0-highlowmem: 0x60000000 0x20000000>;
> 	}

Don't do this.  You shouldn't ever need to use the labels inside a
property.  They are only used for some corner cases where a pointer is
needed to the data inside an fdt blob.

g.
