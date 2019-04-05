From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: sun50i: h6: Introduce Beelink GS1 board
Date: Fri, 5 Apr 2019 14:02:17 +0200
Message-ID: <CAJiuCcdGHgUgUg5xAVPjcxeCqJwnoVjf69_CJaWF22iGPNfniw@mail.gmail.com>
References: <20190404124504.11137-1-peron.clem@gmail.com> <20190404124504.11137-2-peron.clem@gmail.com>
 <20190405090836.cyz2eabxpqjgesig@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190405090836.cyz2eabxpqjgesig@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, 5 Apr 2019 at 11:08, Maxime Ripard <maxime.ripard@bootlin.com> wrot=
e:
>
> Hi,
>
> On Thu, Apr 04, 2019 at 02:45:04PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Beelink GS1 is an Allwinner H6 based TV box,
> > which support:
> > - Allwinner H6 Quad-core 64-bit ARM Cortex-A53
> > - GPU Mali-T720
> > - 2GB LPDDR3 RAM
> > - AXP805 PMIC
> > - 1Gbps GMAC via RTL8211E
> > - FN-Link 6222B-SRB Wifi/BT
> > - 1x USB 2.0 Host and 1x USB 3.0 Host
> > - HDMI port
> > - S/PDIF Tx
> > - IR receiver
> > - 5V/2A DC power supply
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >
> > Thanks to Jagan and Icenowy, most of this devicetree is taken from thei=
r works on
> > the OrangePi One Plus and Pine H64.
> >
> >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >  .../dts/allwinner/sun50i-h6-beelink-gs1.dts   | 252 ++++++++++++++++++
> >  2 files changed, 253 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1=
.dts
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/d=
ts/allwinner/Makefile
> > index e4dce2f6fa3a..2dd806a3d5c9 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -20,6 +20,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-pc2.=
dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-prime.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus2.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-beelink-gs1.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-lite2.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-one-plus.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/=
arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
> > new file mode 100644
> > index 000000000000..d927e7d33bf3
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
> > @@ -0,0 +1,252 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> > +/*
> > + * Copyright (C) 2019 Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-h6.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/ {
> > +     model =3D "Beelink GS1";
> > +     compatible =3D "azw,beelink-gs1", "allwinner,sun50i-h6";
>
> Please add that board to
> Documentation/devicetree/bindings/arm/sunxi.yaml, it's new and in
> linux-next.

OK didn't know about that will do it.

>
> > +&mmc0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&mmc0_pins>;
> > +     vmmc-supply =3D <&reg_cldo1>;
> > +     cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;
> > +     bus-width =3D <4>;
> > +     status =3D "okay";
> > +};
> > +
> > +&mmc2 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&mmc2_pins>;
>
> If those (mmc0 and mmc2_pins) are the only muxing options as their
> names suggests, it should be set in the DTSI.
Yes, it's the only muxing. I will add a patch to move these in the SOC dtsi=
.

>
> If not, the name of the pin group should be changed.
>
> > +                     reg_cldo2: cldo2 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <3300000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-name =3D "vcc-wifi-1";
> > +                     };
> > +
> > +                     reg_cldo3: cldo3 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <3300000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-name =3D "vcc-wifi-2";
> > +                     };
>
> I don't see any SDIO bus declared, why do you need those regulators on?
You're right forget to remove. Will do.

>
> Can you also declare the PIO regulators?
Ok,

Thanks for the review.


>
> Thanks!
> Maxmie
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
