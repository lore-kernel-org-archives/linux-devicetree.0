From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/2] ARM: dts: imx6ul-pico: Add support for the dwarf
 baseboard
Date: Thu, 11 Apr 2019 14:57:36 +0800
Message-ID: <20190411065734.GC26817@dragon>
References: <20190407193723.3351-1-otavio@ossystems.com.br>
 <20190407193723.3351-2-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190407193723.3351-2-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 07, 2019 at 04:37:23PM -0300, Otavio Salvador wrote:
> From: Fabio Estevam <festevam@gmail.com>
> 
> Add support for the imx6ul pico board with dwarf baseboard combination.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>  arch/arm/boot/dts/Makefile              |  1 +
>  arch/arm/boot/dts/imx6ul-pico-dwarf.dts | 52 +++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6ul-pico-dwarf.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index a969ca820d41..e4a2349e130e 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -566,6 +566,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
>  	imx6ul-isiot-nand.dtb \
>  	imx6ul-liteboard.dtb \
>  	imx6ul-opos6uldev.dtb \
> +	imx6ul-pico-dwarf.dtb \
>  	imx6ul-pico-hobbit.dtb \
>  	imx6ul-pico-pi.dtb \
>  	imx6ul-phytec-phyboard-segin-full.dtb \
> diff --git a/arch/arm/boot/dts/imx6ul-pico-dwarf.dts b/arch/arm/boot/dts/imx6ul-pico-dwarf.dts
> new file mode 100644
> index 000000000000..3edd60f46d37
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6ul-pico-dwarf.dts
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +//
> +// Copyright 2015 Technexion Ltd.
> +//
> +// Author: Wig Cheng  <wig.cheng@technexion.com>
> +//	   Richard Hu <richard.hu@technexion.com>
> +//	   Tapani Utriainen <tapani@technexion.com>
> +/dts-v1/;
> +
> +#include "imx6ul-pico.dtsi"
> +/ {
> +	model = "TechNexion PICO-IMX6UL and DWARF baseboard";
> +	compatible = "technexion,imx6ul-pico-dwarf", "fsl,imx6ul";
> +
> +	sound {
> +		compatible = "fsl,imx-audio-sgtl5000";
> +		model = "imx6ul-sgtl5000";
> +		audio-cpu = <&sai1>;
> +		audio-codec = <&sgtl5000>;
> +		audio-routing =
> +			"LINE_IN", "Line In Jack",
> +			"MIC_IN", "Mic Jack",
> +			"Mic Jack", "Mic Bias",
> +			"Headphone Jack", "HP_OUT";
> +	};
> +
> +	sys_mclk: clock-sys-mclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24576000>;
> +	};
> +};
> +
> +&i2c2 {
> +	clock_frequency = <100000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	status = "okay";
> +
> +	sgtl5000: codec@a {

audio-codec for node name.

Shawn

> +		reg = <0x0a>;
> +		compatible = "fsl,sgtl5000";
> +		clocks = <&sys_mclk>;
> +		VDDA-supply = <&reg_2p5v>;
> +		VDDIO-supply = <&reg_3p3v>;
> +	};
> +
> +	pressure-sensor@60 {
> +		compatible = "fsl,mpl3115";
> +		reg = <0x60>;
> +	};
> +};
> -- 
> 2.21.0
> 
