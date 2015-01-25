From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add dts file for pcDuino 3 Nano board
Date: Sun, 25 Jan 2015 17:48:46 +0100
Message-ID: <20150125164846.GL8470@lukather>
References: <1422199921-325-1-git-send-email-ats@offog.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3xQkynibq3FKlJyM"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1422199921-325-1-git-send-email-ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--3xQkynibq3FKlJyM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Adam,

On Sun, Jan 25, 2015 at 03:32:01PM +0000, Adam Sampson wrote:
> Add support for the LinkSprite pcDuino 3 Nano board. This is a low-cost
> Allwinner A20 board with Arduino-style GPIO headers; it features 1G RAM,
> 4G NAND flash, 1 micro-SD, 2 USB sockets, 1 micro USB socket for OTG and
> another for power in, HDMI, SATA, 5V power for SATA devices, gigabit
> Ethernet, an IR receiver, 3.5mm audio out and a MIPI camera connector.
>=20
> For more details, see: http://linux-sunxi.org/LinkSprite_pcDuino3_Nano
>=20
> Signed-off-by: Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>

Thanks for your patch.

> ---
>  arch/arm/boot/dts/Makefile                    |    3 +-
>  arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts |  203 +++++++++++++++++++=
++++++
>  2 files changed, 205 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7df26a2..c025724 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -479,7 +479,8 @@ dtb-$(CONFIG_MACH_SUN7I) +=3D \
>  	sun7i-a20-olinuxino-lime.dtb \
>  	sun7i-a20-olinuxino-lime2.dtb \
>  	sun7i-a20-olinuxino-micro.dtb \
> -	sun7i-a20-pcduino3.dtb
> +	sun7i-a20-pcduino3.dtb \
> +	sun7i-a20-pcduino3-nano.dtb
>  dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-a23-ippo-q8h-v5.dtb \
>  	sun8i-a23-ippo-q8h-v1.2.dtb
> diff --git a/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts b/arch/arm/boo=
t/dts/sun7i-a20-pcduino3-nano.dts
> new file mode 100644
> index 0000000..a2b18de
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts
> @@ -0,0 +1,203 @@
> +/*
> + * Copyright 2015 Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + *     You should have received a copy of the GNU General Public
> + *     License along with this file; if not, write to the Free
> + *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
> + *     MA 02110-1301 USA
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +#include "sun7i-a20.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	model =3D "LinkSprite pcDuino3 Nano";
> +	compatible =3D "linksprite,pcduino3-nano", "allwinner,sun7i-a20";
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&led_pins_pcduino3_nano>;
> +
> +		led3 {
> +			label =3D "pcduino3-nano:green:led3";
> +			gpios =3D <&pio 7 16 GPIO_ACTIVE_LOW>; /* PH16 */
> +		};
> +
> +		led4 {
> +			label =3D "pcduino3-nano:green:led4";
> +			gpios =3D <&pio 7 15 GPIO_ACTIVE_LOW>; /* PH15 */
> +		};

Where are the three other leds?

Also, usually, the last part of the label is what the led function
usually is. In most case, "usr" will be fine, that might be others
too, but the led number definitely isn't an option.


