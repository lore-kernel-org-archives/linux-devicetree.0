From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 2/3] clk: imx8mq: add hdmi_phy_27m clock as pll's
 reference clock
Date: Thu, 07 Mar 2019 13:05:33 +0100
Message-ID: <1551960333.9298.37.camel@pengutronix.de>
References: <1551929772-22633-1-git-send-email-Anson.Huang@nxp.com>
         <1551929772-22633-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551929772-22633-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Abel Vesa <abel.vesa@nxp.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 07.03.2019, 03:41 +0000 schrieb Anson Huang:
> There is another 27MHz OSC inside i.MX8MQ's display block and
> it can be one of reference clocks of all PLLs, add it into clock
> tree and also add it as PLL's reference clock.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/clk/imx/clk-imx8mq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
> index a9b3888..bb1bf9b 100644
> --- a/drivers/clk/imx/clk-imx8mq.c
> +++ b/drivers/clk/imx/clk-imx8mq.c
> @@ -26,7 +26,7 @@ static u32 share_count_nand;
>  
>  static struct clk *clks[IMX8MQ_CLK_END];
>  
> -static const char * const pll_ref_sels[] = { "osc_25m", "osc_27m", "dummy", "dummy", };
> +static const char * const pll_ref_sels[] = { "osc_25m", "osc_27m", "osc_hdmi_phy_27m", "dummy", };
>  static const char * const arm_pll_bypass_sels[] = {"arm_pll", "arm_pll_ref_sel", };
>  static const char * const gpu_pll_bypass_sels[] = {"gpu_pll", "gpu_pll_ref_sel", };
>  static const char * const vpu_pll_bypass_sels[] = {"vpu_pll", "vpu_pll_ref_sel", };
> @@ -281,6 +281,7 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
>  	clks[IMX8MQ_CLK_32K] = of_clk_get_by_name(np, "ckil");
>  	clks[IMX8MQ_CLK_25M] = of_clk_get_by_name(np, "osc_25m");
>  	clks[IMX8MQ_CLK_27M] = of_clk_get_by_name(np, "osc_27m");
> +	clks[IMX8MQ_CLK_HDMI_PHY_27M] = of_clk_get_by_name(np, "osc_hdmi_phy_27m");

This is not acceptable. This adds a new required clock input, without
bothering to add the corresponding binding information or thinking
about backwards compatibility. At this point there are existing DTs out
there, which don't provide this required clock, which will cause a full
boot regression. This can only be an optional clock input at this
point.

Regards,
Lucas

>  	clks[IMX8MQ_CLK_EXT1] = of_clk_get_by_name(np, "clk_ext1");
>  	clks[IMX8MQ_CLK_EXT2] = of_clk_get_by_name(np, "clk_ext2");
>  	clks[IMX8MQ_CLK_EXT3] = of_clk_get_by_name(np, "clk_ext3");
