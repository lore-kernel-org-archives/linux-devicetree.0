From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 1/6] clk: sunxi-ng: div: Add support for
 fixed post-divider
Date: Tue, 27 Jun 2017 11:46:07 +0200
Message-ID: <20170627094607.2hkgzkycclboemvu@flea.lan>
References: <cover.24b2b13ec5a68552e186ba1637f1328363c3886e.1498422562.git-series.plaes@plaes.org>
 <bc043a64775ec8c9cfcfe6d638e348d38e34eba3.1498422562.git-series.plaes@plaes.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5tptchyg3tgiuxg4"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBYGSZDFAKGQEKA2MYJY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <bc043a64775ec8c9cfcfe6d638e348d38e34eba3.1498422562.git-series.plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--5tptchyg3tgiuxg4
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi!

On Sun, Jun 25, 2017 at 11:45:42PM +0300, Priit Laes wrote:
> SATA clock on sun4i/sun7i is of type (parent) / M / 6 where
> 6 is fixed post-divider.
> 
> Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
> ---
>  drivers/clk/sunxi-ng/ccu_div.c | 12 ++++++++++--
>  drivers/clk/sunxi-ng/ccu_div.h |  3 ++-
>  2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
> index c0e5c10..de30e15 100644
> --- a/drivers/clk/sunxi-ng/ccu_div.c
> +++ b/drivers/clk/sunxi-ng/ccu_div.c
> @@ -62,8 +62,13 @@ static unsigned long ccu_div_recalc_rate(struct clk_hw *hw,
>  	parent_rate = ccu_mux_helper_apply_prediv(&cd->common, &cd->mux, -1,
>  						  parent_rate);
>  
> -	return divider_recalc_rate(hw, parent_rate, val, cd->div.table,
> -				   cd->div.flags);
> +	val = divider_recalc_rate(hw, parent_rate, val, cd->div.table,
> +				  cd->div.flags);
> +
> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
> +		val /= cd->fixed_post_div;
> +
> +	return val;
>  }
>  
>  static int ccu_div_determine_rate(struct clk_hw *hw,
> @@ -89,6 +94,9 @@ static int ccu_div_set_rate(struct clk_hw *hw, unsigned long rate,
>  	val = divider_get_val(rate, parent_rate, cd->div.table, cd->div.width,
>  			      cd->div.flags);
>  
> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
> +		val *= cd->fixed_post_div;
> +
>  	spin_lock_irqsave(cd->common.lock, flags);
>  
>  	reg = readl(cd->common.base + cd->common.reg);

You also need to adjust the round rate call back to take into account
the post divider before calling divider_round_rate_parent, and after
since that function can modify the parent_rate.

> diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
> index 08d0744..f3a5028 100644
> --- a/drivers/clk/sunxi-ng/ccu_div.h
> +++ b/drivers/clk/sunxi-ng/ccu_div.h
> @@ -86,9 +86,10 @@ struct ccu_div_internal {
>  struct ccu_div {
>  	u32			enable;
>  
> -	struct ccu_div_internal		div;
> +	struct ccu_div_internal	div;

Spurious change?

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--5tptchyg3tgiuxg4--
