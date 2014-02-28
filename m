From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v2 4/4] pci: Add support for creating a generic
 host_bridge from device tree
Date: Fri, 28 Feb 2014 09:55:59 +0000
Message-ID: <20140228095559.GU1692@e106497-lin.cambridge.arm.com>
References: <1393506402-11474-1-git-send-email-Liviu.Dudau@arm.com>
 <1393506402-11474-5-git-send-email-Liviu.Dudau@arm.com>
 <18746655.qWHLpMg2Yy@wuerfel>
 <1393543924.14012.56.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1393543924.14012.56.camel@pasglop>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 27, 2014 at 11:32:04PM +0000, Benjamin Herrenschmidt wrote:
> On Thu, 2014-02-27 at 14:38 +0100, Arnd Bergmann wrote:
> > On Thursday 27 February 2014 13:06:42 Liviu Dudau wrote:
> > > Several platforms use a rather generic version of parsing
> > > the device tree to find the host bridge ranges. Move the common c=
ode
> > > into the generic PCI code and use it to create a pci_host_bridge
> > > structure that can be used by arch code.
> > >=20
> > > Based on early attempts by Andrew Murray to unify the code.
> > > Used powerpc and microblaze PCI code as starting point.
>=20
> So that is only going to work for archs that don't have any special
> twist. For example it won't work for powerpc which is why Andrew
> original approach didn't fly.
>=20
> The range walk helpers do help though, I need to review in more detai=
ls
> and test Andrew powerpc patch here and will merge it.
>=20
> > > Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> >=20
> > Please add Benjamin Herrenschmidt to Cc here, I think it would be h=
elpful
> > to get his input so we can make this work on powerpc as well.
>=20
> Tricky... We would need hooks which would turn the whole thing into a
> pile of spaghetti. I think we should stick to using the range helpers
> (Andrew latest patch), which makes the powerpc code a lot smaller,
> and leave it at that.

Benjamin,

Thanks for looking at the patches.

I did look at powerpc and microblaze. I've actually started modifying m=
icroblaze
as it seems to have fewer corner cases and that's how I came up with th=
e current
design. Unfortunately my QEMU environment crashes when trying to feed i=
t a custom
dtb file that has a pci host bridge node.

I know that in the range parsing powerpc does a lot more work and that =
is why
I've split my code into the generic part and the arch specific callback=
 that can
do validation of the ranges and also a bit of housekeeping.

The next phase will be to see how much of the pci_controller structure =
can move
into the generic code and reduce its size. I do suffer from not having =
a PowerPC
platform where I can test the changes, but I can produce some compiled =
code that
someone can test.

