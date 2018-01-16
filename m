From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 07/44] clk: davinci: Add platform information for TI
 DM644x PLL
Date: Tue, 16 Jan 2018 14:26:27 +0530
Message-ID: <1f19247f-8417-7035-68e3-2779ef316024@ti.com>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <1515377863-20358-8-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515377863-20358-8-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Adam Ford <aford173-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 08 January 2018 07:47 AM, David Lechner wrote:
> This adds platform-specific declarations for the PLL clocks on TI
> DaVinci 644x based systems.

DM644x

> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>

> + * Copyright (C) 2017 David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>

2018 now.

> +void __init dm644x_pll_clk_init(void __iomem *pll1, void __iomem *pll2)
> +{
> +	const struct davinci_pll_divclk_info *info;
> +
> +	davinci_pll_clk_register("pll1", "ref_clk", pll1);
> +	for (info = dm644x_pll1_divclk_info; info->name; info++)
> +		davinci_pll_divclk_register(info, pll1);
> +	davinci_pll_aux_clk_register("pll1_aux_clk", "ref_clk", pll1);
> +	davinci_pll_bpdiv_clk_register("pll1_sysclkbp", "ref_clk", pll1);
> +
> +	davinci_pll_clk_register("pll2", "ref_clk", pll2);
> +	for (info = dm644x_pll2_divclk_info; info->name; info++)
> +		davinci_pll_divclk_register(info, pll2);
> +	davinci_pll_bpdiv_clk_register("pll2_sysclkbp", "ref_clk", pll2);
> +}

Here too, more line spacing will help.

With those minor comments.

Reviewed-by: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
