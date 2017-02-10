From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 5/5] ARM: dts: sun9i: Initial support for the Sunchip
 CX-A99 board
Date: Fri, 10 Feb 2017 09:59:20 +0100
Message-ID: <20170210085920.7l7gswm6yjuqgdfx@lukather>
References: <cover.1486592470.git.rask@formelder.dk>
 <d4211c5d57f80b0281d7d332edc7d69e66202d3d.1486592471.git.rask@formelder.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gm3otq5nis5arssd"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d4211c5d57f80b0281d7d332edc7d69e66202d3d.1486592471.git.rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rask Ingemann Lambertsen <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--gm3otq5nis5arssd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 09, 2017 at 12:34:06AM +0100, Rask Ingemann Lambertsen wrote:
> The Suncip CX-A99 board is found in at least four brands of media players.
> It features an Allwinner A80 ARM SoC and is found in two models:
>=20
> 1) 2 GiB DDR3 DRAM and 16 GB eMMC
> 2) 4 GiB DDR3 DRAM and 32 GB eMMC
>=20
> For details of the board, see the linux-sunxi page
> <URL:https://linux-sunxi.org/Sunchip_CX-A99>.

Please don't put URLs in commit logs (and the DT).

>=20
> Supported features (+ means tested):
> + One Cortex-A7 CPU core (or four with experimental U-Boot PSCI patches)
> + AXP808 power management chip
> + OZ80120 voltage regulator
> + Serial console port (internal)
> + eMMC and SD card slot
> + USB 2.0 host ports on on-board USB hub
> + SATA port on on-board SATA-to-USB bridge *
> + IEEE 802.11 a/b/g/n/ac SDIO Wifi
> + Real-time clock
> + LEDs
> - IR receiver for remote control
>=20
> * Only shows up when a SATA device is connected. Also, if a power source
>   is connected to the USB 3.0 connector across power cycles (e.g. FEL
>   boot), the bridge may not properly reset and not show up on the USB bus.
>   The vendor U-Boot performs some unknown magic which resets the bridge.

Is that magic at the USB level, or specific to the bridge itself?

> So far unsupported features:
> - Using any of the Cortex-A15 CPU cores
> - USB 3.0 port (except for supplying 5 V power)
> - IEEE 802.3 10/100/1000 megabit Ethernet
> - HDMI connector
> - S/PDIF audio output
> - Jack socket with composite video and analog stereo audio
> - Bluetooth
> - FM radio receiver (assuming it is even wired on the board)

I guess that should be in your cover letter.

This is not found in your DT, so no one really expects it to work :)

