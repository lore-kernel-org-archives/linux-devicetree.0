From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v8 4/9] pci: OF: Fix the conversion of IO ranges into IO
 resources.
Date: Tue, 8 Jul 2014 11:03:32 +0100
Message-ID: <20140708100332.GW6501@e106497-lin.cambridge.arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <6122131.ozzYjjjRQi@wuerfel>
 <20140707111133.GP6501@e106497-lin.cambridge.arm.com>
 <201407072322.00990.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201407072322.00990.arnd@arndb.de>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robherring2@gmail.com>, Sinan Kaya <okaya@codeaurora.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Device Tree ML <devicetree@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Jingoo Han <jg1.han@samsung.com>, Will Deacon <Will.Deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Kukjin Kim <kgene.kim@samsung.com>, Tanmay Inamdar <tinamdar@apm.com>, Suravee Suthikulanit <suravee.suthikulpanit@amd.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bjorn Helgaas <bhelgaas@google.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 07, 2014 at 10:22:00PM +0100, Arnd Bergmann wrote:
> On Monday 07 July 2014, Liviu Dudau wrote:
> > On Sat, Jul 05, 2014 at 09:46:09PM +0100, Arnd Bergmann wrote:
> > > On Saturday 05 July 2014 14:25:52 Rob Herring wrote:
> > > > On Tue, Jul 1, 2014 at 1:43 PM, Liviu Dudau <Liviu.Dudau@arm.co=
m> wrote:
> > > > > The ranges property for a host bridge controller in DT descri=
bes
> > > > > the mapping between the PCI bus address and the CPU physical =
address.
> > > > > The resources framework however expects that the IO resources=
 start
> > > > > at a pseudo "port" address 0 (zero) and have a maximum size o=
f IO_SPACE_LIMIT.
> > > > > The conversion from pci ranges to resources failed to take th=
at into account.
> > > >=20
> > > > I don't think this change is right. There are 2 resources: the =
PCI bus
> > > > addresses and cpu addresses. This function deals with the cpu
> > > > addresses. Returning pci addresses for i/o and cpu addresses fo=
r
> > > > memory is going to be error prone. We probably need both cpu an=
d pci
> > > > resources exposed to host controllers.
> > > >=20
> > > > Making the new function only deal with i/o bus resources and na=
ming it
> > > > of_pci_range_to_io_resource would be better.
> > >=20
> > > I think you are correct that this change by itself is will break =
existing
> > > drivers that rely on the current behavior of of_pci_range_to_reso=
urce,
> > > but there is also something wrong with the existing implementatio=
n:
> >=20
> > Either I'm very confused or I've managed to confuse everyone else. =
The I/O
> > resources described using CPU addresses *are* using "pseudo" port b=
ased
> > addresses (or at least that is my understanding and my reading of t=
he code).
> > Can you point me to a function that is expecting the IO resource to=
 have
> > the start address at the physical address of the mapped space?
>=20
> pci_v3_preinit() in arch/arm/mach-integrator/pci_v3.c for instance ta=
kes
> the resource returned by of_pci_range_to_resource and programs the
> start and size into hardware registers that expect a physical address
> as far as I can tell.
>=20
> > I was trying to fix exactly this issue, that you cannot use the res=
ource
> > structure returned by this function in any call that is expecting a=
n IO
> > resource.
>=20
> I looked at the other drivers briefly, and I think you indeed fix the=
 Tegra
> driver with this but break the integrator driver as mentioned above.
> The other callers of of_pci_range_to_resource() are apparently not
> impacted as they recalculate the values they get.

I would argue that integrator version is having broken assumptions. If =
it would
try to allocate that IO range or request the resource as returned curre=
ntly by
of_pci_range_to_resource (without my patch) it would fail. I know becau=
se I did
the same thing in my host bridge driver and it failed miserably. That's=
 why I
tried to patch it.

I will lay out my argument here and people can tell me if I am wrong:

PCI IO resources (even if they are memory mapped on certain architectur=
es) need
to emulate the x86 world "port" concept. Why do I think this? Because o=
f this
structure at the beginning of kernel/resource.c:

struct resource ioport_resource =3D {
	.name	=3D "PCI IO",
	.start	=3D 0,
	.end	=3D IO_SPACE_LIMIT,
	.flags	=3D IORESOURCE_IO,
};
EXPORT_SYMBOL(ioport_resource);

The other resource that people seem to confuse it with is the next one =
in that
file:

struct resource iomem_resource =3D {
	.name	=3D "PCI mem",
	.start	=3D 0,
	.end	=3D -1,
	.flags	=3D IORESOURCE_MEM,
};
EXPORT_SYMBOL(iomem_resource);

Now, there are architecture that override the .start and .end values, b=
ut arm
is not one of those, and mach-integrator doesn't change it either. So o=
ne can
play with the ioport_resource values to move the "port" window wherever=
 he/she
wants, but it doesn't change the "port access" way of addressing it.

If the IO space is memory mapped, then we use the port number, the io_o=
ffset
and the PCI_IOBASE to get to the virtual address that, when accessed, w=
ill
generate the correct addresses on the bus, based on what the host bridg=
e has
been configured.

This is the current level of my understanding of PCI IO.

Now, I believe Rob has switched entirely to using my series in some tes=
t that
he has run and he hasn't encountered any issues, as long as one remembe=
rs in
the host bridge driver to add the io_base offset to the .start resource=
=2E If
not then I need to patch pci_v3.c.

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
