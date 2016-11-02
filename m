From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 3/3] clk: imx: clk-imx6ul: add clk support for imx6ull
Date: Tue, 1 Nov 2016 17:12:05 -0700
Message-ID: <20161102001205.GA16026@codeaurora.org>
References: <1477969343-19887-1-git-send-email-peter.chen@nxp.com>
 <1477969343-19887-4-git-send-email-peter.chen@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1477969343-19887-4-git-send-email-peter.chen-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>, Peng Fan <peng.fan-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/01, Peter Chen wrote:
>  	clks[IMX6UL_CLK_USDHC1]		= imx_clk_gate2("usdhc1",	"usdhc1_podf",	 base + 0x80,	2);
>  	clks[IMX6UL_CLK_USDHC2]		= imx_clk_gate2("usdhc2",	"usdhc2_podf",	 base + 0x80,	4);
> -	clks[IMX6UL_CLK_SIM1]		= imx_clk_gate2("sim1",		"sim_sel",	 base + 0x80,	6);
> -	clks[IMX6UL_CLK_SIM2]		= imx_clk_gate2("sim2",		"sim_sel",	 base + 0x80,	8);
> +	if (clk_on_imx6ul()) {
> +		clks[IMX6UL_CLK_SIM1]		= imx_clk_gate2("sim1",		"sim_sel",	 base + 0x80,	6);
> +		clks[IMX6UL_CLK_SIM2]		= imx_clk_gate2("sim2",		"sim_sel",	 base + 0x80,	8);
> +	}
>  	clks[IMX6UL_CLK_EIM]		= imx_clk_gate2("eim",		"eim_slow_podf", base + 0x80,	10);
>  	clks[IMX6UL_CLK_PWM8]		= imx_clk_gate2("pwm8",		"perclk",	 base + 0x80,	16);
>  	clks[IMX6UL_CLK_UART8_IPG]	= imx_clk_gate2("uart8_ipg",	"ipg",		 base + 0x80,	14);
> @@ -430,6 +478,7 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
>  	clk_set_rate(clks[IMX6UL_CLK_ENET_REF], 50000000);
>  	clk_set_rate(clks[IMX6UL_CLK_ENET2_REF], 50000000);
>  	clk_set_rate(clks[IMX6UL_CLK_CSI], 24000000);
> +	clk_set_rate(clks[IMX6UL_CLK_PLL3_PFD2], 320000000);

Can you use assigned clock rates for this instead?

>  
>  	/* keep all the clks on just for bringup */

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
