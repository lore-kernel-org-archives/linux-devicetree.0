From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v7 4/6] pci: Introduce a domain number for
 pci_host_bridge.
Date: Thu, 10 Apr 2014 15:53:04 +0100
Message-ID: <20140410145304.GS985@e106497-lin.cambridge.arm.com>
References: <1394811272-1547-5-git-send-email-Liviu.Dudau@arm.com>
 <4506772.YFSM2m1eaP@wuerfel>
 <CAErSpo6u7kr+QdnhAXBo20izg-DNHR4zHT+kRvq34whp68RJCQ@mail.gmail.com>
 <6144916.rD76jOL8sv@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6144916.rD76jOL8sv@wuerfel>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 10, 2014 at 03:07:44PM +0100, Arnd Bergmann wrote:
> On Thursday 10 April 2014 07:50:52 Bjorn Helgaas wrote:
> > On Thu, Apr 10, 2014 at 2:00 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrot=
e:
> > > On Wednesday 09 April 2014 21:48:14 Bjorn Helgaas wrote:
> > >> On Wed, Apr 9, 2014 at 7:27 PM, Liviu Dudau <liviu-I3yL/QOVVjH10XsdtD+oqA@public.gmane.org> =
wrote:
> > >> > On Wed, Apr 09, 2014 at 08:02:41AM -0600, Bjorn Helgaas wrote:
> > >> >> >>   struct pci_host_bridge {
> > >> >> >>     int domain;
> > >> >> >>     int node;
> > >> >> >>     struct device *dev;
> > >> >> >>     struct pci_ops *ops;
> > >> >> >>     struct list_head resources;
> > >> >> >>     void *sysdata;
> > >> >> >>     struct pci_bus *bus;  /* filled in by core, not by arc=
h */
> > >> >> >>     ... /* other existing contents managed by core */
> > >> >> >>   };
> > >> >> >>
> > >> >> >>   struct pci_bus *pci_scan_host_bridge(struct pci_host_bri=
dge *bridge);
> > >> >> >
> >=20
> > I'm not sure I'm following you; you mean the arch-specific sysdata
> > structure would contain a pointer to struct pci_host_bridge?
> >=20
> > I have to admit that I'm not up on how other subsystems handle this
> > sort of abstraction.  Do you have any pointers to good examples tha=
t I
> > can study?
>=20
> What I mean is like this:
>=20
> /* generic structure */
> struct pci_host_bridge {
>         int domain;
>         int node;
>         struct device *dev;
>         struct pci_ops *ops;=20
>         struct list_head resources;
>         struct pci_bus *bus;  /* filled in by core, not by arch */
>         ... /* other existing contents managed by core */
> };
>=20
> /* arm specific structure */
> struct pci_sys_data {
>         char            io_res_name[12];
>                                         /* Bridge swizzling          =
           */
>         u8              (*swizzle)(struct pci_dev *, u8 *);
>                                         /* IRQ mapping               =
           */
>         int             (*map_irq)(const struct pci_dev *, u8, u8);
>                                         /* Resource alignement requir=
ements     */
>         void            (*add_bus)(struct pci_bus *bus);
>         void            (*remove_bus)(struct pci_bus *bus);
>         void            *private_data;  /* platform controller privat=
e data     */
>=20
> 	/* not a pointer: */
> 	struct pci_host_bridge bridge;
> };
> static inline struct pci_sys_data *to_pci_sys_data(struct pci_host_br=
idge *bridge)
> {
> 	return container_of(bridge, struct pci_sys_data, bridge);
> }
>=20
> /* arm specific, driver specific structure */
> struct tegra_pcie {
>         void __iomem *pads;
>         void __iomem *afi;
>=20
>         struct clk *pex_clk;
>         struct clk *afi_clk;
>         struct clk *pll_e;
>         struct clk *cml_clk;
>=20
>         struct tegra_msi msi;
>=20
>         struct list_head ports;
>         unsigned int num_ports;
>=20
> 	struct pci_sys_data sysdata;
> };
> static inline struct tegra_pcie *to_tegra_pcie(struct pci_sys_data *s=
ysdata)
> {
> 	return container_of(sysdata, struct tegra_pcie, sysdata);
> }
>=20
> This mirrors how we treat devices: a pci_device has an embedded devic=
e,
> and so on, in other subsystems we can have multiple layers.
>=20
> In this example, the tegra pcie driver then allocates its own tegra_p=
cie
> structure, fills out the fields it needs, and registers it with the
> ARM architecture code, passing just the pci_sys_data pointer. That fu=
nction
> in turn passes a pointer to the embedded pci_host_bridge down to the
> generic code. Ideally we should try to eliminate the architecture spe=
cific
> portion here, but that is a later step.

So Arnd seems to agree with me: we should try to get out of architectur=
e specific
pci_sys_data and link the host bridge driver straight into the PCI core=
=2E The
core then can call into arch code via pcibios_*() functions.

Arnd, am I reading correctly into what you are saying?

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
