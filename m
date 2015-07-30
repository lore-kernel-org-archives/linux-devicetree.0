From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v6] PCI: Store PCIe bus address in struct of_pci_range
Date: Thu, 30 Jul 2015 12:20:38 +0100
Message-ID: <20150730112038.GE20890@e106497-lin.cambridge.arm.com>
References: <1438010223-124422-1-git-send-email-gabriele.paoloni@huawei.com>
 <20150729172053.GE31170@google.com>
 <EE11001F9E5DDD47B7634E2F8A612F2E01D6F350@lhreml503-mbs>
 <20150729214710.GE9640@google.com>
 <EE11001F9E5DDD47B7634E2F8A612F2E01D6F6F8@lhreml503-mbs>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <EE11001F9E5DDD47B7634E2F8A612F2E01D6F6F8@lhreml503-mbs>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Gabriele Paoloni <gabriele.paoloni@huawei.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, "arnd@arndb.de" <arnd@arndb.de>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, James Morse <James.Morse@arm.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Yuanzhichang <yuanzhichang@hisilicon.com>, Zhudacai <zhudacai@hisilicon.com>, zhangjukuo <zhangjukuo@huawei.com>, qiuzhenfa <qiuzhenfa@hisilicon.com>, "liguozhu@hisilicon.com" <liguozhu@hisilicon.com>, Andrew Murray <amurray@embedded-bits.co.uk>
List-Id: devicetree@vger.kernel.org

Hello,

On Thu, Jul 30, 2015 at 09:30:41AM +0100, Gabriele Paoloni wrote:
> > -----Original Message-----
> > From: Bjorn Helgaas [mailto:bhelgaas@google.com]
> > Sent: Wednesday, July 29, 2015 10:47 PM
> > To: Gabriele Paoloni
> > Cc: arnd@arndb.de; lorenzo.pieralisi@arm.com; Wangzhou (B);
> > robh+dt@kernel.org; james.morse@arm.com; Liviu.Dudau@arm.com; linux=
-
> > pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > devicetree@vger.kernel.org; Yuanzhichang; Zhudacai; zhangjukuo;
> > qiuzhenfa; Liguozhu (Kenneth); Andrew Murray
> > Subject: Re: [PATCH v6] PCI: Store PCIe bus address in struct
> > of_pci_range
> >=20
> > [+cc Andrew]
> >=20
> > On Wed, Jul 29, 2015 at 07:44:18PM +0000, Gabriele Paoloni wrote:
> > > > -----Original Message-----
> > > > From: Bjorn Helgaas [mailto:bhelgaas@google.com]
> > > > Sent: Wednesday, July 29, 2015 6:21 PM
> > > > To: Gabriele Paoloni
> >=20
> > > > On Mon, Jul 27, 2015 at 11:17:03PM +0800, Gabriele Paoloni wrot=
e:
> > > > > From: gabriele paoloni <gabriele.paoloni@huawei.com>
> >=20
> > > > >     This patch adds a new field in "struct of_pci_range" to s=
tore
> > the
> > > > >     pci bus start address; it fills the field in
> > > > of_pci_range_parser_one();
> > > > >     in of_pci_get_host_bridge_resources() it retrieves the
> > resource
> > > > entry
> > > > >     after it is created and added to the resource list and us=
es
> > > > >     entry->__res.start to store the pci controller address
> > > >
> > > > struct of_pci_range is starting to get confusing to non-OF folk=
s
> > like
> > > > me.
> > > > It now contains:
> > > >
> > > >   u32 pci_space;
> > > >   u64 pci_addr;
> > > >   u64 cpu_addr;
> > > >   u64 bus_addr;
> > > >
> > > > Can you explain what all these things mean, and maybe even add =
one-
> > > > line comments to the structure?

I can try to do that, as I worked with Andrew Murray when he did the pa=
tch.

- pci_space is indeed the range.flags variable and it was trying to kee=
p
  the original value from the DT mainly to try to identify the config s=
pace
  in the ranges described. It has now become clear that declaring confi=
g
  space in the ranges area is wrong even if one supports ECAM so pci_sp=
ace
  could be removed as suggested by Bjorn.
- pci_addr is the address that goes on the PCI(e) bus.
- cpu_addr is the translated address that the CPU uses. It does not nec=
essarily
  means it is the same address that the Root Complex sees when requeste=
d to
  do Address Translation between host side and bus side. Also, what get=
s stored
  in the cpu_addr is not equal to what gets declared in the ranges prop=
erty if
  there are other address translation parents between the Root Complex =
and the
  CPU.
- bus_addr is meant to be the un-translated cpu_addr that DesignWare ne=
eds
  in order to setup its ATS service. The reason for putting it in the o=
f_pci_range
  is because the struct resource does not have the concept of an untran=
slated
  address.

Best regards,
Liviu


