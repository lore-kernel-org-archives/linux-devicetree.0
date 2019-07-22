Return-Path: <shawnguo@kernel.org>
Date: Mon, 22 Jul 2019 14:48:41 +0800
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mq: Default parents for PCIE1 clocks
Message-ID: <20190722064840.GB3738@dragon>
References: <1562235864-12953-1-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562235864-12953-1-git-send-email-abel.vesa@nxp.com>
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Leonard Crestez <leonard.crestez@nxp.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Jul 04, 2019 at 01:24:24PM +0300, Abel Vesa wrote:
> Set default parents for PCIE1_CTRL and PCIE1_PHY clocks.

Can you add a few words about why this change is necessary?

Shawn

> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> index e3df9b8..23bf85f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> @@ -235,6 +235,10 @@
>  		 <&clk IMX8MQ_CLK_PCIE1_PHY>,
>  		 <&pcie0_refclk>;
>  	clock-names = "pcie", "pcie_aux", "pcie_phy", "pcie_bus";
> +	assigned-clocks = <&clk IMX8MQ_CLK_PCIE1_CTRL>,
> +			  <&clk IMX8MQ_CLK_PCIE1_PHY>;
> +	assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_250M>,
> +				 <&clk IMX8MQ_SYS2_PLL_100M>;
>  	status = "okay";
>  };
>  
> -- 
> 2.7.4
> 
