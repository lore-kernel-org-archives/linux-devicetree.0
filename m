From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/3] clk: imx: Add a virtual arm clk on i.mx7d
Date: Wed, 25 Nov 2015 11:53:23 +0100
Message-ID: <1448448803.3689.51.camel@pengutronix.de>
References: <1448360716-1741-1-git-send-email-b51503@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448360716-1741-1-git-send-email-b51503-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bai Ping <b51503-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, den 24.11.2015, 18:25 +0800 schrieb Bai Ping:
> Add a virtual arm clk to abstract the actual steps
> when changing the ARM core frequency.So we can using
> the 'cpufreq-dt' driver on i.MX7D/Solo.
> 
> Signed-off-by: Bai Ping <b51503-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Now this is pretty cool, in how much code is actually reused here.

For the whole series:
Acked-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

BTW: Your mailers time is still wrong. It's now off by a whole day
(-24h) instead of just some hours, making your mails look like they were
sent yesterday.

> ---
>  drivers/clk/imx/clk-imx7d.c             | 6 ++++++
>  include/dt-bindings/clock/imx7d-clock.h | 3 ++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
> index 448ef32..581b428 100644
> --- a/drivers/clk/imx/clk-imx7d.c
> +++ b/drivers/clk/imx/clk-imx7d.c
> @@ -833,6 +833,12 @@ static void __init imx7d_clocks_init(struct device_node *ccm_node)
>  
>  	clks[IMX7D_GPT_3M_CLK] = imx_clk_fixed_factor("gpt_3m", "osc", 1, 8);
>  
> +	clks[IMX7D_CLK_ARM] = imx_clk_cpu("arm", "arm_a7_root_clk",
> +					 clks[IMX7D_ARM_A7_ROOT_CLK],
> +					 clks[IMX7D_ARM_A7_ROOT_SRC],
> +					 clks[IMX7D_PLL_ARM_MAIN_CLK],
> +					 clks[IMX7D_PLL_SYS_MAIN_CLK]);
> +
>  	for (i = 0; i < ARRAY_SIZE(clks); i++)
>  		if (IS_ERR(clks[i]))
>  			pr_err("i.MX7D clk %d: register failed with %ld\n",
> diff --git a/include/dt-bindings/clock/imx7d-clock.h b/include/dt-bindings/clock/imx7d-clock.h
> index a4a7a9c..edca8985c 100644
> --- a/include/dt-bindings/clock/imx7d-clock.h
> +++ b/include/dt-bindings/clock/imx7d-clock.h
> @@ -447,5 +447,6 @@
>  #define IMX7D_SEMA4_HS_ROOT_CLK		434
>  #define IMX7D_PLL_DRAM_TEST_DIV		435
>  #define IMX7D_ADC_ROOT_CLK		436
> -#define IMX7D_CLK_END			437
> +#define IMX7D_CLK_ARM			437
> +#define IMX7D_CLK_END			438
>  #endif /* __DT_BINDINGS_CLOCK_IMX7D_H */

-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
