From: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Re: Device tree with early buffer allocations and aliased memory
Date: Wed, 3 Nov 2010 13:50:37 -0700
Message-ID: <20101103205037.GA15096@dvomlehn-lnx2.corp.sa.net>
References: <20101027184908.GA7669@dvomlehn-lnx2.corp.sa.net>
	<AANLkTi=OWBbB8vPNapxkBDiVRCoGS-sZ5-CXcKK0n8iv@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTi=OWBbB8vPNapxkBDiVRCoGS-sZ5-CXcKK0n8iv-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Device Tree Mailing List <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This got eaten as junk mail, so pardon the slow response. Also, Stuart
Y. has been giving me some feedback, so I think I've made some
progress.

On Sat, Oct 30, 2010 at 10:57:34PM -0500, Grant Likely wrote:
> On Wed, Oct 27, 2010 at 2:49 PM, David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org> wrote:
...
> > 3. =A0 =A0 =A0All device registers are at physical addresses < 0x100000=
00.
> =

> Inside of the low memory region?

Yes. Those wacky hardware guys...

> > 4. =A0 =A0 =A0Since the processor needs memory to run, the first 0x0fc0=
0000
> > =A0 =A0 =A0 =A0bytes also appear at 0x10000000. Our hardware guys call =
this
> > =A0 =A0 =A0 =A0a memory "alias". These addresses are physical, but not =
DMA
> > =A0 =A0 =A0 =A0addresses. (The hole is so we can alias the reset vector)
> =

> Not sure I'm clear.  How does the hole work?  It might be useful to
> draw a map of the various ranges rather than trying to describe it in
> prose.  So is phys address range 0x00000000-0x0fc00000 aliased to
> 0x10000000-0x1fc00000?

I can see I wasn't quite accurate here. The only things in the first
0x10000000 bytes of memory are device registers. Real memory starts at
0x10000000 and runs for 0x0fc00000 bytes. The same memory also appears
at 0x20000000-0x2fbfffff. Memory above 0x2fc00000 only appears at one
address.

> You don't need three separate nodes here.  Just do it thusly:
> =

> memory@10000000 {
>         device_type =3D "memory";
>         reg =3D <0x10000000 0x0fc00000
>                0x2fc00000 0x10400000
>                0x60000000 0x20000000>;
> }
> =

> Since (I assume) both #address-cells and #size-cells are 1, the OS can
> interpret three memory ranges from a single node.

This is good to know, though I might want to label each node. See below.

...
> dma-ranges is probably what you want.

I think this is a big part of the solution. My current thinking is to
have something like:

	platform-bus {
		compatible =3D "simple-bus";
		#address-cells =3D <1>;
		#size-cells =3D <1>;
		dma-ranges =3D <0x10000000 0x1000000 0x0fc00000
			0x20000000 0x10000000 0x0fc00000
			0x2fc00000 0x2fc00000 0x10400000
			0x60000000 0x60000000 0x20000000>;
		...

I'm not sure whether I need to specify all those 1:1 mappings or just
the range starting at 0x20000000 that doesn't map identically to the
physical address range. Assuming this is correct, my DMA mapping issue
is solved.

This still leaves the question of buffers. Buffers with statically and
dynamically assigned addresses need some sort of identifier so that
they can be referenced by device drivers. There may be more than one
buffer per device and a single device may use buffers with statically
assigned addresses and buffers with dynamically assigned addresses.
Buffers with statically assigned buffers addresses could be handled
with something like:

	device-s {
		compatible =3D "cisco,device-s";
		cisco,static-buffers =3D =

			"device-s-b1",<0x24000000 0x00100000>,
			"device-s-b2",<0x60000000 0x00200000>;
	};

The first buffer, device-s-b1, is in the area where physical and DMA
address differ. I'm using the DMA address to specify it, but the
the physical address may make more sense since the device tree is
more oriented around the processor's view.

Buffers with dynamically assigned addresses must be assigned within
a given range of memory. Using labeled memory nodes could help:

	device-d {
		compatible =3D "cisco,device-d";
		cisco,dynamic-buffers =3D
			"device-d-b1",<&node0-lowmem 0x00210000>,
			"device-d-b2",<&node0-highmem 0x00220000>,
			"device-d-b3",<&node1-highmem 0x00230000>;
	};

I could have separate memory nodes and label each:

	bank0_lowmem: memory@10000000 {
		device_type =3D "memory";
		reg =3D <0x10000000 0x0fc00000>;
	};
	bank0_highmem: memory@2c00000 {
		device_type =3D "memory";
		reg =3D <0x2fc00000 0x10400000>;
	};
	bank1_highmem: memory@60000000 {
		device_type =3D "memory";
		reg =3D <0x60000000 0x20000000>;
	};

or label the 2-tuple for each node:

	memory@10000000 {
		device_type =3D "memory";
		reg =3D <node0-lowmem: 0x10000000 0x0fc00000
		       node0-highmem: 0x2fc00000 0x10400000
		       node0-highlowmem: 0x60000000 0x20000000>;
	}

The only advantage to the former is that, should it be necessary to
decouple allocation restrictions from memory nodes, a second type
of node could be introduced to do that.

> g.
-- =

David VL
