From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 3/3] arm64: Add architecture support for PCI
Date: Thu, 27 Feb 2014 16:48:57 +0000
Message-ID: <20140227164857.GQ1692@e106497-lin.cambridge.arm.com>
References: <1393506599-11561-1-git-send-email-Liviu.Dudau@arm.com>
 <1393506599-11561-4-git-send-email-Liviu.Dudau@arm.com>
 <5402126.Dbh9PNPIjR@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5402126.Dbh9PNPIjR@wuerfel>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 27, 2014 at 04:06:24PM +0000, Arnd Bergmann wrote:
> On Thursday 27 February 2014 13:09:59 Liviu Dudau wrote:
>=20
> > +/*
> > + * PCI address space differs from physical memory address space
> > + */
> > +#define PCI_DMA_BUS_IS_PHYS	(0)
> > +
> > +extern int isa_dma_bridge_buggy;
>=20
> I got curious about isa_dma_bridge_buggy: apparently this is a quirk =
for
> some old x86 bridges. We don't have those on arm64, and we also don't=
 have
> ISA_DMA_API, so just define this to (0).

OK.

>=20
> > +static inline int pci_domain_nr(struct pci_bus *bus)
> > +{
> > +	struct pci_host_bridge *bridge =3D to_pci_host_bridge(bus->bridge=
);
> > +
> > +	if (bridge)
> > +		return bridge->domain_nr;
> > +
> > +	return 0;
> > +}
> > +
> > +static inline int pci_proc_domain(struct pci_bus *bus)
> > +{
> > +	return pci_domain_nr(bus);
> > +}
>=20
> And this one I would change to always return '1': we can deal with
> domain numbers showing up in /procfs for all buses, since there is
> no legacy software to worry about.

Will do, thanks for reviewing this.

>=20
> > diff --git a/arch/arm64/kernel/pci.c b/arch/arm64/kernel/pci.c
> > new file mode 100644
> > index 0000000..496df41
> > --- /dev/null
> > +++ b/arch/arm64/kernel/pci.c
> > @@ -0,1 +1,126 @@
>=20
> Ok, this is nice and short. Let's see if we can reduce it to nothing =
;-)
>=20
> > +/*
> > + * Called after each bus is probed, but before its children are ex=
amined
> > + */
> > +void pcibios_fixup_bus(struct pci_bus *bus)
> > +{
> > +	struct pci_dev *dev;
> > +	struct resource *res;
> > +	int i;
> > +
> > +	if (!pci_is_root_bus(bus)) {
> > +		pci_read_bridge_bases(bus);
> > +
> > +		pci_bus_for_each_resource(bus, res, i) {
> > +			if (!res || !res->flags || res->parent)
> > +				continue;
> > +
> > +			/*
> > +			 * If we are going to reassign everything, we can
> > +			 * shrink the P2P resource to have zero size to
> > +			 * save space
> > +			 */
> > +			if (pci_has_flag(PCI_REASSIGN_ALL_RSRC)) {
> > +				res->flags |=3D IORESOURCE_UNSET;
> > +				res->start =3D 0;
> > +				res->end =3D -1;
> > +				continue;
> > +			}
> > +		}
> > +	}
> > +
> > +	list_for_each_entry(dev, &bus->devices, bus_list) {
> > +		/* Ignore fully discovered devices */
> > +		if (dev->is_added)
> > +			continue;
> > +
> > +		set_dev_node(&dev->dev, pcibus_to_node(dev->bus));
> > +
> > +		/* Read default IRQs and fixup if necessary */
> > +		dev->irq =3D of_irq_parse_and_map_pci(dev, 0, 0);
> > +	}
> > +}
> > +EXPORT_SYMBOL(pcibios_fixup_bus);
>=20
> Shrinking the P2P resources I suppose is optional, but everything
> else is in fact needed for any DT based architecture. Could this
> be turned into a generic helper function in the PCI core that we
> can call from architecture code?
>=20
> If you name it pci_generic_fixup_bus(), we can add a weak helper
> like:
>=20
> void __weak pcibios_fixup_bus(struct pci_bus *bus)
> {
> 	pci_generic_fixup_bus(bus);
> }
>=20
> for architectures like arm64 that don't actually need to do anything
> else.

