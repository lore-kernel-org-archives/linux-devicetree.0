From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v8 3/9] pci: Introduce pci_register_io_range() helper
 function.
Date: Tue, 8 Jul 2014 11:40:50 +0100
Message-ID: <20140708104050.GA6501@e106497-lin.cambridge.arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <1404240214-9804-4-git-send-email-Liviu.Dudau@arm.com>
 <20140708001418.GB22939@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20140708001418.GB22939@google.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci <linux-pci@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, linaro-kernel <linaro-kernel@lists.linaro.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>, Sinan Kaya <okaya@codeaurora.org>, Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Suravee Suthikulanit <suravee.suthikulpanit@amd.com>, LKML <linux-kernel@vger.kernel.org>, Device Tree ML <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 08, 2014 at 01:14:18AM +0100, Bjorn Helgaas wrote:
> On Tue, Jul 01, 2014 at 07:43:28PM +0100, Liviu Dudau wrote:
> > Some architectures do not have a simple view of the PCI I/O space
> > and instead use a range of CPU addresses that map to bus addresses.=
 For
> > some architectures these ranges will be expressed by OF bindings
> > in a device tree file.
> >=20
> > Introduce a pci_register_io_range() helper function with a generic
> > implementation that can be used by such architectures to keep track
> > of the I/O ranges described by the PCI bindings. If the PCI_IOBASE
> > macro is not defined that signals lack of support for PCI and we
> > return an error.
> >=20
> > Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> > ---
> >  drivers/of/address.c       | 61 ++++++++++++++++++++++++++++++++++=
++++++++++++
> >  include/linux/of_address.h |  1 +
> >  2 files changed, 62 insertions(+)
> >=20
> > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > index 5edfcb0..1345733 100644
> > --- a/drivers/of/address.c
> > +++ b/drivers/of/address.c
> > @@ -5,6 +5,7 @@
> >  #include <linux/module.h>
> >  #include <linux/of_address.h>
> >  #include <linux/pci_regs.h>
> > +#include <linux/slab.h>
> >  #include <linux/string.h>
> > =20
> >  /* Max address size we deal with */
> > @@ -601,12 +602,72 @@ const __be32 *of_get_address(struct device_no=
de *dev, int index, u64 *size,
> >  }
> >  EXPORT_SYMBOL(of_get_address);
> > =20
> > +struct io_range {
> > +	struct list_head list;
> > +	phys_addr_t start;
> > +	resource_size_t size;
> > +};
> > +
> > +static LIST_HEAD(io_range_list);
> > +
> > +/*
> > + * Record the PCI IO range (expressed as CPU physical address + si=
ze).
> > + * Return a negative value if an error has occured, zero otherwise
> > + */
> > +int __weak pci_register_io_range(phys_addr_t addr, resource_size_t=
 size)
>=20
> I don't understand the interface here.  What's the mapping from CPU
> physical address to bus I/O port?  For example, I have the following
> machine in mind:
>=20
>   HWP0002:00: PCI Root Bridge (domain 0000 [bus 00-1b])
>   HWP0002:00: memory-mapped IO port space [mem 0xf8010000000-0xf80100=
00fff]
>   HWP0002:00: host bridge window [io  0x0000-0x0fff]
>=20
>   HWP0002:09: PCI Root Bridge (domain 0001 [bus 00-1b])
>   HWP0002:09: memory-mapped IO port space [mem 0xf8110000000-0xf81100=
00fff]
>   HWP0002:09: host bridge window [io  0x1000000-0x1000fff] (PCI addre=
ss [0x0-0xfff])
>=20
> The CPU physical memory [mem 0xf8010000000-0xf8010000fff] is translat=
ed by
> the bridge to I/O ports 0x0000-0x0fff on PCI bus 0000:00.  Drivers us=
e,
> e.g., "inb(0)" to access it.
>=20
> Similarly, [mem 0xf8110000000-0xf8110000fff] is translated by the sec=
ond
> bridge to I/O ports 0x0000-0x0fff on PCI bus 0001:00.  Drivers use
> "inb(0x1000000)" to access it.
>=20
> pci_register_io_range() seems sort of like it's intended to track the
> memory-mapped IO port spaces, e.g., [mem 0xf8010000000-0xf8010000fff]=
=2E
> But I would think you'd want to keep track of at least the base port
> number on the PCI bus, too.  Or is that why it's weak?

