From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v7 1/6] pci: Introduce pci_register_io_range() helper
 function.
Date: Mon, 7 Apr 2014 09:31:20 +0100
Message-ID: <20140407083120.GE17163@e106497-lin.cambridge.arm.com>
References: <1394811272-1547-1-git-send-email-Liviu.Dudau@arm.com>
 <1394811272-1547-2-git-send-email-Liviu.Dudau@arm.com>
 <20140405001953.GE15806@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140405001953.GE15806-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 05, 2014 at 01:19:53AM +0100, Bjorn Helgaas wrote:
> On Fri, Mar 14, 2014 at 03:34:27PM +0000, Liviu Dudau wrote:
> > Some architectures do not share x86 simple view of the PCI I/O spac=
e
> > and instead use a range of addresses that map to bus addresses. For
> > some architectures these ranges will be expressed by OF bindings
> > in a device tree file.
>=20
> It's true that the current Linux "x86 view of PCI I/O space" is prett=
y
> simple and limited.  But I don't think that's a fundamental x86 limit=
ation
> (other than the fact that the actual INB/OUTB/etc. CPU instructions
> themselves are limited to a single 64K I/O port space).

Hi Bjorn,

Thanks for reviewing this series.

I might've taken a too dim view of x86 world. I tend to split the exist=
ing
architectures into the ones that have special I/O instructions and the =
ones
that map a region of memory into CPU space and do I/O transactions ther=
e as
simple read/writes.

>=20
> Host bridges on x86 could have MMIO apertures that turn CPU memory ac=
cesses
> into PCI port accesses.  We could implement any number of I/O port sp=
aces
> this way, by making the kernel inb()/outb()/etc. interfaces smart eno=
ugh to
> use the memory-mapped space instead of (or in addition to) the
> INB/OUTB/etc. instructions.

Right, sorry for my ignorance then: how does *currently* the device dri=
ver do
the I/O transfer transparent of the implementation mechanism? Or they h=
ave
intimate knowledge of wether the device is behind a host bridge and can=
 do MMIO
or is on an ISA or CF bus and then it needs INB/OUTB ? And if we make i=
nb/outb
smarter, does that mean that we need to change the drivers?

>=20
> ia64 does this (see arch/ia64/include/asm/io.h for a little descripti=
on)
> and I think maybe one or two other arches have something similar.
>=20
> > Introduce a pci_register_io_range() helper function that can be use=
d
> > by the architecture code to keep track of the I/O ranges described =
by the
> > PCI bindings. If the PCI_IOBASE macro is not defined that signals
> > lack of support for PCI and we return an error.
>=20
> I don't quite see how you intend to use this, because this series doe=
sn't
> include any non-stub implementation of pci_register_io_range().
>=20
> Is this anything like the ia64 strategy I mentioned above?  If so, it=
 would
> be really nice to unify some of this stuff.

After discussions with Arnd and Catalin I know have a new series that m=
oves
some of the code from arm64 series into this one. I am putting it throu=
gh
testing right know as I am going to have to depend on another series th=
at
makes PCI_IOBASE defined only for architectures that do MMIO in order t=
o
choose the correct default implementation for these functions. My hope =
is
that I will be able to send the series this week.

Best regards,
Liviu

>=20
> > Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> > Acked-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Tested-by: Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>
> > ---
> >  drivers/of/address.c       | 9 +++++++++
> >  include/linux/of_address.h | 1 +
> >  2 files changed, 10 insertions(+)
> >=20
> > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > index 1a54f1f..be958ed 100644
> > --- a/drivers/of/address.c
> > +++ b/drivers/of/address.c
> > @@ -619,6 +619,15 @@ const __be32 *of_get_address(struct device_nod=
e *dev, int index, u64 *size,
> >  }
> >  EXPORT_SYMBOL(of_get_address);
> > =20
> > +int __weak pci_register_io_range(phys_addr_t addr, resource_size_t=
 size)
> > +{
> > +#ifndef PCI_IOBASE
> > +	return -EINVAL;
> > +#else
> > +	return 0;
> > +#endif
> > +}
> > +
> >  unsigned long __weak pci_address_to_pio(phys_addr_t address)
> >  {
> >  	if (address > IO_SPACE_LIMIT)
> > diff --git a/include/linux/of_address.h b/include/linux/of_address.=
h
> > index 5f6ed6b..40c418d 100644
> > --- a/include/linux/of_address.h
> > +++ b/include/linux/of_address.h
> > @@ -56,6 +56,7 @@ extern void __iomem *of_iomap(struct device_node =
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
> > 1.9.0
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
