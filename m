From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 1/6] clk: sunxi-ng: div: Add support for
 fixed post-divider
Date: Wed, 5 Jul 2017 09:43:10 +0200
Message-ID: <20170705074310.b6ycyf27htv5gkxm@flea>
References: <cover.23e9103a2becf2261d7e145bb1516221a5cfb8a4.1499197129.git-series.plaes@plaes.org>
 <805048a548031cafc890e6ea06ee773bdfb199d0.1499197129.git-series.plaes@plaes.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pldjrt2krdkb5i6a"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBD5R6LFAKGQE37RODTY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <805048a548031cafc890e6ea06ee773bdfb199d0.1499197129.git-series.plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--pldjrt2krdkb5i6a
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Jul 04, 2017 at 11:04:56PM +0300, Priit Laes wrote:
> SATA clock on sun4i/sun7i is of type (parent) / M / 6 where
> 6 is fixed post-divider.
> 
> Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
> ---
>  drivers/clk/sunxi-ng/ccu_div.c | 18 ++++++++++++++++--
>  drivers/clk/sunxi-ng/ccu_div.h |  3 ++-
>  2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
> index c0e5c10..054b12a 100644
> --- a/drivers/clk/sunxi-ng/ccu_div.c
> +++ b/drivers/clk/sunxi-ng/ccu_div.c
> @@ -21,6 +21,9 @@ static unsigned long ccu_div_round_rate(struct ccu_mux_internal *mux,
>  {
>  	struct ccu_div *cd = data;
>  
> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
> +		rate /= cd->fixed_post_div;
> +
>  	return divider_round_rate_parent(&cd->common.hw, parent,
>  					 rate, parent_rate,
>  					 cd->div.table, cd->div.width,

This doesn't work.

The rate formula is
rate = parent / div / 6

Which is equivalent to
div = rate * 6 / parent

You should be multiplying the rate, not dividing it (or dividing the
parent, but then you'll also need to multiply it back after the call
to divider_round_rate_parent).

Consider this, some driver wants to set a rate of 100MHz on this
clock. The parent is 1.2GHz, and you have your postdiv of 6.

The divider we want to compute is 2, obviously.

You're doing here:
rate / 6 = parent / div

Which means that you'll end up trying to find the divider between
1.2GHz and 16.6666MHz, which is going to be 72.

> @@ -62,8 +65,13 @@ static unsigned long ccu_div_recalc_rate(struct clk_hw *hw,
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
> @@ -71,6 +79,9 @@ static int ccu_div_determine_rate(struct clk_hw *hw,
>  {
>  	struct ccu_div *cd = hw_to_ccu_div(hw);
>  
> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
> +		req->rate *= cd->fixed_post_div;
> +

I guess this is why you never really saw the issue. Combined with your
division in ccu_div_round_rate, it produces the exact rate you were
given as an argument.

>  	return ccu_mux_helper_determine_rate(&cd->common, &cd->mux,
>  					     req, ccu_div_round_rate, cd);
>  }
> @@ -89,6 +100,9 @@ static int ccu_div_set_rate(struct clk_hw *hw, unsigned long rate,
>  	val = divider_get_val(rate, parent_rate, cd->div.table, cd->div.width,
>  			      cd->div.flags);
>  
> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
> +		val /= cd->fixed_post_div;
> +

If you multiply the rate before calling divider_get_val, you won't
have to do the division of the divider, with all the rounding
weirdness it might create.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--pldjrt2krdkb5i6a--
