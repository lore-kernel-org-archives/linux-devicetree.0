From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/3] drivers: clk: st: Support for enable/disable in
 Clockgen PLLs
Date: Wed, 15 Jul 2015 16:48:23 -0700
Message-ID: <20150715234823.GT30412@codeaurora.org>
References: <1436443060-12866-1-git-send-email-gabriel.fernandez@linaro.org>
 <1436443060-12866-2-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1436443060-12866-2-git-send-email-gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pankaj Dev <pankaj.dev-qxv4g6HH51o@public.gmane.org>, Olivier Bideau <olivier.bideau-qxv4g6HH51o@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/09, Gabriel Fernandez wrote:
> @@ -270,6 +285,73 @@ static int clkgen_pll_is_enabled(struct clk_hw *hw)
>  	return !poweroff;
>  }
>  
> +static int __clkgen_pll_enable(struct clk_hw *hw)
> +{
> +	struct clkgen_pll *pll = to_clkgen_pll(hw);
> +	unsigned long timeout;
> +	int ret = 0;
> +
> +	if (clkgen_pll_is_enabled(hw))
> +		return 0;
> +
> +	CLKGEN_WRITE(pll, pdn_ctrl, 0);
> +
> +	timeout = jiffies + msecs_to_jiffies(10);

Jiffies isn't guaranteed to increment here because
.enable/.disable is called with irqs disabled and if this is the
only CPU running it won't be getting interrupts to update
jiffies.

> +
> +	while (!clkgen_pll_is_locked(hw)) {
> +		if (time_after(jiffies, timeout))
> +			return -ETIMEDOUT;
> +		cpu_relax();
> +	}
> +
> +	pr_debug("%s:%s enabled\n", __clk_get_name(hw->clk), __func__);
> +
> +	return ret;
> +}

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
