From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: add initial Colibri VF61 board support
Date: Thu, 3 Apr 2014 10:32:27 +0800
Message-ID: <20140403023224.GC2801@dragon>
References: <cover.1396456704.git.stefan@agner.ch>
 <c8f2d3349233b70e5bd242480ff326b3b728cca3.1396456704.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c8f2d3349233b70e5bd242480ff326b3b728cca3.1396456704.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stefan-XLVq0VzYD2Y@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 02, 2014 at 06:47:27PM +0200, stefan-XLVq0VzYD2Y@public.gmane.org wrote:
> From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> 
> Add initial Toradex Colibri VF61 board support. Ethernet, UART
> and SDHC cards are working. Cache latencies need to be a bit
> higher than vf610.dtsi suggests. Those values are validated
> by running multiple memory tests.
> 
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

Looks good to me.  Only one minor comment below.

> ---
>  arch/arm/boot/dts/Makefile          |   1 +
>  arch/arm/boot/dts/vf610-colibri.dts | 123 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 124 insertions(+)
>  create mode 100644 arch/arm/boot/dts/vf610-colibri.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 23d7768..81b3885 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -190,6 +190,7 @@ dtb-$(CONFIG_ARCH_MXC) += \
>  	imx6q-udoo.dtb \
>  	imx6q-wandboard.dtb \
>  	imx6sl-evk.dtb \
> +	vf610-colibri.dtb \
>  	vf610-cosmic.dtb \
>  	vf610-twr.dtb
>  dtb-$(CONFIG_ARCH_MXS) += imx23-evk.dtb \
> diff --git a/arch/arm/boot/dts/vf610-colibri.dts b/arch/arm/boot/dts/vf610-colibri.dts
> new file mode 100644
> index 0000000..3ac34e6
> --- /dev/null
> +++ b/arch/arm/boot/dts/vf610-colibri.dts
> @@ -0,0 +1,123 @@
> +/*
> + * Copyright 2014 Toradex AG
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +/dts-v1/;
> +#include "vf610.dtsi"
> +
> +/ {
> +	model = "Toradex Colibri VF61 COM";
> +	compatible = "toradex,vf610-colibri", "fsl,vf610";
> +
> +	chosen {
> +		bootargs = "console=ttyLP0,115200";
> +	};
> +
> +	memory {
> +		reg = <0x80000000 0x10000000>;
> +	};
> +
> +	clocks {
> +		enet_ext {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <50000000>;
> +		};
> +	};
> +
> +};
> +
> +&iomuxc {

I would suggest to put this node at the bottom of the file, since it
will have a lot more data than other nodes.  Doing so will make reading
of the file a little easier.

Shawn

> +	vf610-colibri {
> +		pinctrl_esdhc1: esdhc1grp {
> +			fsl,fsl,pins = <
> +				VF610_PAD_PTA24__ESDHC1_CLK	0x31ef
> +				VF610_PAD_PTA25__ESDHC1_CMD	0x31ef
> +				VF610_PAD_PTA26__ESDHC1_DAT0	0x31ef
> +				VF610_PAD_PTA27__ESDHC1_DAT1	0x31ef
> +				VF610_PAD_PTA28__ESDHC1_DATA2	0x31ef
> +				VF610_PAD_PTA29__ESDHC1_DAT3	0x31ef
> +				VF610_PAD_PTB20__GPIO_42	0x219d
> +			>;
> +		};
> +
> +		pinctrl_fec1: fec1grp {
> +			fsl,pins = <
> +				VF610_PAD_PTC9__ENET_RMII1_MDC		0x30d2
> +				VF610_PAD_PTC10__ENET_RMII1_MDIO	0x30d3
> +				VF610_PAD_PTC11__ENET_RMII1_CRS		0x30d1
> +				VF610_PAD_PTC12__ENET_RMII_RXD1		0x30d1
> +				VF610_PAD_PTC13__ENET_RMII1_RXD0	0x30d1
> +				VF610_PAD_PTC14__ENET_RMII1_RXER	0x30d1
> +				VF610_PAD_PTC15__ENET_RMII1_TXD1	0x30d2
> +				VF610_PAD_PTC16__ENET_RMII1_TXD0	0x30d2
> +				VF610_PAD_PTC17__ENET_RMII1_TXEN	0x30d2
> +			>;
> +		};
> +
> +		pinctrl_uart0: uart0grp {
> +			fsl,pins = <
> +				VF610_PAD_PTB10__UART0_TX		0x21a2
> +				VF610_PAD_PTB11__UART0_RX		0x21a1
> +			>;
> +		};
> +
> +		pinctrl_uart1: uart1grp {
> +			fsl,pins = <
> +				VF610_PAD_PTB4__UART1_TX		0x21a2
> +				VF610_PAD_PTB5__UART1_RX		0x21a1
> +			>;
> +		};
> +
> +		pinctrl_uart2: uart2grp {
> +			fsl,pins = <
> +				VF610_PAD_PTD0__UART2_TX		0x21a2
> +				VF610_PAD_PTD1__UART2_RX		0x21a1
> +				VF610_PAD_PTD2__UART2_RTS		0x21a2
> +				VF610_PAD_PTD3__UART2_CTS		0x21a1
> +			>;
> +		};
> +	};
> +};
> +
> +&esdhc1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_esdhc1>;
> +	bus-width = <4>;
> +	status = "okay";
> +};
> +
> +&fec1 {
> +	phy-mode = "rmii";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fec1>;
> +	status = "okay";
> +};
> +
> +&L2 {
> +	arm,data-latency = <2 1 2>;
> +	arm,tag-latency = <3 2 3>;
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart0>;
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart2>;
> +	status = "okay";
> +};
> -- 
> 1.9.1
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
