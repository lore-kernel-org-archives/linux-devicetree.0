From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] pci: Add support for creating a generic host_bridge from
 device tree
Date: Mon, 3 Feb 2014 19:06:49 +0000
Message-ID: <20140203190649.GB4889@e106497-lin.cambridge.arm.com>
References: <1391452428-22917-1-git-send-email-Liviu.Dudau@arm.com>
 <1391452428-22917-2-git-send-email-Liviu.Dudau@arm.com>
 <7398333.9L5KlyFggU@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7398333.9L5KlyFggU@wuerfel>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

=46irst of all, thanks for reviewing this!

On Mon, Feb 03, 2014 at 06:46:10PM +0000, Arnd Bergmann wrote:
> On Monday 03 February 2014 18:33:48 Liviu Dudau wrote:
> > +/**
> > + * pci_host_bridge_of_get_ranges - Parse PCI host bridge resources=
 from DT
> > + * @dev: device node of the host bridge having the range property
> > + * @resources: list where the range of resources will be added aft=
er DT parsing
> > + *
> > + * This function will parse the "ranges" property of a PCI host br=
idge device
> > + * node and setup the resource mapping based on its content. It is=
 expected
> > + * that the property conforms with the Power ePAPR document.
> > + *
> > + * Each architecture will then apply their filtering based on the =
limitations
> > + * of each platform. One general restriction seems to be the numbe=
r of IO space
> > + * ranges, the PCI framework makes intensive use of struct resourc=
e management,
> > + * and for IORESOURCE_IO types they can only be requested if they =
are contained
> > + * within the global ioport_resource, so that should be limited to=
 one IO space
> > + * range.
>=20
> Actually we have quite a different set of restrictions around I/O spa=
ce on ARM32
> at the moment: Each host bridge can have its own 64KB range in an arb=
itrary
> location on MMIO space, and the total must not exceed 2MB of I/O spac=
e.

And that is why the filtering is not (yet) imposed in the generic code.=
 But once
you use pci_request_region, that will call request_region which will ch=
eck
against ioport_resource as parent for the requested resource. That shou=
ld fail
if is is not in the correct range, so I don't know how arm arch code ma=
nages
multiple IO ranges.

>=20
> > + */
> > +static int pci_host_bridge_of_get_ranges(struct device_node *dev,
> > +					struct list_head *resources)
> > +{
> > +	struct resource *res;
> > +	struct of_pci_range range;
> > +	struct of_pci_range_parser parser;
> > +	int err;
> > +
> > +	pr_info("PCI host bridge %s ranges:\n", dev->full_name);
> > +
> > +	/* Check for ranges property */
> > +	err =3D of_pci_range_parser_init(&parser, dev);
> > +	if (err)
> > +		return err;
> > +
> > +	pr_debug("Parsing ranges property...\n");
> > +	for_each_of_pci_range(&parser, &range) {
> > +		/* Read next ranges element */
> > +		pr_debug("pci_space: 0x%08x pci_addr:0x%016llx ",
> > +				range.pci_space, range.pci_addr);
> > +		pr_debug("cpu_addr:0x%016llx size:0x%016llx\n",
> > +					range.cpu_addr, range.size);
> > +
> > +		/* If we failed translation or got a zero-sized region
> > +		 * (some FW try to feed us with non sensical zero sized regions
> > +		 * such as power3 which look like some kind of attempt
> > +		 * at exposing the VGA memory hole) then skip this range
> > +		 */
> > +		if (range.cpu_addr =3D=3D OF_BAD_ADDR || range.size =3D=3D 0)
> > +			continue;
> > +
> > +		res =3D kzalloc(sizeof(struct resource), GFP_KERNEL);
> > +		if (!res) {
> > +			err =3D -ENOMEM;
> > +			goto bridge_ranges_nomem;
> > +		}
> > +
> > +		of_pci_range_to_resource(&range, dev, res);
> > +
> > +		pci_add_resource_offset(resources, res,
> > +				range.cpu_addr - range.pci_addr);
> > +	}
>=20
> I believe of_pci_range_to_resource() will return the MMIO aperture fo=
r the
> I/O space window here, which is not what you are supposed to pass int=
o
> pci_add_resource_offset.

And that is why the code in probe.c has been added to deal with that. I=
t is
too early to do the adjustments here as all we have is the list of reso=
urces
and that might get culled by the architecture fixup code. Remembering t=
he
io_offset will happen once the pci_host_bridge gets created, and the re=
sources
are then adjusted.

>=20
> > +EXPORT_SYMBOL(pci_host_bridge_of_init);
>=20
> EXPORT_SYMBOL_GPL

Will change for v2, thanks!

>=20
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index 6e34498..16febae 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -1787,6 +1787,17 @@ struct pci_bus *pci_create_root_bus(struct d=
evice *parent, int bus,
> >  	list_for_each_entry_safe(window, n, resources, list) {
> >  		list_move_tail(&window->list, &bridge->windows);
> >  		res =3D window->res;
> > +		/*
> > +		 * IO resources are stored in the kernel with a CPU start
> > +		 * address of zero. Adjust the data accordingly and remember
> > +		 * the offset
> > +		 */
> > +		if (resource_type(res) =3D=3D IORESOURCE_IO) {
> > +			bridge->io_offset =3D res->start;
> > +			res->end -=3D res->start;
> > +			window->offset -=3D res->start;
> > +			res->start =3D 0;
> > +		}
> >  		offset =3D window->offset;
> >  		if (res->flags & IORESOURCE_BUS)
>=20
> Won't this break all existing host bridges?

I am not sure. I believe not, due to what I've explained earlier, but y=
ou might be right.

The adjustment happens before the resource is added to the host bridge =
windows and translates
it from MMIO range into IO range.

Best regards,
Liviu

>=20
> 	Arnd
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
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
