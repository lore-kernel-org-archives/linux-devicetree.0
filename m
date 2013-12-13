From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx53: add support for Ka-Ro TX53 modules
Date: Fri, 13 Dec 2013 16:17:46 +0800
Message-ID: <20131213081744.GR18380@S2101-09.ap.freescale.net>
References: <1386852128-32220-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386852128-32220-1-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 12, 2013 at 01:42:08PM +0100, Lothar Wa=DFmann wrote:
> This patch adds support for the Ka-Ro electronics GmbH TX53 modules.
> There are two distinct module types. One with an LVDS display
> interface and SATA support, the other with a parallel LCD
> interface and no SATA interface.
>=20
> Signed-off-by: Lothar Wa=DFmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile            |    2 +
>  arch/arm/boot/dts/imx53-tx53-x03x.dts |  269 ++++++++++++
>  arch/arm/boot/dts/imx53-tx53-x13x.dts |  283 ++++++++++++
>  arch/arm/boot/dts/imx53-tx53.dtsi     |  420 ++++++++++++++++--
>  5 files changed, 1701 insertions(+), 45 deletions(-)
>  create mode 100644 arch/arm/boot/dts/imx53-tx53-x03x.dts
>  create mode 100644 arch/arm/boot/dts/imx53-tx53-x13x.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 741bf73..51aa137 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -140,6 +140,8 @@ dtb-$(CONFIG_ARCH_MXC) +=3D \
>  	imx53-mba53.dtb \
>  	imx53-qsb.dtb \
>  	imx53-smd.dtb \
> +	imx53-tx53-x03x.dtb \
> +	imx53-tx53-x13x.dtb \
>  	imx53-voipac-bsb.dtb \
>  	imx6dl-gw51xx.dtb \
>  	imx6dl-gw52xx.dtb \
> diff --git a/arch/arm/boot/dts/imx53-tx53-x03x.dts b/arch/arm/boot/dt=
s/imx53-tx53-x03x.dts
> new file mode 100644
> index 0000000..26853fe
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx53-tx53-x03x.dts
> @@ -0,0 +1,269 @@
> +/*
> + * Copyright 2013 Lothar Wa=DFmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> + *
> + * The code contained herein is licensed under the GNU General Publi=
c
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +/dts-v1/;
> +#include "imx53-tx53.dtsi"
> +
> +/ {
> +	model =3D "Ka-Ro electronics TX53 module";
> +	compatible =3D "karo,tx53", "fsl,imx53";
> +
> +	aliases {
> +		display =3D &display;
> +	};
> +
> +	soc {
> +		display: display@di0 {
> +			compatible =3D "fsl,imx-parallel-display";
> +			crtcs =3D <&ipu 0>;
> +			interface-pix-fmt =3D "rgb24";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_rgb24_vga_1>;
> +			status =3D "okay";
> +
> +			display-timings {
> +				VGA {
> +					clock-frequency =3D <25200000>;
> +					hactive =3D <640>;
> +					vactive =3D <480>;
> +					hback-porch =3D <48>;
> +					hsync-len =3D <96>;
> +					hfront-porch =3D <16>;
> +					vback-porch =3D <31>;
> +					vsync-len =3D <2>;
> +					vfront-porch =3D <12>;
> +					hsync-active =3D <0>;
> +					vsync-active =3D <0>;
> +					de-active =3D <1>;
> +					pixelclk-active =3D <0>;
> +				};
> +
> +				ETV570 {
> +					clock-frequency =3D <25200000>;
> +					hactive =3D <640>;
> +					vactive =3D <480>;
> +					hback-porch =3D <114>;
> +					hsync-len =3D <30>;
> +					hfront-porch =3D <16>;
> +					vback-porch =3D <32>;
> +					vsync-len =3D <3>;
> +					vfront-porch =3D <10>;
> +					hsync-active =3D <0>;
> +					vsync-active =3D <0>;
> +					de-active =3D <1>;
> +					pixelclk-active =3D <0>;
> +				};
> +
> +				ET0350 {
> +					clock-frequency =3D <6413760>;
> +					hactive =3D <320>;
> +					vactive =3D <240>;
> +					hback-porch =3D <34>;
> +					hsync-len =3D <34>;
> +					hfront-porch =3D <20>;
> +					vback-porch =3D <15>;
> +					vsync-len =3D <3>;
> +					vfront-porch =3D <4>;
> +					hsync-active =3D <0>;
> +					vsync-active =3D <0>;
> +					de-active =3D <1>;
> +					pixelclk-active =3D <0>;
> +				};
> +
> +				ET0430 {
> +					clock-frequency =3D <9009000>;
> +					hactive =3D <480>;
> +					vactive =3D <272>;
> +					hback-porch =3D <2>;
> +					hsync-len =3D <41>;
> +					hfront-porch =3D <2>;
> +					vback-porch =3D <2>;
> +					vsync-len =3D <10>;
> +					vfront-porch =3D <2>;
> +					hsync-active =3D <0>;
> +					vsync-active =3D <0>;
> +					de-active =3D <1>;
> +					pixelclk-active =3D <1>;
> +				};
> +
> +				ET0500 {
> +					clock-frequency =3D <33264000>;
> +					hactive =3D <800>;
> +					vactive =3D <480>;
> +					hback-porch =3D <88>;
> +					hsync-len =3D <128>;
> +					hfront-porch =3D <40>;
> +					vback-porch =3D <33>;
> +					vsync-len =3D <2>;
> +					vfront-porch =3D <10>;
> +					hsync-active =3D <0>;
> +					vsync-active =3D <0>;
> +					de-active =3D <1>;
> +					pixelclk-active =3D <0>;
> +				};
> +
> +				ET0700 { /* same as ET0500 */
> +					clock-frequency =3D <33264000>;
> +					hactive =3D <800>;
> +					vactive =3D <480>;
> +					hback-porch =3D <88>;
> +					hsync-len =3D <128>;
> +					hfront-porch =3D <40>;
> +					vback-porch =3D <33>;
> +					vsync-len =3D <2>;
> +					vfront-porch =3D <10>;
> +					hsync-active =3D <0>;
> +					vsync-active =3D <0>;
> +					de-active =3D <1>;
> +					pixelclk-active =3D <0>;
> +				};
> +
> +				ETQ570 {
> +					clock-frequency =3D <6596040>;
> +					hactive =3D <320>;
> +					vactive =3D <240>;
> +					hback-porch =3D <38>;
> +					hsync-len =3D <30>;
> +					hfront-porch =3D <30>;
> +					vback-porch =3D <16>;
> +					vsync-len =3D <3>;
> +					vfront-porch =3D <4>;
> +					hsync-active =3D <0>;
> +					vsync-active =3D <0>;
> +					de-active =3D <1>;
> +					pixelclk-active =3D <0>;
> +				};
> +			};
> +		};
> +	};
> +
> +	backlight0: pwm-backlight@0 {

s/pwm-backlight/backlight

And nodename@num only makes sense when there is a property reg =3D <0xn=
um>
for the node.  Otherwise, we do not add @num into the node name.=20

Also, I do not see the point of having label backlight0 here.

> +		compatible =3D "pwm-backlight";
> +		pwms =3D <&pwm2 0 500000>;
> +		power-supply =3D <&reg_3v3>;
> +		brightness-levels =3D <
> +			100 99 98 97 96 95 94 93 92 91
> +			 90 89 88 87 86 85 84 83 82 81
> +			 80 79 78 77 76 75 74 73 72 71
> +			 70 69 68 67 66 65 64 63 62 61
> +			 60 59 58 57 56 55 54 53 52 51
> +			 50 49 48 47 46 45 44 43 42 41
> +			 40 39 38 37 36 35 34 33 32 31
> +			 30 29 28 27 26 25 24 23 22 21
> +			 20 19 18 17 16 15 14 13 12 11
> +			 10  9  8  7  6  5  4  3  2  1
> +			  0

Why is it so unique to start with 100 and end with 0?  Does it even
work?  Here is what I read from bindings doc.

  - brightness-levels: Array of distinct brightness levels. Typically t=
hese
      are in the range from 0 to 255, but any range starting at 0 will =
do.
      The actual brightness level (PWM duty cycle) will be interpolated
      from these values. 0 means a 0% duty cycle (darkest/off), while t=
he
      last value in the array represents a 100% duty cycle (brightest).

> +		>;
> +		default-brightness-level =3D <50>;
> +	};
> +
> +	regulators {
> +		compatible =3D "simple-bus";

This property can be dropped, since it's already defined in
imx53-tx53.dtsi?

> +
> +		reg_lcd_pwr: regulator@5 {

The DT convention is that you need to have a property 'reg =3D <num>' i=
f
the node name is xxx@num.

> +			compatible =3D "regulator-fixed";
> +			regulator-name =3D "LVDS0 POWER";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			gpio =3D <&gpio2 31 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +			regulator-boot-on;
> +		};
> +
> +		reg_lcd_reset: regulator@6 {
> +			compatible =3D "regulator-fixed";
> +			regulator-name =3D "LVDS1 POWER";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			gpio =3D <&gpio3 29 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +			regulator-boot-on;
> +		};
> +	};
> +};
> +
> +&i2c3 {
> +	status =3D "okay";
> +

We generally put 'status' at the bottom of the property list.  So pleas=
e
drop the blank line and move 'status' after 'pinctrl-0'.

> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_i2c3>;
> +
> +	sgtl5000: codec@0a {
> +		compatible =3D "fsl,sgtl5000";
> +		reg =3D <0x0a>;
> +		VDDA-supply =3D <&reg_2v5>;
> +		VDDIO-supply =3D <&reg_3v3>;
> +		clocks =3D <&mclk>;
> +	};
> +
> +	touchscreen: tsc2007@48 {
> +		compatible =3D "ti,tsc2007";
> +		reg =3D <0x48>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_tsc2007>;
> +		interrupt-parent =3D <&gpio3>;
> +		interrupts =3D <26 0>;
> +		gpios =3D <&gpio3 26 GPIO_ACTIVE_LOW>;
> +		ti,x-plate-ohms =3D <660>;
> +		linux,wakeup;
> +	};
> +};
> +
> +&iomuxc {
> +	pinctrl-names =3D "default";

It does not make any sense to have a 'pinctrl-names' property when ther=
e
is no 'pinctrl-0' accompanied.  So, please drop it.

> +
> +	kpp {

It's not so helpful to create a container node for each device, after w=
e
move to board specific pingrp definition.  You can have only one
container of all these pinctrl nodes just like all other IMX board dts
files do.

> +		pinctrl_kpp: kppgrp {
> +			fsl,pins =3D <
> +				MX53_PAD_GPIO_9__KPP_COL_6 0x80000000
> +				MX53_PAD_GPIO_4__KPP_COL_7 0x80000000
> +				MX53_PAD_KEY_COL2__KPP_COL_2 0x80000000
> +				MX53_PAD_KEY_COL3__KPP_COL_3 0x80000000
> +

Nit: drop the blank line.

> +				MX53_PAD_GPIO_2__KPP_ROW_6 0x80000000
> +				MX53_PAD_GPIO_5__KPP_ROW_7 0x80000000
> +				MX53_PAD_KEY_ROW2__KPP_ROW_2 0x80000000
> +				MX53_PAD_KEY_ROW3__KPP_ROW_3 0x80000000
> +			>;
> +		};
> +	};
> +
> +	touchpanel {
> +		pinctrl_tsc2007: tsc2007grp-1 {

Will there be anything like tsc2007grp-2?  Otherwise, tsc2007grp is goo=
d
enough.

> +			fsl,pins =3D <
> +				MX53_PAD_EIM_D26__GPIO3_26 0xe0 /* Interrupt */
> +			>;
> +		};
> +	};
> +};
> +
> +&kpp {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_kpp>;
> +	status =3D "okay";
> +
> +	/* sample keymap */
> +	/* row/col 0,1 are mapped to KPP row/col 6,7 */
> +	linux,keymap =3D <
> +		0x06060074 /* row 6, col 6, KEY_POWER */

With the help of include/dt-bindings/input/input.h, you can write it
MATRIX_KEY(6, 6, KEY_POWER), right?

> +		0x06070052 /* row 6, col 7, KEY_KP0 */
> +		0x0602004f /* row 6, col 2, KEY_KP1 */
> +		0x06030050 /* row 6, col 3, KEY_KP2 */
> +		0x07060051 /* row 7, col 6, KEY_KP3 */
> +		0x0707004b /* row 7, col 7, KEY_KP4 */
> +		0x0702004c /* row 7, col 2, KEY_KP5 */
> +		0x0703004d /* row 7, col 3, KEY_KP6 */
> +		0x02060047 /* row 2, col 6, KEY_KP7 */
> +		0x02070048 /* row 2, col 7, KEY_KP8 */
> +		0x02020049 /* row 2, col 2, KEY_KP9 */
> +	>;
> +	status =3D "okay";
> +};
> diff --git a/arch/arm/boot/dts/imx53-tx53-x13x.dts b/arch/arm/boot/dt=
s/imx53-tx53-x13x.dts
> new file mode 100644
> index 0000000..a5e08e0
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx53-tx53-x13x.dts
> @@ -0,0 +1,283 @@
> +/*
> + * Copyright 2013 Lothar Wa=DFmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> + *
> + * The code contained herein is licensed under the GNU General Publi=
c
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +/dts-v1/;
> +#include "imx53-tx53.dtsi"
> +
> +/ {
> +	model =3D "Ka-Ro electronics TX53 module (LVDS)";
> +	compatible =3D "karo,tx53", "fsl,imx53";
> +
> +	aliases {
> +		display =3D &lvds0;
> +		lvds0 =3D &lvds0;
> +		lvds1 =3D &lvds1;
> +	};
> +
> +	backlight0: pwm-backlight@0 {
> +		compatible =3D "pwm-backlight";
> +		pwms =3D <&pwm2 0 500000>;
> +		power-supply =3D <&reg_3v3>;
> +		brightness-levels =3D <
> +			  0  1  2  3  4  5  6  7  8  9
> +			 10 11 12 13 14 15 16 17 18 19
> +			 20 21 22 23 24 25 26 27 28 29
> +			 30 31 32 33 34 35 36 37 38 39
> +			 40 41 42 43 44 45 46 47 48 49
> +			 50 51 52 53 54 55 56 57 58 59
> +			 60 61 62 63 64 65 66 67 68 69
> +			 70 71 72 73 74 75 76 77 78 79
> +			 80 81 82 83 84 85 86 87 88 89
> +			 90 91 92 93 94 95 96 97 98 99
> +			100
> +		>;
> +		default-brightness-level =3D <50>;
> +	};
> +
> +	backlight1: pwm-backlight@1 {
> +		compatible =3D "pwm-backlight";
> +		pwms =3D <&pwm1 0 500000>;
> +		power-supply =3D <&reg_3v3>;
> +		brightness-levels =3D <
> +			  0  1  2  3  4  5  6  7  8  9
> +			 10 11 12 13 14 15 16 17 18 19
> +			 20 21 22 23 24 25 26 27 28 29
> +			 30 31 32 33 34 35 36 37 38 39
> +			 40 41 42 43 44 45 46 47 48 49
> +			 50 51 52 53 54 55 56 57 58 59
> +			 60 61 62 63 64 65 66 67 68 69
> +			 70 71 72 73 74 75 76 77 78 79
> +			 80 81 82 83 84 85 86 87 88 89
> +			 90 91 92 93 94 95 96 97 98 99
> +			100
> +		>;
> +		default-brightness-level =3D <50>;
> +	};
> +
> +	regulators {
> +		reg_lcd_pwr0: regulator@5 {
> +			compatible =3D "regulator-fixed";
> +			regulator-name =3D "LVDS0 POWER";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			gpio =3D <&gpio3 29 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +			regulator-boot-on;
> +		};
> +
> +		reg_lcd_pwr1: regulator@6 {
> +			compatible =3D "regulator-fixed";
> +			regulator-name =3D "LVDS1 POWER";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			gpio =3D <&gpio2 31 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +			regulator-boot-on;
> +		};
> +	};
> +};
> +
> +&i2c2 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_i2c2>;
> +
> +	touchscreen2: eeti@04 {
> +		compatible =3D "eeti,egalax_ts";
> +		reg =3D <0x04>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_eeti_2>;
> +		interrupt-parent =3D <&gpio3>;
> +		interrupts =3D <23 0>;
> +		wakeup-gpios =3D <&gpio3 23 GPIO_ACTIVE_HIGH>;
> +		linux,wakeup;
> +	};
> +};
> +
> +&i2c3 {
> +	status =3D "okay";
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_i2c3>;
> +
> +	sgtl5000: codec@0a {
> +		compatible =3D "fsl,sgtl5000";
> +		reg =3D <0x0a>;
> +		VDDA-supply =3D <&reg_2v5>;
> +		VDDIO-supply =3D <&reg_3v3>;
> +		clocks =3D <&mclk>;
> +	};

Can this be put into imx53-tx53.dtsi to save the duplication in both dt=
s
files?

> +
> +	touchscreen1: eeti@04 {
> +		compatible =3D "eeti,egalax_ts";
> +		reg =3D <0x04>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_eeti_1>;
> +		interrupt-parent =3D <&gpio3>;
> +		interrupts =3D <22 0>;
> +		wakeup-gpios =3D <&gpio3 22 GPIO_ACTIVE_HIGH>;
> +		linux,wakeup;
> +	};
> +};
> +
> +&iomuxc {
> +	pinctrl-names =3D "default";
> +
> +	i2c {
> +		pinctrl_i2c2: i2c2-grp1 {
> +			fsl,pins =3D <MX53_I2C2_PINGRP1>;
> +		};
> +	};
> +
> +	kpp {
> +		pinctrl_kpp: kppgrp {
> +			fsl,pins =3D <
> +				MX53_PAD_GPIO_9__KPP_COL_6 0x80000000
> +				MX53_PAD_GPIO_4__KPP_COL_7 0x80000000
> +				MX53_PAD_KEY_COL2__KPP_COL_2 0x80000000
> +
> +				MX53_PAD_GPIO_2__KPP_ROW_6 0x80000000
> +				MX53_PAD_GPIO_5__KPP_ROW_7 0x80000000
> +				MX53_PAD_KEY_ROW2__KPP_ROW_2 0x80000000
> +			>;
> +		};
> +	};
> +
> +	lvds {
> +		pinctrl_lvds0: lvds0grp {
> +			fsl,pins =3D <
> +				MX53_PAD_LVDS0_TX3_P__LDB_LVDS0_TX3 0x80000000
> +				MX53_PAD_LVDS0_CLK_P__LDB_LVDS0_CLK 0x80000000
> +				MX53_PAD_LVDS0_TX2_P__LDB_LVDS0_TX2 0x80000000
> +				MX53_PAD_LVDS0_TX1_P__LDB_LVDS0_TX1 0x80000000
> +				MX53_PAD_LVDS0_TX0_P__LDB_LVDS0_TX0 0x80000000
> +			>;
> +		};
> +
> +		pinctrl_lvds1: lvds1grp {
> +			fsl,pins =3D <
> +				MX53_PAD_LVDS1_TX3_P__LDB_LVDS1_TX3 0x80000000
> +				MX53_PAD_LVDS1_TX2_P__LDB_LVDS1_TX2 0x80000000
> +				MX53_PAD_LVDS1_CLK_P__LDB_LVDS1_CLK 0x80000000
> +				MX53_PAD_LVDS1_TX1_P__LDB_LVDS1_TX1 0x80000000
> +				MX53_PAD_LVDS1_TX0_P__LDB_LVDS1_TX0 0x80000000
> +			>;
> +		};
> +	};
> +
> +	pwm {
> +		pinctrl_pwm1: pwm1grp {
> +			fsl,pins =3D <MX53_PAD_GPIO_9__PWM1_PWMO 0x80000000>;
> +		};
> +	};
> +
> +	touchpanel {
> +		pinctrl_eeti_1: eetigrp-1 {

pinctrl_eeti1: eeti1grp

> +			fsl,pins =3D <
> +				MX53_PAD_EIM_D22__GPIO3_22 0xe0 /* Interrupt */
> +			>;
> +		};
> +
> +		pinctrl_eeti_2: eetigrp-2 {

pinctrl_eeti2: eeti2grp

> +			fsl,pins =3D <
> +				MX53_PAD_EIM_D23__GPIO3_23 0xe0 /* Interrupt */
> +			>;
> +		};
> +	};
> +};
> +
> +&kpp {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_kpp>;
> +	status =3D "okay";
> +
> +	/* sample keymap */
> +	/* row/col 0,1 are mapped to KPP row/col 6,7
> +	 * row/col 3 are used for I2C2 (second touch controller on hsd100px=
n1)
> +	 */
> +	linux,keymap =3D <
> +		0x06060074 /* row 6, col 6, KEY_POWER */
> +		0x06070052 /* row 6, col 7, KEY_KP0 */
> +		0x0602004f /* row 6, col 2, KEY_KP1 */
> +		0x07060050 /* row 7, col 6, KEY_KP2 */
> +		0x07070051 /* row 7, col 7, KEY_KP3 */
> +		0x0702004b /* row 7, col 2, KEY_KP4 */
> +		0x0206004c /* row 2, col 6, KEY_KP5 */
> +		0x0207004d /* row 2, col 7, KEY_KP6 */
> +		0x02020047 /* row 2, col 2, KEY_KP7 */
> +	>;
> +};
> +
> +&ldb {
> +	status =3D "okay";
> +//	fsl,dual-channel;

Drop it.

> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_lvds0 &pinctrl_lvds1>;
> +
> +	lvds0: lvds-channel@0 {
> +		fsl,data-mapping =3D "jeida";
> +		fsl,data-width =3D <24>;
> +		status =3D "okay";
> +
> +		display-timings {
> +			native-mode =3D <&lvds_timing0>;
> +			lvds_timing0: hsd100pxn1 {
> +				clock-frequency =3D <65000000>;
> +				hactive =3D <1024>;
> +				vactive =3D <768>;
> +				hback-porch =3D <220>;
> +				hsync-len =3D <60>;
> +				hfront-porch =3D <40>;
> +				vback-porch =3D <21>;
> +				vsync-len =3D <10>;
> +				vfront-porch =3D <7>;
> +				hsync-active =3D <0>;
> +				vsync-active =3D <0>;
> +				de-active =3D <1>;
> +				pixelclk-active =3D <0>;
> +			};
> +		};
> +	};
> +
> +	lvds1: lvds-channel@1 {
> +		fsl,data-mapping =3D "jeida";
> +		fsl,data-width =3D <24>;
> +		status =3D "okay";
> +
> +		display-timings {
> +			native-mode =3D <&lvds_timing1>;
> +			lvds_timing1: hsd100pxn1 {
> +				clock-frequency =3D <65000000>;
> +				hactive =3D <1024>;
> +				vactive =3D <768>;
> +				hback-porch =3D <220>;
> +				hsync-len =3D <60>;
> +				hfront-porch =3D <40>;
> +				vback-porch =3D <21>;
> +				vsync-len =3D <10>;
> +				vfront-porch =3D <7>;
> +				hsync-active =3D <0>;
> +				vsync-active =3D <0>;
> +				de-active =3D <1>;
> +				pixelclk-active =3D <0>;
> +			};
> +		};
> +	};
> +};
> +
> +&pwm1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_pwm1>;
> +};
> +
> +&sata {
> +	status =3D "okay";
> +};
> diff --git a/arch/arm/boot/dts/imx53-tx53.dtsi b/arch/arm/boot/dts/im=
x53-tx53.dtsi
> index db4255c..63bfa97 100644
> --- a/arch/arm/boot/dts/imx53-tx53.dtsi
> +++ b/arch/arm/boot/dts/imx53-tx53.dtsi
> @@ -1,125 +1,455 @@
>  /*
> - * Copyright 2013 Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> + * Copyright 2012 <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> + * based on imx53-qsb.dts
> + *   Copyright 2011 Freescale Semiconductor, Inc.
> + *   Copyright 2011 Linaro Ltd.
>   *
>   * The code contained herein is licensed under the GNU General Publi=
c
>   * License. You may obtain a copy of the GNU General Public License
> - * Version 2 or later at the following locations:
> + * Version 2 at the following locations:
>   *
>   * http://www.opensource.org/licenses/gpl-license.html
>   * http://www.gnu.org/copyleft/gpl.html
>   */
> =20
> -/include/ "imx53.dtsi"
> +#include "imx53.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> =20
>  / {
> -	model =3D "Ka-Ro TX53";
> +	model =3D "Ka-Ro electronics TX53 module";
>  	compatible =3D "karo,tx53", "fsl,imx53";
> =20
> -	memory {
> -		reg =3D <0x70000000 0x40000000>; /* Up to 1GiB */
> +	aliases {
> +		can0 =3D &can1;
> +		can1 =3D &can2;
> +		ipu =3D &ipu;
> +		reg_can_xcvr =3D &reg_can_xcvr;
> +		usbh1 =3D &usbh1;
> +		usbotg =3D &usbotg;
> +	};
> +
> +	clocks {
> +		ckih1 {
> +			clock-frequency =3D <0>;
> +		};
> +
> +		mclk: codec_clock {

s/codec_clock/clock@0

> +			compatible =3D "fixed-clock";
> +			reg =3D <0>;
> +			#clock-cells =3D <0>;
> +			clock-frequency =3D <27000000>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +
> +		power {
> +			label =3D "Power Button";
> +			gpios =3D <&gpio5 2 GPIO_ACTIVE_HIGH>;
> +			linux,code =3D <116>; /* KEY_POWER */
> +			gpio-key,wakeup;
> +		};
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_stk5led>;
> +
> +		user {
> +			label =3D "Heartbeat";
> +			gpios =3D <&gpio2 20 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
>  	};
> =20
>  	regulators {
>  		compatible =3D "simple-bus";
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;

Keep these.  They are the specification of 'reg' property for the child
nodes.

> =20
> -		reg_3p3v: regulator@0 {
> +		reg_2v5: regulator@0 {
>  			compatible =3D "regulator-fixed";
> -			reg =3D <0>;

Keep this.

> -			regulator-name =3D "3P3V";
> +			regulator-name =3D "2V5";
> +			regulator-min-microvolt =3D <2500000>;
> +			regulator-max-microvolt =3D <2500000>;
> +		};
> +
> +		reg_3v3: regulator@1 {
> +			compatible =3D "regulator-fixed";

Add 'reg' property as well as the following regulator nodes.

> +			regulator-name =3D "3V3";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +		};
> +
> +		reg_can_xcvr: regulator@2 {
> +			compatible =3D "regulator-fixed";
> +			regulator-name =3D "CAN XCVR";
>  			regulator-min-microvolt =3D <3300000>;
>  			regulator-max-microvolt =3D <3300000>;
> -			regulator-always-on;
> +			gpio =3D <&gpio4 21 GPIO_ACTIVE_HIGH>;
> +			enable-active-low;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_can_xcvr>;
> +		};
> +
> +		reg_usbh1_vbus: regulator@3 {
> +			compatible =3D "regulator-fixed";
> +			regulator-name =3D "usbh1_vbus";
> +			regulator-min-microvolt =3D <5000000>;
> +			regulator-max-microvolt =3D <5000000>;
> +			gpio =3D <&gpio3 31 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +		};
> +
> +		reg_usbotg_vbus: regulator@4 {
> +			compatible =3D "regulator-fixed";
> +			regulator-name =3D "usbotg_vbus";
> +			regulator-min-microvolt =3D <5000000>;
> +			regulator-max-microvolt =3D <5000000>;
> +			gpio =3D <&gpio1 7 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
>  		};
>  	};
> +
> +	sound {
> +		compatible =3D "karo,tx53-audio-sgtl5000", "fsl,imx-audio-sgtl5000=
";
> +		model =3D "tx53-audio-sgtl5000";
> +		ssi-controller =3D <&ssi1>;
> +		audio-codec =3D <&sgtl5000>;
> +		audio-routing =3D
> +			"MIC_IN", "Mic Jack",
> +			"Mic Jack", "Mic Bias",
> +			"Headphone Jack", "HP_OUT";
> +		/* '1' based port numbers according to datasheet names */
> +		mux-int-port =3D <1>;
> +		mux-ext-port =3D <5>;
> +	};
> +};
> +
> +&audmux {
> +	status =3D "okay";
>  };
> =20
>  &can1 {
>  	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_can1_2>;
> -	status =3D "disabled";
> +	pinctrl-0 =3D <&pinctrl_can1>;
> +	xceiver-supply =3D <&reg_can_xcvr>;
> +

Drop this blank line.

> +	status =3D "okay";
>  };
> =20
>  &can2 {
>  	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_can2_1>;
> -	status =3D "disabled";
> +	pinctrl-0 =3D <&pinctrl_can2>;
> +	xceiver-supply =3D <&reg_can_xcvr>;
> +

Ditto

> +	status =3D "okay";
>  };
> =20
>  &ecspi1 {
> +	status =3D "okay";
> +

Drop the blank line and move the property to end of property list.

>  	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_ecspi1_2>;
> -	status =3D "disabled";
> +	pinctrl-0 =3D <&pinctrl_ecspi1>;
> +

Drop this blank line.

> +	fsl,spi-num-chipselects =3D <2>;

Have a blank line between node and property.

> +	cs-gpios =3D <
> +		&gpio2 30 GPIO_ACTIVE_HIGH
> +		&gpio3 19 GPIO_ACTIVE_HIGH
> +	>;
> +
> +	spidev0: spi@0 {
> +		compatible =3D "spidev";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <54000000>;
> +	};
>  };
> =20
>  &esdhc1 {
> +	status =3D "okay";

Move it to end.

> +	cd-gpios =3D <&gpio3 24 GPIO_ACTIVE_HIGH>;
> +	fsl,wp-controller;
>  	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_esdhc1_2>;
> -	status =3D "disabled";
> +	pinctrl-0 =3D <&pinctrl_esdhc1>;
>  };
> =20
>  &esdhc2 {
> +	status =3D "okay";

Ditto

> +	cd-gpios =3D <&gpio3 25 GPIO_ACTIVE_HIGH>;
> +	fsl,wp-controller;
>  	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_esdhc2_1>;
> -	status =3D "disabled";
> +	pinctrl-0 =3D <&pinctrl_esdhc2>;
>  };
> =20
>  &fec {
> +	status =3D "okay";
> +

Ditto

>  	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_fec_1>;
> +	pinctrl-0 =3D <&pinctrl_fec>;
> +

Drop the line.

>  	phy-mode =3D "rmii";
> -	status =3D "disabled";
> +	phy-reset-gpios =3D <&gpio7 6 GPIO_ACTIVE_HIGH>;
> +	phy-handle =3D <&phy0>;
> +	mac-address =3D [000000000000]; /* placeholder; will be overwritten=
 by bootloader */
> +
> +	phy0: ethernet-phy@0 {
> +		interrupt-parent =3D <&gpio2>;
> +		interrupts =3D <4>;
> +		device_type =3D "ethernet-phy";
> +	};
>  };
> =20
> -&i2c3 {
> +&i2c1 {
>  	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_i2c3_2>;
> -	status =3D "disabled";
> +	pinctrl-0 =3D <&pinctrl_i2c1>;
> +	clock-frequency =3D <400000>;
> +	status =3D "okay";
> +
> +	rtc1: ds1339@68 {
> +		compatible =3D "dallas,ds1339";
> +		reg =3D <0x68>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_ds1339>;
> +		interrupt-parent =3D <&gpio4>;
> +		interrupts =3D <20 0>;
> +	};
> +
> +	pmic: lt3589@48 {
> +		compatible =3D "lt,lt3589";
> +		reg =3D <0x48>;
> +	};
>  };
> =20
> -&owire {
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_owire_1>;
> -	status =3D "disabled";
> +&iomuxc {
> +	display {

One container node, please.

> +		pinctrl_rgb24_vga_1: rgb24-vga-grp-1 {
> +			fsl,pins =3D <
> +				MX53_PAD_DISP0_DAT0__IPU_DISP0_DAT_0 0x80000000
> +				MX53_PAD_DISP0_DAT1__IPU_DISP0_DAT_1 0x80000000
> +				MX53_PAD_DISP0_DAT2__IPU_DISP0_DAT_2 0x80000000
> +				MX53_PAD_DISP0_DAT3__IPU_DISP0_DAT_3 0x80000000
> +				MX53_PAD_DISP0_DAT4__IPU_DISP0_DAT_4 0x80000000
> +				MX53_PAD_DISP0_DAT5__IPU_DISP0_DAT_5 0x80000000
> +				MX53_PAD_DISP0_DAT6__IPU_DISP0_DAT_6 0x80000000
> +				MX53_PAD_DISP0_DAT7__IPU_DISP0_DAT_7 0x80000000
> +				MX53_PAD_DISP0_DAT8__IPU_DISP0_DAT_8 0x80000000
> +				MX53_PAD_DISP0_DAT9__IPU_DISP0_DAT_9 0x80000000
> +				MX53_PAD_DISP0_DAT10__IPU_DISP0_DAT_10 0x80000000
> +				MX53_PAD_DISP0_DAT11__IPU_DISP0_DAT_11 0x80000000
> +				MX53_PAD_DISP0_DAT12__IPU_DISP0_DAT_12 0x80000000
> +				MX53_PAD_DISP0_DAT13__IPU_DISP0_DAT_13 0x80000000
> +				MX53_PAD_DISP0_DAT14__IPU_DISP0_DAT_14 0x80000000
> +				MX53_PAD_DISP0_DAT15__IPU_DISP0_DAT_15 0x80000000
> +				MX53_PAD_DISP0_DAT16__IPU_DISP0_DAT_16 0x80000000
> +				MX53_PAD_DISP0_DAT17__IPU_DISP0_DAT_17 0x80000000
> +				MX53_PAD_DISP0_DAT18__IPU_DISP0_DAT_18 0x80000000
> +				MX53_PAD_DISP0_DAT19__IPU_DISP0_DAT_19 0x80000000
> +				MX53_PAD_DISP0_DAT20__IPU_DISP0_DAT_20 0x80000000
> +				MX53_PAD_DISP0_DAT21__IPU_DISP0_DAT_21 0x80000000
> +				MX53_PAD_DISP0_DAT22__IPU_DISP0_DAT_22 0x80000000
> +				MX53_PAD_DISP0_DAT23__IPU_DISP0_DAT_23 0x80000000
> +				MX53_PAD_DI0_PIN2__IPU_DI0_PIN2 0x80000000 /* HSYNC */
> +				MX53_PAD_DI0_PIN3__IPU_DI0_PIN3 0x80000000 /* VSYNC */
> +				MX53_PAD_DI0_PIN15__IPU_DI0_PIN15 0x80000000 /* OE */
> +				MX53_PAD_DI0_DISP_CLK__IPU_DI0_DISP_CLK 0x80000000 /* PIXCLK */
> +			>;
> +		};
> +
> +		pinctrl_rgb24_vga_2: rgb24-vga-grp-2 {
> +			fsl,pins =3D <
> +				MX53_PAD_EIM_DA0__IPU_DISP1_DAT_9 0x80000000
> +				MX53_PAD_EIM_DA1__IPU_DISP1_DAT_8 0x80000000
> +				MX53_PAD_EIM_DA2__IPU_DISP1_DAT_7 0x80000000
> +				MX53_PAD_EIM_DA3__IPU_DISP1_DAT_6 0x80000000
> +				MX53_PAD_EIM_DA4__IPU_DISP1_DAT_5 0x80000000
> +				MX53_PAD_EIM_DA5__IPU_DISP1_DAT_4 0x80000000
> +				MX53_PAD_EIM_DA6__IPU_DISP1_DAT_3 0x80000000
> +				MX53_PAD_EIM_DA7__IPU_DISP1_DAT_2 0x80000000
> +				MX53_PAD_EIM_DA8__IPU_DISP1_DAT_1 0x80000000
> +				MX53_PAD_EIM_DA9__IPU_DISP1_DAT_0 0x80000000
> +			>;
> +		};
> +	};
> +
> +	ds1339 {
> +		pinctrl_ds1339: ds1339grp {
> +			fsl,pins =3D <MX53_PAD_DI0_PIN4__GPIO4_20 0xe0>;
> +		};
> +	};
> +
> +	ecspi {
> +		pinctrl_ecspi1: ecspi1grp {
> +			fsl,pins =3D <MX53_ECSPI1_PINGRP2>;
> +		};
> +	};
> +
> +	esdhc {
> +		pinctrl_esdhc1: esdhc1grp {
> +			fsl,pins =3D <MX53_ESDHC1_PINGRP1
> +				MX53_PAD_EIM_D24__GPIO3_24 0x1f0
> +			>;
> +		};
> +
> +		pinctrl_esdhc2: esdhc2grp {
> +			fsl,pins =3D <MX53_ESDHC2_PINGRP1
> +				MX53_PAD_EIM_D25__GPIO3_25 0x1f0
> +			>;
> +		};
> +	};
> +
> +	fec {
> +		pinctrl_fec: fecgrp {
> +			fsl,pins =3D <MX53_FEC_PINGRP1>;
> +		};
> +	};
> +
> +	flexcan {
> +		pinctrl_can1: can1grp {
> +			fsl,pins =3D <MX53_CAN1_PINGRP3>;
> +		};
> +
> +		pinctrl_can2: can2grp {
> +			fsl,pins =3D <MX53_CAN1_PINGRP3>;
> +		};
> +
> +		pinctrl_can_xcvr: can-xcvrgrp {
> +			fsl,pins =3D <MX53_PAD_DISP0_DAT0__GPIO4_21 0xe0>; /* Flexcan XCV=
R enable */
> +		};
> +	};
> +
> +	i2c {
> +
> +		pinctrl_i2c1: i2c1grp {
> +			fsl,pins =3D <MX53_I2C1_PINGRP2>;
> +		};
> +
> +		pinctrl_i2c3: i2c3grp {
> +			fsl,pins =3D <MX53_I2C3_PINGRP2>;
> +		};
> +	};
> +
> +	leds {
> +		pinctrl_stk5led: stk5ledgrp {
> +			fsl,pins =3D <MX53_PAD_EIM_A18__GPIO2_20 0xc0>;
> +		};
> +	};
> +
> +	pwm {
> +		pinctrl_pwm2: pwm2grp {
> +			fsl,pins =3D <MX53_PWM2_PINGRP1>;
> +		};
> +	};
> +
> +	ssi {
> +		pinctrl_ssi1: ssi1grp {
> +			fsl,pins =3D <MX53_AUDMUX_PINGRP1
> +				MX53_PAD_EIM_D26__GPIO3_26 0x1f0
> +			>;
> +		};
> +
> +		pinctrl_ssi2: ssi2grp {
> +			fsl,pins =3D <MX53_AUDMUX_PINGRP3
> +				MX53_PAD_EIM_D27__GPIO3_27 0x1f0
> +			>;
> +		};
> +	};
> +
> +	uart {
> +		pinctrl_uart1: uart1grp {
> +			fsl,pins =3D <MX53_UART1_PINGRP2 MX53_UART1_PINGRP3>;
> +		};
> +
> +		pinctrl_uart2: uart2grp {
> +			fsl,pins =3D <MX53_UART2_PINGRP2>;
> +		};
> +
> +		pinctrl_uart3: uart3grp {
> +			fsl,pins =3D <MX53_UART3_PINGRP1>;
> +		};
> +	};
> +
> +	usbh1 {
> +		pinctrl_usbh1: usbh1grp {
> +			fsl,pins =3D <
> +				MX53_PAD_EIM_D31__GPIO3_31 0xe0 /* VBUS ENABLE */
> +				MX53_PAD_EIM_D30__GPIO3_30 0x100 /* OC */
> +			>;
> +		};
> +	};
> +
> +	usbotg {
> +		pinctrl_usbotg: usbotggrp {
> +			fsl,pins =3D <
> +				MX53_PAD_GPIO_7__GPIO1_7 0xe0 /* VBUS ENABLE */
> +				MX53_PAD_GPIO_8__GPIO1_8 0x100 /* OC */
> +			>;
> +		};
> +	};
> +};
> +
> +&ipu {
> +	status =3D "okay";
> +};
> +
> +&nfc {
> +	nand-bus-width =3D <8>;
> +	nand-ecc-mode =3D "hw";
> +	nand-on-flash-bbt;
> +	status =3D "okay";
>  };
> =20
>  &pwm2 {
>  	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_pwm2_1>;
> -	status =3D "disabled";
> +	pinctrl-0 =3D <&pinctrl_pwm2>;
> +};
> +
> +&sdma {
> +	fsl,sdma-ram-script-name =3D "sdma-imx53.bin";
>  };
> =20
>  &ssi1 {
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_audmux_1>;
> -	status =3D "disabled";
> +	fsl,mode =3D "i2s-slave";
> +	codec-handle =3D <&sgtl5000>;
> +	status =3D "okay";
>  };
> =20
>  &ssi2 {
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_audmux_2>;
>  	status =3D "disabled";
>  };

Then you can drop the node completely.

Shawn

> =20
>  &uart1 {
>  	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_uart1_2>,
> -		    <&pinctrl_uart1_3>;
> +	pinctrl-0 =3D <&pinctrl_uart1>;
>  	fsl,uart-has-rtscts;
> -	status =3D "disabled";
> +	status =3D "okay";
>  };
> =20
>  &uart2 {
>  	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_uart2_2>;
> +	pinctrl-0 =3D <&pinctrl_uart2>;
>  	fsl,uart-has-rtscts;
> -	status =3D "disabled";
> +	status =3D "okay";
>  };
> =20
>  &uart3 {
>  	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_uart3_1>;
> +	pinctrl-0 =3D <&pinctrl_uart3>;
>  	fsl,uart-has-rtscts;
> -	status =3D "disabled";
> +	status =3D "okay";
> +};
> +
> +&usbh1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usbh1>;
> +	disable-over-current;
> +	vbus-supply =3D <&reg_usbh1_vbus>;
> +	status =3D "okay";
> +};
> +
> +&usbotg {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_usbotg>;
> +	disable-over-current;
> +	vbus-supply =3D <&reg_usbotg_vbus>;
> +	status =3D "okay";
>  };
> --=20
> 1.7.2.5
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
