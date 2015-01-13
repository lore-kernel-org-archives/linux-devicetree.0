From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 07/15] clk: add DT parsing function
Date: Tue, 13 Jan 2015 11:24:49 -0800
Message-ID: <20150113192449.20842.60390@quantum>
References: <1418226513-14105-1-git-send-email-a.hajda@samsung.com>
 <1418226513-14105-8-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418226513-14105-8-git-send-email-a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski
	<m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman
	<gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>,
	Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot
	<gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae
	<inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Liam
	Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant
	Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>,
	moderated list:ARM/CLKDEV SUPPORT <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
	, open list:GPIO SUBSYSTEM <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list:DRM
	PANEL DRIVERS <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, moderated list:ARM/S5P
	EXYNOS AR... <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list:OPEN
	FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sboyd@co
List-Id: devicetree@vger.kernel.org

+Stephen Boyd

Quoting Andrzej Hajda (2014-12-10 07:48:25)
> The patch adds function for parsing Device Tree to get
> clock specifier. The function could be ultimately used
> by clock core.
> 
> Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/clk/clkdev.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
> index da4bda8..bd22750 100644
> --- a/drivers/clk/clkdev.c
> +++ b/drivers/clk/clkdev.c
> @@ -120,6 +120,29 @@ struct clk *of_clk_get_by_name(struct device_node *np, const char *name)
>         return clk;
>  }
>  EXPORT_SYMBOL(of_clk_get_by_name);
> +
> +static int of_get_clock_spec(struct device *dev, const char *name,
> +               struct of_phandle_args *spec)
> +{
> +       struct device_node *np = dev->of_node;
> +
> +       while (np) {
> +               int idx = 0;
> +
> +               if (name)
> +                       idx = of_property_match_string(np, "clock-names", name);
> +
> +               if (!of_parse_phandle_with_args(np, "clocks", "#clock-cells",
> +                                               idx, spec))
> +                       return 0;
> +
> +               np = np->parent;
> +               if (np && !of_get_property(np, "clock-ranges", NULL))
> +                       break;
> +       }
> +
> +       return -ENOENT;
> +}
>  #endif
>  
>  /*
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
