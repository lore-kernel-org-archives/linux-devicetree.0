From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v7 3/3] arm64: Add architecture support for PCI
Date: Fri, 14 Mar 2014 18:05:27 +0000
Message-ID: <20140314180527.GZ6457@e106497-lin.cambridge.arm.com>
References: <1394811258-1500-1-git-send-email-Liviu.Dudau@arm.com>
 <1394811258-1500-4-git-send-email-Liviu.Dudau@arm.com>
 <20140314171457.GK18126@arm.com>
 <201403141838.08900.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201403141838.08900.arnd@arndb.de>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Catalin Marinas <Catalin.Marinas@arm.com>, linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 14, 2014 at 05:38:08PM +0000, Arnd Bergmann wrote:
> On Friday 14 March 2014, Catalin Marinas wrote:
> > On Fri, Mar 14, 2014 at 03:34:18PM +0000, Liviu Dudau wrote:
> > > --- /dev/null
> > > +++ b/arch/arm64/kernel/pci.c
> > [...]
> > > +int pci_register_io_range(phys_addr_t address, resource_size_t s=
ize)
> > [...]
> > > +unsigned long pci_address_to_pio(phys_addr_t address)
> > [...]
> > > +void pcibios_fixup_bus(struct pci_bus *bus)
> > [ actually most of this file ]
> >=20
> > Maybe it was raised before already but can we have __weak generic
> > definitions of these functions? They don't seem to be arm64 specifi=
c in
> > any way.
> >=20
>=20
> I would definitely prefer that.
>=20
> 	Arnd
>=20

I haven't seen any reaction from Bjorn on this, so I threaded carefully=
 on that
subject. I'm new to this so I don't know how to handle this.

To my mind, and looking at the way every architecture has been setup, t=
he pcibios_*
function are intended to be provided by the architecture. No matter how=
 much wishful
thinking we are going to put in here, it will not change the fact that =
the non-arm64
specific version of pcibios_fixup_bus() that I wrote is not shared by a=
nyone else
and it will remain "for arm64 use only" regardless to where it is place=
d until the
next architecture comes into the kernel. And even then its adoption is =
questionable.
If we are looking for simple and common implementations of this functio=
n, maybe we
should look at why microblaze and powerpc versions, that are identical,=
 are not being
made the default __weak implementation.

As for the other two functions, I've no special attachment to where the=
y are present
and I'm happy to move them into drivers/pci on the condition that the p=
atchset doesn't
double in size. The reason why I'm weary of touching other architecture=
s in a significant
way is the current lack of engineering bandwidth and way of testing all=
 the architectures.
My low friction approach has been to introduce them in arm64 and then s=
lowly move them
into core (and yes, I know about good intentions and the road to hell.)

Catalin, if you are happy to ask for ACKs from all arch maintainers tha=
t might get
affected by our custom version of pci_address_to_pio() before you can p=
ull PCI support
for arm64 then I can propose a new patchset.

Best regards,
Liviu=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
