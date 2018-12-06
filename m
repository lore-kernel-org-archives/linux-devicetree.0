From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 4/5] ARM: dts: imx6ul-pico-hobbit: Extend peripherals
 support
Date: Thu, 6 Dec 2018 09:34:20 +0800
Message-ID: <20181206013419.GT3987@dragon>
References: <20181202211809.11621-1-otavio@ossystems.com.br>
 <20181202211809.11621-5-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181202211809.11621-5-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 02, 2018 at 07:18:08PM -0200, Otavio Salvador wrote:
> From: Fabio Estevam <festevam@gmail.com>
> 
> This adds following peripherals support:
> 
>  - ADC
>  - GPIO LED
>  - GPIOs
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>  arch/arm/boot/dts/imx6ul-pico-hobbit.dts | 30 ++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
> index 8656ccbb5a06..f2dd6945e98c 100644
> --- a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
> +++ b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
> @@ -14,6 +14,8 @@
>  
>  	leds {
>  		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio_leds>;
>  
>  		led {
>  			label = "gpio-led";
> @@ -58,6 +60,12 @@
>  &i2c3 {
>  	status = "okay";
>  
> +	adc081c: adc@50 {
> +		compatible = "ti,adc081c";
> +		reg = <0x50>;
> +		vref-supply = <&reg_3p3v>;
> +	};
> +

The child nodes should be sorted in order of unit-address.  That said,
it should go after touchscreen@38 below.

I fixed it up and applied the series.

Shawn

>  	polytouch: touchscreen@38 {
>  		compatible = "edt,edt-ft5x06";
>  		reg = <0x38>;
> @@ -68,3 +76,25 @@
>  		touchscreen-size-y = <480>;
>  	};
>  };
> +
> +&iomuxc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hog>;
> +
> +	pinctrl_hog: hoggrp {
> +		fsl,pins = <
> +			MX6UL_PAD_CSI_VSYNC__GPIO4_IO19		0x10b0
> +			MX6UL_PAD_CSI_DATA00__GPIO4_IO21	0x10b0
> +			MX6UL_PAD_CSI_DATA01__GPIO4_IO22	0x10b0
> +			MX6UL_PAD_CSI_DATA02__GPIO4_IO23	0x10b0
> +			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x10b0
> +			MX6UL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x10b0
> +		>;
> +	};
> +
> +	pinctrl_gpio_leds: gpioledsgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_UART4_RX_DATA__GPIO1_IO29	0x10b0
> +		>;
> +	};
> +};
> -- 
> 2.19.2
> 
