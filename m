From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 1/5] clk: mvebu: Add core-divider clock
Date: Thu, 26 Sep 2013 10:24:04 +0200
Message-ID: <20130926082404.GA18244@lunn.ch>
References: <1380144502-24109-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130925213730.GA19371@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130925213730.GA19371@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <elopez93-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Ezequiel

> +static int clk_corediv_enable(struct clk_hw *hwclk)
> +{
> +	struct clk_corediv *corediv = to_corediv_clk(hwclk);
> +	struct clk_corediv_desc *desc = &corediv->desc;
> +	u32 reg;
> +
> +	reg = readl(corediv->reg);
> +	reg |= (BIT(desc->fieldbit) << CORE_CLOCK_DIVIDER_ENABLE_OFFSET);
> +	writel(reg, corediv->reg);
> +	return 0;
> +}

Shouldn't there be spinlocks around these register accesses? At least
the core gate clk driver has a spinlock.

> +static long clk_corediv_round_rate(struct clk_hw *hwclk, unsigned long rate,
> +	     				          unsigned long *parent_rate)
> +{
> +	/* Valid ratio are 1:4, 1:5, 1:6 and 1:8 */
> +	u32 div;
> +
> +	div = *parent_rate / rate;
> +	if (div <= 4)
> +	   div = 4;
> +	   else if (div <= 5)
> +	   	div = 5;
> +		else if (div <= 6)
> +		     div = 6;
> +		     else
> +			div = 8;
> +
> +	return *parent_rate / div;
> +}

This looks odd. Is not the following clearer?

	div = *parent_rate / rate;
	if (div < 5)
	   div = 4;
	   else if (div > 6)
		div = 8;

The CodingStyle might require some {} here?

+   /*
+    * Wait for clocks to settle down, and then clear all the
+     * ratios request and the reload request.
+      */
+      udelay(1000);
+      reg &= ~(CORE_CLOCK_DIVIDER_RATIO_MASK | CORE_CLOCK_DIVIDER_RATIO_RELOAD);
+      writel(reg, corediv->reg);
+      udelay(1000);


Documentation/timers/timers-howto.txt says: 

       SLEEPING FOR ~USECS OR SMALL MSECS ( 10us - 20ms):
       		* Use usleep_range

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
