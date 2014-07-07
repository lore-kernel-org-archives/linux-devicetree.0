From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v8 4/9] pci: OF: Fix the conversion of IO ranges into IO
 resources.
Date: Mon, 7 Jul 2014 12:11:33 +0100
Message-ID: <20140707111133.GP6501@e106497-lin.cambridge.arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <1404240214-9804-5-git-send-email-Liviu.Dudau@arm.com>
 <CAL_JsqJNfB_jynFQK0Ov6A3wqk6LF3abUFEUjhmzipak26sU5w@mail.gmail.com>
 <6122131.ozzYjjjRQi@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <6122131.ozzYjjjRQi@wuerfel>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robherring2@gmail.com>, Sinan Kaya <okaya@codeaurora.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Device Tree ML <devicetree@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Jingoo Han <jg1.han@samsung.com>, Will Deacon <Will.Deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Kukjin Kim <kgene.kim@samsung.com>, Tanmay Inamdar <tinamdar@apm.com>, Suravee Suthikulanit <suravee.suthikulpanit@amd.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bjorn Helgaas <bhelgaas@google.com>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 05, 2014 at 09:46:09PM +0100, Arnd Bergmann wrote:
> On Saturday 05 July 2014 14:25:52 Rob Herring wrote:
> > On Tue, Jul 1, 2014 at 1:43 PM, Liviu Dudau <Liviu.Dudau@arm.com> w=
rote:
> > > The ranges property for a host bridge controller in DT describes
> > > the mapping between the PCI bus address and the CPU physical addr=
ess.
> > > The resources framework however expects that the IO resources sta=
rt
> > > at a pseudo "port" address 0 (zero) and have a maximum size of IO=
_SPACE_LIMIT.
> > > The conversion from pci ranges to resources failed to take that i=
nto account.
> >=20
> > I don't think this change is right. There are 2 resources: the PCI =
bus
> > addresses and cpu addresses. This function deals with the cpu
> > addresses. Returning pci addresses for i/o and cpu addresses for
> > memory is going to be error prone. We probably need both cpu and pc=
i
> > resources exposed to host controllers.
> >=20
> > Making the new function only deal with i/o bus resources and naming=
 it
> > of_pci_range_to_io_resource would be better.
>=20
> I think you are correct that this change by itself is will break exis=
ting
> drivers that rely on the current behavior of of_pci_range_to_resource=
,
> but there is also something wrong with the existing implementation:

Either I'm very confused or I've managed to confuse everyone else. The =
I/O
resources described using CPU addresses *are* using "pseudo" port based
addresses (or at least that is my understanding and my reading of the c=
ode).
Can you point me to a function that is expecting the IO resource to hav=
e
the start address at the physical address of the mapped space?

I was trying to fix exactly this issue, that you cannot use the resourc=
e
structure returned by this function in any call that is expecting an IO
resource.

Rob, you can try this function with two host bridges. Patch [3/9] chang=
es
pci_address_to_pio() to calculate the offset of the range based on alre=
ady
registed ranges, so the first host bridge will have it's IO resources
starting from zero, but the second host bridge will have .start offsete=
d
by the size of the IO space of the first bridge. That is not a PCI bus
address AFAICT.

Best regards,
Liviu

>=20
> of_pci_range_to_resource() at the moment returns a the address in
> cpu address space (i.e. IORESOURCE_MEM) but sets the res->flags
> value to IORESOURCE_IO, which means it doesn't fit into the resource
> tree. Liviu's version gets that part right, and it would be nice
> to fix that eventually, however we do it here.
>=20
> 	Arnd
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