> +	};
> +};
> +
> +&ahci {
> +	target-supply =3D <&reg_ahci_5v>;
> +	status =3D "okay";
> +};
> +
> +&ehci0 {
> +	status =3D "okay";
> +};
> +
> +&ehci1 {
> +	status =3D "okay";
> +};
> +
> +&gmac {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&gmac_pins_rgmii_a>;
> +	phy =3D <&phy1>;
> +	phy-mode =3D "rgmii";
> +	status =3D "okay";
> +
> +	phy1: ethernet-phy@1 {
> +		reg =3D <1>;
> +	};
> +};
> +
> +&i2c0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c0_pins_a>;
> +	status =3D "okay";
> +
> +	axp209: pmic@34 {
> +		compatible =3D "x-powers,axp209";
> +		reg =3D <0x34>;
> +		interrupt-parent =3D <&nmi_intc>;
> +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +
> +		interrupt-controller;
> +		#interrupt-cells =3D <1>;
> +	};
> +};
> +
> +&i2c2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c2_pins_a>;
> +	status =3D "okay";
> +};
> +
> +&ir0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&ir0_pins_a>;
> +	status =3D "okay";
> +};
> +
> +&mmc0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin_reference_design>;
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&pio 7 1 GPIO_ACTIVE_HIGH>; /* PH1 */
> +	cd-inverted;
> +	status =3D "okay";
> +};
> +
> +&ohci0 {
> +	status =3D "okay";
> +};
> +
> +&ohci1 {
> +	status =3D "okay";
> +};
> +
> +&pio {
> +	ahci_pwr_pin_a: ahci_pwr_pin@0 {
> +		allwinner,pins =3D "PH2";
> +	};

We usually declare a whole new node for this one...

> +	led_pins_pcduino3_nano: led_pins@0 {
> +		allwinner,pins =3D "PH16", "PH15";
> +		allwinner,function =3D "gpio_out";
> +		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +	};
> +
> +	usb1_vbus_pin_pcduino3_nano: usb1_vbus_pin@0 {
> +		allwinner,pins =3D "PH11";
> +		allwinner,function =3D "gpio_out";
> +		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +	};
> +};
> +
> +&reg_ahci_5v {
> +	gpio =3D <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */

=2E.. and we override the pinctrl-0 property here.

> +	status =3D "okay";
> +};
> +
> +&reg_usb1_vbus {
> +	pinctrl-0 =3D <&usb1_vbus_pin_pcduino3_nano>;
> +	gpio =3D <&pio 7 11 GPIO_ACTIVE_HIGH>; /* PH11 */
> +	status =3D "okay";
> +};
> +
> +&reg_usb2_vbus {
> +	status =3D "okay";
> +};
> +
> +&spi0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&spi0_pins_a>;
> +	status =3D "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pins_a>;
> +	status =3D "okay";
> +};
> +
> +&uart2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart2_pins_a>;
> +	status =3D "okay";
> +};

You probably want aliases for these two UARTs.

Looks good otherwise,
Maxime


--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--3xQkynibq3FKlJyM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUxR5uAAoJEBx+YmzsjxAgJkQP/Al/lpKlcdIhhW78buyx+oFE
mzLj/27F1z7EoesoSFYykG1KZB42g8P5oJRWizGULqDb5Dd0IP7+geujMGS8Lxbt
46l7wb1HwO4kYDnZtYTuJsUtL6MhZvSGJPaL7Jtac5Y7Rjfe956nUeOXq7A3GMI/
vJem0x2j6YeVNkqNEtKKQlDO5flFd8WhDnQLUkcbplzZzVati1+7jL629/O6nFrX
czEbz7i4y94Rlc0AKneWUQw9aVbh3Bnop/zuudt81lqraEqIsB7ihniDieY9um0c
TumOpwpX99WWTNcc9PR0ed8J/TiIjwJ8N7ni1yTBxMWGcIRjveZNHmeeE9KA/BaK
BTXT3l5Aladgl1AfvmZxv3YimqMdF1FgZm8h0Ehqjgp9e6w/x0z4JXA1nWzvL8nl
irWLTBSwUoZP5PMsb4Hb17Mhmhhcca1sXED3nvxEPSH57XgDU9rSZfKxgo0jTGQz
/o7gCEHk/VLJWPQK/C2+XYF7kl6XFb8VFafH+FXIvJi6nMVLJCeoQFcNCxtjSJon
MV7goS7L2wyvHBz/tWLXq5ehbGjitqQsGgdi5bhVvGim9rblzQwlXiYb+BJpEyQ1
jlosPY7lNPAFHU184+0YDDZ4j6AkkLum8gck/ZwkWUgf1irnLMoNDOpA8sOry4ON
AMI8T5P9ZoZEFqJnoYST
=Cp/H
-----END PGP SIGNATURE-----

--3xQkynibq3FKlJyM--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
