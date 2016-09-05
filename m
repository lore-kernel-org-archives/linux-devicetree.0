From: Vagrant Cascadian <vagrant@debian.org>
Subject: Re: [PATCH v3 2/2] ARM: dts: imx53: add support for USB armory board
Date: Mon, 05 Sep 2016 10:08:35 -0700
Message-ID: <87wpiqjmuk.fsf@aikidev.net>
References: <20160905101117.27473-1-andrej@inversepath.com>
 <20160905101117.27473-3-andrej@inversepath.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1801050699732250226=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160905101117.27473-3-andrej@inversepath.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: andrej@inversepath.com, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============1801050699732250226==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 2016-09-05, andrej@inversepath.com wrote:
> From: Andrej Rosano <andrej@inversepath.com>
>
> Add support for Inverse Path USB armory board, an open source
> flash-drive sized computer based on NXP i.MX53 SoC.
>
> https://inversepath.com/usbarmory
>
> Signed-off-by: Andrej Rosano <andrej@inversepath.com>

Boots with v4.8-rc5, USB OTG works, serial console works.

Tested-by: Vagrant Cascadian <vagrant@debian.org>

live well,
  vagrant

> ---
>  arch/arm/boot/dts/Makefile            |   1 +
>  arch/arm/boot/dts/imx53-usbarmory.dts | 224 ++++++++++++++++++++++++++++=
++++++
>  2 files changed, 225 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx53-usbarmory.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index faacd52..20790b8 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -315,6 +315,7 @@ dtb-$(CONFIG_SOC_IMX53) +=3D \
>  	imx53-smd.dtb \
>  	imx53-tx53-x03x.dtb \
>  	imx53-tx53-x13x.dtb \
> +	imx53-usbarmory.dtb \
>  	imx53-voipac-bsb.dtb
>  dtb-$(CONFIG_SOC_IMX6Q) +=3D \
>  	imx6dl-apf6dev.dtb \
> diff --git a/arch/arm/boot/dts/imx53-usbarmory.dts b/arch/arm/boot/dts/im=
x53-usbarmory.dts
> new file mode 100644
> index 0000000..6782d7f
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx53-usbarmory.dts
> @@ -0,0 +1,224 @@
> +/*
> + * USB armory MkI device tree file
> + * https://inversepath.com/usbarmory
> + *
> + * Copyright (C) 2015, Inverse Path
> + * Andrej Rosano <andrej@inversepath.com>
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
> +/dts-v1/;
> +#include "imx53.dtsi"
> +
> +/ {
> +	model =3D "Inverse Path USB armory";
> +	compatible =3D "inversepath,imx53-usbarmory", "fsl,imx53";
> +};
> +
> +/ {
> +	chosen {
> +		stdout-path =3D &uart1;
> +	};
> +
> +	memory {
> +		reg =3D <0x70000000 0x20000000>;
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_led>;
> +
> +		user {
> +			label =3D "LED";
> +			gpios =3D <&gpio4 27 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};
> +};
> +
> +/*
> + * Not every i.MX53 P/N supports clock > 800MHz.
> + * As USB armory does not mount a specific P/N set a safe clock upper li=
mit.
> + */
> +&cpu0 {
> +	operating-points =3D <
> +		/* kHz */
> +		166666  850000
> +		400000  900000
> +		800000 1050000
> +	>;
> +};
> +
> +&esdhc1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_esdhc1>;
> +	status =3D "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_esdhc1: esdhc1grp {
> +		fsl,pins =3D <
> +			MX53_PAD_SD1_DATA0__ESDHC1_DAT0		0x1d5
> +			MX53_PAD_SD1_DATA1__ESDHC1_DAT1		0x1d5
> +			MX53_PAD_SD1_DATA2__ESDHC1_DAT2		0x1d5
> +			MX53_PAD_SD1_DATA3__ESDHC1_DAT3		0x1d5
> +			MX53_PAD_SD1_CMD__ESDHC1_CMD		0x1d5
> +			MX53_PAD_SD1_CLK__ESDHC1_CLK		0x1d5
> +		>;
> +	};
> +
> +	pinctrl_i2c1_pmic: i2c1grp {
> +		fsl,pins =3D <
> +			MX53_PAD_EIM_D21__I2C1_SCL	0x80
> +			MX53_PAD_EIM_D28__I2C1_SDA	0x80
> +		>;
> +	};
> +
> +	pinctrl_led: ledgrp {
> +		fsl,pins =3D <
> +			MX53_PAD_DISP0_DAT6__GPIO4_27 0x1e4
> +		>;
> +	};
> +
> +	/*
> +	 * UART mode pin header configration
> +	 * 3 - GPIO5[26], pull-down 100K
> +	 * 4 - GPIO5[27], pull-down 100K
> +	 * 5 - TX, pull-up 100K
> +	 * 6 - RX, pull-up 100K
> +	 * 7 - GPIO5[30], pull-down 100K
> +	 */
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins =3D <
> +			MX53_PAD_CSI0_DAT8__GPIO5_26		0xc0
> +			MX53_PAD_CSI0_DAT9__GPIO5_27		0xc0
> +			MX53_PAD_CSI0_DAT10__UART1_TXD_MUX	0x1e4
> +			MX53_PAD_CSI0_DAT11__UART1_RXD_MUX	0x1e4
> +			MX53_PAD_CSI0_DAT12__GPIO5_30		0xc0
> +		>;
> +	};
> +};
> +
> +&i2c1 {
> +	pinctrl-0 =3D <&pinctrl_i2c1_pmic>;
> +	status =3D "okay";
> +
> +	ltc3589: pmic@34 {
> +		compatible =3D "lltc,ltc3589-2";
> +		reg =3D <0x34>;
> +
> +		regulators {
> +			sw1_reg: sw1 {
> +				regulator-min-microvolt =3D <591930>;
> +				regulator-max-microvolt =3D <1224671>;
> +				lltc,fb-voltage-divider =3D <100000 158000>;
> +				regulator-ramp-delay =3D <7000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			sw2_reg: sw2 {
> +				regulator-min-microvolt =3D <704123>;
> +				regulator-max-microvolt =3D <1456803>;
> +				lltc,fb-voltage-divider =3D <180000 191000>;
> +				regulator-ramp-delay =3D <7000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			sw3_reg: sw3 {
> +				regulator-min-microvolt =3D <1341250>;
> +				regulator-max-microvolt =3D <2775000>;
> +				lltc,fb-voltage-divider =3D <270000 100000>;
> +				regulator-ramp-delay =3D <7000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			bb_out_reg: bb-out {
> +				regulator-min-microvolt =3D <3387341>;
> +				regulator-max-microvolt =3D <3387341>;
> +				lltc,fb-voltage-divider =3D <511000 158000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo1_reg: ldo1 {
> +				regulator-min-microvolt =3D <1306329>;
> +				regulator-max-microvolt =3D <1306329>;
> +				lltc,fb-voltage-divider =3D <100000 158000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo2_reg: ldo2 {
> +				regulator-min-microvolt =3D <704123>;
> +				regulator-max-microvolt =3D <1456806>;
> +				lltc,fb-voltage-divider =3D <180000 191000>;
> +				regulator-ramp-delay =3D <7000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo3_reg: ldo3 {
> +				regulator-min-microvolt =3D <2800000>;
> +				regulator-max-microvolt =3D <2800000>;
> +				regulator-boot-on;
> +			};
> +
> +			ldo4_reg: ldo4 {
> +				regulator-min-microvolt =3D <1200000>;
> +				regulator-max-microvolt =3D <3200000>;
> +			};
> +		};
> +	};
> +};
> +
> +&uart1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_uart1>;
> +	status =3D "okay";
> +};
> +
> +&usbotg {
> +	dr_mode =3D "peripheral";
> +	status =3D "okay";
> +};
> --=20
> 2.9.3

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXzaaTAAoJELeLgtSBS5G2xr8P/RGMkrzxrmq9x77GXLvlL7hA
d8cR/x4of36/4pWLvkjSG9HfyAvZdeEC7Gl4h69rReQQhVion7cBhfiNd9pfbTse
RmTxpQ8zTcqMg4T7KL63pVXirSqfpl+zPSwkWGjDeKLAfI0q7cgFttBEKlO0NRBF
jACohvLZJQZgsyA5vxfVPbfmu+KDt/O8jLvwp79RJ0SUnc+c6WcgdwBItwU92TLD
r5lfB+ChJWY8Hr5d7jB0IZsToeZNm0/jVu4aOeF0NvqY87uy7r78zib0gGUVTSse
xi6Ef+kZsaXeK0qXvz4616eJltRRuMgI6ZMEr1AgyDL0RnwEMeqeiY+9Yct5g9BP
e8qV8oXo7h4kLQ6WF626cl8nt9GDnwijvyFnJUwWdPYmc4j8+gxJUOflHIk9o2rI
1zWpwVhxpvLz8LdMW01ChKD34az1G2Yby2v96lgKHkS7UWV57b7qIgMdOXJOfkep
hSEiZL0j6AYnXItk/vco4OMw3rw5rydPuoZt0xT6FspncIGVEWxLcjpKXBbzgeCK
vOAIT2iSDwXqMFbYOWFE6ciYI7RzveERil2wPdAxtpgV+3z86XK4idpFVYAEwCie
+3BJAGNu0cMI9o33N4PbymtMDi0d/5HMwvhTADsiRbp9fMFG0VYMlOIk/LS2F/3I
56eozt2wy33u+My+IyXa
=9JiR
-----END PGP SIGNATURE-----
--=-=-=--


--===============1801050699732250226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1801050699732250226==--
