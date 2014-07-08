From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v8 8/9] pci: Add support for creating a generic
 host_bridge from device tree
Date: Tue, 8 Jul 2014 11:29:40 +0100
Message-ID: <20140708102940.GZ6501@e106497-lin.cambridge.arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <1404240214-9804-9-git-send-email-Liviu.Dudau@arm.com>
 <20140708010103.GD22939@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20140708010103.GD22939@google.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci <linux-pci@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, linaro-kernel <linaro-kernel@lists.linaro.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>, Sinan Kaya <okaya@codeaurora.org>, Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Suravee Suthikulanit <suravee.suthikulpanit@amd.com>, LKML <linux-kernel@vger.kernel.org>, Device Tree ML <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 08, 2014 at 02:01:04AM +0100, Bjorn Helgaas wrote:
> On Tue, Jul 01, 2014 at 07:43:33PM +0100, Liviu Dudau wrote:
> > Several platforms use a rather generic version of parsing
> > the device tree to find the host bridge ranges. Move the common cod=
e
> > into the generic PCI code and use it to create a pci_host_bridge
> > structure that can be used by arch code.
> >
> > Based on early attempts by Andrew Murray to unify the code.
> > Used powerpc and microblaze PCI code as starting point.
> >
> > Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> > Tested-by: Tanmay Inamdar <tinamdar@apm.com>
> > ---
> >  drivers/of/of_pci.c       | 135 ++++++++++++++++++++++++++++++++++=
++++++++++++
> >  drivers/pci/host-bridge.c |  18 +++++++
> >  include/linux/of_pci.h    |  10 ++++
> >  include/linux/pci.h       |   8 +++
> >  4 files changed, 171 insertions(+)
> >
> > diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
> > index 8481996..55d8320 100644
> > --- a/drivers/of/of_pci.c
> > +++ b/drivers/of/of_pci.c
> > @@ -89,6 +89,141 @@ int of_pci_parse_bus_range(struct device_node *=
node, struct resource *res)
> >  }
> >  EXPORT_SYMBOL_GPL(of_pci_parse_bus_range);
> >
> > +/**
> > + * pci_host_bridge_of_get_ranges - Parse PCI host bridge resources=
 from DT
> > + * @dev: device node of the host bridge having the range property
> > + * @resources: list where the range of resources will be added aft=
er DT parsing
> > + * @io_base: pointer to a variable that will contain the physical =
address for
> > + * the start of the I/O range.
> > + *
> > + * It is the callers job to free the @resources list if an error i=
s returned.
> > + *
> > + * This function will parse the "ranges" property of a PCI host br=
idge device
> > + * node and setup the resource mapping based on its content. It is=
 expected
> > + * that the property conforms with the Power ePAPR document.
> > + *
> > + * Each architecture is then offered the chance of applying their =
own
> > + * filtering of pci_host_bridge_windows based on their own restric=
tions by
> > + * calling pcibios_fixup_bridge_ranges(). The filtered list of win=
dows
> > + * can then be used when creating a pci_host_bridge structure.
> > + */
> > +static int pci_host_bridge_of_get_ranges(struct device_node *dev,
> > +             struct list_head *resources, resource_size_t *io_base=
)
> > +{
> > +     struct resource *res;
> > +     struct of_pci_range range;
> > +     struct of_pci_range_parser parser;
> > +     int err;
> > +
> > +     pr_info("PCI host bridge %s ranges:\n", dev->full_name);
> > +
> > +     /* Check for ranges property */
> > +     err =3D of_pci_range_parser_init(&parser, dev);
> > +     if (err)
> > +             return err;
> > +
> > +     pr_debug("Parsing ranges property...\n");
> > +     for_each_of_pci_range(&parser, &range) {
> > +             /* Read next ranges element */
> > +             pr_debug("pci_space: 0x%08x pci_addr:0x%016llx cpu_ad=
dr:0x%016llx size:0x%016llx\n",
> > +                     range.pci_space, range.pci_addr, range.cpu_ad=
dr, range.size);
>=20
> If you're not trying to match other printk formats, you could try to =
match
> the %pR format used elsewhere, e.g., "%#010llx-%#010llx" with
> range.cpu_addr, range.cpu_addr + range.size - 1.

Yes, not a big fan of the ugly output it generates, but the output matc=
hes closely the ranges
definition in the device tree file so it is easy to validate that you a=
re parsing the right
entry. I am happy to change it to shorten the cpu range message.

>=20
> > +
> > +             /*
> > +              * If we failed translation or got a zero-sized regio=
n
> > +              * then skip this range
> > +              */
> > +             if (range.cpu_addr =3D=3D OF_BAD_ADDR || range.size =3D=
=3D 0)
> > +                     continue;
> > +
> > +             res =3D kzalloc(sizeof(struct resource), GFP_KERNEL);
> > +             if (!res)
> > +                     return -ENOMEM;
> > +
> > +             err =3D of_pci_range_to_resource(&range, dev, res);
> > +             if (err)
> > +                     return err;
> > +
> > +             if (resource_type(res) =3D=3D IORESOURCE_IO)
> > +                     *io_base =3D range.cpu_addr;
> > +
> > +             pci_add_resource_offset(resources, res,
> > +                             res->start - range.pci_addr);
> > +     }
> > +
> > +     /* Apply architecture specific fixups for the ranges */
> > +     return pcibios_fixup_bridge_ranges(resources);
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
> > +     int err, domain, busno;
> > +     struct resource *bus_range;
> > +     struct pci_bus *root_bus;
> > +     struct pci_host_bridge *bridge;
> > +     resource_size_t io_base;
> > +     LIST_HEAD(res);
> > +
> > +     bus_range =3D kzalloc(sizeof(*bus_range), GFP_KERNEL);
> > +     if (!bus_range)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     domain =3D of_alias_get_id(parent->of_node, "pci-domain");
> > +     if (domain =3D=3D -ENODEV)
> > +             domain =3D atomic_inc_return(&domain_nr);
> > +
> > +     err =3D of_pci_parse_bus_range(parent->of_node, bus_range);
> > +     if (err) {
> > +             dev_info(parent, "No bus range for %s, using default =
[0-255]\n",
> > +                     parent->of_node->full_name);
> > +             bus_range->start =3D 0;
> > +             bus_range->end =3D 255;
> > +             bus_range->flags =3D IORESOURCE_BUS;
>=20
> If you put the dev_info() down here, you can print &bus_range with %p=
R.

Sure, will do.

>=20
> > +     }
> > +     busno =3D bus_range->start;
> > +     pci_add_resource(&res, bus_range);
> > +
> > +     /* now parse the rest of host bridge bus ranges */
> > +     err =3D pci_host_bridge_of_get_ranges(parent->of_node, &res, =
&io_base);
> > +     if (err)
> > +             goto err_create;
> > +
> > +     /* then create the root bus */
> > +     root_bus =3D pci_create_root_bus_in_domain(parent, domain, bu=
sno,
> > +                                             ops, host_data, &res)=
;
> > +     if (IS_ERR(root_bus)) {
> > +             err =3D PTR_ERR(root_bus);
> > +             goto err_create;
> > +     }
> > +
> > +     bridge =3D to_pci_host_bridge(root_bus->bridge);
> > +     bridge->io_base =3D io_base;
> > +
> > +     return bridge;
> > +
> > +err_create:
> > +     pci_free_resource_list(&res);
> > +     return ERR_PTR(err);
> > +}
> > +EXPORT_SYMBOL_GPL(of_create_pci_host_bridge);
> > +
> >  #ifdef CONFIG_PCI_MSI
> >
> >  static LIST_HEAD(of_pci_msi_chip_list);
> > diff --git a/drivers/pci/host-bridge.c b/drivers/pci/host-bridge.c
> > index 36c669e..cfee5d1 100644
> > --- a/drivers/pci/host-bridge.c
> > +++ b/drivers/pci/host-bridge.c
> > @@ -5,6 +5,9 @@
> >  #include <linux/kernel.h>
> >  #include <linux/pci.h>
> >  #include <linux/module.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_pci.h>
> > +#include <linux/slab.h>
> >
> >  #include "pci.h"
> >
> > @@ -83,3 +86,18 @@ void pcibios_bus_to_resource(struct pci_bus *bus=
, struct resource *res,
> >       res->end =3D region->end + offset;
> >  }
> >  EXPORT_SYMBOL(pcibios_bus_to_resource);
> > +
> > +/**
> > + * Simple version of the platform specific code for filtering the =
list
> > + * of resources obtained from the ranges declaration in DT.
> > + *
> > + * Platforms can override this function in order to impose stronge=
r
> > + * constraints onto the list of resources that a host bridge can u=
se.
> > + * The filtered list will then be used to create a root bus and as=
sociate
> > + * it with the host bridge.
> > + *
> > + */
> > +int __weak pcibios_fixup_bridge_ranges(struct list_head *resources=
)
> > +{
> > +     return 0;
> > +}
>=20
> I'd wait to add this until there's a platform that needs to implement=
 it.