>=20
> > > diff --git a/drivers/pci/host-bridge.c b/drivers/pci/host-bridge.=
c
> > > index 06ace62..feb8436 100644
> > > --- a/drivers/pci/host-bridge.c
> > > +++ b/drivers/pci/host-bridge.c
> > > @@ -6,9 +6,13 @@
> > >  #include <linux/init.h>
> > >  #include <linux/pci.h>
> > >  #include <linux/module.h>
> > > +#include <linux/of_address.h>
> > > +#include <linux/of_pci.h>
> > > =20
> > >  #include "pci.h"
> > > =20
> > > +static int domain_nr;
> > > +
> >=20
> > For correctness, I think you want an 'atomic_t' here and use
> > atomic_inc_return() to get a new value.
> >=20
> > >  static struct pci_bus *find_pci_root_bus(struct pci_bus *bus)
> > >  {
> > >  	while (bus->parent)
> > > @@ -91,3 +95,133 @@ void pcibios_bus_to_resource(struct pci_bus *=
bus, struct resource *res,
> > >  	res->end =3D region->end + offset;
> > >  }
> > >  EXPORT_SYMBOL(pcibios_bus_to_resource);
> > > +
> > > +/**
> > > + * pci_host_bridge_of_get_ranges - Parse PCI host bridge resourc=
es from DT
> > > + * @dev: device node of the host bridge having the range propert=
y
> > > + * @resources: list where the range of resources will be added a=
fter DT parsing
> > > + * @io_base: pointer to a variable that will contain the physica=
l address for
> > > + * the start of the I/O range.
> > > + *
> > > + * If this function returns an error then the @resources list wi=
ll be freed.
> > > + *
> > > + * This function will parse the "ranges" property of a PCI host =
bridge device
> > > + * node and setup the resource mapping based on its content. It =
is expected
> > > + * that the property conforms with the Power ePAPR document.
> > > + *
> > > + * Each architecture is then offered the chance of applying thei=
r own
> > > + * filtering of pci_host_bridge_windows based on their own restr=
ictions by
> > > + * calling pcibios_fixup_bridge_ranges(). The filtered list of w=
indows
> > > + * can then be used when creating a pci_host_bridge structure.
> > > + */
> > > +static int pci_host_bridge_of_get_ranges(struct device_node *dev=
,
> > > +		struct list_head *resources, resource_size_t *io_base)
> > > +{
> > > +	struct resource *res;
> > > +	struct of_pci_range range;
> > > +	struct of_pci_range_parser parser;
> > > +	int err;
> > > +
> > > +	pr_info("PCI host bridge %s ranges:\n", dev->full_name);
> > > +
> > > +	/* Check for ranges property */
> > > +	err =3D of_pci_range_parser_init(&parser, dev);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	pr_debug("Parsing ranges property...\n");
> > > +	for_each_of_pci_range(&parser, &range) {
> > > +		/* Read next ranges element */
> > > +		pr_debug("pci_space: 0x%08x pci_addr:0x%016llx ",
> > > +				range.pci_space, range.pci_addr);
> > > +		pr_debug("cpu_addr:0x%016llx size:0x%016llx\n",
> > > +					range.cpu_addr, range.size);
> > > +
> > > +		/*
> > > +		 * If we failed translation or got a zero-sized region
> > > +		 * then skip this range
> > > +		 */
> > > +		if (range.cpu_addr =3D=3D OF_BAD_ADDR || range.size =3D=3D 0)
> > > +			continue;
>=20
> Shouldn't that test move into the parsing helper ?

Good question. Should we then automatically skip the bad translated
ranges?

>=20
> > > +		res =3D kzalloc(sizeof(struct resource), GFP_KERNEL);
> > > +		if (!res) {
> > > +			err =3D -ENOMEM;
> > > +			goto bridge_ranges_nomem;
> > > +		}
> > > +
> > > +		of_pci_range_to_resource(&range, dev, res);
> > > +
> > > +		if (resource_type(res) =3D=3D IORESOURCE_IO)
> > > +			*io_base =3D range.cpu_addr;
>=20
> You don't care about the size of the IO space ?

Not here. I will leave it to the platform specific hook to do the valid=
ation.

>=20
> > > +		pci_add_resource_offset(resources, res,
> > > +				res->start - range.pci_addr);
> > > +	}
> >=20
> > This is not the correct resource for I/O space at all. Please talk
> > to Will, I've been over this with him in detail and he probably
> > understands it now. I assume you are both working in the same
> > building.
>=20
> Yes, the IO offsets work differently on powerpc as well

Can you check for powerpc in light of the changes I've made in the
of_pci_range_to_resource() function? (and please read range.cpu_addr in=
stead
of range.pci_addr in the pci_address_to_pio(). I'll post v3 shortly.)=20

>=20
> > Since this is common PCI code, you could also decide to open-code
> > the pci_add_resource_offset() function. If you don't do that, I
> > think you have a memory leak for the resources that you can avoid
> > by allocating the resource and pci_host_bridge_window structures
> > together with a single kzalloc.
> >=20
> > > +	/* Apply architecture specific fixups for the ranges */
> > > +	pcibios_fixup_bridge_ranges(resources);
> > > +
> > > +	return 0;
> > > +
> > > +bridge_ranges_nomem:
> > > +	pci_free_resource_list(resources);
> > > +	return err;
> > > +}
> > > +
> > > +/**
> > > + * of_create_pci_host_bridge - Create a PCI host bridge structur=
e using
> > > + * information passed in the DT.
> > > + * @parent: device owning this host bridge
> > > + * @ops: pci_ops associated with the host controller
> > > + * @host_data: opaque data structure used by the host controller=
=2E
> > > + *
> > > + * returns a pointer to the newly created pci_host_bridge struct=
ure, or
> > > + * NULL if the call failed.
> > > + *
> > > + * This function will try to obtain the host bridge domain numbe=
r by
> > > + * using of_alias_get_id() call with "pci-domain" as a stem. If =
that
> > > + * fails, a local allocator will be used that will put each host=
 bridge
> > > + * in a new domain.
> > > + */
> > > +struct pci_host_bridge *
> > > +of_create_pci_host_bridge(struct device *parent, struct pci_ops =
*ops, void *host_data)
> > > +{
> > > +	int err, domain, busno;
> > > +	struct resource bus_range;
> > > +	struct pci_bus *root_bus;
> > > +	struct pci_host_bridge *bridge;
> > > +	resource_size_t io_base;
> > > +	LIST_HEAD(res);
> > > +
> > > +	domain =3D of_alias_get_id(parent->of_node, "pci-domain");
> > > +	if (domain =3D=3D -ENODEV)
> > > +		domain =3D domain_nr++;
> > >
> We probably want some uniqueness testing here.

You mean you want one host bridge per domain? It's not entirely clear i=
f there is
general consensus here on this, but I'm in favour of enforcing that.

Best regards,
Liviu

>=20
> > > +	err =3D of_pci_parse_bus_range(parent->of_node, &bus_range);
> > > +	if (err) {
> > > +		dev_info(parent, "No bus range for %s, using default [0-255]\n=
",
> > > +			parent->of_node->full_name);
> > > +		bus_range.start =3D 0;
> > > +		bus_range.end =3D 255;
> > > +		bus_range.flags =3D IORESOURCE_BUS;
> > > +	}
> > > +	busno =3D bus_range.start;
> > > +	pci_add_resource(&res, &bus_range);
> > > +
> > > +	/* now parse the rest of host bridge bus ranges */
> > > +	if (pci_host_bridge_of_get_ranges(parent->of_node, &res, &io_ba=
se))
> > > +		return NULL;
> > > +
> > > +	/* then create the root bus */
> > > +	root_bus =3D pci_create_root_bus_in_domain(parent, domain, busn=
o,
> > > +						ops, host_data, &res);
> > > +	if (!root_bus)
> > > +		return NULL;
> >=20
> > Do we have any code that checks for conflicting domain/bus numbers =
here?
> > I guess pci_create_root_bus_in_domain() will fail if you have that.
> >=20
> > Since pci_create_root_bus_in_domain() is a new function that you ju=
st
> > introduced, it would be helpful to change the calling conventions
> > so it returns an error pointer instead of NULL upon failing.
> > of_create_pci_host_bridge() can do the same, but pci_create_root_bu=
s()
> > should keep returning NULL so we don't have to change all the
> > callers.
> >=20
> > > +	bridge =3D to_pci_host_bridge(root_bus->bridge);
> > > +	bridge->io_base =3D io_base;
> > > +
> > > +	return bridge;
> > > +}
> > > +EXPORT_SYMBOL_GPL(of_create_pci_host_bridge);
> > > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > > index 1eed009..0c5e269 100644
> > > --- a/include/linux/pci.h
> > > +++ b/include/linux/pci.h
> > > @@ -395,6 +395,7 @@ struct pci_host_bridge {
> > >  	struct device dev;
> > >  	struct pci_bus *bus;		/* root bus */
> > >  	int domain_nr;
> > > +	resource_size_t io_base;	/* physical address for the start of I=
/O area */
> > >  	struct list_head windows;	/* pci_host_bridge_windows */
> > >  	void (*release_fn)(struct pci_host_bridge *);
> > >  	void *release_data;
> >=20
> > What is the io_base used for here?
> >=20
> > > @@ -1786,11 +1787,23 @@ static inline struct device_node *pci_bus=
_to_OF_node(struct pci_bus *bus)
> > >  	return bus ? bus->dev.of_node : NULL;
> > >  }
> > > =20
> > > +struct pci_host_bridge *
> > > +of_create_pci_host_bridge(struct device *parent, struct pci_ops =
*ops,
> > > +			void *host_data);
> > > +
> > > +void pcibios_fixup_bridge_ranges(struct list_head *resources);
> > >  #else /* CONFIG_OF */
> > >  static inline void pci_set_of_node(struct pci_dev *dev) { }
> > >  static inline void pci_release_of_node(struct pci_dev *dev) { }
> > >  static inline void pci_set_bus_of_node(struct pci_bus *bus) { }
> > >  static inline void pci_release_bus_of_node(struct pci_bus *bus) =
{ }
> > > +
> > > +static inline struct pci_host_bridge *
> > > +pci_host_bridge_of_init(struct device *parent, struct pci_ops *o=
ps,
> > > +			void *host_data)
> > > +{
> > > +	return NULL;
> > > +}
> > >  #endif  /* CONFIG_OF */
> > > =20
> > >  #ifdef CONFIG_EEH
> > >=20
> >=20
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-pci=
" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
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
