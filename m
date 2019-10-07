From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: imx8mq: Use correct clock for usdhc's
 ipg clk
Date: Mon, 7 Oct 2019 20:12:05 +0800
Message-ID: <20191007121204.GI7150@dragon>
References: <1568869559-28611-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1568869559-28611-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, daniel.lezcano@linaro.org, ping.bai@nxp.com, daniel.baluta@nxp.com, jun.li@nxp.com, l.stach@pengutronix.de, abel.vesa@nxp.com, andrew.smirnov@gmail.com, angus@akkea.ca, ccaione@baylibre.com, agx@sigxcpu.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Thu, Sep 19, 2019 at 01:05:57PM +0800, Anson Huang wrote:
> On i.MX8MQ, usdhc's ipg clock is from IMX8MQ_CLK_IPG_ROOT,
> assign it explicitly instead of using IMX8MQ_CLK_DUMMY.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Fixes tag?

Shawn

> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index fd42bee..e2c95ad 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -850,7 +850,7 @@
>  				             "fsl,imx7d-usdhc";
>  				reg = <0x30b40000 0x10000>;
>  				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&clk IMX8MQ_CLK_DUMMY>,
> +				clocks = <&clk IMX8MQ_CLK_IPG_ROOT>,
>  				         <&clk IMX8MQ_CLK_NAND_USDHC_BUS>,
>  				         <&clk IMX8MQ_CLK_USDHC1_ROOT>;
>  				clock-names = "ipg", "ahb", "per";
> @@ -867,7 +867,7 @@
>  				             "fsl,imx7d-usdhc";
>  				reg = <0x30b50000 0x10000>;
>  				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&clk IMX8MQ_CLK_DUMMY>,
> +				clocks = <&clk IMX8MQ_CLK_IPG_ROOT>,
>  				         <&clk IMX8MQ_CLK_NAND_USDHC_BUS>,
>  				         <&clk IMX8MQ_CLK_USDHC2_ROOT>;
>  				clock-names = "ipg", "ahb", "per";
> -- 
> 2.7.4
> 