Sure, it can be done. Don't know what is the policy for these kind of f=
unctions
that are used by architectures, but I can try sending a patch that adds=
 the
weak implementations in the core PCI code.

>=20
> > +/*
> > + * We don't have to worry about legacy ISA devices, so nothing to =
do here
> > + */
> > +resource_size_t pcibios_align_resource(void *data, const struct re=
source *res,
> > +				resource_size_t size, resource_size_t align)
> > +{
> > +	return ALIGN(res->start, align);
> > +}
> > +EXPORT_SYMBOL(pcibios_align_resource);
>=20
> Where did this come from?=20

=46rom an internal version that Will posted. See, we do talk to each ot=
her ;)


> The most common implementation seems to be
>=20
> resource_size_t pcibios_align_resource(void *data, const struct resou=
rce *res,
> 				resource_size_t size, resource_size_t align)
> {
> 	return start;
> }
> EXPORT_SYMBOL(pcibios_align_resource);
>=20
> if you don't have to worry about ISA devices. The ALIGN() part seems =
to
> be handled by __find_resource() already.
>=20
> I'd say that should be made the default implementation in the PCI cor=
e.
>=20
> I'm also pretty sure you don't need the EXPORT_SYMBOL, since the PCI
> core cannot be a loadable module (yet).

OK.

>=20
> > +int pcibios_enable_device(struct pci_dev *dev, int mask)
> > +{
> > +	return pci_enable_resources(dev, mask);
> > +}
> > +
> > +void pcibios_fixup_bridge_ranges(struct list_head *resources)
> > +{
> > +}
>=20
> These are clearly the right implementations, but they should be weak
> functions, too.

pcibios_enable_devices is already subject to a patch series from Bjorn =
that make
the weak implementation do the right thing for arm64, so the final vers=
ion will
not contain this.

>=20
> > +#define IO_SPACE_PAGES	((IO_SPACE_LIMIT + 1) / PAGE_SIZE)
> > +static DECLARE_BITMAP(pci_iospace, IO_SPACE_PAGES);
> > +
> > +unsigned long pci_ioremap_io(const struct resource *res, phys_addr=
_t phys_addr)
> > +{
> > +	unsigned long start, len, virt_start;
> > +	int err;
> > +
> > +	if (res->end > IO_SPACE_LIMIT)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * try finding free space for the whole size first,
> > +	 * fall back to 64K if not available
> > +	 */
> > +	len =3D resource_size(res);
> > +	start =3D bitmap_find_next_zero_area(pci_iospace, IO_SPACE_PAGES,
> > +				res->start / PAGE_SIZE, len / PAGE_SIZE, 0);
> > +	if (start =3D=3D IO_SPACE_PAGES && len > SZ_64K) {
> > +		len =3D SZ_64K;
> > +		start =3D 0;
> > +		start =3D bitmap_find_next_zero_area(pci_iospace, IO_SPACE_PAGES=
,
> > +					start, len / PAGE_SIZE, 0);
> > +	}
> > +
> > +	/* no 64K area found */
> > +	if (start =3D=3D IO_SPACE_PAGES)
> > +		return -ENOMEM;
> > +
> > +	/* ioremap physical aperture to virtual aperture */
> > +	virt_start =3D start * PAGE_SIZE + (unsigned long)PCI_IOBASE;
> > +	err =3D ioremap_page_range(virt_start, virt_start + len,
> > +				phys_addr, __pgprot(PROT_DEVICE_nGnRE));
> > +	if (err)
> > +		return err;
> > +
> > +	bitmap_set(pci_iospace, start, len / PAGE_SIZE);
> > +
> > +	/* return io_offset */
> > +	return start * PAGE_SIZE - res->start;
> > +}
>=20
> Maybe this can become an optional helper function with a separate Kco=
nfig symbol
> to enable it.

Probably need to find a different name for it as well when it moves int=
o core, arm
already has an externalised function with this name.

Best regards,
Liviu

>=20
> 	Arnd
>=20
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
