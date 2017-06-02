From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v6 03/11] clk: bcm: Add clocks for Stingray SOC
Date: Fri, 2 Jun 2017 15:10:52 -0700
Message-ID: <20170602221052.GT20170@codeaurora.org>
References: <1496385275-6899-1-git-send-email-anup.patel@broadcom.com>
 <1496385275-6899-4-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1496385275-6899-4-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anup Patel <anup.patel@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Oza Pawandeep <oza.oza@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>, Pramod Kumar <pramod.kumar@broadcom.com>, Sandeep Tripathy <sandeep.tripathy@broadcom.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On 06/02, Anup Patel wrote:
> diff --git a/drivers/clk/bcm/clk-sr.c b/drivers/clk/bcm/clk-sr.c
> new file mode 100644
> index 0000000..342f702
> --- /dev/null
> +++ b/drivers/clk/bcm/clk-sr.c
> @@ -0,0 +1,320 @@
> +
> +static const struct iproc_clk_ctrl lcpll_pcie_clk[] = {
> +	[BCM_SR_LCPLL_PCIE_PHY_REF_CLK] = {
> +		.channel = BCM_SR_LCPLL_PCIE_PHY_REF_CLK,
> +		.flags = IPROC_CLK_AON,
> +		.enable = ENABLE_VAL(0x0, 7, 1, 13),
> +		.mdiv = REG_VAL(0x14, 0, 9),
> +	},
> +};
> +
> +static void __init sr_lcpll_pcie_clk_init(struct device_node *node)

Drop __init usage throughout this patch please.

> +{
> +	iproc_pll_clk_setup(node, &lcpll_pcie, NULL, 0, lcpll_pcie_clk,
> +		ARRAY_SIZE(lcpll_pcie_clk));
> +}
> +
> +static const struct of_device_id sr_clk_dt_ids[] = {
> +{ .compatible = "brcm,sr-genpll0", .data = sr_genpll0_clk_init, },
> +{ .compatible = "brcm,sr-genpll4", .data = sr_genpll4_clk_init, },
> +{ .compatible = "brcm,sr-genpll5", .data = sr_genpll5_clk_init, },
> +{ .compatible = "brcm,sr-lcpll0", .data = sr_lcpll0_clk_init, },
> +{ .compatible = "brcm,sr-lcpll1", .data = sr_lcpll1_clk_init, },
> +{ .compatible = "brcm,sr-lcpll-pcie", .data = sr_lcpll_pcie_clk_init, },
> +{ /* sentinel */ }

Please tab these out properly And also leave off the , after the
init function.

> +};
> +
> +static int sr_clk_probe(struct platform_device *pdev)
> +{
> +	const struct of_device_id *device;
> +	void (*init_func)(struct device_node *);

Let's keep this taking the platform device pointer. That way in
the future devm could be used as well as other platform device
APIs without having to change all init signatures.

> +
> +	device = of_match_device(sr_clk_dt_ids, &pdev->dev);
> +	if (!device)
> +		return -ENODEV;
> +	init_func = device->data;

Can use of_device_get_match_data() instead

> +
> +	init_func(pdev->dev.of_node);
> +
> +	return 0;
> +}

It would be pretty nice if we could have some platform driver
common function for this where we want to call different probe
functions for different compatible ids and put them all in the
same driver file. Like platform_driver_of_probe() or something
that then calls a int (*init_func)(struct platform_device *pdev)
directly from the of match table for you.

> +
> +static struct platform_driver sr_clk_driver = {

iproc_sr_* throughout this file?

> +	.driver = {
> +		.name = "sr-clk",
> +		.of_match_table = sr_clk_dt_ids,
> +	},
> +	.probe = sr_clk_probe,
> +};
> +builtin_platform_driver(sr_clk_driver);

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
