From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 3/3] ARM: dts: sun9i: Initial support for the Sunchip
 CX-A99 board
Date: Mon, 22 Aug 2016 20:57:45 +0200
Message-ID: <20160822185745.GC7104@lukather>
References: <9f39145aa6a46a1e130c4b91bd120eabeb7c8929.1471637309.git.ccc94453@vip.cybercity.dk>
 <ce704da79c6263a4a5048af8f8e90f22e0849188.1471637309.git.ccc94453@vip.cybercity.dk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4489301726823387143=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <ce704da79c6263a4a5048af8f8e90f22e0849188.1471637309.git.ccc94453@vip.cybercity.dk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rask Ingemann Lambertsen <ccc94453@vip.cybercity.dk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============4489301726823387143==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uBaQ+BsiqpBBIRFI"
Content-Disposition: inline


--uBaQ+BsiqpBBIRFI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Aug 13, 2016 at 12:03:57AM +0200, Rask Ingemann Lambertsen wrote:
> The Suncip CX-A99 board is found in at least four brands of TV boxes.
> It features an Allwinner A80 SOC, with either 2 GiB DDR3 DRAM and
> 16 GB eMMC or 4 GiB DDR3 DRAM and 32 GB eMMC, as well as several support
> chips for Ethernet, wireless networking, video output, SATA and power
> management. For details, see the linux-sunxi page about the board
> <URL:https://linux-sunxi.org/Sunchip_CX-A99>.
>=20
> This patch only adds support for the SD and eMMC storage, real-time clock,
> USB 2.0 ports (and by extension the SATA port), the UART port and the LED=
s.
> All of this relies on the boot loader to leave those parts powered up, as
> I'm still working on a driver for the AXP808 PMIC.
>=20
> Signed-off-by: Rask Ingemann Lambertsen <ccc94453@vip.cybercity.dk>

It looks mostly good, but I have a couple of comments though, see below.

> ---
>=20
> Although the vendor U-Boot lets you boot the kernel on one of the
> Cortex-A15 cores, the kernel gpio-regulator driver currently glitches
> the GPIO lines to the OZ80120 regulator such that the system crashes
> during startup. This part needs further work to be useful.

So it doesn't power the CPU through one of the AXP regulators?
Interesting design.

