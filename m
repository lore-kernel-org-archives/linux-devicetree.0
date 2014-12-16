From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm: dts: imx6sx: add i.mx6sx sabreauto board support
Date: Tue, 16 Dec 2014 15:55:51 +0800
Message-ID: <20141216075548.GF2411@dragon>
References: <1418022354-21988-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1418022354-21988-1-git-send-email-b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 08, 2014 at 03:05:54PM +0800, Anson Huang wrote:
> Add basic i.MX6SoloX Sabre Auto board support, currently
> only debug UART and uSDHC are supported on this board.
> 
> Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Use "ARM: " in the patch prefix.

> ---
>  arch/arm/boot/dts/Makefile             |    1 +
>  arch/arm/boot/dts/imx6sx-sabreauto.dts |  135 ++++++++++++++++++++++++++++++++
>  2 files changed, 136 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6sx-sabreauto.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 4600499..f5acbc1 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -251,6 +251,7 @@ dtb-$(CONFIG_ARCH_MXC) += \
>  	imx6q-tx6q-1110.dtb \
>  	imx6sl-evk.dtb \
>  	imx6sx-sdb.dtb \
> +	imx6sx-sabreauto.dtb \

I just checked my alphabet table, and it tells 'a' goes before 'b'.

>  	ls1021a-qds.dtb \
>  	ls1021a-twr.dtb \
>  	vf500-colibri-eval-v3.dtb \
> diff --git a/arch/arm/boot/dts/imx6sx-sabreauto.dts b/arch/arm/boot/dts/imx6sx-sabreauto.dts
> new file mode 100644
> index 0000000..95f7f0f
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6sx-sabreauto.dts
> @@ -0,0 +1,135 @@
> +/*
> + * Copyright (C) 2014 Freescale Semiconductor, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6sx.dtsi"
> +
> +/ {
> +	model = "Freescale i.MX6 SoloX Sabre Auto Board";
> +	compatible = "fsl,imx6sx-sabreauto", "fsl,imx6sx";
> +
> +	memory {
> +		reg = <0x80000000 0x80000000>;
> +	};
> +
> +	regulators {
> +		compatible = "simple-bus";
> +
> +		reg_sd3_vmmc: sd3_vmmc{
> +			compatible = "regulator-fixed";
> +			regulator-name = "VCC_SD3";
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3000000>;
> +			gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +		};

Check imx6sx-sdb.dts for examples how we do fixed regulators.

> +	};
> +};
> +
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1_1>;
> +	status = "okay";
> +};
> +
> +&usdhc3 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc3_1>;
> +	pinctrl-1 = <&pinctrl_usdhc3_1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc3_1_200mhz>;
> +	bus-width = <8>;
> +	cd-gpios = <&gpio7 10 0>;
> +	wp-gpios = <&gpio3 19 0>;

Use GPIO_ACTIVE_HIGH just like what you did for regulator above.

> +	keep-power-in-suspend;
> +	enable-sdio-wakeup;
> +	vmmc-supply = <&reg_sd3_vmmc>;
> +	status = "okay";
> +};
> +
> +&usdhc4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_usdhc4_3>;
> +	bus-width = <8>;
> +	cd-gpios = <&gpio7 11 0>;

Ditto

> +	no-1-8-v;
> +	keep-power-in-suspend;
> +	enable-sdio-wakup;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	imx6x-sabreauto {
> +		pinctrl_uart1_1: uart1grp {

The label can just be as simple as "pinctrl_uart1".  The last number in
the name means nothing now, since we define pin groups per board.

> +			fsl,pins = <
> +				MX6SX_PAD_GPIO1_IO04__UART1_TX		0x1b0b1
> +				MX6SX_PAD_GPIO1_IO05__UART1_RX		0x1b0b1
> +			>;
> +		};
> +
> +		pinctrl_usdhc3_1: usdhc3grp {

pinctrl_usdhc3

> +			fsl,pins = <
> +				MX6SX_PAD_SD3_CMD__USDHC3_CMD		0x17059
> +				MX6SX_PAD_SD3_CLK__USDHC3_CLK		0x10059
> +				MX6SX_PAD_SD3_DATA0__USDHC3_DATA0	0x17059
> +				MX6SX_PAD_SD3_DATA1__USDHC3_DATA1	0x17059
> +				MX6SX_PAD_SD3_DATA2__USDHC3_DATA2	0x17059
> +				MX6SX_PAD_SD3_DATA3__USDHC3_DATA3	0x17059
> +				MX6SX_PAD_SD3_DATA4__USDHC3_DATA4	0x17059
> +				MX6SX_PAD_SD3_DATA5__USDHC3_DATA5	0x17059
> +				MX6SX_PAD_SD3_DATA6__USDHC3_DATA6	0x17059
> +				MX6SX_PAD_SD3_DATA7__USDHC3_DATA7	0x17059
> +				MX6SX_PAD_KEY_COL0__GPIO2_IO_10		0x17059 /* CD */
> +				MX6SX_PAD_KEY_ROW0__GPIO2_IO_15		0x17059 /* WP */
> +			>;
> +		};
> +
> +		pinctrl_usdhc3_1_100mhz: usdhc3grp-100mhz {

pinctrl_usdhc3_100mhz

> +			fsl,pins = <
> +				MX6SX_PAD_SD3_CMD__USDHC3_CMD		0x170b9
> +				MX6SX_PAD_SD3_CLK__USDHC3_CLK		0x100b9
> +				MX6SX_PAD_SD3_DATA0__USDHC3_DATA0	0x170b9
> +				MX6SX_PAD_SD3_DATA1__USDHC3_DATA1	0x170b9
> +				MX6SX_PAD_SD3_DATA2__USDHC3_DATA2	0x170b9
> +				MX6SX_PAD_SD3_DATA3__USDHC3_DATA3	0x170b9
> +				MX6SX_PAD_SD3_DATA4__USDHC3_DATA4	0x170b9
> +				MX6SX_PAD_SD3_DATA5__USDHC3_DATA5	0x170b9
> +				MX6SX_PAD_SD3_DATA6__USDHC3_DATA6	0x170b9
> +				MX6SX_PAD_SD3_DATA7__USDHC3_DATA7	0x170b9
> +			>;
> +		};
> +
> +		pinctrl_usdhc3_1_200mhz: usdhc3grp-200mhz {

pinctrl_usdhc3_200mhz

> +			fsl,pins = <
> +				MX6SX_PAD_SD3_CMD__USDHC3_CMD		0x170f9
> +				MX6SX_PAD_SD3_CLK__USDHC3_CLK		0x100f9
> +				MX6SX_PAD_SD3_DATA0__USDHC3_DATA0	0x170f9
> +				MX6SX_PAD_SD3_DATA1__USDHC3_DATA1	0x170f9
> +				MX6SX_PAD_SD3_DATA2__USDHC3_DATA2	0x170f9
> +				MX6SX_PAD_SD3_DATA3__USDHC3_DATA3	0x170f9
> +				MX6SX_PAD_SD3_DATA4__USDHC3_DATA4	0x170f9
> +				MX6SX_PAD_SD3_DATA5__USDHC3_DATA5	0x170f9
> +				MX6SX_PAD_SD3_DATA6__USDHC3_DATA6	0x170f9
> +				MX6SX_PAD_SD3_DATA7__USDHC3_DATA7	0x170f9
> +			>;
> +		};
> +
> +		pinctrl_usdhc4_3: usdhc4grp {

pinctrl_usdhc4

Shawn

> +			fsl,pins = <
> +				MX6SX_PAD_SD4_CMD__USDHC4_CMD		0x17059
> +				MX6SX_PAD_SD4_CLK__USDHC4_CLK		0x10059
> +				MX6SX_PAD_SD4_DATA0__USDHC4_DATA0	0x17059
> +				MX6SX_PAD_SD4_DATA1__USDHC4_DATA1	0x17059
> +				MX6SX_PAD_SD4_DATA2__USDHC4_DATA2	0x17059
> +				MX6SX_PAD_SD4_DATA3__USDHC4_DATA3	0x17059
> +				MX6SX_PAD_SD4_DATA7__GPIO6_IO_21	0x17059 /* CD */
> +				MX6SX_PAD_SD4_DATA6__GPIO6_IO_20	0x17059 /* WP */
> +			>;
> +		};
> +	};
> +};
> -- 
> 1.7.9.5
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
