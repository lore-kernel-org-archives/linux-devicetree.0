From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] arm64: Add architecture support for PCI
Date: Tue, 4 Feb 2014 12:29:51 +0000
Message-ID: <20140204122951.GC27975@e106497-lin.cambridge.arm.com>
References: <1391453028-23191-1-git-send-email-Liviu.Dudau@arm.com>
 <1391453028-23191-2-git-send-email-Liviu.Dudau@arm.com>
 <CAPcvp5EF_=G=VwWLfbw6mwczErTHeq4AbVALYpuAzb3c5eb2rA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CAPcvp5EF_=G=VwWLfbw6mwczErTHeq4AbVALYpuAzb3c5eb2rA@mail.gmail.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Andrew Murray <amurray@embedded-bits.co.uk>
Cc: linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 03, 2014 at 10:34:40PM +0000, Andrew Murray wrote:
> On 3 February 2014 18:43, Liviu Dudau <Liviu.Dudau@arm.com> wrote:
> > diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/i=
o.h
> > index 4cc813e..ce5bad2 100644
> > --- a/arch/arm64/include/asm/io.h
> > +++ b/arch/arm64/include/asm/io.h
> > @@ -120,9 +120,13 @@ static inline u64 __raw_readq(const volatile v=
oid __iomem *addr)
> >  /*
> >   *  I/O port access primitives.
> >   */
> > +#define arch_has_dev_port()    (0)
> >  #define IO_SPACE_LIMIT         0xffff
> >  #define PCI_IOBASE             ((void __iomem *)(MODULES_VADDR - S=
Z_2M))
> >
> > +#define ioport_map(port, nr)   (PCI_IOBASE + ((port) & IO_SPACE_LI=
MIT))
> > +#define ioport_unmap(addr)
>=20
> I'm not sure that this will work. The in[bwl], out[bwl] macros in
> arch/arm64/include/asm/io.h already add the PCI_IOBASE offset.
>=20
> Instead of these two #defines, why not just enforce that
> GENERIC_PCI_IOMAP is enabled? Or at least wrap these defines with 'if
> (!config_enabled(CONFIG_GENERIC_PCI_IOMAP))' or similar.

GENERIC_PCI_IOMAP *is* enabled for AArch64. We have select GENERIC_IOMA=
P in
arch/arm64/Kconfig which in turn selects GENERIC_PCI_IOMAP in lib/Kconf=
ig.

Best regards,
Liviu

>=20
> > +
> >  static inline u8 inb(unsigned long addr)
> >  {
> >         return readb(addr + PCI_IOBASE);
>=20
>=20
> Andrew Murray
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
