From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 2/3] clk: add Dove PLL divider support for GPU, VMeta and
 AXI clocks
Date: Fri, 27 Nov 2015 21:10:08 +0100
Message-ID: <20151127201008.GD14645@lunn.ch>
References: <E1a24wo-0004j2-Vd@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1a24wo-0004j2-Vd-eh5Bv4kxaXIANfyc6IWni62ZND6+EDdj@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Russell

> +static int dove_calc_divider(const struct dove_clk *dc, unsigned long rate,
> +			     unsigned long parent_rate, bool set)
> +{
> +	unsigned int divider, max;
> +
> +	divider = DIV_ROUND_CLOSEST(parent_rate, rate);
> +
> +	if (dc->divider_table) {
> +		unsigned int i;
> +
> +		for (i = 0; dc->divider_table[i]; i++)
> +			if (divider == dc->divider_table[i]) {
> +				divider = i;
> +				break;
> +			}
> +
> +		if (dc->divider_table[i])
> +			return -EINVAL;

Is this condition correct? If we have reached the 0 at the end of the
table, -EINVAL makes sense. But that would need a !

       Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
