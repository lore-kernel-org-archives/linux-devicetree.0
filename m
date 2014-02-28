From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v2 1/4] pci: OF: Fix the conversion of IO ranges into IO
 resources.
Date: Fri, 28 Feb 2014 12:50:45 +0000
Message-ID: <20140228125045.GV1692@e106497-lin.cambridge.arm.com>
References: <1393506402-11474-1-git-send-email-Liviu.Dudau@arm.com>
 <5379319.g8IPYmY2Zo@wuerfel>
 <20140227200729.GB7773@obsidianresearch.com>
 <11097076.0C13zaKdYD@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <11097076.0C13zaKdYD@wuerfel>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, linaro-kernel <linaro-kernel@lists.linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 27, 2014 at 08:22:12PM +0000, Arnd Bergmann wrote:
> On Thursday 27 February 2014 13:07:29 Jason Gunthorpe wrote:
> > On Thu, Feb 27, 2014 at 08:48:08PM +0100, Arnd Bergmann wrote:
> > > > It also looks correct for architectures that use the CPU MMIO a=
ddress
> > > > as the IO address directly (where IO_SPACE_LIMIT would be 4G)
> > >=20
> > > Are you aware of any that still do? I thought we had stopped doin=
g
> > > that.
> >=20
> > I thought ia64 used to, but it has been a long time since I've touc=
hed
> > one...
>=20
> They have a different way of doing it now, no idea how it looked in
> the past:
>=20
> #define IO_SPACE_LIMIT          0xffffffffffffffffUL
>=20
> #define MAX_IO_SPACES_BITS              8
> #define MAX_IO_SPACES                   (1UL << MAX_IO_SPACES_BITS)
> #define IO_SPACE_BITS                   24
> #define IO_SPACE_SIZE                   (1UL << IO_SPACE_BITS)
>=20
> #define IO_SPACE_NR(port)               ((port) >> IO_SPACE_BITS)
> #define IO_SPACE_BASE(space)            ((space) << IO_SPACE_BITS)
> #define IO_SPACE_PORT(port)             ((port) & (IO_SPACE_SIZE - 1)=
)
>=20
> #define IO_SPACE_SPARSE_ENCODING(p)     ((((p) >> 2) << 12) | ((p) & =
0xfff))
>=20
> So their port number is a logical token that contains the I/O space n=
umber
> and a 16MB offset.
>=20
> Apparently sparc64 uses physical memory addressing for I/O space, the
> same way they do for memory space, and they just set IO_SPACE_LIMIT t=
o
> 0xffffffffffffffffUL.
>=20
> > > > Architectures that use the virtual IO window technique will alw=
ays
> > > > require a custom pci_address_to_pio implementation.
> > >=20
> > > Hmm, at the moment we only call it from of_address_to_resource(),
> > > which in turn does not get called on PCI devices, and does not
> > > call pci_address_to_pio for 'simple' platform devices. The only
> > > case I can think of where it actually matters is when we have
> > > ISA devices in DT that use an I/O port address in the reg propert=
y,
> > > and that case hopefully won't happen on ARM32 or ARM64.
> >=20
> > Sure, I ment, after Liviu's patch it will become required since he =
is
> > cleverly using it to figure out what the io mapping the bridge driv=
er
> > setup before calling the helper.
>=20
> Ok. I was arguing more that we should add this dependency.

I've thought about this last night and I think I was trying to be too c=
lever
for my own good. As Jason points out, arm64 needs its own version of
pci_address_to_pio(). I have an idea on how to borrow the powerpc/micro=
blaze
one and make it useful without the need for pci_controller *hose. It wo=
uld
be generic enough for other platforms that use virtual I/O windows can =
use,
but I'll start with it being defined for arm64 for discussions in this =
list.

I'll post v3 shortly.

Best regards,
Liviu

>=20
> > > > I think the legacy reasons for having all those layers of trans=
lation
> > > > are probably not applicable to ARM64, and it is much simpler wi=
thout
> > > > the extra translation step....
> > > >=20
> > > > Arnd, what do you think?
> > >=20
> > > Either I don't like it or I misunderstand you ;-)
> > >=20
> > > Most PCI drivers normally don't call ioport_map or pci_iomap, so
> > > we can't just do it there. If you are thinking of calling ioport_=
map
> >=20
> > Okay, that was one of the 'legacy reasons'. Certainly lots of drive=
rs
> > do call pci_iomap, but if you think legacy drivers that don't are
> > important to ARM64 then it makes sense to use the virtual IO window=
=2E
>=20
> I think all uses of I/O space are legacy, but I don't think that
> drivers doing inb/outb are more obsolete than those doing pci_iomap.
> It's got more to do with the subsystem requirements, e.g. libata
> requires the use of pci_iomap.
>=20
> > > for every PCI device that has an I/O BAR and storing the virtual
> > > address in the pci_dev resource, I don't see what that gains us
> >=20
> > Mainly we get to drop the fancy dynamic allocation stuff for the fi=
xed
> > virtual window, and it gives the option to have a 1:1 relationship
> > between CPU addresses and PCI BARs.
>=20
> I don't think the allocation is much of a problem, as long as we
> can localize it in one function that is shared by everyone.
> The problems I saw were all about explaining to people how it
> works, but they really shouldn't have to know.
>=20
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
