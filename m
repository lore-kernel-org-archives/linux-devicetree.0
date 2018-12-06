Return-Path: <shawnguo@kernel.org>
Date: Thu, 6 Dec 2018 10:11:55 +0800
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6ul: add flexcan support
Message-ID: <20181206021154.GX3987@dragon>
References: <20181203043230.32385-1-qiangqing.zhang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181203043230.32385-1-qiangqing.zhang@nxp.com>
To: Joakim Zhang <qiangqing.zhang@nxp.com>
Cc: "mkl@pengutronix.de" <mkl@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Aisheng DONG <aisheng.dong@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Dec 03, 2018 at 04:34:50AM +0000, Joakim Zhang wrote:
> From: Aisheng Dong <aisheng.dong@nxp.com>
> 
> Add flexcan support for i.MX6UL and i.MX6ULL boards.

To be precise, s/i.MX6ULL/i.MX6ULZ?

> 
> Signed-off-by: Aisheng Dong <aisheng.dong@nxp.com>
> Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
> ---
>  arch/arm/boot/dts/imx6ul-14x14-evk.dtsi | 54 +++++++++++++++++++++++++
>  arch/arm/boot/dts/imx6ulz-14x14-evk.dts |  2 +
>  arch/arm/boot/dts/imx6ulz.dtsi          |  2 -
>  3 files changed, 56 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi b/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
> index 095568b30d30..ae29c059d627 100644
> --- a/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
> +++ b/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
> @@ -30,6 +30,14 @@
>  		enable-active-high;
>  	};
>  
> +	reg_can_3v3: regulator-can-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "can-3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpios = <&gpio_spi 3 GPIO_ACTIVE_LOW>;
> +	};
> +
>  	sound {
>  		compatible = "simple-audio-card";
>  		simple-audio-card,name = "mx6ul-wm8960";
> @@ -64,6 +72,29 @@
>  		};
>  	};
>  
> +	spi4 {
> +		compatible = "spi-gpio";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_spi4>;
> +		status = "okay";
> +		gpio-sck = <&gpio5 11 0>;
> +		gpio-mosi = <&gpio5 10 0>;
> +		cs-gpios = <&gpio5 7 0>;
> +		num-chipselects = <1>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		gpio_spi: gpio_spi@0 {

I think node name "gpio@0" is good enough.

> +			compatible = "fairchild,74hc595";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			reg = <0>;
> +			registers-number = <1>;
> +			registers-default = /bits/ 8 <0x57>;

I cannot find this property in bindings doc.

Shawn

> +			spi-max-frequency = <100000>;
> +		};
> +	};
> +
>  	panel {
>  		compatible = "innolux,at043tn24";
>  		backlight = <&backlight_display>;
> @@ -130,6 +161,20 @@
>  	};
>  };
>  
> +&can1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	xceiver-supply = <&reg_can_3v3>;
> +	status = "okay";
> +};
> +
> +&can2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan2>;
> +	xceiver-supply = <&reg_can_3v3>;
> +	status = "okay";
> +};
> +
>  &i2c1 {
>  	clock-frequency = <100000>;
>  	pinctrl-names = "default";
> @@ -415,6 +460,15 @@
>  		>;
>  	};
>  
> +	pinctrl_spi4: spi4grp {
> +		fsl,pins = <
> +			MX6UL_PAD_BOOT_MODE0__GPIO5_IO10	0x70a1
> +			MX6UL_PAD_BOOT_MODE1__GPIO5_IO11	0x70a1
> +			MX6UL_PAD_SNVS_TAMPER7__GPIO5_IO07	0x70a1
> +			MX6UL_PAD_SNVS_TAMPER8__GPIO5_IO08	0x80000000
> +		>;
> +	};
> +
>  	pinctrl_tsc: tscgrp {
>  		fsl,pins = <
>  			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01		0xb0
> diff --git a/arch/arm/boot/dts/imx6ulz-14x14-evk.dts b/arch/arm/boot/dts/imx6ulz-14x14-evk.dts
> index 6f1af240e0ce..483d9732c002 100644
> --- a/arch/arm/boot/dts/imx6ulz-14x14-evk.dts
> +++ b/arch/arm/boot/dts/imx6ulz-14x14-evk.dts
> @@ -9,6 +9,8 @@
>  
>  /delete-node/ &fec1;
>  /delete-node/ &fec2;
> +/delete-node/ &can1;
> +/delete-node/ &can2;
>  /delete-node/ &lcdif;
>  /delete-node/ &tsc;
>  
> diff --git a/arch/arm/boot/dts/imx6ulz.dtsi b/arch/arm/boot/dts/imx6ulz.dtsi
> index ae6d7e593769..0b5f1a763567 100644
> --- a/arch/arm/boot/dts/imx6ulz.dtsi
> +++ b/arch/arm/boot/dts/imx6ulz.dtsi
> @@ -20,8 +20,6 @@
>  };
>  
>  /delete-node/ &adc1;
> -/delete-node/ &can1;
> -/delete-node/ &can2;
>  /delete-node/ &ecspi3;
>  /delete-node/ &ecspi4;
>  /delete-node/ &epit2;
> -- 
> 2.17.1
> 
