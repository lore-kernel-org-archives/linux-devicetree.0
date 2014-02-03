From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] arm64: Add architecture support for PCI
Date: Mon, 3 Feb 2014 19:18:38 +0000
Message-ID: <20140203191837.GC4889@e106497-lin.cambridge.arm.com>
References: <1391453028-23191-1-git-send-email-Liviu.Dudau@arm.com>
 <1391453028-23191-2-git-send-email-Liviu.Dudau@arm.com>
 <21596846.kVTqp7roW4@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <21596846.kVTqp7roW4@wuerfel>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, linaro-kernel <linaro-kernel@lists.linaro.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 03, 2014 at 06:58:56PM +0000, Arnd Bergmann wrote:
> On Monday 03 February 2014 18:43:48 Liviu Dudau wrote:
> > diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/i=
o.h
> > index 4cc813e..ce5bad2 100644
> > --- a/arch/arm64/include/asm/io.h
> > +++ b/arch/arm64/include/asm/io.h
> > @@ -120,9 +120,13 @@ static inline u64 __raw_readq(const volatile v=
oid __iomem *addr)
> >  /*
> >   *  I/O port access primitives.
> >   */
> > +#define arch_has_dev_port()	(0)
>=20
> Why not?

Maybe I got it the wrong way around, but the comment in include/linux/i=
o.h says:

/*
 * Some systems do not have legacy ISA devices.
 * /dev/port is not a valid interface on these systems.
 * So for those archs, <asm/io.h> should define the following symbol.
 */

So ... defining it should mean no legacy ISA devices, right?

>=20
> >  #define IO_SPACE_LIMIT		0xffff
>=20
> You probably want to increase this a bit, to allow multiple host brid=
ges
> to have their own I/O space.

OK, but to what size?

>=20
> >  #define PCI_IOBASE		((void __iomem *)(MODULES_VADDR - SZ_2M))
>=20
> And modify this location: There is no particular reason to have the I=
/O space
> mapped exactly 2MB below the loadable modules, as virtual address spa=
ce is
> essentially free.

Will talk with Catalin about where to place this.

>=20
> > +#define ioport_map(port, nr)	(PCI_IOBASE + ((port) & IO_SPACE_LIMI=
T))
> > +#define ioport_unmap(addr)
>=20
> inline functions?

Will do, thanks!

>=20
> >  static inline u8 inb(unsigned long addr)
> >  {
> >  	return readb(addr + PCI_IOBASE);
> > diff --git a/arch/arm64/include/asm/pci.h b/arch/arm64/include/asm/=
pci.h
> > new file mode 100644
> > index 0000000..dd084a3
> > --- /dev/null
> > +++ b/arch/arm64/include/asm/pci.h
> > @@ -0,0 +1,35 @@
> > +#ifndef __ASM_PCI_H
> > +#define __ASM_PCI_H
> > +#ifdef __KERNEL__
> > +
> > +#include <linux/types.h>
> > +#include <linux/slab.h>
> > +#include <linux/dma-mapping.h>
> > +
> > +#include <asm/io.h>
> > +#include <asm-generic/pci-bridge.h>
> > +#include <asm-generic/pci-dma-compat.h>
> > +
> > +#define PCIBIOS_MIN_IO		0
> > +#define PCIBIOS_MIN_MEM		0
>=20
> PCIBIOS_MIN_IO is normally set to 0x1000, to stay out of the ISA rang=
e.

:) No ISA support! (Die ISA, die!!)=20

>=20
> > diff --git a/arch/arm64/kernel/pci.c b/arch/arm64/kernel/pci.c
> > new file mode 100644
> > index 0000000..7b652cf
> > --- /dev/null
> > +++ b/arch/arm64/kernel/pci.c
> > @@ -0,0 +1,112 @@
>=20
> None of this looks really arm64 specific, nor should it be. I think
> we should try a little harder to move this as a default implementatio=
n
> into common code, even if we start out by having all architectures
> override it.

Agree. This is the RFC version. I didn't dare to post a patch with fixe=
s
for all architectures. :)

>=20
> > +int pci_ioremap_io(unsigned int offset, phys_addr_t phys_addr)
> > +{
> > +	BUG_ON(offset + SZ_64K - 1 > IO_SPACE_LIMIT);
> > +
> > +	return ioremap_page_range((unsigned long)PCI_IOBASE + offset,
> > +				(unsigned long)PCI_IOBASE + offset + SZ_64K,
> > +				phys_addr,
> > +				__pgprot(PROT_DEVICE_nGnRE));
> > +}
>=20
> Not sure if we want to treat this one as architecture specific though=
=2E
> It certainly won't be portable to x86, but it could be shared with
> a couple of others. We may also want to redesign the interface.
> I've been thinking we could make this function allocate space in the
> Linux virtual I/O space aperture, and pass two resources into it
> (physical I/O aperture and bus I/O range), and get the actual
> io_offset as the return value, or a negative error number.

Not sure I completely follow your idea.

>=20
> That way, you could have an arbitrary number of host bridges in the
> system and each one gets a share of the virtual aperture until
> it's full.

One still needs to fix the pci_request_region use that checks against
ioport_resource. But it is an interesting idea.

>=20
> 	Arnd
>=20
>=20

Thanks for reviewing this patch!

Liviu

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
