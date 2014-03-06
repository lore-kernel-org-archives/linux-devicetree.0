From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 3/3] arm64: Add architecture support for PCI
Date: Thu, 6 Mar 2014 16:17:13 +0000
Message-ID: <20140306161713.GH6457@e106497-lin.cambridge.arm.com>
References: <1393948216-11599-1-git-send-email-Liviu.Dudau@arm.com>
 <1393948216-11599-4-git-send-email-Liviu.Dudau@arm.com>
 <201403042328.51361.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201403042328.51361.arnd-r2nGTMty4D4@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 04, 2014 at 10:28:51PM +0000, Arnd Bergmann wrote:
> On Tuesday 04 March 2014, Liviu Dudau wrote:
>=20
> > +extern int isa_dma_bridge_buggy;
>=20
> As commented before, I still think we can hardcode this to off

Unfortunately that doesn't work when you have CONFIG_PCI=3Dy. drivers/p=
ci/pci.c has:

drivers/pci/pci.c:int isa_dma_bridge_buggy;
drivers/pci/pci.c:EXPORT_SYMBOL(isa_dma_bridge_buggy);

and drivers/pci/quirks.c does:

drivers/pci/quirks.c:   if (!isa_dma_bridge_buggy) {
drivers/pci/quirks.c:           isa_dma_bridge_buggy=3D1;
drivers/pci/quirks.c-           dev_info(&dev->dev, "Activating ISA DMA=
 hang workarounds\n");
drivers/pci/quirks.c-   }


>=20
> > +unsigned long pci_address_to_pio(phys_addr_t address)
> > +{
> > +	struct ioresource *res;
> > +
> > +	list_for_each_entry(res, &io_list, list) {
> > +		if (address >=3D res->start &&
> > +			address < res->start + res->size) {
> > +			return res->start - address;
> > +		}
> > +	}
> > +
> > +	return (unsigned long)-1;
> > +}
> > +EXPORT_SYMBOL_GPL(pci_address_to_pio);
>=20
> This has two problems:
>=20
> - You return the address in bus space not the logical Linux
>   port number as powerpc and microblaze do.
> - You imply that the window starts at bus address zero, which
>   might not be the case.

That's definitely not the intention here. I want to return the
logical port number and I want that port number to start from
zero for every registered IO range.=20

>=20
> > +EXPORT_SYMBOL(pcibios_fixup_bus);
>=20
> no need for this export.

OK.

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
> or this one. Also, the ALIGN() is already done by the PCI core.

This has been fix in v6 already.

Thanks for reviewing this!

Liviu

>=20
> 	Arnd
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
