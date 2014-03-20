From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v7 3/3] arm64: Add architecture support for PCI
Date: Thu, 20 Mar 2014 11:38:21 +0000
Message-ID: <20140320113820.GH6457@e106497-lin.cambridge.arm.com>
References: <1394811258-1500-1-git-send-email-Liviu.Dudau@arm.com>
 <8312584.jdZZuHGAjg@wuerfel>
 <20140320094654.GZ6457@e106497-lin.cambridge.arm.com>
 <201403201217.22339.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <201403201217.22339.arnd@arndb.de>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Catalin Marinas <Catalin.Marinas@arm.com>, linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 20, 2014 at 11:17:22AM +0000, Arnd Bergmann wrote:
> On Thursday 20 March 2014, Liviu Dudau wrote:
> > On Wed, Mar 19, 2014 at 06:37:51PM +0000, Arnd Bergmann wrote:
> > > On Wednesday 19 March 2014 17:21:41 Liviu Dudau wrote:
> > > >=20
> > > > My ultimate point is that no matter how long we argue about the=
 shape of the functions that
> > > > I've added into arch/arm64/kernel/pci.c I don't think we can ge=
t away without having that
> > > > file, or at least not in the first phase if we want speedy inte=
gration into mainline.
> > >=20
> > > Let me simplify the discussion here:
> > >=20
> > > NAK to adding yet another architecture specific implementation.
> >=20
> > So what would be your approach for handling pci_address_to_pio() in=
 a non-arch specific way?
> >=20
> > unsigned long __weak pci_address_to_pio(phys_addr_t address)
> > {
> > #ifdef ARCH_HAS_IOSPACE
> >         if (address > IO_SPACE_LIMIT)
> >                 return (unsigned long)-1;
> >=20
> >         return (unsigned long) address;
> > #else
> >         struct ioresource *res;
> >=20
> >         list_for_each_entry(res, &io_list, list) {
> >                 if (address >=3D res->start &&
> >                         address < res->start + res->size) {
> >                         return res->start - address;
> >                 }
> >         }
> >=20
> >         return (unsigned long)-1;
> > #endif
> > }
> >=20
> >=20
> > Either that, or you have more magic rabbits than me.
>=20
> I don't even understand why you want to create a generic pci_address_=
to_pio
> implementation, when we don't need that for arm64 at all. Unless I'm
> missing something important, that function is only called in case of
> PCI_PROBE_DEVTREE with pci_of_scan on PowerPC. I don't expect any
> architecture to do the same thing, and the only other architecture th=
at
> needs something like it (sparc) has a different implementation.

Because in my [v7 2/6]* patch for the generic host bridge support I sta=
rt
using pci_address_to_pio to fix the conversion of PCI ranges to resourc=
es.
That requires an arm64 (or more correctly, an arch with memory mapped I=
O
specific) version of pci_address_to_pio().

Best regards,
Liviu

>=20
> The regular (non-DEVTREE) PCI bus scan should just be able to transla=
te
> the BUS I/O addresses into Linux I/O port numbers using io_offset,
> without going through an intermediate step of translating into a CPU
> physical address first, so the entire lookup method won't get used.
>=20
> The reason why PowerPC needs it is that they traditionally don't
> use PCI config space access to assign or look at resources, but
> instead rely on the firmware to have set it up in advance and then
> put matching information into DT and the BARs. For Solaris and AIX,
> it's probably easier to use the information from DT, but in Linux,
> we already need to implement the manual bus scan, e.g. to do
> PCI device hotplugging if nothing else.
>=20
> 	Arnd
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
