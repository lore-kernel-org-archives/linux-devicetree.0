From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v7 3/3] arm64: Add architecture support for PCI
Date: Mon, 17 Mar 2014 18:05:25 +0000
Message-ID: <20140317180525.GL6457@e106497-lin.cambridge.arm.com>
References: <1394811258-1500-1-git-send-email-Liviu.Dudau@arm.com>
 <1394811258-1500-4-git-send-email-Liviu.Dudau@arm.com>
 <20140314171457.GK18126@arm.com>
 <201403141838.08900.arnd@arndb.de>
 <20140314180527.GZ6457@e106497-lin.cambridge.arm.com>
 <20140317173821.GJ24070@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140317173821.GJ24070@arm.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 17, 2014 at 05:38:21PM +0000, Catalin Marinas wrote:
> On Fri, Mar 14, 2014 at 06:05:27PM +0000, Liviu Dudau wrote:
> > On Fri, Mar 14, 2014 at 05:38:08PM +0000, Arnd Bergmann wrote:
> > > On Friday 14 March 2014, Catalin Marinas wrote:
> > > > On Fri, Mar 14, 2014 at 03:34:18PM +0000, Liviu Dudau wrote:
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/kernel/pci.c
> > > > [...]
> > > > > +int pci_register_io_range(phys_addr_t address, resource_size=
_t size)
> > > > [...]
> > > > > +unsigned long pci_address_to_pio(phys_addr_t address)
> > > > [...]
> > > > > +void pcibios_fixup_bus(struct pci_bus *bus)
> > > > [ actually most of this file ]
> > > >=20
> > > > Maybe it was raised before already but can we have __weak gener=
ic
> > > > definitions of these functions? They don't seem to be arm64 spe=
cific in
> > > > any way.
> [...]
> > Catalin, if you are happy to ask for ACKs from all arch maintainers=
 that might get
> > affected by our custom version of pci_address_to_pio() before you c=
an pull PCI support
> > for arm64 then I can propose a new patchset.
>=20
> You don't need to change the other architectures, that's the point of=
 a
> __weak definition, it will be automatically overridden. If you want, =
you
> can even place a GENERIC_PCI or whatever config option that is only
> selected by arm64 for the time being.

pci_address_to_pio() is alread __weak. My patch was adding the arm64 ve=
rsion of it. Adding
an #ifdef GENERIC_PCI to the __weak implementation is not just a tempor=
ary solution.
We would still have to keep some sort of #ifdef around in the function =
as x86
will never pickup our version. Regardless, the list of people that woul=
d need to ACK that
change will increase, right?

Best regards,
Liviu

>=20
> --=20
> Catalin
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
