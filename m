From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 01/11] clk: sunxi-ng: mux: Fix
 determine_rate for mux clocks with pre-dividers
Date: Thu, 26 Jan 2017 10:55:23 +0100
Message-ID: <20170126095523.rat5wqbj73fkxy6z@lukather>
References: <20170124023230.3990-1-wens@csie.org>
 <20170124023230.3990-2-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fqlb7rnfodlsakqe"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBDEPU7CAKGQE4STO3WQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170124023230.3990-2-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--fqlb7rnfodlsakqe
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi Chen-Yu,

On Tue, Jan 24, 2017 at 10:32:20AM +0800, Chen-Yu Tsai wrote:
> The determine_rate helper used ccu_mux_helper_adjust_parent_for_prediv()
> to adjust the parent_rate to account for pre-dividers, but then passed
> the pristine parent clock rate from clk_hw_get_rate() to the round()
> callback, thereby ignoring the pre-divider adjustment. In addition,
> it was saving the adjusted parent rate back into struct
> clk_rate_request.
> 
> This patch fixes this by saving the pristine parent clock rate, and
> adding a copy that is adjusted and passed to the round() callback.
> The pristine copy, if it is the best solution, would be saved back
> to struct clk_rate_request.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  drivers/clk/sunxi-ng/ccu_mux.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
> index 858a48621631..3445041894e7 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.c
> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
> @@ -71,7 +71,7 @@ int ccu_mux_helper_determine_rate(struct ccu_common *common,
>  	unsigned int i;
>  
>  	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
> -		unsigned long tmp_rate, parent_rate;
> +		unsigned long tmp_rate, parent_rate, adj_parent_rate;
>  		struct clk_hw *parent;
>  
>  		parent = clk_hw_get_parent_by_index(hw, i);
> @@ -79,10 +79,11 @@ int ccu_mux_helper_determine_rate(struct ccu_common *common,
>  			continue;
>  
>  		parent_rate = clk_hw_get_rate(parent);
> +		adj_parent_rate = parent_rate;
>  		ccu_mux_helper_adjust_parent_for_prediv(common, cm, i,
> -							&parent_rate);
> +							&adj_parent_rate);
>  
> -		tmp_rate = round(cm, clk_hw_get_rate(parent), req->rate, data);
> +		tmp_rate = round(cm, parent_rate, req->rate, data);

Shouldn't you use the adjusted rate here too?

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--fqlb7rnfodlsakqe--
