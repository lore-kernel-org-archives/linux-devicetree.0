From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v5 1/7] pci: Introduce pci_register_io_range() helper
 function.
Date: Mon, 10 Mar 2014 14:45:19 +0000
Message-ID: <20140310144519.GU6457@e106497-lin.cambridge.arm.com>
References: <1393948204-11555-1-git-send-email-Liviu.Dudau@arm.com>
 <201403042330.09607.arnd@arndb.de>
 <20140306160442.GG6457@e106497-lin.cambridge.arm.com>
 <201403070124.13139.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201403070124.13139.arnd@arndb.de>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, linaro-kernel <linaro-kernel@lists.linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, Tanmay Inamdar <tinamdar@apm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 07, 2014 at 12:24:12AM +0000, Arnd Bergmann wrote:
> On Thursday 06 March 2014, Liviu Dudau wrote:
> > On Tue, Mar 04, 2014 at 10:30:09PM +0000, Arnd Bergmann wrote:
> > > On Tuesday 04 March 2014, Liviu Dudau wrote:
> > > > +int __weak pci_register_io_range(phys_addr_t addr, resource_si=
ze_t size)
> > > > +{
> > > > +       return 0;
> > > > +}
> > > > +
> > >=20
> > > How about returning an error here? You don't actually register th=
e range.
> >=20
> > That's not the intention here. I basically want a nop, as by defaul=
t (read x86)
> > we do nothing with the IO range.
>=20
> I think x86 is a bad default though, because that is the exception ra=
ther than
> the rule. I also think that on x86, you shouldn't have an entry for t=
he I/O
> space in the "ranges" property since there is no translation, and the=
n we don't
> call this function.
>=20
> PCI devices described in DT on x86 would still be able to list their =
I/O BARs
> in DT, but you don't ever translate them into MMIO ranges.
>=20
> 	Arnd
>=20

So, if I understand you correctly, you would prefer to fail here and he=
nce stop the
parsing for the x86, rather than pretending everything is OK and going =
through the
motions?

That was not my original thinking when I've introduced this function he=
re. The main
purpose of the function is to help the correct translation of IO addres=
ses in
pci_address_to_pio(). As Jason has explained very nicely, we have 3 typ=
es of
architectures here that we try to support:
  - the ones that have separate IO address space (x86)
  - the ones that have 1:1 mapping between physical IO addresses and lo=
gical ports
  - the architectures that memory map the IO addresses in virtual addre=
ss space
    and then translate the logical addresses into virtual based on a gi=
ven offset.

=46or the first two types we don't want to do anything special. Archite=
ctures that
fall in the last category will have to provide their own version of thi=
s function,
with the arm64 version being generic enough to be used as de facto?

But I can see your point of view as well. I just don't know if that is =
good enough
for powerpc and microblaze. With the way things are in my patch, they s=
hould be able
to switch to of_create_pci_host_bridge() easily*, with your suggestion =
they will
have to provide their implementation for pci_register_io_range().

We really need to get another architecture converted. If there are no o=
ther takers I
will make a stab once the current push towards upstreaming AArch64 hard=
ware support
slows down.

* says the newby with confidence in his voice ;)

Liviu


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