> Signed-off-by: Rask Ingemann Lambertsen <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
> ---
>=20
> Changes in v6:
> - Updated commit message description of SATA-to-USB bridge quirk and added
>   note about experimental U-Boot PSCI support for up to four CPU cores.
> - The blue LED is no longer on by default as its meaning is not documente=
d.
> - Removed "regulator-boot-on" from regulators having "regulator-always-on=
".
> - Removed misleading mention of "OTG connector" which the device doesn't =
have.
> - More detailed explanation for the need for "broken-cd" on mmc0.
> - Several regulators have had their voltage range relaxed a little to mat=
ch
>   the permissible range according to the data sheets of the consumers. Th=
is
>   is similar to what is used for the Cubieboard4 and Merrii A80 Optimus.
> - Shortened regulator dcdce name as per v5 comments. A comment now lists =
the
>   pin groups supplied by dcdce.
>=20
> Changes in v5:
> - Switched pinmux modes to generic properties and dropped=20
>   #include <dt-bindings/pinctrl/sun4i-a10.h> as a consequence.
> - Dropped pinctrl properties from GPIO nodes and dropped the pinmux
>   nodes for them.
> - AXP808 regulators added.
> - Dropped the now unused #include <sunxi-common-regulators.dtsi>.
> - Ampak AP6335 SDIO-Wifi added.
> - USB Vbus changes as per v4 comments.
> - Added "broken-cd" to mmc0 because GPIO interrupts don't work.
>=20
> Changes in v4:
> - Node names had underscores changed to hyphens.
> - Changed formatting of the ac100/rtc node's clock output name list to ma=
tch
>  that of the same node in the cubieboard4 and a80-optimus device trees.
>=20
> Changes in v3:
> None.
>=20
> Changes in v2:
> - Fixed formatting and style issues found by scripts/checkpatch.pl.
>=20
>  arch/arm/boot/dts/Makefile             |   3 +-
>  arch/arm/boot/dts/sun9i-a80-cx-a99.dts | 409 +++++++++++++++++++++++++++=
++++++
>  2 files changed, 411 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/sun9i-a80-cx-a99.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 8553bd7..40546fa 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -862,7 +862,8 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-v3s-licheepi-zero.dtb
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
> index 0000000..f5496d2
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun9i-a80-cx-a99.dts
> @@ -0,0 +1,409 @@
> +/*
> + * sun9i-a80-cx-a99.dts - Device Tree file for the Sunchip CX-A99 board.
> + *
> + * Copyright (C) 2017 Rask Ingemann Lambertsen <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
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
> +/*
> + * The Sunchip CX-A99 board is found in several similar Android media
> + * players, such as:
> + *
> + * Instabox Fantasy A8 (no external antenna)
> + * Jesurun CS-Q8 (ships with larger remote control)
> + * Jesurun Maxone
> + * Rikomagic (RKM) MK80/MK80LE
> + * Tronsmart Draco AW80 Meta/Telos
> + *
> + * See <URL:https://linux-sunxi.org/Sunchip_CX-A99> for more information.
> + */
> +
> +/dts-v1/;
> +#include "sun9i-a80.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
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
> +
> +		blue {
> +			gpios =3D <&pio 6 10 GPIO_ACTIVE_HIGH>;	/* PG10 */
> +			label =3D "cx-a99:blue:status";
> +		};
> +
> +		red {
> +			gpios =3D <&pio 6 11 GPIO_ACTIVE_HIGH>;	/* PG11 */
> +			label =3D "cx-a99:red:status";
> +		};
> +	};
> +
> +	powerseq_wifi: powerseq-wifi {
> +		compatible =3D "mmc-pwrseq-simple";
> +		clocks =3D <&ac100_rtc 1>;
> +		clock-names =3D "ext_clock";
> +		reset-gpios =3D <&r_pio 1 0 GPIO_ACTIVE_LOW>;	/* PM0 */
> +		post-power-on-delay-ms =3D <1>;	/* Minimum 2 cycles. */
> +	};
> +
> +	/* USB 3.0 standard-A receptacle. For now, only Vbus is supported. */

I'm not sure what you mean by "only VBUS is supported"? Is there any
other signal?

> +	reg_usb0_vbus: regulator-usb0-vbus {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "usb0-vbus";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		gpio =3D <&pio 7 15 GPIO_ACTIVE_HIGH>;	/* PH15 */
> +		enable-active-high;

This is redundant with the GPIO flag

> +		regulator-always-on;

And it shouldn't be always on. The USB driver will enable it if needs
be.

> +	};
> +
> +	/*
> +	 * A GL850G hub with two external USB connectors is connected
> +	 * to ehci0. Each has a Vbus regulator controlled by a GPIO:
> +	 * PL7 for port 1, closest to the 12 V power connector, and
> +	 * PL8 for port 2, next to the SD card slot.
> +	 * Because regulator-fixed doesn't support a GPIO list, and
> +	 * allwinner,sun9i-a80-usb-phy doesn't support more than one
> +	 * supply, we have to use regulator-always-on on usb1-2-vbus.
> +	 * Note that the GPIO pins also need cldo1 to be enabled.
> +	 */

What is the source of those regulators connected then? Some PMIC
regulator? AC-IN?

