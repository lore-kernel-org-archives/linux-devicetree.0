From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [RFC 2/4] PCI: generic: Add support for ARM64 and MSI(x)
Date: Tue, 30 Sep 2014 18:48:21 +0100
Message-ID: <20140930174821.GX841@e106497-lin.cambridge.arm.com>
References: <1411937610-22125-1-git-send-email-suravee.suthikulpanit@amd.com>
 <8631927.qWHZsjCs8e@wuerfel>
 <20140930120344.GA14215@e102568-lin.cambridge.arm.com>
 <3090148.OUdB0fsdsR@wuerfel>
 <20140930161241.GA16583@e102568-lin.cambridge.arm.com>
 <20140930164256.GS841@e106497-lin.cambridge.arm.com>
 <20140930173540.GB16583@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20140930173540.GB16583@e102568-lin.cambridge.arm.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Marc Zyngier <Marc.Zyngier@arm.com>, Will Deacon <Will.Deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>, Catalin Marinas <Catalin.Marinas@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "tglx@linutronix.de" <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 30, 2014 at 06:35:40PM +0100, Lorenzo Pieralisi wrote:
> On Tue, Sep 30, 2014 at 05:42:56PM +0100, Liviu Dudau wrote:
> > On Tue, Sep 30, 2014 at 05:12:41PM +0100, Lorenzo Pieralisi wrote:
> > > On Tue, Sep 30, 2014 at 01:31:44PM +0100, Arnd Bergmann wrote:
> > > > On Tuesday 30 September 2014 13:03:44 Lorenzo Pieralisi wrote:
> > > > > > >  static int gen_pci_probe(struct platform_device *pdev)
> > > > > > >  {
> > > > > > > @@ -326,6 +385,7 @@ static int gen_pci_probe(struct platf=
orm_device *pdev)
> > > > > > >         struct device *dev =3D &pdev->dev;
> > > > > > >         struct device_node *np =3D dev->of_node;
> > > > > > >         struct gen_pci *pci =3D devm_kzalloc(dev, sizeof(=
*pci), GFP_KERNEL);
> > > > > > > +#ifndef CONFIG_ARM64
> > > > > > >         struct hw_pci hw =3D {
> > > > > > >                 .nr_controllers =3D 1,
> > > > > > >                 .private_data   =3D (void **)&pci,
> > > > > > > @@ -333,6 +393,7 @@ static int gen_pci_probe(struct platf=
orm_device *pdev)
> > > > > > >                 .map_irq        =3D of_irq_parse_and_map_=
pci,
> > > > > > >                 .ops            =3D &gen_pci_ops,
> > > > > > >         };
> > > > > > > +#endif
> > > > > > > =20
> > > > > >=20
> > > > > > Same here, I'd suggest marking this "#ifdef CONFIG_ARM" ins=
tead, as hw_pci
> > > > > > is an arm32 specific data structure.
> > > > >=20
> > > > > I do not think we need hw struct at all, see below, we can wr=
ite code so
> > > > > that we do not rely on ARM32 PCI bios, I will have a stab at =
that and
> > > > > post the resulting code.
> > > >=20
> > > > That would of course be best. I think it needs some rework of t=
he
> > > > arm32 PCI code though, or you'd still have to create pci_sys_da=
ta
> > > > manually, and that is currently allocated by pcibios_init_hw.
> >=20
> > I don't see why we need to involve the arm32 code here at all. A ho=
st bridge can
> > be fully functional with the generic code without having to use any=
 of the
> > arm32 code (unless I'm missing something here).
>=20
> Ok so I can remove the pci_common_init() call, use the common PCI API=
 and
> everything will work as expected, even if there is a list of function=
s (see
> below) that *require* pci_sys_data to exist (and that's allocated in =
arm32
> pcibios code in pcibios_init_hw(), called from pci_common_init()) ?

See bellow my comments on those functions.

>=20
> I like the idea but I think that's optimistic, or at least we did not
> trigger the code paths that can cause issues.
>=20
> > > Right, as far as I can see, creating a pci_sys_data struct
> > > that's all we would need. "Problem" is that it does not exist on =
ARM64
> > > so to avoid ifdeffery we have to declare a struct with the same
> > > fields (ie only pci_sys_data.private_data is used by this driver =
-
> > > apart from arm32 specific functions usage) that is passed to the =
PCI layer
> > > and stored in the bus.sysdata, but that's extremely ugly (and we =
won't
> > > need this when the arm32 conversion is completed).
> > >=20
> > > > > > > +       if (!gen_scan_root_bus(&pdev->dev, pci->cfg.bus_r=
ange.start,
> > > > > > > +                              &gen_pci_ops, pci, &pci->r=
esources)) {
> > > > > > > +               dev_err(&pdev->dev, "failed to enable PCI=
e ports\n");
> > > > > > > +               return -ENODEV;
> > > > > > > +       }
> > > > > > > +#else
> > > > > > >         pci_common_init_dev(dev, &hw);
> > > > > > > +#endif /* CONFIG_ARM64 */
> > > > > > >=20
> > > > > >=20
> > > > > > Again, just make the pci_common_init_dev() call #ifdef CONF=
IG_ARM, and move
> > > > > > the generic case after it, outside of the #ifdef.
> > > > >=20
> > > > > I went through the code quickly but I think we can (and shoul=
d) remove
> > > > > this quite ugly ifdeffery altogether. Most of the functionali=
ty in
> > > > > pci_common_init_dev() can be implemented through the common P=
CI API (and this
> > > > > would make this driver arch agnostic as it should be), I will=
 go through ARM32
> > > > > PCI bios code to check what is executed in detail in pci_comm=
on_init_dev() and
> > > > > make sure that we follow those initialization steps in the re=
sulting probe code
> > > > > for this PCI generic host controller driver.
> > > >=20
> > > > These are the functions I found that refer to pci_sys_data on a=
rm32:
> > > >=20
> > > > pcibios_add_bus
> > > > pcibios_remove_bus

These are only needed if you want to do per HB processing of the bus

> > > > pcibios_align_resource

mvebu is the only user of this function.

> > > > pci_mmap_page_range

This is only needed when mapping a PCI resource to userspace. Is that y=
our case here?

> > > > pci_domain_nr
> > > > pci_proc_domain

We have equivalent functionality in the generic patches for those.

Best regards,
Liviu

> > > >=20
> > > > This is not as bad as I had feared, but we still have to ensure=
 that
> > > > any caller of these functions will work with both the generic P=
CI support
> > > > and the arm32 specific drivers that today use hw_pci.
> > > >=20
> > > > My idea for dealing with this was to convert all host drivers i=
n
> > > > drivers/pci/host to the generic PCI code and never build the ar=
m32
> > > > bios32 code when CONFIG_ARCH_MULTIPLATFORM is set. Unfortunatel=
y that
> > > > requires either doing them all at once or coming up with a migr=
ation
> > > > strategy so we don't break things in the process.
> > >=20
> > > That makes sense. Related to the migration strategy, thoughts
> > > appreciated. Declaring a static pci_sys_data (with some ifdef aro=
und it)
> > > seems a horrible hack to me. Calling pci_common_init() only if CO=
NFIG_ARM
> > > is rather horrible too, but we can probably live with that.
> > >=20
> > > I do not see anything else as possible solution at the moment unl=
ess
> > > we go the whole nine yards and do what you suggest above, might t=
ake a
> > > little while though.
> > >=20
> > > Probably leaving pci_common_init() call (and related hw_pci struc=
t, and
> > > related ifdeffery to differentiate between different sysdata layo=
uts for ARM
> > > and ARM64) is the fastest path but I still think it is not nice a=
t all.
> >=20
> > Rob Herring found the conversion of mach-integrator/pci_v3.c to the=
 generic
> > framework quite painless. We might have to go through a lot of test=
ing, but I don't
> > see the process to be too horrendous.
>=20
> See my comments above, I have not said that the conversion is complic=
ated,
> what I am saying is that I am not sure we can get rid of pcibios code=
 calls
> yet, as Arnd pointed out.
>=20
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
