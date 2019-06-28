From: Angus Ainslie <angus@akkea.ca>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mq: Add MIPI D-PHY
Date: Fri, 28 Jun 2019 08:43:05 -0600
Message-ID: <dd48a5d849c8ddffa3c980a22777833f@www.akkea.ca>
References: <cover.1561451144.git.agx@sigxcpu.org>
 <613eef8ee6fd427a2fb5eb91865e71f3ee6bded6.1561451144.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <613eef8ee6fd427a2fb5eb91865e71f3ee6bded6.1561451144.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Pavel Machek <pavel@ucw.cz>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Carlo Caione <ccaione@baylibre.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2019-06-25 02:27, Guido Günther wrote:
> Add a node for the Mixel MIPI D-PHY, "disabled" by default.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>

Acked-by: Angus Ainslie (Purism) <angus@akkea.ca>

> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index d09b808eff87..891ee7578c2d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -728,6 +728,19 @@
>  				status = "disabled";
>  			};
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
>  			i2c1: i2c@30a20000 {
>  				compatible = "fsl,imx8mq-i2c", "fsl,imx21-i2c";
>  				reg = <0x30a20000 0x10000>;
