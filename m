From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [RFC 2/4] PCI: generic: Add support for ARM64 and MSI(x)
Date: Tue, 30 Sep 2014 17:42:56 +0100
Message-ID: <20140930164256.GS841@e106497-lin.cambridge.arm.com>
References: <1411937610-22125-1-git-send-email-suravee.suthikulpanit@amd.com>
 <8631927.qWHZsjCs8e@wuerfel>
 <20140930120344.GA14215@e102568-lin.cambridge.arm.com>
 <3090148.OUdB0fsdsR@wuerfel>
 <20140930161241.GA16583@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140930161241.GA16583@e102568-lin.cambridge.arm.com>
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
To: Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Marc Zyngier <Marc.Zyngier@arm.com>, Will Deacon <Will.Deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>, Catalin Marinas <Catalin.Marinas@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "tglx@linutronix.de" <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 30, 2014 at 05:12:41PM +0100, Lorenzo Pieralisi wrote:
> On Tue, Sep 30, 2014 at 01:31:44PM +0100, Arnd Bergmann wrote:
> > On Tuesday 30 September 2014 13:03:44 Lorenzo Pieralisi wrote:
> > > > >  static int gen_pci_probe(struct platform_device *pdev)
> > > > >  {
> > > > > @@ -326,6 +385,7 @@ static int gen_pci_probe(struct platform_=
device *pdev)
> > > > >         struct device *dev =3D &pdev->dev;
> > > > >         struct device_node *np =3D dev->of_node;
> > > > >         struct gen_pci *pci =3D devm_kzalloc(dev, sizeof(*pci=
), GFP_KERNEL);
> > > > > +#ifndef CONFIG_ARM64
> > > > >         struct hw_pci hw =3D {
> > > > >                 .nr_controllers =3D 1,
> > > > >                 .private_data   =3D (void **)&pci,
> > > > > @@ -333,6 +393,7 @@ static int gen_pci_probe(struct platform_=
device *pdev)
> > > > >                 .map_irq        =3D of_irq_parse_and_map_pci,
> > > > >                 .ops            =3D &gen_pci_ops,
> > > > >         };
> > > > > +#endif
> > > > > =20
> > > >=20
> > > > Same here, I'd suggest marking this "#ifdef CONFIG_ARM" instead=
, as hw_pci
> > > > is an arm32 specific data structure.
> > >=20
> > > I do not think we need hw struct at all, see below, we can write =
code so
> > > that we do not rely on ARM32 PCI bios, I will have a stab at that=
 and
> > > post the resulting code.
> >=20
> > That would of course be best. I think it needs some rework of the
> > arm32 PCI code though, or you'd still have to create pci_sys_data
> > manually, and that is currently allocated by pcibios_init_hw.

I don't see why we need to involve the arm32 code here at all. A host b=
ridge can
be fully functional with the generic code without having to use any of =
the
arm32 code (unless I'm missing something here).

>=20
> Right, as far as I can see, creating a pci_sys_data struct
> that's all we would need. "Problem" is that it does not exist on ARM6=
4
> so to avoid ifdeffery we have to declare a struct with the same
> fields (ie only pci_sys_data.private_data is used by this driver -
> apart from arm32 specific functions usage) that is passed to the PCI =
layer
> and stored in the bus.sysdata, but that's extremely ugly (and we won'=
t
> need this when the arm32 conversion is completed).
>=20
> > > > > +       if (!gen_scan_root_bus(&pdev->dev, pci->cfg.bus_range=
=2Estart,
> > > > > +                              &gen_pci_ops, pci, &pci->resou=
rces)) {
> > > > > +               dev_err(&pdev->dev, "failed to enable PCIe po=
rts\n");
> > > > > +               return -ENODEV;
> > > > > +       }
> > > > > +#else
> > > > >         pci_common_init_dev(dev, &hw);
> > > > > +#endif /* CONFIG_ARM64 */
> > > > >=20
> > > >=20
> > > > Again, just make the pci_common_init_dev() call #ifdef CONFIG_A=
RM, and move
> > > > the generic case after it, outside of the #ifdef.
> > >=20
> > > I went through the code quickly but I think we can (and should) r=
emove
> > > this quite ugly ifdeffery altogether. Most of the functionality i=
n
> > > pci_common_init_dev() can be implemented through the common PCI A=
PI (and this
> > > would make this driver arch agnostic as it should be), I will go =
through ARM32
> > > PCI bios code to check what is executed in detail in pci_common_i=
nit_dev() and
> > > make sure that we follow those initialization steps in the result=
ing probe code
> > > for this PCI generic host controller driver.
> >=20
> > These are the functions I found that refer to pci_sys_data on arm32=
:
> >=20
> > pcibios_add_bus
> > pcibios_remove_bus
> > pcibios_align_resource
> > pci_mmap_page_range
> > pci_domain_nr
> > pci_proc_domain
> >=20
> > This is not as bad as I had feared, but we still have to ensure tha=
t
> > any caller of these functions will work with both the generic PCI s=
upport
> > and the arm32 specific drivers that today use hw_pci.
> >=20
> > My idea for dealing with this was to convert all host drivers in
> > drivers/pci/host to the generic PCI code and never build the arm32
> > bios32 code when CONFIG_ARCH_MULTIPLATFORM is set. Unfortunately th=
at
> > requires either doing them all at once or coming up with a migratio=
n
> > strategy so we don't break things in the process.
>=20
> That makes sense. Related to the migration strategy, thoughts
> appreciated. Declaring a static pci_sys_data (with some ifdef around =
it)
> seems a horrible hack to me. Calling pci_common_init() only if CONFIG=
_ARM
> is rather horrible too, but we can probably live with that.
>=20
> I do not see anything else as possible solution at the moment unless
> we go the whole nine yards and do what you suggest above, might take =
a
> little while though.
>=20
> Probably leaving pci_common_init() call (and related hw_pci struct, a=
nd
> related ifdeffery to differentiate between different sysdata layouts =
for ARM
> and ARM64) is the fastest path but I still think it is not nice at al=
l.

Rob Herring found the conversion of mach-integrator/pci_v3.c to the gen=
eric
framework quite painless. We might have to go through a lot of testing,=
 but I don't
see the process to be too horrendous.

That being said, I think we first need to make sure we have all the fea=
tures
needed by the host bridge drivers in place before we start the conversi=
on. MSI
support is amongst them.

Best regards,
Liviu

>=20
> Thanks,
> Lorenzo

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF

