From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv3] ARM: dts: imx53: Add GE Healthcare PPD
Date: Fri, 30 Jun 2017 12:52:30 -0300
Message-ID: <CAOMZO5AcQCaXqyx0GW83Dj9XWuvBjgQg5V3vufiTUai_fNya-Q@mail.gmail.com>
References: <20170626131104.19912-1-sebastian.reichel@collabora.co.uk> <20170630095424.21782-1-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170630095424.21782-1-sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, nux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabien Lahoudere <fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sebastian,

On Fri, Jun 30, 2017 at 6:54 AM, Sebastian Reichel
<sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:

> diff --git a/arch/arm/boot/dts/imx53-ppd.dts b/arch/arm/boot/dts/imx53-ppd.dts
> new file mode 100644
> index 000000000000..56c24765b6f9
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx53-ppd.dts
> @@ -0,0 +1,1022 @@
> +/*
> + * Copyright 2014 General Electric Company
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */

Could you consider to make it dual license: GPLv2 and X11?

Other GE mx6-based boards do use dual license. Please check:
arch/arm/boot/dts/imx6q-bx50v3.dtsi

> +
> +/dts-v1/;
> +
> +#include "imx53.dtsi"
> +
> +/ {
> +       model = "Freescale i.MX53 CPUV0 PPD rev6";
> +       compatible = "fsl,imx53-cpuvo", "fsl,imx53";

This board is manufactured by GE, so this should be:

 compatible = "ge,imx53-cpuvo", "fsl,imx53";

> +       reg_usb_otg_vbus: regulator-usb-otg-vbus {
> +               compatible = "regulator-fixed";
> +               regulator-name = "usbotg_vbus";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               pinctrl-0 = <&pinctrl_usb_otg_vbus>;
> +               gpio = <&gpio4 15 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +               regulator-always-on;

As this is controlled by a GPIO via the usb chipidea driver, it can be
turned off, so passing 'regulator-always-on;' does not seem correct
here.

> +       };
> +
> +       reg_usb_vbus: regulator-usb-vbus {
> +               compatible = "regulator-fixed";
> +               regulator-name = "usbh1_vbus";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               pinctrl-0 = <&pinctrl_usbh1_vbus>;
> +               gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +               regulator-always-on;

Ditto.

> +       };
> +
> +       reg_usbh2_vbus: regulator-usbh2-vbus {
> +               compatible = "regulator-fixed";
> +               regulator-name = "usbh2_vbus";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_usbh2_vbus>;
> +               gpio = <&gpio3 31 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +               regulator-boot-on;
> +       };
> +
> +       reg_usbh3_vbus: regulator-usbh3-vbus {
> +               compatible = "regulator-fixed";
> +               regulator-name = "usbh3_vbus";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_usbh3_vbus>;
> +               gpio = <&gpio5 27 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +               regulator-boot-on;
> +       };
> +
> +       backlight: pwm-bl@2 {

Why do you pass the @2 here?

> +               compatible = "pwm-backlight";
> +               pwms = <&pwm2 0 50000>;
> +               brightness-levels = <0 2 5 7 10 12 15 17 20 22 25 28 30 33 35 \
> +                                    38 40 43 45 48 51 53 56 58 61 63 66 68 71 \
> +                                    73 76 79 81 84 86 89 91 94 96 99 102 104 \
> +                                    107 109 112 114 117 119 122 124 127 130 \
> +                                    132 135 137 140 142 145 147 150 153 155 \
> +                                    158 160 163 165 168 170 173 175 178 181 \
> +                                    183 186 188 191 193 196 198 201 204 206 \
> +                                    209 211 214 216 219 221 224 226 229 232 \
> +                                    234 237 239 242 244 247 249 252 255>;
> +               default-brightness-level = <0>;
> +               enable-gpios = <&gpio5 29 GPIO_ACTIVE_HIGH>;
> +       };

> +       power-gpio-keys {
> +               compatible = "gpio-keys";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               power-button {
> +                       label = "Power button";
> +                       gpios = <&gpio4 13 0>;

You can pass the GPIO flag as label for better readability: GPIO_ACTIVE_HIGH

> +                       linux,code = <116>;
> +               };
> +       };
> +
> +       touch-lock-key {
> +               compatible = "gpio-keys";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               touch-lock-button {
> +                       label = "Touch lock button";
> +                       gpios = <&gpio5 2 GPIO_ACTIVE_LOW>;
> +                       linux,code = <88>;
> +               };
> +       };
> +
> +       usbphy2: usbphy@2 {

You pass @2, but does not pass reg = <2>, so dtc should complain if
you build it with W=1.

Seems like you can simply remove the @2.

> +               compatible = "usb-nop-xceiv";
> +               reset-gpios = <&gpio4 4 GPIO_ACTIVE_LOW>;
> +               clock-names = "main_clk";
> +
> +               clock-frequency = <24000000>;
> +               clocks = <&clks IMX5_CLK_CKO2>;
> +               assigned-clocks = <&clks IMX5_CLK_CKO2_SEL>, <&clks IMX5_CLK_OSC>;
> +               assigned-clock-parents = <&clks IMX5_CLK_OSC>;
> +               status = "okay";
> +       };
> +
> +       usbphy3: usbphy@3 {

Ditto.

> +               compatible = "usb-nop-xceiv";
> +               reset-gpios = <&gpio2 19 GPIO_ACTIVE_LOW>;
> +               clock-names = "main_clk";
> +
> +               clock-frequency = <24000000>;
> +               clocks = <&clks IMX5_CLK_CKO2>;
> +               assigned-clocks = <&clks IMX5_CLK_CKO2_SEL>, <&clks IMX5_CLK_OSC>;
> +               assigned-clock-parents = <&clks IMX5_CLK_OSC>;
> +               status = "okay";
> +       };
> +
> +       panel-lvds0 {
> +               compatible = "nvd,9128";
> +               port {
> +                       panel_in_lvds0: endpoint {
> +                               remote-endpoint = <&lvds0_out>;
> +                       };
> +               };
> +       };
> +};
> +
> +
> +/* Pin configuration variables */
> +#define NO_PAD_CTL 0x00010000
> +#define XX_PAD_CTL 0x80000000

