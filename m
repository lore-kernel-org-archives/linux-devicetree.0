From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v7 1/6] pci: Introduce pci_register_io_range() helper
 function.
Date: Mon, 7 Apr 2014 09:35:50 +0100
Message-ID: <20140407083550.GF17163@e106497-lin.cambridge.arm.com>
References: <1394811272-1547-1-git-send-email-Liviu.Dudau@arm.com>
 <1394811272-1547-2-git-send-email-Liviu.Dudau@arm.com>
 <20140405001953.GE15806@google.com>
 <1396777793.3671.15.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396777793.3671.15.camel@pasglop>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 06, 2014 at 10:49:53AM +0100, Benjamin Herrenschmidt wrote:
> On Fri, 2014-04-04 at 18:19 -0600, Bjorn Helgaas wrote:
> > > Introduce a pci_register_io_range() helper function that can be u=
sed
> > > by the architecture code to keep track of the I/O ranges describe=
d by the
> > > PCI bindings. If the PCI_IOBASE macro is not defined that signals
> > > lack of support for PCI and we return an error.
> >=20
> > I don't quite see how you intend to use this, because this series d=
oesn't
> > include any non-stub implementation of pci_register_io_range().
> >=20
> > Is this anything like the ia64 strategy I mentioned above?  If so, =
it would
> > be really nice to unify some of this stuff.
>=20
> We also use two different strategies on ppc32 and ppc64
>=20
>  - On ppc32, inb/outb turn into an MMIO access to _IO_BASE + port
>=20
> That _IO_BASE is a variable which is initialized to the ioremapped ad=
dress
> of the IO space MMIO aperture of the first bridge we discover. Then p=
ort
> numbers are "fixed up" on all other bridges so that the addition _IO_=
BASE + port
> fits the ioremapped address of the IO space on that bridge. A bit mes=
sy... and breaks
> whenever drivers copy port numbers into variables of the wrong type s=
uch as shorts.
>=20
>  - On ppc64, we have more virtual space, so instead we reserve a rang=
e
> of address space (fixed) for IO space, it's always the same. Bridges =
IO spaces
> are then mapped into that range, so we always have a positive offset =
from _IO_BASE
> which makes things a bit more robust and less "surprising" than ppc32=
=2E Additionally,
> the first 64k are reserved. They are only mapped if we see an ISA bri=
dge (which some
> older machines have). Otherwise it's left unmapped, so crappy drivers=
 trying to
> hard code x86 IO ports will blow up immediately which I deem better t=
han silently
> whacking the wrong hardware. In addition, we have a mechanism we use =
on powernv to
> re-route accesses to that first 64k to the power8 built-in LPC bus wh=
ich can
> have some legacy IOs on it such as a UART or a RTC.
>=20
> Cheers,
> Ben.
>=20

Hi Benjamin,

Thanks for the summary, is really useful as I was recently looking into=
 code in that
area. One thing I was trying to understand is why ppc needs _IO_BASE at=
 all rather
than using the generic PCI_IOBASE?=20

Best regards,
Liviu
=20

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
