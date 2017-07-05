From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2] clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0
 clock selector PHY
Date: Wed, 5 Jul 2017 14:17:53 -0700
Message-ID: <20170705211753.GV22780@codeaurora.org>
References: <1498631315-15730-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1498631315-15730-1-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/28, Yoshihiro Shimoda wrote:
> +
> +
> +	platform_set_drvdata(pdev, priv);
> +	dev_set_drvdata(dev, priv);
> +
> +	init.name = "rcar_usb2_clock_sel";
> +	init.ops = &usb2_clock_sel_clock_ops;
> +	init.flags = CLK_IS_BASIC;

Please drop CLK_IS_BASIC unless you need it.

> +	init.parent_names = NULL;
> +	init.num_parents = 0;
> +	priv->hw.init = &init;
> +
> +	clk = clk_register(NULL, &priv->hw);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	error = of_clk_add_provider(np, of_clk_src_simple_get, clk);

Can you use clk_hw_register() and of_clk_add_hw_provider()
please?

> +	if (error)
> +		return error;
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops rcar_usb2_clock_sel_pm_ops = {
> +	.suspend	= rcar_usb2_clock_sel_suspend,
> +	.resume		= rcar_usb2_clock_sel_resume,
> +};
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