> The driver for the AC100 real-time clock is found in Lee Jones' MFD branch
> git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-rtc-v4.9
> and is not essential for using the board.
>=20
> Changes in v4:
> Node names had underscores changed to hyphens.
> Changed formatting of the ac100/rtc node's clock output name list to match
> that of the same node in the cubieboard4 and a80-optimus device trees.
>=20
> Changes in v3:
> None.
>=20
> Changes in v2:
> Fixed formatting and style issues found by scripts/checkpatch.pl.
>=20
>  arch/arm/boot/dts/Makefile             |   3 +-
>  arch/arm/boot/dts/sun9i-a80-cx-a99.dts | 261 +++++++++++++++++++++++++++=
++++++
>  2 files changed, 263 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/sun9i-a80-cx-a99.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 6b3bdb6..8b77a53 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -796,7 +796,8 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-r16-parrot.dtb
>  dtb-$(CONFIG_MACH_SUN9I) +=3D \
>  	sun9i-a80-optimus.dtb \
> -	sun9i-a80-cubieboard4.dtb
> +	sun9i-a80-cubieboard4.dtb \
> +	sun9i-a80-cx-a99.dtb
>  dtb-$(CONFIG_ARCH_TANGO) +=3D \
>  	tango4-vantage-1172.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) +=3D \
> diff --git a/arch/arm/boot/dts/sun9i-a80-cx-a99.dts b/arch/arm/boot/dts/s=
un9i-a80-cx-a99.dts
> new file mode 100644
> index 0000000..d08a35e
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun9i-a80-cx-a99.dts
> @@ -0,0 +1,261 @@
> +/*
> + * sun9i-a80-cx-a99.dts - Device Tree file for the Sunchip CX-A99 board.
> + *
> + * Copyright (C) 2016 Rask Ingemann Lamberten <ccc94453@vip.cybercity.dk>
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
> +/* The Sunchip CX-A99 board is found in several similar Android TV box
> + * products, such as:
> + *
> + * Instabox Fantasy A8 (no external antenna)
> + * Jesurun CS-Q8 (ships with larger remote control)
> + * Jesurun Maxone
> + * Rikomagic (RKM) MK80/MK80LE
> + * Tronsmart Draco AW80 Meta/Telos
> + *
> + * See <URL:https://linux-sunxi.org/Sunchip_cx_a99> for more information.
> + */
> +
> +/dts-v1/;
> +#include "sun9i-a80.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> +
> +/ {
> +	model =3D "Sunchip CX-A99";
> +	compatible =3D "sunchip,cx-a99", "allwinner,sun9i-a80";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&led_pins_cx_a99>;
> +
> +		blue {
> +			gpios =3D <&pio 6 10 GPIO_ACTIVE_HIGH>;	/* PG10 */
> +			label =3D "cx-a99:blue:normal";
> +			default-state =3D "on";
> +		};
> +
> +		red {
> +			gpios =3D <&pio 6 11 GPIO_ACTIVE_HIGH>;	/* PG11 */
> +			label =3D "cx-a99:red:standby";

The last part of the label should be the function.

> +		};
> +	};
> +
> +	/* Power supply for the four Cortex-A15 cores. */
> +	reg_vdd_cpub: oz80120 {
> +		compatible =3D "regulator-gpio";
> +		regulator-name =3D "vdd-cpub";
> +
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-type =3D "voltage";
> +		regulator-min-microvolt =3D < 800000>;
> +		regulator-max-microvolt =3D <1100000>;
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&vdd_cpub_r_pins_cx_a99>;
> +		enable-gpio =3D <&r_pio 0 2 GPIO_ACTIVE_HIGH>;	/* PL2 */
> +		enable-active-high;
> +		gpios =3D <&r_pio 0 3 GPIO_ACTIVE_HIGH>,		/* PL3 */
> +			<&r_pio 0 4 GPIO_ACTIVE_HIGH>,		/* PL4 */
> +			<&r_pio 0 5 GPIO_ACTIVE_HIGH>;		/* PL5 */
> +		/* There appears to be an external pull-up on PL3. */
> +		gpios-states =3D <1 0 0>;
> +		states =3D <	 750000 0x7
> +				 800000 0x3
> +				 850000 0x5
> +				 900000 0x1
> +				 950000 0x6
> +				1000000 0x2
> +				1100000 0x4
> +				1200000 0x0>;
> +	};
> +};
> +
> +&ehci0 {
> +	status =3D "okay";
> +};
> +
> +&ehci2 {
> +	status =3D "okay";
> +};
> +
> +&mmc0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc0_pins>, <&mmc0_cd_pin_cx_a99>;
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&pio 7 17 GPIO_ACTIVE_LOW>; /* PH17 */
> +	status =3D "okay";
> +};
> +
> +&mmc2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc2_8bit_pins>;
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	bus-width =3D <8>;
> +	non-removable;
> +	status =3D "okay";
> +};
> +
> +&osc32k {
> +	clocks =3D <&ac100_rtc 0>;
> +};
> +
> +&pio {
> +	led_pins_cx_a99: led-pins {
> +		allwinner,pins =3D "PG10", "PG11";
> +		allwinner,function =3D "gpio_out";
> +		allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +	};
> +
> +	mmc0_cd_pin_cx_a99: mmc0-cd {
> +		allwinner,pins =3D "PH17";
> +		allwinner,function =3D "gpio_in";
> +		allwinner,pull =3D <SUN4I_PINCTRL_PULL_UP>;
> +	};
> +};
> +
> +/* Each GPIO controls VBUS for a port on the GL850G hub connected to ehc=
i0;
> + * PL7 for port 1, the USB connector closest to the 12 V power connector=
, and
> + * PL8 for port 2, the USB connector next to the (micro)SD card slot.
> + * Note: The regulators are not chained like this in reality, but
> + * regulator-fixed doesn't support a gpio list, and allwinner,sun9i-a80-=
usb-phy
> + * doesn't support more than one supply, so this will have to do (for no=
w).
> + */
> +&reg_usb1_vbus {
> +	pinctrl-0 =3D <&usb1_vbus_r_pin_cx_a99>;
> +	gpio =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>;	/* PL7 */
> +	status =3D "okay";
> +};
> +
> +&reg_usb2_vbus {
> +	pinctrl-0 =3D <&usb2_vbus_r_pin_cx_a99>;
> +	gpio =3D <&r_pio 0 8 GPIO_ACTIVE_HIGH>;	/* PL8 */

I'd really prefer it to be modelled properly, and not attached to the
wrong device.

I have some work pending to allow multiple regulators in the same
property, but that won't be ready soon.

For the time being, I would suggest having two usb1 regulators
defined, each with their respective GPIOs, and one set to always on
(and keep that great comment).

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--uBaQ+BsiqpBBIRFI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXu0spAAoJEBx+YmzsjxAgDI8P/2PAOtcfwxcpDj2cAORK4GbV
XjTrz+yGwa/oA7JIsS5edRrTEzQ26xHpzAD3bKup9aEPVD56imePdRGzI47qw1xa
dhxeUKtNnVSCH0TOzzttt6eBBIJfqrjAhKYbyNZVL9zsm98fLJNRnVRxBnoPUL8m
vaBjmvSQd/5rjmzD2xFUpnjIdoLCSnEWbI9+R0fkGLDFyzh4KKYWPJNeCgA7esNg
2p0TxqXzhyELFflh8XPWBbHMgwtCf2kBd35CyHNQmYzAA4blgwzDzIRxluLafJUp
ZEebua+KLa8cNgJA2OPW6a81HfjKwEkigmEjIsPiM2K2nm8VB+I+GcLkL8eAyUx3
6hyuXZpzccOnnBFCCVQXFf7WDaCw7U4ekUyebahN9W2SDETfkB8uKAsyKmdGsARb
N9NiHDnAonxL8EPO2ZmmT9XV9WvgUvCnt17Vn3kecbZGkL0O7Da/K0d41ozWfFi6
VO2ps7lK50i5PKv2sHzsaEju1TBSkduTRb+kcSP27g+usE2MoeCVxlVXdb+1BGUR
5CDSffhftMzmY3okU28DdVgfD11yTQrA6pJwqfbSqIfp+3IZVRAQVSzM0jc8zGVR
Kr56H5Xlkd6h1oYrNMMo3Ervcg783pfMFTFG+MylSxmj6YcKS8muO/bFNO3tojx+
BP8sK/0qtxpNzczWGosU
=ZLC4
-----END PGP SIGNATURE-----

--uBaQ+BsiqpBBIRFI--


--===============4489301726823387143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4489301726823387143==--
