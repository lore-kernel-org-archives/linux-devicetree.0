From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] pci: Add support for creating a generic host_bridge from
 device tree
Date: Sat, 8 Feb 2014 14:22:08 +0000
Message-ID: <20140208142207.GR4993@e106497-lin.cambridge.arm.com>
References: <1391452428-22917-1-git-send-email-Liviu.Dudau@arm.com>
 <1391452428-22917-2-git-send-email-Liviu.Dudau@arm.com>
 <7398333.9L5KlyFggU@wuerfel>
 <CACoXjckKRQfR3CbC1JpgbhOumED+OqiMh1_Y73-h6q=ByMNanw@mail.gmail.com>
 <20140206101814.GA4993@e106497-lin.cambridge.arm.com>
 <CACoXjcnTHgtBDesqFUOca1nf34HvNGAV0vP9AEB5xV1mvcRGfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CACoXjcnTHgtBDesqFUOca1nf34HvNGAV0vP9AEB5xV1mvcRGfw@mail.gmail.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Tanmay Inamdar <tinamdar@apm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, linux-pci <linux-pci@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Feb 08, 2014 at 12:21:56AM +0000, Tanmay Inamdar wrote:
> On Thu, Feb 6, 2014 at 2:18 AM, Liviu Dudau <Liviu.Dudau@arm.com> wro=
te:
> > On Wed, Feb 05, 2014 at 10:26:27PM +0000, Tanmay Inamdar wrote:
> >> Hello Liviu,
> >>
> >> I did not get the first email of this particular patch on any of
> >> subscribed mailing lists (don't know why), hence replying here.
> >
> > Strange, it shows in the MARC and GMANE archive for linux-pci, prob=
ably
> > a hickup on your receiving side?
> >
> >>
> >> +struct pci_host_bridge *
> >> +pci_host_bridge_of_init(struct device *parent, int busno, struct =
pci_ops *ops,
> >> + void *host_data, struct list_head *resources)
> >> +{
> >> + struct pci_bus *root_bus;
> >> + struct pci_host_bridge *bridge;
> >> +
> >> + /* first parse the host bridge bus ranges */
> >> + if (pci_host_bridge_of_get_ranges(parent->of_node, resources))
> >> + return NULL;
> >> +
> >> + /* then create the root bus */
> >> + root_bus =3D pci_create_root_bus(parent, busno, ops, host_data, =
resources);
> >> + if (!root_bus)
> >> + return NULL;
> >> +
> >> + bridge =3D to_pci_host_bridge(root_bus->bridge);
> >> +
> >> + return bridge;
> >> +}
> >>
> >> You are keeping the domain_nr inside pci_host_bridge structure. In
> >> above API, domain_nr is required in 'pci_find_bus' function called
> >> from 'pci_create_root_bus'. Since the bridge is allocated after
> >> creating root bus, 'pci_find_bus' always gets domain_nr as 0. This
> >> will cause problem for scanning multiple domains.
> >
> > Good catch. I was switching between creating a pci_controller in ar=
ch/arm64 and
> > adding the needed bits in pci_host_bridge. After internal review I'=
ve decided to
> > add the domain_nr to pci_host_bridge, but forgot to update the code=
 everywhere.
> >
> > Thanks for reviewing this, will fix in v2.
> >
> > Do you find porting to the new API straight forward?
>=20
> It is quite straight forward for MEM regions but for IO regions it is
> not. You always assume IO resource starting at 0x0. IMO, this will
> cause problem for systems with multiple ports / IO windows. You can
> take a look at 'drivers/pci/host/pcie-designware.c'.
>=20
> Also the manipulations of addresses for IO_RESOURCES can be dangerous=
=2E
> It can make some value negative. For example if my PCI IO range start=
s
> in 32 bit address range say 0x8000_0000 with CPU address
> 0xb0_8000_0000, window->offset after manipulation will become
> negative.
>=20
> Personally I would like to do get all the PCI and CPU addresses from
> my device tree as is and do the 'pci_add_resource_offset'. This will
> help me setup my regions correctly without any further arithmetic.
> Please let me know what you think.

Yes, that parsing code of ranges is incorrect in light of the current d=
iscussion. I
will try to propose a fix in the v2 series.

Regarding your PCI IO range: if your bus address starts at 0x8000_0000,=
 would
that not cause problems with devices that use less than 32bits for addr=
ess
decoding? It is a rather unusual setup, I believe the x86 world (even P=
CI spec?)
mandates IO bus ranges in the first 16MB of address range?

Best regards,
Liviu

>=20
> >
> > Best regards,
> > Liviu
> >
> >>
> >>
> >> On Mon, Feb 3, 2014 at 10:46 AM, Arnd Bergmann <arnd@arndb.de> wro=
te:
> >> > On Monday 03 February 2014 18:33:48 Liviu Dudau wrote:
> >> >> +/**
> >> >> + * pci_host_bridge_of_get_ranges - Parse PCI host bridge resou=
rces from DT
> >> >> + * @dev: device node of the host bridge having the range prope=
rty
> >> >> + * @resources: list where the range of resources will be added=
 after DT parsing
> >> >> + *
> >> >> + * This function will parse the "ranges" property of a PCI hos=
t bridge device
> >> >> + * node and setup the resource mapping based on its content. I=
t is expected
> >> >> + * that the property conforms with the Power ePAPR document.
> >> >> + *
> >> >> + * Each architecture will then apply their filtering based on =
the limitations
> >> >> + * of each platform. One general restriction seems to be the n=
umber of IO space
> >> >> + * ranges, the PCI framework makes intensive use of struct res=
ource management,
> >> >> + * and for IORESOURCE_IO types they can only be requested if t=
hey are contained
> >> >> + * within the global ioport_resource, so that should be limite=
d to one IO space
> >> >> + * range.
> >> >
> >> > Actually we have quite a different set of restrictions around I/=
O space on ARM32
> >> > at the moment: Each host bridge can have its own 64KB range in a=
n arbitrary
> >> > location on MMIO space, and the total must not exceed 2MB of I/O=
 space.
> >> >
> >> >> + */
> >> >> +static int pci_host_bridge_of_get_ranges(struct device_node *d=
ev,
> >> >> +                                     struct list_head *resourc=
es)
> >> >> +{
> >> >> +     struct resource *res;
> >> >> +     struct of_pci_range range;
> >> >> +     struct of_pci_range_parser parser;
> >> >> +     int err;
> >> >> +
> >> >> +     pr_info("PCI host bridge %s ranges:\n", dev->full_name);
> >> >> +
> >> >> +     /* Check for ranges property */
> >> >> +     err =3D of_pci_range_parser_init(&parser, dev);
> >> >> +     if (err)
> >> >> +             return err;
> >> >> +
> >> >> +     pr_debug("Parsing ranges property...\n");
> >> >> +     for_each_of_pci_range(&parser, &range) {
> >> >> +             /* Read next ranges element */
> >> >> +             pr_debug("pci_space: 0x%08x pci_addr:0x%016llx ",
> >> >> +                             range.pci_space, range.pci_addr);
> >> >> +             pr_debug("cpu_addr:0x%016llx size:0x%016llx\n",
> >> >> +                                     range.cpu_addr, range.siz=
e);
> >> >> +
> >> >> +             /* If we failed translation or got a zero-sized r=
egion
> >> >> +              * (some FW try to feed us with non sensical zero=
 sized regions
> >> >> +              * such as power3 which look like some kind of at=
tempt
> >> >> +              * at exposing the VGA memory hole) then skip thi=
s range
> >> >> +              */
> >> >> +             if (range.cpu_addr =3D=3D OF_BAD_ADDR || range.si=
ze =3D=3D 0)
> >> >> +                     continue;
> >> >> +
> >> >> +             res =3D kzalloc(sizeof(struct resource), GFP_KERN=
EL);
> >> >> +             if (!res) {
> >> >> +                     err =3D -ENOMEM;
> >> >> +                     goto bridge_ranges_nomem;
> >> >> +             }
> >> >> +
> >> >> +             of_pci_range_to_resource(&range, dev, res);
> >> >> +
> >> >> +             pci_add_resource_offset(resources, res,
> >> >> +                             range.cpu_addr - range.pci_addr);
> >> >> +     }
> >> >
> >> > I believe of_pci_range_to_resource() will return the MMIO apertu=
re for the
> >> > I/O space window here, which is not what you are supposed to pas=
s into
> >> > pci_add_resource_offset.
> >> >
> >> >> +EXPORT_SYMBOL(pci_host_bridge_of_init);
> >> >
> >> > EXPORT_SYMBOL_GPL
> >> >
> >> >> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> >> >> index 6e34498..16febae 100644
> >> >> --- a/drivers/pci/probe.c
> >> >> +++ b/drivers/pci/probe.c
> >> >> @@ -1787,6 +1787,17 @@ struct pci_bus *pci_create_root_bus(stru=
ct device *parent, int bus,
> >> >>       list_for_each_entry_safe(window, n, resources, list) {
> >> >>               list_move_tail(&window->list, &bridge->windows);
> >> >>               res =3D window->res;
> >> >> +             /*
> >> >> +              * IO resources are stored in the kernel with a C=
PU start
> >> >> +              * address of zero. Adjust the data accordingly a=
nd remember
> >> >> +              * the offset
> >> >> +              */
> >> >> +             if (resource_type(res) =3D=3D IORESOURCE_IO) {
> >> >> +                     bridge->io_offset =3D res->start;
> >> >> +                     res->end -=3D res->start;
> >> >> +                     window->offset -=3D res->start;
> >> >> +                     res->start =3D 0;
> >> >> +             }
> >> >>               offset =3D window->offset;
> >> >>               if (res->flags & IORESOURCE_BUS)
> >> >
> >> > Won't this break all existing host bridges?
> >> >
> >> >         Arnd
> >> >
> >> > _______________________________________________
> >> > linux-arm-kernel mailing list
> >> > linux-arm-kernel@lists.infradead.org
> >> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >>
> >
> > --
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > | I would like to |
> > | fix the world,  |
> > | but they're not |
> > | giving me the   |
> >  \ source code!  /
> >   ---------------
> >     =C2=AF\_(=E3=83=84)_/=C2=AF
> >
> > -- IMPORTANT NOTICE: The contents of this email and any attachments=
 are confidential and may also be privileged. If you are not the intend=
ed recipient, please notify the sender immediately and do not disclose =
the contents to any other person, use it for any purpose, or store or c=
opy the information in any medium.  Thank you.
> >
> > ARM Limited, Registered office 110 Fulbourn Road, Cambridge CB1 9NJ=
, Registered in England & Wales, Company No:  2557590
> > ARM Holdings plc, Registered office 110 Fulbourn Road, Cambridge CB=
1 9NJ, Registered in England & Wales, Company No:  2548782
> >
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" =
in
> the body of a message to majordomo@vger.kernel.org
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
