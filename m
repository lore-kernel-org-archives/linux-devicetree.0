From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 5/9] clk: sunxi-ng: mux: support fixed
 pre-dividers on multiple parents
Date: Wed, 27 Jul 2016 09:26:10 +0200
Message-ID: <20160727072610.GE6560@lukather>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
 <1469516671-19377-6-git-send-email-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C94crkcyjafcjHxo"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBHOE4G6AKGQE4P33LLA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1469516671-19377-6-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--C94crkcyjafcjHxo
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Tue, Jul 26, 2016 at 03:04:27PM +0800, Chen-Yu Tsai wrote:
> Some clocks on the A31 have fixed pre-dividers on multiple parents.
> Add support for them.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-h3.c |  9 +++++----
>  drivers/clk/sunxi-ng/ccu_mux.c      |  6 ++++--
>  drivers/clk/sunxi-ng/ccu_mux.h      | 10 ++++++----
>  3 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
> index 9af359544110..5f5c900c235b 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
> @@ -184,15 +184,16 @@ static SUNXI_CCU_MP_WITH_MUX(apb2_clk, "apb2", apb2_parents, 0x058,
>  			     0);
>  
>  static const char * const ahb2_parents[] = { "ahb1" , "pll-periph0" };
> +static const struct ccu_mux_fixed_prediv ahb2_fixed_predivs[] = {
> +	{ .index = 1, .div = 2},
> +	{ },
> +};
>  static struct ccu_mux ahb2_clk = {
>  	.mux		= {
>  		.shift	= 0,
>  		.width	= 1,
>  
> -		.fixed_prediv	= {
> -			.index	= 1,
> -			.div	= 2,
> -		},
> +		.fixed_predivs	= ahb2_fixed_predivs,

I think I'd prefer to have the number of dividers too, instead of
iterating until we find a 0 one. It's easier to iterate over it, the
errors are easier to catch and it's consistent with the other arrays
we give, for example for the parents.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--C94crkcyjafcjHxo--
