From: deadcom@gmail.com
Subject: Re: [PATCH v3] ARM: dts: sun8i: Add dts file for Olimex A33-OLinuXino
Date: Thu, 23 Jun 2016 04:01:53 -0700 (PDT)
Message-ID: <8e5b45fe-f60b-419f-8b00-b816ffe5d98c@googlegroups.com>
References: <1466418769-8384-1-git-send-email-stefan.mavrodiev@gmail.com>
 <20160622132222.GX26668@lukather>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="----=_Part_395_557646352.1466679714127"
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160622132222.GX26668@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-sunxi <linux-sunxi@googlegroups.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.co, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, stefan.mavrodiev@gmail.com, wens@csie.org, robh+dt@kernel.org, galak@codeaurora.org, maxime.ripard@free-electrons.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

------=_Part_395_557646352.1466679714127
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80=D1=8F=D0=B4=D0=B0, 22 =D1=8E=D0=BD=D0=B8 2016 =D0=B3., 16:22:3=
4 UTC+3, Maxime Ripard =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0:
> Hi,
>=20
> On Mon, Jun 20, 2016 at 01:32:49PM +0300, Stefan Mavrodiev wrote:
> > A33-OLinuXino is A33 development board designed by Olimex LTD.
> >=20
> > It has AXP233 PMU, 1GB DRAM, a micro SD card, one USB-OTG connector,
> > headphone and mic jacks, connector for LiPo battery and optional
> > 4GB NAND Flash.
> >=20
> > It has two 40-pin headers. One for LCD panel, and one for
> > additional modules. Also there is CSI/DSI connector.
>=20
> Oh? So it ships already? Nice!

