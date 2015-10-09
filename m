From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH 3/4] arm64: Juno: Add support for the PCIe host bridge on
 Juno R1
Date: Fri, 9 Oct 2015 15:11:07 +0100
Message-ID: <20151009141107.GD3394@e106497-lin.cambridge.arm.com>
References: <1444398323-17354-1-git-send-email-Liviu.Dudau@arm.com>
 <1444398323-17354-4-git-send-email-Liviu.Dudau@arm.com>
 <CAL_JsqJsb53VXiUfjGBXK37dBEi1r-PXVohg-c-7_x63R04VMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJsb53VXiUfjGBXK37dBEi1r-PXVohg-c-7_x63R04VMA@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Jon Medhurst <tixy@linaro.org>, linux-pci <linux-pci@vger.kernel.org>, device-tree <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 09, 2015 at 08:54:33AM -0500, Rob Herring wrote:
> On Fri, Oct 9, 2015 at 8:45 AM, Liviu Dudau <Liviu.Dudau@arm.com> wro=
te:
> > Juno R1 board sports a functional PCIe host bridge that is
> > compliant with the SBSA standard found here[1]. With the right
> > firmware that initialises the XpressRICH3 controller one can
> > use the generic Host Bridge driver to use the PCIe hardware.
> >
> > Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> >
> > [1] http://infocenter.arm.com/help/topic/com.arm.doc.den0029a/
> > ---
> >  arch/arm64/boot/dts/arm/juno-r1.dts | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/=
dts/arm/juno-r1.dts
> > index c627511..a702a6b 100644
> > --- a/arch/arm64/boot/dts/arm/juno-r1.dts
> > +++ b/arch/arm64/boot/dts/arm/juno-r1.dts
> > @@ -109,6 +109,26 @@
> >
> >         #include "juno-base.dtsi"
> >
> > +       pcie-controller@40000000 {
> > +               compatible =3D "pci-host-ecam-generic";
>=20
> I think this is the first case of real h/w using this. We should have
> a specific compatible here additionally.

Or maybe I can claim the use of the string on account on being the firs=
t on arm64 ;)

I can add a vendor prefix if you want, but pci-host-generic is going to=
 ignore it=20
*because* it is trying to be a generic driver.

>  Perhaps the firmware did not setup something correctly.

Hope not :) I no longer have that much input into the UEFI firmware, bu=
t for U-Boot is
is all in the open and can be fixed at any time (?).

Thanks for reviewing this!

Best regards,
Liviu

>=20
> > +               device_type =3D "pci";
> > +               reg =3D <0 0x40000000 0 0x10000000>;      /* ECAM c=
onfig space */
> > +               bus-range =3D <0 255>;
> > +               linux,pci-domain =3D <0>;
> > +               #address-cells =3D <3>;
> > +               #size-cells =3D <2>;
> > +               dma-coherent;
> > +               ranges =3D <0x01000000 0x00 0x5f800000 0x00 0x5f800=
000 0x0 0x00800000
> > +                         0x02000000 0x00 0x50000000 0x00 0x5000000=
0 0x0 0x08000000
> > +                         0x42000000 0x40 0x00000000 0x40 0x0000000=
0 0x1 0x00000000>;
> > +               #interrupt-cells =3D <1>;
> > +               interrupt-map-mask =3D <0 0 0 7>;
> > +               interrupt-map =3D <0 0 0 1 &gic 0 0 0 136 4
> > +                                0 0 0 2 &gic 0 0 0 137 4
> > +                                0 0 0 3 &gic 0 0 0 138 4
> > +                                0 0 0 4 &gic 0 0 0 139 4>;
> > +               msi-parent =3D <&v2m_0>;
> > +       };
> >  };
> >
> >  &memtimer {
> > --
> > 2.6.0
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetre=
e" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
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
