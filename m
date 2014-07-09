From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v8 4/9] pci: OF: Fix the conversion of IO ranges into IO
 resources.
Date: Wed, 9 Jul 2014 10:27:16 +0100
Message-ID: <20140709092716.GS6501@e106497-lin.cambridge.arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <201407072322.00990.arnd@arndb.de>
 <20140708100332.GW6501@e106497-lin.cambridge.arm.com>
 <201407091031.50402.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <201407091031.50402.arnd@arndb.de>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robherring2@gmail.com>, Sinan Kaya <okaya@codeaurora.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Device Tree ML <devicetree@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Jingoo Han <jg1.han@samsung.com>, Will Deacon <Will.Deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Kukjin Kim <kgene.kim@samsung.com>, Tanmay Inamdar <tinamdar@apm.com>, Suravee Suthikulanit <suravee.suthikulpanit@amd.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bjorn Helgaas <bhelgaas@google.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 09, 2014 at 09:31:50AM +0100, Arnd Bergmann wrote:
> On Tuesday 08 July 2014, Liviu Dudau wrote:
> > On Mon, Jul 07, 2014 at 10:22:00PM +0100, Arnd Bergmann wrote:
> > >=20
> > > I looked at the other drivers briefly, and I think you indeed fix=
 the Tegra
> > > driver with this but break the integrator driver as mentioned abo=
ve.
> > > The other callers of of_pci_range_to_resource() are apparently no=
t
> > > impacted as they recalculate the values they get.
> >=20
> > I would argue that integrator version is having broken assumptions.=
 If it would
> > try to allocate that IO range or request the resource as returned c=
urrently by
> > of_pci_range_to_resource (without my patch) it would fail. I know b=
ecause I did
> > the same thing in my host bridge driver and it failed miserably. Th=
at's why I
> > tried to patch it.
>=20
> The integrator code was just introduced and the reason for how it doe=
s things
> is the way that of_pci_range_to_resource() works today. We tried to c=
ope with
> it and not change the existing behavior in order to not break any oth=
er drivers.
>=20
> It's certainly not fair to call the integrator version broken, it jus=
t works
> around the common code having a quirky interface. We should probably =
have
> done of_pci_range_to_resource better than it is today (I would have a=
rgued
> for it to return an IORESOURCE_MEM with the CPU address), but it took=
 long
> enough to get that merged and I was sick of arguing about it.

Understood. That is why I have carefully worded my email as not to diss=
 anyone.
I didn't say the code is broken, I've said it has broken assumptions.

>=20
> > If the IO space is memory mapped, then we use the port number, the =
io_offset
> > and the PCI_IOBASE to get to the virtual address that, when accesse=
d, will
> > generate the correct addresses on the bus, based on what the host b=
ridge has
> > been configured.
> >=20
> > This is the current level of my understanding of PCI IO.
>=20
> Your understanding is absolutely correct, and that's great because ve=
ry few
> people get that right. What I think we're really arguing about is wha=
t the
> of_pci_range_to_resource is supposed to return. As you and Bjorn both=
 pointed
> out earlier, there are in fact two resources associated with the I/O =
window
> and the flaw in the current implementation is that of_pci_range_to_re=
source
> returns the numeric values for the IORESOURCE_MEM resource, but sets =
the
> type to IORESOURCE_IO, which is offset from that by PCI_IOBASE.
>=20
> You try to fix that by making it return the correct IORESOURCE_IO res=
ource,
> which is a reasonable approach but you must not break drivers that re=
ly
> on the broken resource while doing that.

Or I need to fix the existing drivers that rely on the old behaviour.

>=20
> The approach that I would have picked is to return the IORESOURCE_MEM
> resource associated with the I/O window and pick a (basically random)
> IORESOURCE_IO resource struct based on what hasn't been used and then
> compute the appropriate io_offset from that. This approach of course
> would also have required fixing up all drivers relying on the current
> behavior.
>=20
> To be clear, I'm fine with you (and Bjorn if he cares) picking the
> approach you like here, either one of these works fine as long as the
> host drivers use the interface in the way it is defined.

OK. Thanks for that. It does look like either way some existing code ne=
eds
fixing, so I will have a look at that. Unless Bjorn votes for making a =
new
version of pci_range_to_resource().

>=20
> > Now, I believe Rob has switched entirely to using my series in some=
 test that
> > he has run and he hasn't encountered any issues, as long as one rem=
embers in
> > the host bridge driver to add the io_base offset to the .start reso=
urce. If
> > not then I need to patch pci_v3.c.
>=20
> The crazy part of all these discussions is that basically nobody ever=
 uses
> I/O port access, so it's very hard to test and we don't even notice w=
hen
> we get it wrong, but we end up spending most of the time for PCI host=
 controller
> reviews trying to get these right.
>=20
> I'm very thankful that you are doing this work to get it moved into c=
ommon
> code so hopefully this is the last time we ever have to worry about i=
t because
> all future drivers will be able to use the common implemnetation.

Ahh, we humans! We always hope for the best! :)

My only chance of succeeding is if I make it a no brainer for people to=
 use the
code. At the moment the interface for host bridge drivers is not too ba=
d, but
it looks like the internals are still hard to comprehend.

Best regards,
Liviu

>=20
> 	Arnd
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
