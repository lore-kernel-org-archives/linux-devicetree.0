From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v6 25/41] ARM: dm646x: add new clock init using common
 clock framework
Date: Fri, 2 Feb 2018 20:25:56 +0530
Message-ID: <d874e568-315d-0325-1b60-920ed35ca740@ti.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-26-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1516468460-4908-26-git-send-email-david@lechnology.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Saturday 20 January 2018 10:44 PM, David Lechner wrote:
>  void __init dm646x_init_time(unsigned long ref_clk_rate,
>  			     unsigned long aux_clkin_rate)
>  {
> +#ifdef CONFIG_COMMON_CLK
> +	void __iomem *pll1, *pll2, *psc;
> +	struct clk *clk;
> +
> +	pll1 = ioremap(DAVINCI_PLL1_BASE, SZ_4K);
> +	pll2 = ioremap(DAVINCI_PLL2_BASE, SZ_4K);
> +	psc = ioremap(DAVINCI_PWR_SLEEP_CNTRL_BASE, SZ_4K);
> +
> +	clk_register_fixed_rate(NULL, "ref_clk", NULL, 0, ref_clk_rate);
> +	clk_register_fixed_rate(NULL, "aux_clkin", NULL, 0, aux_clkin_rate);
> +
> +	dm646x_pll_clk_init(pll1, pll2);
> +
> +	dm646x_psc_clk_init(psc);

> +	/* no LPSC, always enabled; c.f. spruep9a */
> +	clk = clk_register_fixed_factor(NULL, "timer2", "pll1_sysclk3", 0, 1, 1);
> +	clk_register_clkdev(clk, NULL, "davinci-wdt");

Lets move this to dm646x_pll_clk_init() and directly register to clkdev
to pll1_sysclk3?

Thanks,
Sekhar
