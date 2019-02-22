From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 1/3] clk: imx8mq: initialize clock tree earlier
Date: Fri, 22 Feb 2019 11:54:47 +0100
Message-ID: <66e1685e5cc3fdcaba6ab55b3d030628c37ef8e2.camel@pengutronix.de>
References: <1550828264-9962-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550828264-9962-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.ke>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Am Freitag, den 22.02.2019, 09:42 +0000 schrieb Anson Huang:
> Currently on i.MX8MQ platform, clock driver is probed
> later than GPIO driver, and GPIO driver does NOT have
> defer probe mechanism since the GPIO clock is optional,

So this is what should be fixed. If there is a clock reference in the
DT, having the clock driver ready is not optional. Optional to the GPIO
driver just means it won't fail if there is no clock reference at all.
If there is and the clock provider is not yet there, it needs to do a
PROBE_DEFER.

So that's a NACK on this patch.

Regards,
Lucas

> some platforms have GPIO clocks and some are NOT. So
> it is an issue that on i.MX8MQ platform, there are GPIO
> clocks defined, but due to clock tree is NOT ready during
> GPIO driver probe, the GPIO clock management will fail
> and cause system hang if GPIO clocks are OFF by default.
> 
> This patch changes the i.MX8MQ clock tree initialization
> using CLK_OF_DECLARE instead of platform driver model to
> make clock tree ready earlier than GPIO driver.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/clk/imx/clk-imx8mq.c | 33 +++++++--------------------------
>  1 file changed, 7 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-
> imx8mq.c
> index 26b57f4..2df1575 100644
> --- a/drivers/clk/imx/clk-imx8mq.c
> +++ b/drivers/clk/imx/clk-imx8mq.c
> @@ -269,10 +269,9 @@ static const char *imx8mq_clko2_sels[] =
> {"osc_25m", "sys2_pll_200m", "sys1_pll_
>  
>  static struct clk_onecell_data clk_data;
>  
> -static int imx8mq_clocks_probe(struct platform_device *pdev)
> +static void __init imx8mq_clocks_init(struct device_node *np)
>  {
> -	struct device *dev = &pdev->dev;
> -	struct device_node *np = dev->of_node;
> +	struct device_node *anatop_np;
>  	void __iomem *base;
>  	int err;
>  	int i;
> @@ -286,10 +285,10 @@ static int imx8mq_clocks_probe(struct
> platform_device *pdev)
>  	clks[IMX8MQ_CLK_EXT3] = of_clk_get_by_name(np, "clk_ext3");
>  	clks[IMX8MQ_CLK_EXT4] = of_clk_get_by_name(np, "clk_ext4");
>  
> -	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mq-anatop");
> -	base = of_iomap(np, 0);
> +	anatop_np = of_find_compatible_node(NULL, NULL, "fsl,imx8mq-
> anatop");
> +	base = of_iomap(anatop_np, 0);
>  	if (WARN_ON(!base))
> -		return -ENOMEM;
> +		return;
>  
>  	clks[IMX8MQ_ARM_PLL_REF_SEL] = imx_clk_mux("arm_pll_ref_sel",
> base + 0x28, 16, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
>  	clks[IMX8MQ_GPU_PLL_REF_SEL] = imx_clk_mux("gpu_pll_ref_sel",
> base + 0x18, 16, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
> @@ -389,10 +388,9 @@ static int imx8mq_clocks_probe(struct
> platform_device *pdev)
>  	clks[IMX8MQ_SYS2_PLL_500M] =
> imx_clk_fixed_factor("sys2_pll_500m", "sys2_pll_out", 1, 2);
>  	clks[IMX8MQ_SYS2_PLL_1000M] =
> imx_clk_fixed_factor("sys2_pll_1000m", "sys2_pll_out", 1, 1);
>  
> -	np = dev->of_node;
>  	base = of_iomap(np, 0);
>  	if (WARN_ON(!base))
> -		return -ENOMEM;
> +		return;
>  
>  	/* CORE */
>  	clks[IMX8MQ_CLK_A53_SRC] = imx_clk_mux2("arm_a53_src", base +
> 0x8000, 24, 3, imx8mq_a53_sels, ARRAY_SIZE(imx8mq_a53_sels));
> @@ -568,22 +566,5 @@ static int imx8mq_clocks_probe(struct
> platform_device *pdev)
>  
>  	err = of_clk_add_provider(np, of_clk_src_onecell_get,
> &clk_data);
>  	WARN_ON(err);
> -
> -	return err;
>  }
> -
> -static const struct of_device_id imx8mq_clk_of_match[] = {
> -	{ .compatible = "fsl,imx8mq-ccm" },
> -	{ /* Sentinel */ },
> -};
> -MODULE_DEVICE_TABLE(of, imx8mq_clk_of_match);
> -
> -
> -static struct platform_driver imx8mq_clk_driver = {
> -	.probe = imx8mq_clocks_probe,
> -	.driver = {
> -		.name = "imx8mq-ccm",
> -		.of_match_table = of_match_ptr(imx8mq_clk_of_match),
> -	},
> -};
> -module_platform_driver(imx8mq_clk_driver);
> +CLK_OF_DECLARE(imx8mq, "fsl,imx8mq-ccm", imx8mq_clocks_init);
