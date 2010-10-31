From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device tree with early buffer allocations and aliased memory
Date: Sat, 30 Oct 2010 23:57:34 -0400
Message-ID: <AANLkTi=OWBbB8vPNapxkBDiVRCoGS-sZ5-CXcKK0n8iv@mail.gmail.com>
References: <20101027184908.GA7669@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101027184908.GA7669-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org>
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

On Wed, Oct 27, 2010 at 2:49 PM, David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org> wrote:
> This is a very long question and appreciate your forebearance--I'm using
> Linux and I have a pretty complicated memory structure for which I'm
> trying to define a device tree and I need some help making sense out
> it all. The basic scenario:
> 1 =A0 =A0 =A0 I'm using a MIPS processor, which has low memory from 0x0 to
> =A0 =A0 =A0 =A00x1fffffff.
> 2. =A0 =A0 =A0I have two banks of memory with the following DMA addresses:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Bank 0 =A00x20000000-0x3fffffff
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Bank 1 =A00x60000000-0x7fffffff
> =A0 =A0 =A0 =A0With a page map, the processor can also get to these so th=
ey
> =A0 =A0 =A0 =A0are also physical addresses.
> 3. =A0 =A0 =A0All device registers are at physical addresses < 0x10000000.

Inside of the low memory region?

> 4. =A0 =A0 =A0Since the processor needs memory to run, the first 0x0fc000=
00
> =A0 =A0 =A0 =A0bytes also appear at 0x10000000. Our hardware guys call th=
is
> =A0 =A0 =A0 =A0a memory "alias". These addresses are physical, but not DMA
> =A0 =A0 =A0 =A0addresses. (The hole is so we can alias the reset vector)

Not sure I'm clear.  How does the hole work?  It might be useful to
draw a map of the various ranges rather than trying to describe it in
prose.  So is phys address range 0x00000000-0x0fc00000 aliased to
0x10000000-0x1fc00000?

> 5. =A0 =A0 =A0We need huge buffers (up to 80 MiB) that are way too large =
to
> =A0 =A0 =A0 =A0allocate with the usual functions, so we allocate them very
> =A0 =A0 =A0 =A0early through the bootmem allocator. Some of these must be
> =A0 =A0 =A0 =A0at a fixed address and some may be allocated in one or the
> =A0 =A0 =A0 =A0other bank of memory. Dynamic address assignment is genera=
lly
> =A0 =A0 =A0 =A0preferred to avoid overlapping static assignments.
>
> Memory seems straight-forward-just use the process physical addresses
> wherever possible:
>
> =A0 =A0 =A0 =A0memories {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memory@10000000 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0device_type =3D "memory";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <10000000 0x0fc000=
00>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memory@20000000 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0device_type =3D "memory";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <2fc00000 10400000=
>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memory@60000000 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0default_type =3D "memory";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <60000000 20000000=
>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0};

You don't need three separate nodes here.  Just do it thusly:

memory@10000000 {
        device_type =3D "memory";
        reg =3D <0x10000000 0x0fc00000
               0x2fc00000 0x10400000
               0x60000000 0x20000000>;
}

Since (I assume) both #address-cells and #size-cells are 1, the OS can
interpret three memory ranges from a single node.

> For a device with buffers allocated at a static address in memory
> without an alias I use a new property, cisco,memory-buffers, which
> specifies triples for buffers where:
> =A0 =A0 =A0 =A0item 1 =A0Lowest allowable address of the first byte of th=
e buffer
> =A0 =A0 =A0 =A0item 2 =A0Highest allowable address of the last byte of th=
e buffer
> =A0 =A0 =A0 =A0item 3 =A0Number of bytes in the buffer.

This is a little odd.  Is the dma-ranges property not suitable to
describe which address ranges are actually available for DMA'ing into
for each bus?

> If item 1 =3D item 2 - item 3 this buffer must be allocated at the address
> given in item 1, i.e. it has a static address. Otherwise it may be
> dynamically allocated within the given range:
>
> =A0 =A0 =A0 =A0static-dev-noalias@08000000 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "cisco,static-dev-noalias";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x08000000>;

Unless the paren't #size-cells =3D 0, this reg property is broken
because it doesn't have the size field.

> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cisco,memory-buffers=3D<0x60000000 0x60200=
000 0x00200000>;
> =A0 =A0 =A0 =A0};
>
> I think this is reasonable, though I'd prefer a standard way to specify
> memory buffers allocation parameters. Things get complicated for a device
> with buffers dynamically allocated in the part of memory with an alias.
> The device registers are still in non-aliased memory, so this isn't a
> completely independent bus:
>
> =A0 =A0 =A0 =A0dyn-dev-alias@08001000 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "cisco,dyn-dev-alias";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x08001000>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cisco,memory-buffers =3D <0x10000000 0x1fb=
00000 0x00100000>;
> =A0 =A0 =A0 =A0};
>
> The problem is that I haven't supplied enough information to turn the
> memory buffer physical addresses into DMA addresses, but if I wrap this
> in something like a simple-bus, the address for the reg property will
> be wrong.

How so?  Address translation should work if the properties are set up corre=
ctly.

> I could simply adjust it, but then it gets a lot harder to
> read and maintain.
>
> So, questions:
> 1. =A0 =A0 =A0Is there a better way to specify parameters for very early
> =A0 =A0 =A0 =A0buffer allocations?

Well, dma-ranges (see ePAPR) can set up the DMA constraints, and then
you can have a simple property just for specifying the required DMA
region size.

> 2. =A0 =A0 =A0Is there a better way to handle devices whose device regist=
ers
> =A0 =A0 =A0 =A0live nicely in physical address space but whose buffers li=
ve
> =A0 =A0 =A0 =A0in different physical and DMA address spaces?

dma-ranges is probably what you want.

g.
