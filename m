From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v7 1/6] pci: Introduce pci_register_io_range() helper
 function.
Date: Mon, 7 Apr 2014 14:42:50 +0100
Message-ID: <20140407134250.GL17163@e106497-lin.cambridge.arm.com>
References: <1394811272-1547-1-git-send-email-Liviu.Dudau@arm.com>
 <20140405001953.GE15806@google.com>
 <20140407083120.GE17163@e106497-lin.cambridge.arm.com>
 <5183143.FxBNM0xTAV@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5183143.FxBNM0xTAV@wuerfel>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 07, 2014 at 12:36:15PM +0100, Arnd Bergmann wrote:
> On Monday 07 April 2014 09:31:20 Liviu Dudau wrote:
> > On Sat, Apr 05, 2014 at 01:19:53AM +0100, Bjorn Helgaas wrote:
> >
> > > Host bridges on x86 could have MMIO apertures that turn CPU memor=
y accesses
> > > into PCI port accesses.  We could implement any number of I/O por=
t spaces
> > > this way, by making the kernel inb()/outb()/etc. interfaces smart=
 enough to
> > > use the memory-mapped space instead of (or in addition to) the
> > > INB/OUTB/etc. instructions.
>=20
> PowerPC actually has this already, as CONFIG_PPC_INDIRECT_PIO meaning=
 that
> access to PIO registers is bus specific, and there is also CONFIG_PPC=
_INDIRECT_MMIO
> for the case where MMIO access is not native.
> =20
> > Right, sorry for my ignorance then: how does *currently* the device=
 driver do
> > the I/O transfer transparent of the implementation mechanism? Or th=
ey have
> > intimate knowledge of wether the device is behind a host bridge and=
 can do MMIO
> > or is on an ISA or CF bus and then it needs INB/OUTB ? And if we ma=
ke inb/outb
> > smarter, does that mean that we need to change the drivers?
>=20
> The idea of that would be to not change drivers.
>=20
> My preference here would be to only have a generic function for those
> architectures that have the simple MMIO access all the time.
>=20
> > > ia64 does this (see arch/ia64/include/asm/io.h for a little descr=
iption)
> > > and I think maybe one or two other arches have something similar.
> > >=20
> > > > Introduce a pci_register_io_range() helper function that can be=
 used
> > > > by the architecture code to keep track of the I/O ranges descri=
bed by the
> > > > PCI bindings. If the PCI_IOBASE macro is not defined that signa=
ls
> > > > lack of support for PCI and we return an error.
> > >=20
> > > I don't quite see how you intend to use this, because this series=
 doesn't
> > > include any non-stub implementation of pci_register_io_range().
> > >=20
> > > Is this anything like the ia64 strategy I mentioned above?  If so=
, it would
> > > be really nice to unify some of this stuff.
> >=20
> > After discussions with Arnd and Catalin I know have a new series th=
at moves
> > some of the code from arm64 series into this one. I am putting it t=
hrough
> > testing right know as I am going to have to depend on another serie=
s that
> > makes PCI_IOBASE defined only for architectures that do MMIO in ord=
er to
> > choose the correct default implementation for these functions. My h=
ope is
> > that I will be able to send the series this week.
>=20
> I think migrating other architectures to use the same code should be
> a separate effort from adding a generic implementation that can be
> used by arm64. It's probably a good idea to have patches to convert
> arm32 and/or microblaze.

Agree. My updated series only moves the arm64 code into framework to ma=
ke the
arm64 part a noop.

Liviu

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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
