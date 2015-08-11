From: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: add lpc18xx creg clk driver
Date: Tue, 11 Aug 2015 13:41:27 -0700
Message-ID: <20150811204127.31346.16729@quantum>
References: <1436651307-24098-1-git-send-email-manabian@gmail.com>
 <1436651307-24098-2-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436651307-24098-2-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Joachim,

Quoting Joachim Eastwood (2015-07-11 14:48:26)
> +static void __init lpc18xx_creg_clk_init(struct device_node *np)
> +{
> +       const char *clk_32khz_parent;
> +       struct regmap *syscon;
> +
> +       syscon = syscon_node_to_regmap(np->parent);
> +       if (IS_ERR(syscon)) {
> +               pr_err("%s: syscon lookup failed\n", __func__);
> +               return;
> +       }
> +
> +       clk_32khz_parent = of_clk_get_parent_name(np, 0);
> +
> +       clk_creg[CREG_CLK_32KHZ] =
> +               clk_register_creg_clk(&clk_creg_clocks[CREG_CLK_32KHZ],
> +                                     &clk_32khz_parent, syscon);
> +
> +       clk_creg[CREG_CLK_1KHZ] =
> +               clk_register_creg_clk(&clk_creg_clocks[CREG_CLK_1KHZ],
> +                                     &clk_creg_clocks[CREG_CLK_32KHZ].name,
> +                                     syscon);
> +
> +       of_clk_add_provider(np, of_clk_src_onecell_get, &clk_base_data);
> +}
> +CLK_OF_DECLARE(lpc18xx_creg_clk, "nxp,lpc1850-creg-clk", lpc18xx_creg_clk_init);

I'll ask the same question that Stephen asked in your CCU/CGU driver
series: is it necessary to use CLK_OF_DECLARE here or can you use the
platform device model?

Thanks,
Mike
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
