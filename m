From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v8 8/9] pci: Add support for creating a generic
 host_bridge from device tree
Date: Tue, 8 Jul 2014 23:27:38 +0100
Message-ID: <20140708222738.GA4980@e106497-lin.cambridge.arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <1404240214-9804-9-git-send-email-Liviu.Dudau@arm.com>
 <20140708010103.GD22939@google.com>
 <20140708102940.GZ6501@e106497-lin.cambridge.arm.com>
 <20140708213305.GB4555@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140708213305.GB4555@google.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci <linux-pci@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, linaro-kernel <linaro-kernel@lists.linaro.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>, Sinan Kaya <okaya@codeaurora.org>, Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Suravee Suthikulanit <suravee.suthikulpanit@amd.com>, LKML <linux-kernel@vger.kernel.org>, Device Tree ML <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 08, 2014 at 10:33:05PM +0100, Bjorn Helgaas wrote:
> On Tue, Jul 08, 2014 at 11:29:40AM +0100, Liviu Dudau wrote:
> > On Tue, Jul 08, 2014 at 02:01:04AM +0100, Bjorn Helgaas wrote:
> > > On Tue, Jul 01, 2014 at 07:43:33PM +0100, Liviu Dudau wrote:
> > > > ...
> > > > +     for_each_of_pci_range(&parser, &range) {
> > > > +             /* Read next ranges element */
> > > > +             pr_debug("pci_space: 0x%08x pci_addr:0x%016llx cp=
u_addr:0x%016llx size:0x%016llx\n",
> > > > +                     range.pci_space, range.pci_addr, range.cp=
u_addr, range.size);
> > >=20
> > > If you're not trying to match other printk formats, you could try=
 to match
> > > the %pR format used elsewhere, e.g., "%#010llx-%#010llx" with
> > > range.cpu_addr, range.cpu_addr + range.size - 1.
> >=20
> > Yes, not a big fan of the ugly output it generates, but the output =
matches closely the ranges
> > definition in the device tree file so it is easy to validate that y=
ou are parsing the right
> > entry. I am happy to change it to shorten the cpu range message.
>=20
> If it already matches other device tree stuff, that's perfect.  I'm n=
ot
> familiar with that.
>=20
> > > > +int __weak pcibios_fixup_bridge_ranges(struct list_head *resou=
rces)
> > > > +{
> > > > +     return 0;
> > > > +}
> > >=20
> > > I'd wait to add this until there's a platform that needs to imple=
ment it.
> > > Splitting it out will make this patch that much smaller and easie=
r to
> > > understand.
> >=20
> > I need this as this is the default implementation (i.e. do nothing)=
=2E Otherwise the
> > link phase will give errors.=20
>=20
> I meant that you could remove the default implementation *and* the ca=
ll of
> it, since it currently does nothing.

True. But it looks like converting Will's pci-host-generic.c driver wil=
l make use of this.

>=20
> > > > diff --git a/include/linux/of_pci.h b/include/linux/of_pci.h
> > > > index dde3a4a..71e36d0 100644
> > > > --- a/include/linux/of_pci.h
> > > > +++ b/include/linux/of_pci.h
> > > > @@ -15,6 +15,9 @@ struct device_node *of_pci_find_child_device(=
struct device_node *parent,
> > > >  int of_pci_get_devfn(struct device_node *np);
> > > >  int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slo=
t, u8 pin);
> > > >  int of_pci_parse_bus_range(struct device_node *node, struct re=
source *res);
> > > > +struct pci_host_bridge *of_create_pci_host_bridge(struct devic=
e *parent,
> > > > +                                     struct pci_ops *ops, void=
 *host_data);
> > > > +
> > > >  #else
> > > >  static inline int of_irq_parse_pci(const struct pci_dev *pdev,=
 struct of_phandle_args *out_irq)
> > > >  {
> > > > @@ -43,6 +46,13 @@ of_pci_parse_bus_range(struct device_node *n=
ode, struct resource *res)
> > > >  {
> > > >       return -EINVAL;
> > > >  }
> > > > +
> > > > +static inline struct pci_host_bridge *
> > > > +of_create_pci_host_bridge(struct device *parent, struct pci_op=
s *ops,
> > > > +                     void *host_data)
> > > > +{
> > > > +     return NULL;
> > > > +}
> > > >  #endif
> > > >
> > > >  #if defined(CONFIG_OF) && defined(CONFIG_PCI_MSI)
> > > > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > > > index 7e7b939..556dc5f 100644
> > > > --- a/include/linux/pci.h
> > > > +++ b/include/linux/pci.h
> > > > @@ -402,6 +402,7 @@ struct pci_host_bridge {
> > > >       struct device dev;
> > > >       struct pci_bus *bus;            /* root bus */
> > > >       int domain_nr;
> > > > +     resource_size_t io_base;        /* physical address for t=
he start of I/O area */
> > >=20
> > > I don't see where this is used yet.
> >=20
> > It's used in pci_host_bridge_of_get_ranges() (earlier in this patch=
).
>=20
> of_create_pci_host_bridge() fills in bridge->io_base, but I don't see
> anything that ever *reads* bridge->io_base.

Ah, understood. It is used by the host bridge drivers to set their ATR =
registers to the
correct CPU address values.

>=20
> > > As far as I know, there's nothing that prevents a host bridge fro=
m having
> > > several I/O port apertures (or several memory-mapped I/O port spa=
ces).
> >=20
> > The pci_register_io_range() will give different offsets for each ap=
perture.
> > I just need to make sure I don't overwrite io_base when parsing mul=
tiple IO
> > ranges.
>=20
> Let's continue this in the other thread where I'm trying to understan=
d the
> I/O apertures.  Obviously I'm still missing something if you can inde=
ed
> have multiple I/O apertures per bridge (because then only one of them=
 can
> start at I/O address 0 on PCI).

Sure.

Thanks,
Liviu

>=20
> Bjorn
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