> Splitting it out will make this patch that much smaller and easier to
> understand.

I need this as this is the default implementation (i.e. do nothing). Ot=
herwise the
link phase will give errors.=20

>=20
> > diff --git a/include/linux/of_pci.h b/include/linux/of_pci.h
> > index dde3a4a..71e36d0 100644
> > --- a/include/linux/of_pci.h
> > +++ b/include/linux/of_pci.h
> > @@ -15,6 +15,9 @@ struct device_node *of_pci_find_child_device(stru=
ct device_node *parent,
> >  int of_pci_get_devfn(struct device_node *np);
> >  int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u=
8 pin);
> >  int of_pci_parse_bus_range(struct device_node *node, struct resour=
ce *res);
> > +struct pci_host_bridge *of_create_pci_host_bridge(struct device *p=
arent,
> > +                                     struct pci_ops *ops, void *ho=
st_data);
> > +
> >  #else
> >  static inline int of_irq_parse_pci(const struct pci_dev *pdev, str=
uct of_phandle_args *out_irq)
> >  {
> > @@ -43,6 +46,13 @@ of_pci_parse_bus_range(struct device_node *node,=
 struct resource *res)
> >  {
> >       return -EINVAL;
> >  }
> > +
> > +static inline struct pci_host_bridge *
> > +of_create_pci_host_bridge(struct device *parent, struct pci_ops *o=
ps,
> > +                     void *host_data)
> > +{
> > +     return NULL;
> > +}
> >  #endif
> >
> >  #if defined(CONFIG_OF) && defined(CONFIG_PCI_MSI)
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index 7e7b939..556dc5f 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -402,6 +402,7 @@ struct pci_host_bridge {
> >       struct device dev;
> >       struct pci_bus *bus;            /* root bus */
> >       int domain_nr;
> > +     resource_size_t io_base;        /* physical address for the s=
tart of I/O area */
>=20
> I don't see where this is used yet.

It's used in pci_host_bridge_of_get_ranges() (earlier in this patch).

>=20
> As far as I know, there's nothing that prevents a host bridge from ha=
ving
> several I/O port apertures (or several memory-mapped I/O port spaces)=
=2E

The pci_register_io_range() will give different offsets for each appert=
ure.
I just need to make sure I don't overwrite io_base when parsing multipl=
e IO
ranges.

Thanks for reviewing this,
Liviu

>=20
> >       struct list_head windows;       /* pci_host_bridge_windows */
> >       void (*release_fn)(struct pci_host_bridge *);
> >       void *release_data;
> > @@ -1809,8 +1810,15 @@ static inline void pci_set_of_node(struct pc=
i_dev *dev) { }
> >  static inline void pci_release_of_node(struct pci_dev *dev) { }
> >  static inline void pci_set_bus_of_node(struct pci_bus *bus) { }
> >  static inline void pci_release_bus_of_node(struct pci_bus *bus) { =
}
> > +
> >  #endif  /* CONFIG_OF */
> >
> > +/* Used by architecture code to apply any quirks to the list of
> > + * pci_host_bridge resource ranges before they are being used
> > + * by of_create_pci_host_bridge()
> > + */
> > +extern int pcibios_fixup_bridge_ranges(struct list_head *resources=
);
> > +
> >  #ifdef CONFIG_EEH
> >  static inline struct eeh_dev *pci_dev_to_eeh_dev(struct pci_dev *p=
dev)
> >  {
> > --
> > 2.0.0
> >
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
