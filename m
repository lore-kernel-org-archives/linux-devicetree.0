From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v8 3/9] pci: Introduce pci_register_io_range() helper
 function.
Date: Wed, 9 Jul 2014 10:14:41 +0100
Message-ID: <20140709091441.GR6501@e106497-lin.cambridge.arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <201407080900.44882.arnd@arndb.de>
 <20140708212951.GA4555@google.com>
 <201407090820.49418.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201407090820.49418.arnd@arndb.de>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci <linux-pci@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>, Sinan Kaya <okaya@codeaurora.org>, Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Suravee Suthikulanit <suravee.suthikulpanit@amd.com>, LKML <linux-kernel@vger.kernel.org>, Device Tree ML <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 09, 2014 at 07:20:49AM +0100, Arnd Bergmann wrote:
> On Tuesday 08 July 2014, Bjorn Helgaas wrote:
> > On Tue, Jul 8, 2014 at 1:00 AM, Arnd Bergmann <arnd@arndb.de> wrote=
:
> > > On Tuesday 08 July 2014, Bjorn Helgaas wrote:
> > >> On Tue, Jul 01, 2014 at 07:43:28PM +0100, Liviu Dudau wrote:
> > >> > +static LIST_HEAD(io_range_list);
> > >> > +
> > >> > +/*
> > >> > + * Record the PCI IO range (expressed as CPU physical address=
 + size).
> > >> > + * Return a negative value if an error has occured, zero othe=
rwise
> > >> > + */
> > >> > +int __weak pci_register_io_range(phys_addr_t addr, resource_s=
ize_t size)
> > >>
> > >> I don't understand the interface here.  What's the mapping from =
CPU
> > >> physical address to bus I/O port?  For example, I have the follo=
wing
> > >> machine in mind:
> > >>
> > >>   HWP0002:00: PCI Root Bridge (domain 0000 [bus 00-1b])
> > >>   HWP0002:00: memory-mapped IO port space [mem 0xf8010000000-0xf=
8010000fff]
> > >>   HWP0002:00: host bridge window [io  0x0000-0x0fff]
> > >>
> > >>   HWP0002:09: PCI Root Bridge (domain 0001 [bus 00-1b])
> > >>   HWP0002:09: memory-mapped IO port space [mem 0xf8110000000-0xf=
8110000fff]
> > >>   HWP0002:09: host bridge window [io  0x1000000-0x1000fff] (PCI =
address [0x0-0xfff])
> > >>
> > >> The CPU physical memory [mem 0xf8010000000-0xf8010000fff] is tra=
nslated by
> > >> the bridge to I/O ports 0x0000-0x0fff on PCI bus 0000:00.  Drive=
rs use,
> > >> e.g., "inb(0)" to access it.
> > >>
> > >> Similarly, [mem 0xf8110000000-0xf8110000fff] is translated by th=
e second
> > >> bridge to I/O ports 0x0000-0x0fff on PCI bus 0001:00.  Drivers u=
se
> > >> "inb(0x1000000)" to access it.
> > >
> > > I guess you are thinking of the IA64 model here where you keep th=
e virtual
> > > I/O port numbers in a per-bus lookup table that gets accessed for=
 each
> > > inb() call. I've thought about this some more, and I believe ther=
e are good
> > > reasons for sticking with the model used on arm32 and powerpc for=
 the
> > > generic OF implementation.
> > >
> > > The idea is that there is a single virtual memory range for all I=
/O port
> > > mappings and we use the MMU to do the translation rather than com=
puting
> > > it manually in the inb() implemnetation. The main advantage is th=
at all
> > > functions used in device drivers to (potentially) access I/O port=
s
> > > become trivial this way, which helps for code size and in some ca=
ses
> > > (e.g. SoC-internal registers with a low latency) it may even be p=
erformance
> > > relevant.
> >=20
> > My example is from ia64, but I'm not advocating for the lookup tabl=
e.
> > The point is that the hardware works similarly (at least for dense =
ia64
> > I/O port spaces) in terms of mapping CPU physical addresses to PCI =
I/O
> > space.
> >=20
> > I think my confusion is because your pci_register_io_range() and
> > pci_addess_to_pci() implementations assume that every io_range star=
ts at
> > I/O port 0 on PCI (correct me if I'm wrong).  I suspect that's why =
you
> > don't save the I/O port number in struct io_range.
>=20
> I think you are just misreading the code, but I agree it's hard to
> understand and I made the same mistake in my initial reply to the
> first version.

I am willing to make the code more easy to understand and validate. Pro=
of that
things are not that easy to check is that I've also got confused last n=
ight
without having all the code in front of me. Any suggestions?

Best regards,
Liviu

>=20
> pci_register_io_range and pci_address_to_pci only worry about the map=
ping
> between CPU physical and Linux I/O address, they do not care which PC=
I
> port numbers are behind that. The mapping between PCI port numbers an=
d
> Linux port numbers is done correctly in patch 8/9 in the
> pci_host_bridge_of_get_ranges() function.
>=20
> > Maybe that assumption is guaranteed by OF, but it doesn't hold for =
ACPI;
> > ACPI can describe several I/O port apertures for a single bridge, e=
ach
> > associated with a different CPU physical memory region.
>=20
> DT can have the same, although the common case is that each PCI host
> bridge has 64KB of I/O ports starting at address 0. Most driver write=
rs
> get it wrong for the case where it starts at a different address, so
> I really want to have a generic implementation that gets it right.
>=20
> > If my speculation here is correct, a comment to the effect that eac=
h
> > io_range corresponds to a PCI I/O space range that starts at 0 migh=
t be
> > enough.
> >=20
> > If you did add a PCI I/O port number argument to pci_register_io_ra=
nge(),
> > we might be able to make an ACPI-based implementation of it.  But I=
 guess
> > that could be done if/when anybody ever wants to do that.
>=20
> I think we shoulnd't worry about it before we actually need it. As fa=
r as
> I understand, the only user of that code (unless someone wants to con=
vert
> ia64) would be ARM64 with ACPI, but that uses the SBSA hardware model=
 that
> recommends having no I/O space at all.
>=20
>  	Arnd
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
