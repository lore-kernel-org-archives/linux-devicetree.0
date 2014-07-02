From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v8 8/9] pci: Add support for creating a generic
 host_bridge from device tree
Date: Wed, 2 Jul 2014 18:23:55 +0100
Message-ID: <20140702172355.GQ2173@e106497-lin.cambridge.arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <1404240214-9804-9-git-send-email-Liviu.Dudau@arm.com>
 <20140702112230.GL18731@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140702112230.GL18731-5wv7dgnIgG8@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Suravee Suthikulanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Device Tree ML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 02, 2014 at 12:22:30PM +0100, Will Deacon wrote:
> Hi Liviu,
>=20
> On Tue, Jul 01, 2014 at 07:43:33PM +0100, Liviu Dudau wrote:
> > Several platforms use a rather generic version of parsing
> > the device tree to find the host bridge ranges. Move the common cod=
e
> > into the generic PCI code and use it to create a pci_host_bridge
> > structure that can be used by arch code.
> >=20
> > Based on early attempts by Andrew Murray to unify the code.
> > Used powerpc and microblaze PCI code as starting point.
>=20
> I just had a quick look at this to see how it differs from the parsin=
g in
> pci-host-generic.c and there a few small differences worth discussing=
=2E
>=20
> > +static int pci_host_bridge_of_get_ranges(struct device_node *dev,
> > +		struct list_head *resources, resource_size_t *io_base)
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
> > +		pr_debug("pci_space: 0x%08x pci_addr:0x%016llx cpu_addr:0x%016ll=
x size:0x%016llx\n",
> > +			range.pci_space, range.pci_addr, range.cpu_addr, range.size);
> > +
> > +		/*
> > +		 * If we failed translation or got a zero-sized region
> > +		 * then skip this range
> > +		 */
> > +		if (range.cpu_addr =3D=3D OF_BAD_ADDR || range.size =3D=3D 0)
> > +			continue;
> > +
> > +		res =3D kzalloc(sizeof(struct resource), GFP_KERNEL);
> > +		if (!res)
> > +			return -ENOMEM;
> > +
> > +		err =3D of_pci_range_to_resource(&range, dev, res);
> > +		if (err)
> > +			return err;
> > +
> > +		if (resource_type(res) =3D=3D IORESOURCE_IO)
> > +			*io_base =3D range.cpu_addr;
> > +
> > +		pci_add_resource_offset(resources, res,
> > +				res->start - range.pci_addr);
>=20
> Where do you request_resource before adding it?

I don't, because I'm expecting that arch code might filter the list. Wh=
en=20
the host bridge code calls pci_scan_root_bus() the resources will be
requested then.

>=20
> > +	}
> > +
> > +	/* Apply architecture specific fixups for the ranges */
> > +	return pcibios_fixup_bridge_ranges(resources);
>=20
> I currently mandate at least one non-prefetchable resource in the
> device-tree. Should I simply drop this restriction, or do I have to s=
omehow
> hook this into the pcibios callback?

Don't think I understand why you need at least one non-prefetcheable re=
source
but if you want to mandate that then the pcibios_fixup_bridge_ranges() =
would
be the place to put that check.

>=20
> > +}
> > +
> > +static atomic_t domain_nr =3D ATOMIC_INIT(-1);
> > +
> > +/**
> > + * of_create_pci_host_bridge - Create a PCI host bridge structure =
using
> > + * information passed in the DT.
> > + * @parent: device owning this host bridge
> > + * @ops: pci_ops associated with the host controller
> > + * @host_data: opaque data structure used by the host controller.
> > + *
> > + * returns a pointer to the newly created pci_host_bridge structur=
e, or
> > + * NULL if the call failed.
> > + *
> > + * This function will try to obtain the host bridge domain number =
by
> > + * using of_alias_get_id() call with "pci-domain" as a stem. If th=
at
> > + * fails, a local allocator will be used that will put each host b=
ridge
> > + * in a new domain.
> > + */
> > +struct pci_host_bridge *
> > +of_create_pci_host_bridge(struct device *parent, struct pci_ops *o=
ps, void *host_data)
> > +{
> > +	int err, domain, busno;
> > +	struct resource *bus_range;
> > +	struct pci_bus *root_bus;
> > +	struct pci_host_bridge *bridge;
> > +	resource_size_t io_base;
> > +	LIST_HEAD(res);
> > +
> > +	bus_range =3D kzalloc(sizeof(*bus_range), GFP_KERNEL);
> > +	if (!bus_range)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	domain =3D of_alias_get_id(parent->of_node, "pci-domain");
> > +	if (domain =3D=3D -ENODEV)
> > +		domain =3D atomic_inc_return(&domain_nr);
> > +
> > +	err =3D of_pci_parse_bus_range(parent->of_node, bus_range);
> > +	if (err) {
> > +		dev_info(parent, "No bus range for %s, using default [0-255]\n",
> > +			parent->of_node->full_name);
> > +		bus_range->start =3D 0;
> > +		bus_range->end =3D 255;
> > +		bus_range->flags =3D IORESOURCE_BUS;
>=20
> What about bus_range->name?

Don't know! Is anyone using it?

>=20
> > +	}
> > +	busno =3D bus_range->start;
> > +	pci_add_resource(&res, bus_range);
>=20
> I currently truncate the bus range to fit inside the Configuration Sp=
ace
> window I have (in the reg property). How can I continue to do that wi=
th this
> patch?

Not easily. Unless I add an argument to this function that will allow y=
ou to
pass in the max number for the bus range, then the code becomes:

+	err =3D of_pci_parse_bus_range(parent->of_node, bus_range);
+	if (err) {
+		dev_info(parent, "No bus range for %s, using default [0-%d]\n",
+			parent->of_node->full_name, max_range);
+		bus_range->start =3D 0;
+		bus_range->end =3D max_range;
+		bus_range->flags =3D IORESOURCE_BUS;
+	} else {
+		if (bus_range->end > bus_range->start + max_range) {
+			bus_range->end =3D bus_range->start + max_range;
+		}
+	}

Or something like that.

Best regards,
Liviu

>=20
> Will
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
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