Not yet, but very soon will.
>=20
> > Signed-off-by: Stefan Mavrodiev <stefan.mavrodiev@gmail.com>
> > ---
> > Changes for v2:
> > =09- Removed unused power nodes
> > =09- Removed default-trigger for green led
> > =09- Removed "always-on" option for LCD power
> >=20
> > Changes for v3:
> > =09- Nodes are sorted alphabetically
> >=20
> >  arch/arm/boot/dts/Makefile                |   1 +
> >  arch/arm/boot/dts/sun8i-a33-olinuxino.dts | 207 ++++++++++++++++++++++=
++++++++
> >  2 files changed, 208 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/sun8i-a33-olinuxino.dts
> >=20
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 970e906..b78f363 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -760,6 +760,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
> >  =09sun8i-a33-ippo-q8h-v1.2.dtb \
> >  =09sun8i-a33-q8-tablet.dtb \
> >  =09sun8i-a33-sinlinx-sina33.dtb \
> > +=09sun8i-a33-olinuxino.dtb \
>=20
> This should be ordered alphabetically.
>=20
> >  =09sun8i-a83t-allwinner-h8homlet-v2.dtb \
> >  =09sun8i-a83t-cubietruck-plus.dtb \
> >  =09sun8i-h3-orangepi-2.dtb \
> > diff --git a/arch/arm/boot/dts/sun8i-a33-olinuxino.dts b/arch/arm/boot/=
dts/sun8i-a33-olinuxino.dts
> > new file mode 100644
> > index 0000000..586ffd3
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/sun8i-a33-olinuxino.dts
> > @@ -0,0 +1,207 @@
> > +/*
> > + * Copyright 2016 - Stefan Mavrodiev <stefan.mavrodiev@gmail.com>
> > + *                  Olimex LTD. <support@olimex.com>
> > + *
> > + * This file is dual-licensed: you can use it either under the terms
> > + * of the GPL or the X11 license, at your option. Note that this dual
> > + * licensing only applies to this file, and not this project as a
> > + * whole.
> > + *
> > + *  a) This file is free software; you can redistribute it and/or
> > + *     modify it under the terms of the GNU General Public License as
> > + *     published by the Free Software Foundation; either version 2 of =
the
> > + *     License, or (at your option) any later version.
> > + *
> > + *     This file is distributed in the hope that it will be useful,
> > + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *     GNU General Public License for more details.
> > + *
> > + * Or, alternatively,
> > + *
> > + *  b) Permission is hereby granted, free of charge, to any person
> > + *     obtaining a copy of this software and associated documentation
> > + *     files (the "Software"), to deal in the Software without
> > + *     restriction, including without limitation the rights to use,
> > + *     copy, modify, merge, publish, distribute, sublicense, and/or
> > + *     sell copies of the Software, and to permit persons to whom the
> > + *     Software is furnished to do so, subject to the following
> > + *     conditions:
> > + *
> > + *     The above copyright notice and this permission notice shall be
> > + *     included in all copies or substantial portions of the Software.
> > + *
> > + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> > + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> > + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> > + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > + *     OTHER DEALINGS IN THE SOFTWARE.
> > + */
> > +
> > +/dts-v1/;
> > +#include "sun8i-a33.dtsi"
> > +#include "sunxi-common-regulators.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/pinctrl/sun4i-a10.h>
> > +
> > +/ {
> > +=09model =3D "A33-OLinuXino";
>=20
> Olimex A33-Olinuxino
>=20
> > +=09compatible =3D "allwinner,sun8i-a33";
>=20
> And you should have an extra compatible for your board here.
>=20
> > +
> > +=09aliases {
> > +=09=09serial0 =3D &uart0;
> > +=09};
> > +
> > +=09chosen {
> > +=09=09stdout-path =3D "serial0:115200n8";
> > +=09};
> > +
> > +=09leds {
> > +=09=09compatible =3D "gpio-leds";
> > +=09=09pinctrl-names =3D "default";
> > +=09=09pinctrl-0 =3D <&led_pin_olinuxino>;
> > +
> > +=09=09green {
> > +=09=09=09label =3D "olinuxino:green:usr";
>=20
> The first part of the label is usually the board name, a33-olinuxino
> in that case.
>=20
> > +=09=09=09gpios =3D <&pio 1 7 GPIO_ACTIVE_HIGH>; /* LED2 */
> > +=09=09};
> > +=09};
> > +};
> > +
> > +&ehci0 {
> > +=09status =3D "okay";
> > +};
> > +
> > +&mmc0 {
> > +=09pinctrl-names =3D "default";
> > +=09pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin_olinuxino>;
> > +=09vmmc-supply =3D <&reg_dcdc1>;
> > +=09bus-width =3D <4>;
> > +=09cd-gpios =3D <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
> > +=09cd-inverted;
> > +=09status =3D "okay";
> > +};
> > +
> > +&ohci0 {
> > +=09status =3D "okay";
> > +};
> > +
> > +&pio {
> > +=09led_pin_olinuxino: led_pins@0 {
> > +=09=09allwinner,pins =3D "PB7";
> > +=09        allwinner,function =3D "gpio_out";
> > +=09=09allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> > +=09=09allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> > +    };
> > +
> > +=09mmc0_cd_pin_olinuxino: mmc0_cd_pin@0 {
> > +=09=09allwinner,pins =3D "PB4";
> > +=09=09allwinner,function =3D "gpio_in";
> > +=09=09allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> > +=09=09allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> > +=09};
> > +};
> > +
> > +&r_rsb {
> > +=09status =3D "okay";
> > +
> > +=09axp22x: pmic@3a3 {
> > +=09=09compatible =3D "x-powers,axp223";
> > +=09=09reg =3D <0x3a3>;
> > +=09=09interrupt-parent =3D <&nmi_intc>;
> > +=09=09interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> > +=09=09eldoin-supply =3D <&reg_dcdc1>;
> > +=09};
> > +};
> > +
> > +#include "axp22x.dtsi"
> > +
> > +&reg_aldo1 {
> > +=09regulator-always-on;
> > +=09regulator-min-microvolt =3D <3300000>;
> > +=09regulator-max-microvolt =3D <3300000>;
> > +=09regulator-name =3D "vcc-io";
> > +};
> > +
> > +&reg_aldo2 {
> > +=09regulator-always-on;
> > +=09regulator-min-microvolt =3D <2350000>;
> > +=09regulator-max-microvolt =3D <2650000>;
> > +=09regulator-name =3D "vdd-dll";
> > +};
> > +
> > +&reg_aldo3 {
> > +=09regulator-always-on;
> > +=09regulator-min-microvolt =3D <3300000>;
> > +=09regulator-max-microvolt =3D <3300000>;
> > +=09regulator-name =3D "vcc-avcc";
> > +};
> > +
> > +&reg_dc1sw {
> > +=09regulator-name =3D "vcc-lcd";
> > +};
> > +
> > +&reg_dc5ldo {
> > +=09regulator-always-on;
> > +=09regulator-min-microvolt =3D <900000>;
> > +=09regulator-max-microvolt =3D <1400000>;
> > +=09regulator-name =3D "vdd-cpus";
> > +};
> > +
> > +&reg_dcdc1 {
> > +=09regulator-always-on;
> > +=09regulator-min-microvolt =3D <3300000>;
> > +=09regulator-max-microvolt =3D <3300000>;
> > +=09regulator-name =3D "vcc-dsi";
> > +};
> > +
> > +&reg_dcdc2 {
> > +=09regulator-always-on;
> > +=09regulator-min-microvolt =3D <900000>;
> > +=09regulator-max-microvolt =3D <1400000>;
> > +=09regulator-name =3D "vdd-sys";
> > +};
> > +
> > +&reg_dcdc3 {
> > +=09regulator-always-on;
> > +=09regulator-min-microvolt =3D <900000>;
> > +=09regulator-max-microvolt =3D <1400000>;
> > +=09regulator-name =3D "vdd-cpu";
> > +};
> > +
> > +&reg_dcdc5 {
> > +=09regulator-always-on;
> > +=09regulator-min-microvolt =3D <1500000>;
> > +=09regulator-max-microvolt =3D <1500000>;
> > +=09regulator-name =3D "vcc-dram";
> > +};
> > +
> > +&reg_rtc_ldo {
> > +=09regulator-name =3D "vcc-rtc";
> > +};
> > +
> > +&simplefb_lcd {
> > +=09vcc-lcd-supply =3D <&reg_dc1sw>;
> > +};
> > +
> > +&uart0 {
> > +=09pinctrl-names =3D "default";
> > +=09pinctrl-0 =3D <&uart0_pins_b>;
> > +=09status =3D "okay";
> > +};
> > +
> > +&usb_otg {
> > +=09dr_mode =3D "host";
> > +=09status =3D "okay";
> > +};
> > +
> > +&usbphy {
> > +=09usb0_vbus-supply =3D <&reg_vcc5v0>;
> > +=09status =3D "okay";
> > +
> > +};
>=20
> It doesn't work as USB OTG ?

The hardware should work as OTG. In FEL mode it works as device, and in cur=
rent dt configuration - as host. I've spend some time trying to make it wor=
k as otg, but didn't succeed.=20

There are some hardware differences between our board and other a33, but if=
 you say that OTG work, I'll spend some additional time working on it.

>=20
> Thanks,
> Maxime
>=20
> --=20
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Regards,
Stefan Mavrodiev
Olimex LTD.

------=_Part_395_557646352.1466679714127
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

------=_Part_395_557646352.1466679714127--
