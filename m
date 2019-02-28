From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: imx8mq: Add the buck vdd_arm regulator
Date: Thu, 28 Feb 2019 22:15:46 +0800
Message-ID: <20190228141543.GA29231@dragon>
References: <1550254032-16451-1-git-send-email-abel.vesa@nxp.com>
 <1550254032-16451-3-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550254032-16451-3-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Angus Ainslie <angus.ainslie@puri.sm>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Anson Huang <anson.huang@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 15, 2019 at 06:07:23PM +0000, Abel Vesa wrote:
> According to the schematics, this is a MP2147 switch converter
> which is controlled by GPIO1_IO13. When set the gpio is set to
> high the regulator output is set to 0.9V. When the gpio is set
> to low the regulator output is set to 1V.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 36 ++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> index 54737bf..e5da3dd 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> @@ -31,6 +31,35 @@
>  		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
>  	};
> +
> +	buck2_reg: buck2 {

Please follow regulator-xxx naming convention.

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_buck2>;
> +		compatible = "regulator-gpio";
> +		regulator-name = "vdd_arm";
> +		regulator-min-microvolt = <900000>;
> +		regulator-max-microvolt = <1000000>;
> +		gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
> +		states = <1000000 0x0
> +			  900000 0x1>;
> +		enable-active-high;

The property only makes sense when enable-gpio is present?

Shawn

> +	};
> +};
> +
> +&A53_0 {
> +	cpu-supply = <&buck2_reg>;
> +};
> +
> +&A53_1 {
> +	cpu-supply = <&buck2_reg>;
> +};
> +
> +&A53_2 {
> +	cpu-supply = <&buck2_reg>;
> +};
> +
> +&A53_3 {
> +	cpu-supply = <&buck2_reg>;
>  };
>  
>  &fec1 {
> @@ -203,6 +232,13 @@
>  };
>  
>  &iomuxc {
> +	pinctrl_buck2: vddarmgrp {
> +		fsl,pins = <
> +			MX8MQ_IOMUXC_GPIO1_IO13_GPIO1_IO13		0x19
> +		>;
> +
> +	};
> +
>  	pinctrl_fec1: fec1grp {
>  		fsl,pins = <
>  			MX8MQ_IOMUXC_ENET_MDC_ENET1_MDC			0x3
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
