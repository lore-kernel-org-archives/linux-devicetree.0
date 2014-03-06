From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v6 1/3] Fix ioport_map() for !CONFIG_GENERIC_IOMAP	cases.
Date: Thu, 6 Mar 2014 10:36:20 +0000
Message-ID: <20140306103620.GB6457@e106497-lin.cambridge.arm.com>
References: <1394020150-1875-1-git-send-email-Liviu.Dudau@arm.com>
 <1394020150-1875-2-git-send-email-Liviu.Dudau@arm.com>
 <20140305233135.GZ21483@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20140305233135.GZ21483@n2100.arm.linux.org.uk>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, linaro-kernel <linaro-kernel@lists.linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, LKML <linux-kernel@vger.kernel.org>, Tanmay Inamdar <tinamdar@apm.com>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 05, 2014 at 11:31:35PM +0000, Russell King - ARM Linux wrot=
e:
> On Wed, Mar 05, 2014 at 11:49:08AM +0000, Liviu Dudau wrote:
> > The inline version of ioport_map() that gets used when !CONFIG_GENE=
RIC_IOMAP
> > is wrong. It returns a mapped (i.e. virtual) address that can start=
 from
> > zero and completely ignores the PCI_IOBASE and IO_SPACE_LIMIT that =
most
> > architectures that use !CONFIG_GENERIC_MAP define.
>=20
> What value does PCI_IOBASE and IO_SPACE_LIMIT have on other architect=
ures
> who make use of asm-generic/io.h ?

Hi Russell,

Sorry for being a bit opaque in the commit message, I probably conflate=
d two
issues into one. The first issue is that ioport_map() is supposed to re=
turn
a virtual address for the IO port. I struggle to believe that a virtual=
 address
of zero for IO is valid for most architectures other than x86. My guess=
 is that
most of the architectures that you have listed as including asm-generic=
/io.h
have no support for PCI whatsoever. The other issue is that *if* you sp=
ecify an
PCI_IOBASE and don't come up with your own version of ioport_map() then=
 you
get the wrong virtual addresses back.

One way to fix all this is to use PCI_IOBASE inside the generic version=
 and to
define it to a non-zero values for architectures that have memory mappe=
d IO.
That should reduce the number of custom versions of ioport_map() that w=
e currently
have.

The other implied message that I'm getting is that you are suggesting t=
hat the
commit message is generalising a bit too much? With that I agree, in li=
ght of
your analysis. I can change it to something like:

   The inline version of ioport_map() that gets used for !CONFIG_GENERI=
C_IOMAP is
   wrong when PCI_IOBASE has a non-zero value. The function is supposed=
 to return
   a virtual address for IO ports and for architectures that memory map=
 the IO
   areas that is giving incorrect results as it ignores PCI_IOBASE. Fix=
 this and
   also limit the port range to the IO_SPACE_LIMIT mask.

>=20
> $ git grep asm-generic/io.h arch/
> arch/arc/include/asm/io.h:#include <asm-generic/io.h>
> arch/blackfin/include/asm/io.h:#include <asm-generic/io.h>
> arch/metag/include/asm/io.h:#include <asm-generic/io.h>
> arch/microblaze/include/asm/io.h:/* from asm-generic/io.h */
> arch/openrisc/include/asm/io.h:#include <asm-generic/io.h>
> arch/s390/include/asm/io.h:#include <asm-generic/io.h>
> arch/score/include/asm/io.h:#include <asm-generic/io.h>
> arch/unicore32/include/asm/io.h:#include <asm-generic/io.h>

PCI_IOBASE =3D PKUNITY_PCILIO_BASE =3D PKUNITY_PCI_BASE + 0x00030000 =3D=
=20
    io_p2v(0x80000000) + 0x00030000

All other ones bar arm64 are either happy with PCI_IOBASE being zero (p=
roxy for
"no PCI support") or define their own version of ioport_map().

Best regards,
Liviu

> arch/xtensa/include/asm/io.h:#include <asm-generic/io.h>
> $ arch/arc/include/asm/io.h:#define PCI_IOBASE ((void __iomem *)0)
> arch/arm64/include/asm/io.h:#define PCI_IOBASE          ((void __iome=
m *)(MODULES_VADDR - SZ_2M))
> arch/arm64/include/asm/io.h:    return readb(addr + PCI_IOBASE);
> arch/arm64/include/asm/io.h:    return readw(addr + PCI_IOBASE);
> arch/arm64/include/asm/io.h:    return readl(addr + PCI_IOBASE);
> arch/arm64/include/asm/io.h:    writeb(b, addr + PCI_IOBASE);
> arch/arm64/include/asm/io.h:    writew(b, addr + PCI_IOBASE);
> arch/arm64/include/asm/io.h:    writel(b, addr + PCI_IOBASE);
> arch/arm64/include/asm/io.h:            *buf++ =3D __raw_readb(addr +=
 PCI_IOBASE);
> arch/arm64/include/asm/io.h:            *buf++ =3D __raw_readw(addr +=
 PCI_IOBASE);
> arch/arm64/include/asm/io.h:            *buf++ =3D __raw_readl(addr +=
 PCI_IOBASE);
> arch/arm64/include/asm/io.h:            __raw_writeb(*buf++, addr + P=
CI_IOBASE);
> arch/arm64/include/asm/io.h:            __raw_writew(*buf++, addr + P=
CI_IOBASE);
> arch/arm64/include/asm/io.h:            __raw_writel(*buf++, addr + P=
CI_IOBASE);
> arch/unicore32/include/asm/io.h:#define PCI_IOBASE      PKUNITY_PCILI=
O_BASE
> arch/unicore32/include/asm/io.h:#define PIO_OFFSET              (unsi=
gned int)(PCI_IOBASE)
>=20
>=20
> --=20
> FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... sl=
owly
> improving, and getting towards what was expected from it.
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