It's weak in case the default implementation doesn't fit someones requi=
rements.
And yes, it is trying to track the memory-mapped IO port spaces. When
calling pci_address_to_pio() - which takes the CPU address - it will
return the port number (0x0000 - 0x0fff and 0x1000000 - 0x1000fff respe=
ctively).
pci_address_to_pio() uses the list built by calling pci_register_io_ran=
ge()
to calculate the correct offsets (although in this case it would move y=
our
second host bridge io ports to [io 0x1000 - 0x1fff] as it tries not to =
leave
gaps in the reservations).

>=20
> Here's what these look like in /proc/iomem and /proc/ioports (note th=
at
> there are two resource structs for each memory-mapped IO port space: =
one
> IORESOURCE_MEM for the memory-mapped area (used only by the host brid=
ge
> driver), and one IORESOURCE_IO for the I/O port space (this becomes t=
he
> parent of a region used by a regular device driver):
>=20
>   /proc/iomem:
>     PCI Bus 0000:00 I/O Ports 00000000-00000fff
>     PCI Bus 0001:00 I/O Ports 01000000-01000fff
>=20
>   /proc/ioports:
>     00000000-00000fff : PCI Bus 0000:00
>     01000000-01000fff : PCI Bus 0001:00

OK, I have a question that might be ovbious to you but I have missed th=
e answer
so far: how does the IORESOURCE_MEM area gets created? Is it the host b=
ridge
driver's job to do it? Is it something that the framework should do whe=
n it
notices that the IORESOURCE_IO is memory mapped?

Many thanks,
Liviu

>=20
> > +{
> > +#ifdef PCI_IOBASE
> > +	struct io_range *res;
> > +	resource_size_t allocated_size =3D 0;
> > +
> > +	/* check if the range hasn't been previously recorded */
> > +	list_for_each_entry(res, &io_range_list, list) {
> > +		if (addr >=3D res->start && addr + size <=3D res->start + size)
> > +			return 0;
> > +		allocated_size +=3D res->size;
> > +	}
> > +
> > +	/* range not registed yet, check for available space */
> > +	if (allocated_size + size - 1 > IO_SPACE_LIMIT)
> > +		return -E2BIG;
> > +
> > +	/* add the range to the list */
> > +	res =3D kzalloc(sizeof(*res), GFP_KERNEL);
> > +	if (!res)
> > +		return -ENOMEM;
> > +
> > +	res->start =3D addr;
> > +	res->size =3D size;
> > +
> > +	list_add_tail(&res->list, &io_range_list);
> > +
> > +	return 0;
> > +#else
> > +	return -EINVAL;
> > +#endif
> > +}
> > +
> >  unsigned long __weak pci_address_to_pio(phys_addr_t address)
> >  {
> > +#ifdef PCI_IOBASE
> > +	struct io_range *res;
> > +	resource_size_t offset =3D 0;
> > +
> > +	list_for_each_entry(res, &io_range_list, list) {
> > +		if (address >=3D res->start &&
> > +			address < res->start + res->size) {
> > +			return res->start - address + offset;
> > +		}
> > +		offset +=3D res->size;
> > +	}
> > +
> > +	return (unsigned long)-1;
> > +#else
> >  	if (address > IO_SPACE_LIMIT)
> >  		return (unsigned long)-1;
> > =20
> >  	return (unsigned long) address;
> > +#endif
> >  }
> > =20
> >  static int __of_address_to_resource(struct device_node *dev,
> > diff --git a/include/linux/of_address.h b/include/linux/of_address.=
h
> > index c13b878..ac4aac4 100644
> > --- a/include/linux/of_address.h
> > +++ b/include/linux/of_address.h
> > @@ -55,6 +55,7 @@ extern void __iomem *of_iomap(struct device_node =
*device, int index);
> >  extern const __be32 *of_get_address(struct device_node *dev, int i=
ndex,
> >  			   u64 *size, unsigned int *flags);
> > =20
> > +extern int pci_register_io_range(phys_addr_t addr, resource_size_t=
 size);
> >  extern unsigned long pci_address_to_pio(phys_addr_t addr);
> > =20
> >  extern int of_pci_range_parser_init(struct of_pci_range_parser *pa=
rser,
> > --=20
> > 2.0.0
> >=20
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