> >=20
> > > > pci_space: The only uses I see are to determine whether to prin=
t
> > > > "Prefetch".  I don't see any real functionality that uses this.
> > >
> > > Looking at the code I agree. it's seems to be used only in powerp=
c
> > > and microblaze to print out.
> > > However from my understanding pci_space is the phys.hi field of t=
he
> > > ranges property: it defines the properties of the address space
> > associated
> > > to the PCI address. if you're curious you can find a nice and qui=
ck
> > to read
> > > "guide" in http://devicetree.org/MPC5200:PCI
> >=20
> > I think pci_space should be removed and the users should test
> > "range.flags & IORESOURCE_PREFETCH" instead.  That's already set by
> > of_bus_pci_get_flags().  This is separate from your current patch, =
of
> > course.
>=20
> Ok so I'll do nothing in my patch about this; maybe I can propose a s=
eparate
> patch for this, but I cannot test it (I've got no microblaze and powe=
rpc=20
> neither....)
>=20
> >=20
> > 29b635c00f3e ("of/pci: Provide support for parsing PCI DT ranges
> > property") added struct of_pci_range, and even at the time,
> > of_bus_pci_get_flags() set IORESOURCE_PREFETCH in of_pci_range.flag=
s.
> >=20
> > 654837e8fe8d ("powerpc/pci: Use of_pci_range_parser helper in
> > pci_process_bridge_OF_ranges") converted powerpc to use
> > of_pci_range_parser() instead of parsing manually.  It converted ot=
her
> > references to look at struct of_pci_range.flags; I'm not sure why i=
t
> > didn't do that for the prefetch bit.
> >=20
> > I copied Andrew in case there's some subtlety here.
> >=20
> > > > pci_addr: I assume this is a PCI bus address, like what you wou=
ld
> > see
> > > > if
> > > > you put an analyzer on the bus/link.  This address could go in =
a
> > BAR.
> > >
> > > Yes, this is the PCI start address of the range: phys.mid + phys.=
low
> > in the
> > > guide mentioned above
> > >
> > > > cpu_addr: I assume this is a CPU physical address, like what yo=
u
> > would
> > > > see
> > > > in /proc/iomem and what you would pass to ioremap().
> > >
> > > Yes correct
> > >
> > > > bus_addr: ?
> > >
> > > According to the guide above, this is the address into which the
> > pci_address
> > > get translated to and that is passed to the root complex. Between=
 the
> > root
> > > complex and the CPU there can be intermediate translation layers:
> >=20
> > I can't quite parse this, but I do understand how a host bridge can
> > translate CPU physical addresses to a different range of PCI bus
> > addresses.  What I don't understand is the difference between
> > "pci_addr"
> > and the "bus_addr" you're adding.
>=20
> For example see:
> http://lxr.free-electrons.com/source/arch/arm/boot/dts/imx6qdl.dtsi#L=
148
>=20
> ranges =3D <0x00000800 0 0x01f00000 0x01f00000 0 0x00080000   /* conf=
iguration space */
>           0x81000000 0 0          0x01f80000 0 0x00010000   /* downst=
ream I/O */
>           0x82000000 0 0x01000000 0x01000000 0 0x00f00000>; /* non-pr=
efetchable memory *
>                /\          /\          /\
>            pci_space    pci_addr     bus_addr           =20
>=20
>=20
> The host bridge performs the first translation from pci_addr to bus_a=
ddr.
> If there are other ranges in the parents nodes in the DT bus_addr get=
s=20
> translated further till you get the cpu_addr.
>=20
> Hope it is a bit clearer now....
>=20
> >=20
> > > see that to
> > > get pci_address we call "of_translate_address"; this will apply a=
ll
> > the
> > > translation layers (ranges in the DT) that it finds till it comes=
 to
> > the root
> > > node of the DT (thus retrieving the CPU address).
> > > Now said that, for designware we need the first translated PCI
> > address, that we call
> > > here bus_addr after Rob Herring suggested the name...honestly I
> > cannot think of a
> > > different name
> > >
> > >
> > >
> > > > I'm trying to imagine how this might be expressed in ACPI.  A h=
ost
> > > > bridge
> > > > ACPI _CRS contains a CPU physical address and applying a _TRA
> > > > (translation
> > > > offset) to the CPU address gives you a PCI bus address.  I know
> > this
> > > > code
> > > > is OF, not ACPI, but I assume that it should be possible to
> > describe
> > > > your
> > > > hardware via ACPI as well as by OF.
> >=20
> > > > > diff --git a/include/linux/of_address.h
> > b/include/linux/of_address.h
> > > > > index d88e81b..865f96e 100644
> > > > > --- a/include/linux/of_address.h
> > > > > +++ b/include/linux/of_address.h
> > > > > @@ -16,6 +16,7 @@ struct of_pci_range {
> > > > >  	u32 pci_space;
> > > > >  	u64 pci_addr;
> > > > >  	u64 cpu_addr;
> > > > > +	u64 bus_addr;
> > > > >  	u64 size;
> > > > >  	u32 flags;
> > > > >  };
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
