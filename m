From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v7 3/3] arm64: Add architecture support for PCI
Date: Wed, 19 Mar 2014 17:21:41 +0000
Message-ID: <20140319172140.GA16328@e106497-lin.cambridge.arm.com>
References: <1394811258-1500-1-git-send-email-Liviu.Dudau@arm.com>
 <1394811258-1500-4-git-send-email-Liviu.Dudau@arm.com>
 <20140314171457.GK18126@arm.com>
 <201403141838.08900.arnd@arndb.de>
 <20140314180527.GZ6457@e106497-lin.cambridge.arm.com>
 <20140317173821.GJ24070@arm.com>
 <20140317180525.GL6457@e106497-lin.cambridge.arm.com>
 <20140319135619.GC6231@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20140319135619.GC6231@localhost>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 19, 2014 at 01:56:19PM +0000, Catalin Marinas wrote:
> On Mon, Mar 17, 2014 at 06:05:25PM +0000, Liviu Dudau wrote:
> > On Mon, Mar 17, 2014 at 05:38:21PM +0000, Catalin Marinas wrote:
> > > On Fri, Mar 14, 2014 at 06:05:27PM +0000, Liviu Dudau wrote:
> > > > On Fri, Mar 14, 2014 at 05:38:08PM +0000, Arnd Bergmann wrote:
> > > > > On Friday 14 March 2014, Catalin Marinas wrote:
> > > > > > On Fri, Mar 14, 2014 at 03:34:18PM +0000, Liviu Dudau wrote=
:
> > > > > > > --- /dev/null
> > > > > > > +++ b/arch/arm64/kernel/pci.c
> > > > > > [...]
> > > > > > > +int pci_register_io_range(phys_addr_t address, resource_=
size_t size)
> > > > > > [...]
> > > > > > > +unsigned long pci_address_to_pio(phys_addr_t address)
> > > > > > [...]
> > > > > > > +void pcibios_fixup_bus(struct pci_bus *bus)
> > > > > > [ actually most of this file ]
> > > > > >=20
> > > > > > Maybe it was raised before already but can we have __weak g=
eneric
> > > > > > definitions of these functions? They don't seem to be arm64=
 specific in
> > > > > > any way.
> > > [...]
> > > > Catalin, if you are happy to ask for ACKs from all arch maintai=
ners that might get
> > > > affected by our custom version of pci_address_to_pio() before y=
ou can pull PCI support
> > > > for arm64 then I can propose a new patchset.
> > >=20
> > > You don't need to change the other architectures, that's the poin=
t of a
> > > __weak definition, it will be automatically overridden. If you wa=
nt, you
> > > can even place a GENERIC_PCI or whatever config option that is on=
ly
> > > selected by arm64 for the time being.
> >=20
> > pci_address_to_pio() is alread __weak. My patch was adding the arm6=
4 version of it. Adding
> > an #ifdef GENERIC_PCI to the __weak implementation is not just a te=
mporary solution.
>=20
> Ah, I start to understand what you mean, pci_address_to_pio() is alre=
ady
> defined as __weak in drivers/of/address.c. So the reason we redefine =
it
> on arm64 is that it uses the io_list resources which are populated by
> pci_register_io_range(). Do you see any other architecture using a
> similar logic (that could be shared)?

All architectures that memory map the PCI IO range should be supported =
by my version of
pci_address_to_pio(). But that still leaves the x86 and those architect=
ures that have
separate IO space or map it 1:1 into CPU address space to carry a diffe=
rent version (which
the current "generic" weak version catters for).

>=20
> Any other functions in this file that could be shared (and are not
> __weak already)?

A version of the pci_register_io_range() that uses part of pci_ioremap_=
io() (the calculation
of io_offset part).

My ultimate point is that no matter how long we argue about the shape o=
f the functions that
I've added into arch/arm64/kernel/pci.c I don't think we can get away w=
ithout having that
file, or at least not in the first phase if we want speedy integration =
into mainline.

Best regards,
Liviu

>=20
> --=20
> Catalin

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
