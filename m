From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: sun8i: Add Parrot Board DTS
Date: Mon, 20 Jun 2016 17:44:52 +0200
Message-ID: <20160620154452.GL26668@lukather>
References: <1465812931-22824-1-git-send-email-quentin.schulz@free-electrons.com>
 <1465812931-22824-2-git-send-email-quentin.schulz@free-electrons.com>
 <CAGb2v64jduBijEXzsKbOpSvLd9YHwO=qpSyPSDuYtMPg8wfKzA@mail.gmail.com>
 <575FFFBE.5090107@free-electrons.com>
 <CAGb2v67JGG35odB7kEAoF0kGes=KRGoREOSTc_GM0B4A+8cKWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7891237103051309314=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGb2v67JGG35odB7kEAoF0kGes=KRGoREOSTc_GM0B4A+8cKWg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Hans De Goede <hdegoede@redhat.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux@armlinux.org.uk, linux-kernel <linux-kernel@vger.kernel.org>, Quentin Schulz <quentin.schulz@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============7891237103051309314==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YIleam+9adpUeYf+"
Content-Disposition: inline


--YIleam+9adpUeYf+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 14, 2016 at 09:19:58PM +0800, Chen-Yu Tsai wrote:
> On Tue, Jun 14, 2016 at 8:59 PM, Quentin Schulz
> <quentin.schulz@free-electrons.com> wrote:
> > Hi,
> >
> > On 13/06/2016 15:04, Chen-Yu Tsai wrote:
> >> Hi,
> >>
> >> On Mon, Jun 13, 2016 at 6:15 PM, Quentin Schulz
> >> <quentin.schulz@free-electrons.com> wrote:
> >>> The Parrot Board is an evaluation board with an Allwinner R16 (assumed
> >>> to be close to an Allwinner A33), 4GB of NAND, 512MB of RAM, USB host
> >>
> >> You say NAND here, but you enable mmc2 for eMMC below. Please correct =
it.
> >>
> >
> > ACK.
> >
> >>> and OTG, a WiFi/Bluetooth combo chip, a micro SD Card reader, 2
> >>> controllable buttons, an LVDS port with separated backlight and
> >>> capacitive touch panel ports, an audio/microphone jack, a camera CSI
> >>> port, 2 sets of 22 GPIOs and an accelerometer.
> >>
> >> I assume the board is this one:
> >>
> >> https://world.taobao.com/item/530374411673.htm
> >>
> >
> > Definitely looks like it.
> >
> >>> Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
> >>> ---
> >>>  arch/arm/boot/dts/Makefile             |   1 +
> >>>  arch/arm/boot/dts/sun8i-r16-parrot.dts | 333 +++++++++++++++++++++++=
++++++++++
> >>>  2 files changed, 334 insertions(+)
> >>>  create mode 100644 arch/arm/boot/dts/sun8i-r16-parrot.dts
> >>>
> >>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> >>> index 06b6c2d..1149512 100644
> >>> --- a/arch/arm/boot/dts/Makefile
> >>> +++ b/arch/arm/boot/dts/Makefile
> >>> @@ -760,6 +760,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
> >>>         sun8i-a33-ippo-q8h-v1.2.dtb \
> >>>         sun8i-a33-q8-tablet.dtb \
> >>>         sun8i-a33-sinlinx-sina33.dtb \
> >>> +       sun8i-r16-parrot.dtb \
> >>>         sun8i-a83t-allwinner-h8homlet-v2.dtb \
> >>>         sun8i-a83t-cubietruck-plus.dtb \
> >>>         sun8i-h3-orangepi-2.dtb \
> >>> diff --git a/arch/arm/boot/dts/sun8i-r16-parrot.dts b/arch/arm/boot/d=
ts/sun8i-r16-parrot.dts
> >>> new file mode 100644
> >>> index 0000000..75e2420
> >>> --- /dev/null
> >>> +++ b/arch/arm/boot/dts/sun8i-r16-parrot.dts
> >>> @@ -0,0 +1,333 @@
> >>> +/*
> >>> + * Copyright 2015 Quentin Schulz
> >>> + *
> >>> + * Quentin Schulz <quentin.schulz@free-electrons.com>
> >>> + *
> >>> + * This file is dual-licensed: you can use it either under the terms
> >>> + * of the GPL or the X11 license, at your option. Note that this dual
> >>> + * licensing only applies to this file, and not this project as a
> >>> + * whole.
> >>> + *
> >>> + *  a) This file is free software; you can redistribute it and/or
> >>> + *     modify it under the terms of the GNU General Public License as
> >>> + *     published by the Free Software Foundation; either version 2 o=
f the
> >>> + *     License, or (at your option) any later version.
> >>> + *
> >>> + *     This file is distributed in the hope that it will be useful,
> >>> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> >>> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >>> + *     GNU General Public License for more details.
> >>> + *
> >>> + * Or, alternatively,
> >>> + *
> >>> + *  b) Permission is hereby granted, free of charge, to any person
> >>> + *     obtaining a copy of this software and associated documentation
> >>> + *     files (the "Software"), to deal in the Software without
> >>> + *     restriction, including without limitation the rights to use,
> >>> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> >>> + *     sell copies of the Software, and to permit persons to whom the
> >>> + *     Software is furnished to do so, subject to the following
> >>> + *     conditions:
> >>> + *
> >>> + *     The above copyright notice and this permission notice shall be
> >>> + *     included in all copies or substantial portions of the Softwar=
e.
> >>> + *
> >>> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIN=
D,
> >>> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTI=
ES
> >>> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> >>> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> >>> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> >>> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> >>> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> >>> + *     OTHER DEALINGS IN THE SOFTWARE.
> >>> + */
> >>> +
> >>> +/dts-v1/;
> >>> +#include "sun8i-a33.dtsi"
> >>> +#include "sunxi-common-regulators.dtsi"
> >>> +
> >>> +#include <dt-bindings/gpio/gpio.h>
> >>> +#include <dt-bindings/input/input.h>
> >>> +
> >>> +/ {
> >>> +       model =3D "Allwinner Parrot EVB R16";
> >>> +       compatible =3D "allwinner,parrot-evb-r16", "allwinner,sun8i-a=
33";
> >>> +
> >>> +       aliases {
> >>> +               serial0 =3D &uart0;
> >>> +       };
> >>> +
> >>> +       chosen {
> >>> +               stdout-path =3D "serial0:115200n8";
> >>> +       };
> >>> +
> >>> +       leds {
> >>> +               compatible =3D "gpio-leds";
> >>> +               pinctrl-names =3D "default";
> >>> +               pinctrl-0 =3D <&led_pins_r16>;
> >>
> >> IMO r16 is too generic. You may want to add parrot_ or parrot_evb_ to =
it.
> >> Same goes for all the other r16 identifier names.
> >>
> >
> > ACK.
> >
> >>> +
> >>> +               led1 {
> >>> +                       label =3D "r16:led1:usr";
> >>> +                       gpio =3D <&pio 4 17 GPIO_ACTIVE_HIGH>; /* PE1=
7 */
> >>> +               };
> >>> +
> >>> +               led2 {
> >>> +                       label =3D "r16:led2:usr";
> >>> +                       gpio =3D <&pio 4 16 GPIO_ACTIVE_HIGH>; /* PE1=
6 */
> >>> +               };
> >>> +       };
> >>> +
> >>> +       wifi_pwrseq: wifi_pwrseq {
> >>> +               compatible =3D "mmc-pwrseq-simple";
> >>> +               reset-gpios =3D <&r_pio 0 6 GPIO_ACTIVE_LOW>; /* PL06=
 */
> >>> +       };
> >>> +
> >>> +};
> >>> +
> >>> +&ehci0 {
> >>> +       status =3D "okay";
> >>> +};
> >>> +
> >>> +&i2c1 {
> >>> +       pinctrl-names =3D "default";
> >>> +       pinctrl-0 =3D <&i2c1_pins_a>;
> >>> +       status =3D "okay";
> >>
> >> Nothing connected? A comment mentioning which connector this is on
> >> if it's not directly connecting something on the board would be nice.
> >>
> >
> > An accelerometer is connected to this i2c, but:
> > 1) The given address of the i2c device given by i2cdetect is not the
> > same as specified in both fex and schematics.
> > 2) The accelerometer has a "product reference" on the schematics for a
> > Broadcom BMA250 but the associated driver does not work with it.
> >
> > So there is an accelerometer connected to this i2c but I've not found
> > yet what can drive it. I could add a comment specifying the
> > accelerometer is attached to this i2c or remove the node?
>=20
> A comment will suffice, until you figure out what exactly is on there.
>=20
> >
> >>> +};
> >>> +
> >>> +&lradc {
> >>> +       vref-supply =3D <&reg_aldo3>;
> >>> +       status =3D "okay";
> >>> +
> >>> +       button@0 {
> >>> +               label =3D "V+";
> >>> +               linux,code =3D <KEY_VOLUMEUP>;
> >>> +               channel =3D <0>;
> >>> +               voltage =3D <190000>;
> >>> +       };
> >>> +
> >>> +       button@1 {
> >>> +               label =3D "V-";
> >>> +               linux,code =3D <KEY_VOLUMEDOWN>;
> >>> +               channel =3D <0>;
> >>> +               voltage =3D <390000>;
> >>> +       };
> >>> +
> >>> +};
> >>> +
> >>> +&mmc0 {
> >>> +       pinctrl-names =3D "default";
> >>> +       pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin_parrot>;
> >>> +       vmmc-supply =3D <&reg_dcdc1>;
> >>> +       cd-gpios =3D <&pio 3 14 GPIO_ACTIVE_LOW>; /* PD14 */
> >>> +       bus-width =3D <4>;
> >>> +       status =3D "okay";
> >>> +};
> >>> +
> >>> +&mmc1 {
> >>> +       pinctrl-names =3D "default";
> >>> +       pinctrl-0 =3D <&mmc1_pins_a>, <&wifi_reset_pin_r16>;
> >>> +       vmmc-supply =3D <&reg_aldo1>;
> >>
> >> This looks fishy. See below.
> >>
> >>> +       mmc-pwrseq =3D <&wifi_pwrseq>;
> >>> +       bus-width =3D <4>;
> >>> +       non-removable;
> >>> +       status =3D "okay";
> >>> +};
> >>> +
> >>> +&mmc2 {
> >>> +       pinctrl-names =3D "default";
> >>> +       pinctrl-0 =3D <&mmc2_8bit_pins>;
> >>> +       vmmc-supply =3D <&reg_dcdc1>;
> >>> +       bus-width =3D <8>;
> >>> +       non-removable;
> >>> +       cap-mmc-hw-reset;
> >>> +       status =3D "okay";
> >>> +};
> >>> +
> >>> +&mmc2_8bit_pins {
> >>> +       allwinner,drive =3D <SUN4I_PINCTRL_40_MA>;
> >>> +       allwinner,pull =3D <SUN4I_PINCTRL_PULL_UP>;
> >>> +};
> >>> +
> >>> +&ohci0 {
> >>> +       status =3D "okay";
> >>> +};
> >>> +
> >>> +&pio {
> >>> +       mmc0_cd_pin_parrot: mmc0_cd_pin@0 {
> >>
> >> _parrot suffix works as well.
> >>
> >>> +               allwinner,pins =3D "PD14";
> >>> +               allwinner,function =3D "gpio_in";
> >>> +               allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> >>> +               allwinner,pull =3D <SUN4I_PINCTRL_PULL_UP>;
> >>> +       };
> >>> +
> >>> +       led_pins_r16: led_pins@0 {
> >>> +               allwinner,pins =3D "PE16", "PE17";
> >>> +               allwinner,function =3D "gpio_out";
> >>> +               allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> >>> +               allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> >>> +       };
> >>> +
> >>> +       usb0_id_det: usb0_id_detect_pin@0 {
> >>> +               allwinner,pins =3D "PD10";
> >>> +               allwinner,function =3D "gpio_in";
> >>> +               allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> >>> +               allwinner,pull =3D <SUN4I_PINCTRL_PULL_UP>;
> >>> +       };
> >>> +
> >>> +       usb1_vbus_pin_r16: usb1_vbus_pin@0 {
> >>> +               allwinner,pins =3D "PD12";
> >>> +               allwinner,function =3D "gpio_out";
> >>> +               allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> >>> +               allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> >>> +       };
> >>> +};
> >>> +
> >>> +&r_pio {
> >>> +       wifi_reset_pin_r16: wifi_reset_pin@3 {
> >>
> >> Why @3?
> >>
> >
> > This is a typo, I'll correct it.
> >
> >>> +               allwinner,pins =3D "PL6";
> >>> +               allwinner,function =3D "gpio_out";
> >>> +               allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> >>> +               allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> >>> +       };
> >>> +};
> >>> +
> >>> +&r_rsb {
> >>> +       status =3D "okay";
> >>> +
> >>> +       axp22x: pmic@3a3 {
> >>> +               compatible =3D "x-powers,axp223";
> >>> +               reg =3D <0x3a3>;
> >>> +               interrupt-parent =3D <&nmi_intc>;
> >>> +               interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> >>> +               eldoin-supply =3D <&reg_dcdc1>;
> >>
> >> A drivevbus-supply referencing reg_vcc5v0 here would be better.
> >>
> >
> > ACK.
> >
> >>> +               x-powers,drive-vbus-en;
> >>> +       };
> >>> +};
> >>> +
> >>> +#include "axp22x.dtsi"
> >>> +
> >>> +&reg_aldo1 {
> >>> +       regulator-always-on;
> >>> +       regulator-min-microvolt =3D <3000000>;
> >>> +       regulator-max-microvolt =3D <3000000>;
> >>> +       regulator-name =3D "aldo1";
> >>
> >> What is this for exactly? Would turning it off render the system inope=
rable?
> >> How was it referenced in the fex file?
> >>
> >> If this is for WiFi I/O VCC, then you should specify it in mmc1 with
> >> vqmmc-supply.
> >>
> >
> > In the fex, aldo1 is one of the three power inputs for the WiFi (the
> > others being dldo1 and dldo2) and in the schematics it is linked to
> > both VCC-USB and VCC-IO-WIFI.
> >
> > I tried to turn it off and, indeed, the system becomes inoperable.
> >
> > I'll add vqmmc-supply in mmc1 with aldo1 regulator. However, I am
> > wondering what to put in vmmc-supply for mmc1 since the WiFi module has
> > three power inputs: dldo1, dldo2 and aldo1. In the fex, they are
> > referenced as, respectively, module_power1, module_power2 and
> > module_power3 and in the schematics dldo1 and dldo2 are named VCC-WIFI
> > while aldo1 is used for VCC-IO-WIFI (if it can help in any way).
> >
> > VCC-WIFI is connected to pin VBAT of the Broadcom AP6212 WiFi chip.
> > VCC-IO-WIFI is connected to pin VDDIO of the chip.
>=20
> VCC-IO-WIFI is vqmmc, and VCC-WIFI is vmmc.

Isn't vmmc supposed to be always powered at 3.3v, and vqmmc the one
used to drop to 1.8V with the UHS cards?

In which case, VCC-IO-WIFI is vmmc, and VCC-WIFI is just one of the
wifi chip power rail, to be handled by a power sequence.

> About having 2 regulators, Maxime is working on a solution. In the
> meantime, you could have dldo1/dldo2 always-on, and put a TODO
> comment on them.

Yep.

> Not sure about it also linked to VCC-USB though. Is VCC-USB connected
> to the SoC or just a trace on the board? If it's the latter, it might
> also be designed to work with a USB based WiFi module.

It seems to be one of the inputs of the SoC.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--YIleam+9adpUeYf+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXaA90AAoJEBx+YmzsjxAgW/UQALdL2cRkOde7yZGaLlhEofOM
JdHOtdEZLkbjZBzeOYtfeh0rHFY7pbkZmfiSa6x7gN1ZyN1FZBEv/qAWTOYtyMIz
IbZeBaQ/UayAco7A46V32FqDe3jKdFoDfnnRxAyLwtpR6aTf5poAqC1+ArWqM2tC
MkjYQDKAbWZPKe4OUIadRmVoSygEhxpap0UB0S1yRsn8xyuxMxXDmnBMvjYYaVxE
TasKGd/+vhfU5hhbZgF+0+9ADRr5sbBSjn+c6hbuzDdR2+Uee7FgSD33+8ffbADi
YG6yzaNERzsxODJQC3kg3j+ds6RVN0l2kDviTH+TlqyrtTepBjEW9E7da9Q2W0Yf
xw6SfoFcjzZkqhvXeplBvYBGiIY2kDKfELZi1DwwugZOKu+QVrnQy9eUibsN9dwY
Pb+8ULmYJjGDfyUw/7+QLo2u4o7i8yNrYOTIvNm+6W5h+d0PG6/OBOJr3iFbGMQ3
HZmACgPLsxdwUI+ML1n+YjLcXZi3sD0gt155yQsi/5+U4be4ZPmaUCcSlGLU7pp5
XTz5Rss3+gdwc/06WIyy7fEdg3K42/UM91jdVkx5nMIys2ie6PrtG5OzNLqXY4Po
zR2gtYQIdN5pcO9YcWVzPG8j/13u9efnHW0TO/cXb4x37kLlz3Bcv2pO1Ez4FUMq
MZ6/9JLCUZxgFnvmB72h
=58E9
-----END PGP SIGNATURE-----

--YIleam+9adpUeYf+--


--===============7891237103051309314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7891237103051309314==--
