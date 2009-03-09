From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: mapping a PCI bus
Date: Mon, 09 Mar 2009 07:25:55 -1000
Message-ID: <49B55123.3090401@firmworks.com>
References: <49B4F27C.7040007@fr.thalesgroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <49B4F27C.7040007-s/S/64wAxt+H1Tvi1vFFB9BPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Nicolas Lavocat <nicolas.lavocat-s/S/64wAxt+H1Tvi1vFFB9BPR1lH4CV8@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The reason why the ranges property for PCI is so complicated is because =

PCI addressing is complicated, so it's tricky to fit the PCI address =

information into a generic framework.  I'll explain how it works =

in-line, below.

> Hy everybody!
>
> I=92m working on a project:
>
> On a proprietary board, (with a PowerPC 7448), a minimal Linux has =

> been embedded. My first aim consist in using a graphic chipset on the =

> board, that is to say make work the PCI bus. For the address mapping, =

> I try to write a dts, using the dts of the mpc7448hpc2 board as a =

> model. My problem is that I don=92t understand how to fill the field =

> =93range=94 of the PCI. The =93width=94 used and the number of range is =

> different from on board to an other where PCI is used. I read the PCI =

> specification, and don=92t find anything about it.
>
> Here is an extract of my dts, where the field in question is indicated =

> thanks to commentaries:
>
> pci@70000000 { compatible =3D "abac-pci";
> device_type =3D "pci";
> #size-cells =3D <2>;
> #address-cells =3D <3>;
> #interrupt-cells =3D <1>;
> reg =3D <0x70000000 0x1000>;
> bus-range =3D <0 0>;
> /* how can I know how to chose the number of range and their width?*/
The "ranges" property describes how the bus bridge translates between =

the "parent" address space (typically the main system bus) and the =

"child" address space (the PCI bus address space).  For the full details =

of the generic "ranges" property, consult page 172 of =

ftp://playground.sun.com/pub/1275/coredoc/1275-1994/1275.ps.gz

The number of ranges entries is equal to the number of disjoint =

translation regions.  Typically you need at least two for PCI bus, one =

for the PCI memory space and another for the PCI I/O space.

>
> Then, I have a second question: why PCI=92s addresses seem to be =

> implemented on 96 bits, whereas the addressing is done on 32 bits?

I have moved this question up, as the answer is helpful for later.

PCI bus addressing can be either 32 bits or 64 bits, depending on the =

hardware implementation.  The Open Firmware binding to PCI uses 64 bits =

so it can accommodate the full PCI spec.  In addition to the 64 address =

bits, you need bits to indicate other information, such as which address =

space (I/O or memory) you are talking about, which Base Address Register =

is involved, and other information as described on page 4 (pdf page 9) =

of ftp://playground.sun.com/pub/1275/bindings/pci/pci2_1.pdf .  Much of =

that other information is irrelevant in the context of the "ranges" =

property - but the address space identifier is relevant.  Numeric values =

in the device tree are represented in units of 32 bits, so you need a =

total of 96 bits for the basic 64-bit address plus the extra info.

>
> ranges =3D <0x2000000 0x0 0xe0000000      0xe0000000      0x0 0x1a000000

Okay, now we can start to parse this ranges property.  I added spaces =

above to show grouping.

    0x2000000 0x0 0xe0000000

is the base PCI address of one of the ranges entries.  0x2000000  is the =

"phys.hi" cell that contains the "extra" information - in particular the =

"2" is in the "ss" field that indicates the address space - 2 means "PCI =

memory space".  The rest of the bits in that word are irrelevant to the =

ranges property.   0x0 0xe0000000 is a 64-bit offset, indicating that =

the mapped-through range begins at e0000000 in PCI memory address space.

   0xe0000000

is the entry's base address in the parent (system bus) address space.  =

Apparently this bus bridge is a very simple one - probably just wires =

and a decoder - because the parent address and child address are =

identical.  That's not always the case.

   0x0 0x1a000000

is the size of this range.  It's a 64-bit number because PCI has =

#size-cells =3D 2.  So the range goes from 0xe0000000 to 0xf9ffffff.


>
> 0x1000000 0x0 0x0 0xfa000000 0x0 0x10000>;

Similarly - 0x1000000 means I/O space, 0x0 0x0 means PCI I/O space =

beginning at 0, 0xfa000000 means that the PCI I/O space appears at =

0xfa000000 in the system bus address space, and 0x0 0x10000 means the =

mapping is 64Kbytes long.


>
> =85
>
> };
>
> Thanks for Your attention !
>
> Nicolas Lavocat
