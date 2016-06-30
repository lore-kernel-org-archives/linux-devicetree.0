From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor
 rate application method
Date: Thu, 30 Jun 2016 22:40:01 +0200
Message-ID: <20160630204001.GC5485@lukather>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBKEH225QKGQEDZQ2IEY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20160625034511.7966-7-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Cc: dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Sat, Jun 25, 2016 at 05:45:03AM +0200, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org wrote:
> From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> 
> PLL1 on H3 requires special factors application algorithm,
> when the rate is changed. This algorithm was extracted
> from the arisc code that handles frequency scaling
> in the BSP kernel.
> 
> This commit adds optional apply function to
> struct factors_data, that can implement non-trivial
> factors application method, when necessary.
> 
> Also struct clk_factors_config is extended with position
> of the PLL lock flag.

Have you tested the current implementation, and found that it was not
working, or did you duplicate the arisc code directly?

>  /**
> + * sun8i_h3_apply_pll1_factors() - applies n, k, m, p factors to the
> + * register using an algorithm that tries to reserve the PLL lock
> + */
> +
> +static void sun8i_h3_apply_pll1_factors(struct clk_factors *factors, struct factors_request *req)
> +{
> +	const struct clk_factors_config *config = factors->config;
> +	u32 reg;
> +
> +	/* Fetch the register value */
> +	reg = readl(factors->reg);
> +
> +	if (FACTOR_GET(config->pshift, config->pwidth, reg) < req->p) {
> +		reg = FACTOR_SET(config->pshift, config->pwidth, reg, req->p);
> +
> +		writel(reg, factors->reg);
> +		__delay(2000);
> +	}

So there was some doubts about the fact that P was being used, or at
least that it was useful.

> +	if (FACTOR_GET(config->mshift, config->mwidth, reg) < req->m) {
> +		reg = FACTOR_SET(config->mshift, config->mwidth, reg, req->m);
> +
> +		writel(reg, factors->reg);
> +		__delay(2000);
> +	}
> +
> +	reg = FACTOR_SET(config->nshift, config->nwidth, reg, req->n);
> +	reg = FACTOR_SET(config->kshift, config->kwidth, reg, req->k);
> +
> +	writel(reg, factors->reg);
> +	__delay(20);
> +
> +	while (!(readl(factors->reg) & (1 << config->lock)));

So, they are applying the dividers first, and then applying the
multipliers, and then wait for the PLL to stabilize.

> +
> +	if (FACTOR_GET(config->mshift, config->mwidth, reg) > req->m) {
> +		reg = FACTOR_SET(config->mshift, config->mwidth, reg, req->m);
> +
> +		writel(reg, factors->reg);
> +		__delay(2000);
> +	}
> +
> +	if (FACTOR_GET(config->pshift, config->pwidth, reg) > req->p) {
> +		reg = FACTOR_SET(config->pshift, config->pwidth, reg, req->p);
> +
> +		writel(reg, factors->reg);
> +		__delay(2000);
> +	}

However, this is kind of weird, why would you need to re-apply the
dividers? Nothing really changes. Have you tried without that part?

Since this is really specific, I guess you could simply make the
clk_ops for the nkmp clocks public, and just re-implement set_rate
using that logic.

You might also need to set an upper limit on P, since the last value
(4) is not a valid one.

I guess you could do that by adding a max field in the __ccu_div
structure.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--2JFBq9zoW8cOFH7v--
