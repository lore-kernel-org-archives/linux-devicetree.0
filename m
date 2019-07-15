From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 1/2] arm64: dts: imx8mq: Add MIPI D-PHY
Date: Mon, 15 Jul 2019 12:55:14 +0200
Message-ID: <1563188114.2307.7.camel@pengutronix.de>
References: <cover.1563187253.git.agx@sigxcpu.org>
         <30c7622bf590670190b93c9b5b6dd1e8f809bbb2.1563187253.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <30c7622bf590670190b93c9b5b6dd1e8f809bbb2.1563187253.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Pavel Machek <pavel@ucw.cz>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Carlo Caione <ccaione@baylibre.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Montag, den 15.07.2019, 12:43 +0200 schrieb Guido Günther:
> Add a node for the Mixel MIPI D-PHY, "disabled" by default.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> Acked-by: Angus Ainslie (Purism) <angus@akkea.ca>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index d09b808eff87..891ee7578c2d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -728,6 +728,19 @@
>  				status = "disabled";
>  			};
>  
> +			dphy: dphy@30a00300 {
> +				compatible = "fsl,imx8mq-mipi-dphy";
> +				reg = <0x30a00300 0x100>;
> +				clocks = <&clk IMX8MQ_CLK_DSI_PHY_REF>;
> +				clock-names = "phy_ref";
> +				assigned-clocks = <&clk IMX8MQ_CLK_DSI_PHY_REF>;
> +				assigned-clock-parents = <&clk IMX8MQ_VIDEO_PLL1_OUT>;
> +				assigned-clock-rates = <24000000>;
> +				#phy-cells = <0>;
> +				power-domains = <&pgc_mipi>;
> +				status = "disabled";
> +			};
> +
>  			i2c1: i2c@30a20000 {
>  				compatible = "fsl,imx8mq-i2c", "fsl,imx21-i2c";
>  				reg = <0x30a20000 0x10000>;