Better not pass 0x80000000 as it relies on the bootloader
configuration of the IOMUX.

Use the real IOMUX configured value instead.
> +&ldb {
> +       status = "okay";
> +       lvds0: lvds-channel@0 {
> +               status = "okay";
> +               port@2 {
> +                       reg = <2>;
> +                       lvds0_out: endpoint {
> +                               remote-endpoint = <&panel_in_lvds0>;
> +                       };
> +               };
> +       };
> +};
> +
> +

No need for two blank lines.

> +&uart5 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_uart5>;
> +       status = "okay";
> +};
> +
> +&audmux {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_audmux>;
> +       status = "okay";
> +};

Please keep nodes in alphabetical order. Usually the iomux one can go
as the last one.

> +&fec {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_fec>;
> +       phy-mode = "rmii";
> +       phy-reset-gpios = <&gpio2 16 0>;

0 means active high, but I guess you are hardware is using this GPIO
as active low because as FEC driver ignores the GPIO polarity and
assume active low by default.

It is better to  use phy-reset-gpios = <&gpio2 16 GPIO_ACTIVE_LOW>; instead

> +       status = "okay";
> +};
> +
> +&i2c1 {
> +       pinctrl-names = "default", "gpio";
> +       pinctrl-0 = <&pinctrl_i2c1>;
> +       pinctrl-1 = <&pinctrl_i2c1_gpio>;
> +       sda-gpios = <&gpio3 28 GPIO_ACTIVE_HIGH>;
> +       scl-gpios = <&gpio3 21 GPIO_ACTIVE_HIGH>;
> +       status = "okay";
> +
> +       i2xmux_pca: i2c-mux_pca954x {
> +               compatible = "nxp,pca9547";
> +               reg = <0x70>;

You pass reg = <0x70> but no @70. dtc should complain about it if you
build it with W=1.


> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reset-gpios = <&gpio2 18 GPIO_ACTIVE_LOW>;
> +
> +               i2c4: i2cmux-ppd-0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;

Ditto.

> +
> +                       sgtl5000: codec@0a {
> +                               compatible = "fsl,sgtl5000";
> +                               reg = <0x0a>;
> +                               VDDA-supply = <&reg_sgtl5k>;
> +                               VDDIO-supply = <&reg_sgtl5k>;
> +                               clocks = <&cko2_11M>;
> +                               status = "okay";
> +                       };
> +               };
> +               i2c5: i2cmux-ppd-1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;

Ditto.

> +                       rtc@30 {
> +                              compatible = "sii,s35390a";
> +                              reg = <0x30>;
> +                       };
> +                       tmp112@48 {
> +                               compatible = "ti,tmp112";
> +                               reg = <0x48>;
> +                       };
> +                       mma8453q@1c {
> +                               compatible = "fsl,mma8453";
> +                               reg = <0x1c>;
> +                               interrupt-parent = <&gpio1>;
> +                               interrupts = <6 0>;
> +                               interrupt-names = "INT1";
> +                       };
> +                       mpl3115: mpl3115@60 {
> +                               compatible = "fsl,mpl3115";
> +                               reg = <0x60>;
> +                       };
> +                       eeprom: eeprom@50 {
> +                               compatible = "atmel,24c08";
> +                               reg = <0x50>;
> +                       };
> +               };
> +               i2c6: i2cmux-ppd-2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +               };
> +               i2c7: i2cmux-ppd-3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +               };
> +               i2c8: i2cmux-ppd-4 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <4>;
> +               };
> +               i2c9: i2cmux-ppd-5 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <5>;
> +               };
> +               i2c10: i2cmux-ppd-6 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <6>;
> +               };
> +               i2c11: i2cmux-ppd-7 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <7>;
> +               };
> +       };
> +};
> +
> +&i2c2 {
> +       pinctrl-names = "default", "gpio";
> +       pinctrl-0 = <&pinctrl_i2c2>;
> +       pinctrl-1 = <&pinctrl_i2c2_gpio>;
> +       sda-gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
> +       scl-gpios = <&gpio2 30 GPIO_ACTIVE_HIGH>;
> +       status = "okay";
> +
> +       touchscreen@4b {
> +               compatible = "atmel,maxtouch";
> +               reg = <0x4b>;
> +               interrupt-parent = <&gpio5>;
> +               interrupts = <4 0x8>;
> +       };
> +};
> +
> +&i2c3 {
> +       pinctrl-names = "default", "gpio";
> +       pinctrl-0 = <&pinctrl_i2c3>;
> +       pinctrl-1 = <&pinctrl_i2c3_gpio>;
> +       sda-gpios = <&gpio3 18 GPIO_ACTIVE_HIGH>;
> +       scl-gpios = <&gpio3 17 GPIO_ACTIVE_HIGH>;
> +       status = "okay";
> +

Remove this empty line.

> +};

> +
> +&ssi2 {
> +       fsl,mode = "i2s-slave";

This is not used. Please remove it.

> +&usbotg {
> +       dr_mode = "otg";
> +       phy_type = "utmi";
> +       status = "okay";

Usually we put the status property in the end.

> +       vbus-supply = <&reg_usb_otg_vbus>;
> +       pinctrl-0 = <&pinctrl_usb_otg>;
> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
