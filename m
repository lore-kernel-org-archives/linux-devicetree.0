From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] arm64: dts: imx8mq: Add a node for irqsteer
Date: Tue, 30 Apr 2019 15:50:04 +0200
Message-ID: <1556632204.2560.20.camel@pengutronix.de>
References: <a08a0a2fdd2090f4f42fe50d8ed70ee08b2fbcaf.1556631673.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a08a0a2fdd2090f4f42fe50d8ed70ee08b2fbcaf.1556631673.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, Carlo Caione <ccaione@baylibre.com>, Daniel Baluta <daniel.baluta@nxp.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, den 30.04.2019, 15:41 +0200 schrieb Guido Günther:
> Add a node for the irqsteer interrupt controller found on the iMX8MQ
> SoC.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 2cc939cfbd75..ce0e137ec8ee 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -798,6 +798,27 @@
>  			};
>  		};
>  
> +		bus@32c00000 { /* AIPS4 */
> +			compatible = "fsl,imx8mq-aips-bus", "simple-bus";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x32c00000 0x32c00000 0x400000>;
> +
> +			irqsteer: interrupt-controller@32e2d000 {
> +				compatible = "fsl,imx8m-irqsteer",
> +					     "fsl,imx-irqsteer";

This fits on a single line, right?

> +				reg = <0x32e2d000 0x1000>;
> +				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
> +				clock-names = "ipg";
> +				fsl,channel = <0>;
> +				fsl,num-irqs = <64>;
> +				interrupt-controller;
> +				interrupt-parent = <&gic>;

This is wrong, the irqsteer upstream IRQ is routed through the GPC like
all the other peripheral interrupts. You can just drop this property.

With this fixed:
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

Regards,
Lucas

> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
>  		gpu: gpu@38000000 {
>  			compatible = "vivante,gc";
>  			reg = <0x38000000 0x40000>;