> +	reg_usb1_1_vbus: regulator-usb1-1-vbus {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "usb1-1-vbus";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		gpio =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>;	/* PL7 */
> +		enable-active-high;
> +	};
> +
> +	reg_usb1_2_vbus: regulator-usb1-2-vbus {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "usb1-2-vbus";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		gpio =3D <&r_pio 0 8 GPIO_ACTIVE_HIGH>;	/* PL8 */
> +		enable-active-high;
> +		regulator-always-on;

Same comment about always on. If the driver needs fixing to grab an
additional regulator, fix it, but this shouldn't be left that way.

> +	};
> +
> +	/* OZ80120 voltage regulator for the four Cortex-A15 cores. */
> +	reg_vdd_cpub: regulator-vdd-cpub {
> +		compatible =3D "regulator-gpio";
> +
> +		regulator-always-on;
> +		regulator-min-microvolt =3D < 800000>;
> +		regulator-max-microvolt =3D <1100000>;
> +		regulator-name =3D "vdd-cpub";
> +
> +		enable-gpio =3D <&r_pio 0 2 GPIO_ACTIVE_HIGH>;	/* PL2 */
> +		enable-active-high;
> +		gpios =3D <&r_pio 0 3 GPIO_ACTIVE_HIGH>,		/* PL3 */
> +			<&r_pio 0 4 GPIO_ACTIVE_HIGH>,		/* PL4 */
> +			<&r_pio 0 5 GPIO_ACTIVE_HIGH>;		/* PL5 */
> +
> +		gpios-states =3D <1 0 0>;
> +		states =3D <	 750000 0x7
> +				 800000 0x3
> +				 850000 0x5
> +				 900000 0x1
> +				 950000 0x6
> +				1000000 0x2
> +				1100000 0x4
> +				1200000 0x0>;

You're listing a minimum state of 750mv, yet your minimum voltage is
800mV.

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
> +/*
> + * SD card slot. Although the GPIO pin for card detection is listed as c=
apable
> + * of generating interrupts in the "A80 User Manual", this doesn't work =
for
> + * some unknown reason, so poll the GPIO for card detection. This is als=
o what
> + * the vendor sys_config.fex file specifies.
> + */
> +&mmc0 {
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&pio 7 17 GPIO_ACTIVE_LOW>;	/* PH17 */
> +	broken-cd;				/* Poll. */
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc0_pins>;
> +	vmmc-supply =3D <&reg_dcdce>;
> +	status =3D "okay";
> +};
> +
> +/* Ampak AP6335 IEEE 802.11 a/b/g/n/ac "Wifi". */

Why "wifi" ? It's not implementing true wifi?

> +&mmc1 {
> +	bus-width =3D <4>;
> +	non-removable;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc1_pins>;
> +	vmmc-supply =3D <&reg_cldo3>;	/* See cldo2,cldo3 note. */
> +	vqmmc-supply =3D <&reg_aldo2>;

So it's able to support 1.2 or 1.8V IO modes? Surely you want to
enable those modes here to.

> +	mmc-pwrseq =3D <&powerseq_wifi>;
> +	status =3D "okay";
> +};
> +
> +/* On-board eMMC card. */
> +&mmc2 {
> +	bus-width =3D <8>;
> +	non-removable;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc2_8bit_pins>;
> +	vmmc-supply =3D <&reg_dcdce>;
> +	status =3D "okay";
> +};
> +
> +&osc32k {
> +	clocks =3D <&ac100_rtc 0>;
> +};
> +
> +&r_ir {
> +	status =3D "okay";
> +};
> +
> +&r_rsb {
> +	status =3D "okay";
> +
> +	ac100: codec@e89 {
> +		compatible =3D "x-powers,ac100";
> +		reg =3D <0xe89>;
> +
> +		ac100_codec: codec {
> +			compatible =3D "x-powers,ac100-codec";
> +			interrupt-parent =3D <&r_pio>;
> +			interrupts =3D <0 9 IRQ_TYPE_LEVEL_LOW>;	/* PL9 */
> +			#clock-cells =3D <0>;
> +			clock-output-names =3D "4M_adda";
> +		};
> +
> +		ac100_rtc: rtc {
> +			compatible =3D "x-powers,ac100-rtc";
> +			interrupt-parent =3D <&nmi_intc>;
> +			interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +			clocks =3D <&ac100_codec>;
> +			#clock-cells =3D <1>;
> +			clock-output-names =3D "cko1_rtc",
> +					     "cko2_rtc",
> +					     "cko3_rtc";
> +		};
> +	};
> +
> +	pmic@745 {
> +		compatible =3D "x-powers,axp808", "x-powers,axp806";
> +		reg =3D <0x745>;
> +		interrupt-parent =3D <&nmi_intc>;
> +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-controller;
> +		#interrupt-cells =3D <1>;
> +
> +		swin-supply =3D <&reg_dcdce>;

Please use an incude for that PMIC.

> +
> +		/* In comments: Initial setup from vendor sys_config.fex. */
> +		regulators {
> +			/* 3.0 V (enabled). */

This might be disabled though.

> +			reg_aldo1: aldo1 {
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <3000000>;
> +				regulator-max-microvolt =3D <3000000>;
> +				regulator-name =3D "vcc-3v0";
> +			};
> +
> +			/* 1.8 V (enabled). */
> +			reg_aldo2: aldo2 {
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <3600000>;
> +				regulator-name =3D "vcc-pg-pm-wifi+btio-audio";

Usually, there is simpler names available on the schematics, or at
least simpler names we can come up with.

Something like vcc-wifi would be enough her.

> +			};
> +
> +			/* 2.5 V (enabled). */
> +			reg_aldo3: aldo3 {
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <2500000>;
> +				regulator-max-microvolt =3D <2500000>;
> +				regulator-name =3D "vcc-pa-gmac2v5";

vcc-gmac

> +			};
> +
> +			/* 1.8 V (enabled). */
> +			reg_bldo1: bldo1 {
> +				regulator-always-on;	/* Hang if disabled */
> +				regulator-min-microvolt =3D <1700000>;
> +				regulator-max-microvolt =3D <1900000>;
> +				regulator-name =3D "vdd18-dll-vcc18-pll";

vdd-dll

> +			};
> +
> +			/* 0.9 V (enabled). */
> +			reg_bldo2: bldo2 {
> +				regulator-always-on;	/* Hang if disabled */
> +				regulator-min-microvolt =3D < 800000>;
> +				regulator-max-microvolt =3D <1100000>;
> +				regulator-name =3D "vdd-cpus";
> +			};
> +
> +			/* 1.2 V (disabled). */
> +			reg_bldo3: bldo3 {
> +				regulator-min-microvolt =3D <1100000>;
> +				regulator-max-microvolt =3D <1300000>;
> +				regulator-name =3D "vcc12-hsic";

vcc-hsic

> +			};
> +
> +			/* 1.1 V (enabled). */
> +			reg_bldo4: bldo4 {
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D < 800000>;
> +				regulator-max-microvolt =3D <1100000>;
> +				regulator-name =3D "vdd09-hdmi";

vdd-hdmi

> +			};
> +
> +			/* 3.3 V (enabled). PLx pins control some regulators. */
> +			reg_cldo1: cldo1 {
> +				regulator-always-on;
> +				regulator-min-microvolt =3D <3300000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-name =3D "vcc-pl-led";

vcc-led, etc...

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--gm3otq5nis5arssd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYnYDiAAoJEBx+YmzsjxAgVWAP/10D2pwXcRHCu/ez32mY5f5J
1Hiq+aVnSaTQdZUWPqObdxxX1tMacaIdA+yBgdsGbsghpsRbqF+v0Jx+8Fu+bfrg
hnfqP1K37ZsvSQuVjT8KD0MzN8s+WaSBOrlpDAi6bpOM26NOsiAmIhw0OEcOieug
pzs4v82nZQblrwsCzIiN1Lsfgpptf619DRxPmS3IV9bQNmJ35JaQDznxtLuB/784
PpE1BZkily9KgcjHPOU3j48GlUSQjeZOFkKtkXlm3CME/tGi5nXIQMXg4oGn0Hs2
75q1va+5nqjbHhAdeFTyf0Qaf/PUoqn6V0Ua2df5SIj0cLKhTgtG2OtiTMgaoajy
A0fbc1FJothkVOuB4PChrlhPE3BJudbn6so1ruW8ojwqg7nLpn6jT77MGJ7SqQjG
vxR5jQDxSDm9vmxgmzvZq/iGeTAuWaHxobTkU37kA99dxdTv1qboN34GgIbc1YIs
pfuM+wnYjKjjGRhct1mSugrB6T3YKOrhHnwNYEyD5dKY3BJlRZkIgI1Ij1wDpA80
ekQrBmteviCujv65RHdLWPO7QmzTRwcSOUaTFG2iuvZWfw1R3qBGihB8ba5ttuiZ
OtOVCII/kSjOd2MA7X9NFFWfJxuFsaJYRjSai97fgSTWWeB09zTWRxRnErWV9v7l
E9nsL34suj7mSt5uIc4P
=JcqQ
-----END PGP SIGNATURE-----

--gm3otq5nis5arssd--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
