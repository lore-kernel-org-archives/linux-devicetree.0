From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/9] clk: sunxi-ng: mux: Add support for mux tables
Date: Wed, 27 Jul 2016 08:48:09 +0200
Message-ID: <20160727064809.GC6560@lukather>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
 <1469516671-19377-5-git-send-email-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBK5S4G6AKGQE27VZ7AI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1469516671-19377-5-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, Jul 26, 2016 at 03:04:26PM +0800, Chen-Yu Tsai wrote:
> Some clock muxes have holes, i.e. invalid or unconnected inputs,
> between parent mux values.
> 
> Add support for specifying a mux table to map clock parents to
> mux values.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  drivers/clk/sunxi-ng/ccu_mux.c | 12 ++++++++++++
>  drivers/clk/sunxi-ng/ccu_mux.h | 12 ++++++++++--
>  2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
> index 1329b9ab481e..68b32f168a74 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.c
> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
> @@ -107,6 +107,15 @@ u8 ccu_mux_helper_get_parent(struct ccu_common *common,
>  	parent = reg >> cm->shift;
>  	parent &= (1 << cm->width) - 1;
>  
> +	if (cm->table) {
> +		int num_parents = clk_hw_get_num_parents(&common->hw);
> +		int i;
> +
> +		for (i = 0; i < num_parents; i++)
> +			if (cm->table[i] == parent)
> +				return i;
> +	}
> +
>  	return parent;
>  }
>  
> @@ -117,6 +126,9 @@ int ccu_mux_helper_set_parent(struct ccu_common *common,
>  	unsigned long flags;
>  	u32 reg;
>  
> +	if (cm->table)
> +		index = cm->table[index];
> +
>  	spin_lock_irqsave(common->lock, flags);
>  
>  	reg = readl(common->base + common->reg);
> diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
> index d35ce5e93840..f0078de78712 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.h
> +++ b/drivers/clk/sunxi-ng/ccu_mux.h
> @@ -6,8 +6,9 @@
>  #include "ccu_common.h"
>  
>  struct ccu_mux_internal {
> -	u8	shift;
> -	u8	width;
> +	u8		shift;
> +	u8		width;
> +	const u8	*table;
>  
>  	struct {
>  		u8	index;
> @@ -21,6 +22,13 @@ struct ccu_mux_internal {
>  	} variable_prediv;
>  };
>  
> +#define SUNXI_CLK_MUX_TABLE(_shift, _width, _table)	\
> +	{						\
> +		.shift	= _shift,			\
> +		.width	= _width,			\
> +		.table	= _table,			\
> +	}
> +

I basically had the exact same patch done a few days ago :)

This is in my A64 serie, together with some cleanup on that macro that
is not consistent with the other internal structures.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--0vzXIDBeUiKkjNJl--
