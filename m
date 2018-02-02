From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 20/41] ARM: da830: add new clock init using common
 clock framework
Date: Fri, 2 Feb 2018 19:42:42 +0530
Message-ID: <4b2f45f5-7f0d-f0e6-6854-9992e19f45f2@ti.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-21-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516468460-4908-21-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Adam Ford <aford173-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Saturday 20 January 2018 10:43 PM, David Lechner wrote:
>  void __init da830_init_time(void)
>  {
> +#ifdef CONFIG_COMMON_CLK
> +	void __iomem *pll0, *psc0, *psc1;
> +	struct clk *clk;
> +
> +	pll0 = ioremap(DA8XX_PLL0_BASE, SZ_4K);
> +	psc0 = ioremap(DA8XX_PSC0_BASE, SZ_4K);
> +	psc1 = ioremap(DA8XX_PSC1_BASE, SZ_4K);
> +
> +	da8xx_register_cfgchip();
> +
> +	clk_register_fixed_rate(NULL, "ref_clk", NULL, 0, DA830_REF_FREQ);
> +
> +	da830_pll_clk_init(pll0);
> +
> +	da830_psc_clk_init(psc0, psc1);
> +

> +	clk = clk_register_fixed_factor(NULL, "i2c0", "pll0_aux_clk", 0, 1, 1);
> +	clk_register_clkdev(clk, NULL, "i2c_davinci.1");
> +
> +	clk = clk_register_fixed_factor(NULL, "timer0", "pll0_aux_clk", 0, 1, 1);
> +	clk_register_clkdev(clk, "timer0", NULL);
> +
> +	clk = clk_register_fixed_factor(NULL, "timer1", "pll0_aux_clk", 0, 1, 1);
> +	clk_register_clkdev(clk, NULL, "davinci-wdt");

Isn't this better done in da830_pll_clk_init() ? I think we can get rid
of the dummy fixed factor clock too and directly use the pll0_auxclk.
That reminds me, is "pll0_aux_clk" above correct, or should it be
"pll0_auxclk" like in da830_pll_clk_init()?

> +
> +	clk = clk_register_fixed_factor(NULL, "rmii", "pll0_sysclk7", 0, 1, 1);
> +	clk_register_clkdev(clk, "rmii", NULL);

I don't see any driver looking for this clock using con_id "rmii". I
know this came from existing code. But its most likely a vestige and can
be dropped.

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
