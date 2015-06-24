From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/9] drivers: clk: st: Incorrect clocks status
Date: Wed, 24 Jun 2015 13:02:31 -0700
Message-ID: <558B0CD7.6040302@codeaurora.org>
References: <1435068567-30995-1-git-send-email-gabriel.fernandez@linaro.org> <1435068567-30995-2-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435068567-30995-2-git-send-email-gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pankaj Dev <pankaj.dev-qxv4g6HH51o@public.gmane.org>, Olivier Bideau <olivier.bideau-qxv4g6HH51o@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/23/2015 07:09 AM, Gabriel Fernandez wrote:
> In the clk_summary output, the h/w status of DivMux is incorrect
> (Parent and Enable status), since the clk_mux_ops.get_parent()
> returns -ERRCODE when clock is OFF.
>
> Signed-off-by: Pankaj Dev <pankaj.dev-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/clk/st/clkgen-mux.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/st/clkgen-mux.c b/drivers/clk/st/clkgen-mux.c
> index 4fbe6e0..c94b56b 100644
> --- a/drivers/clk/st/clkgen-mux.c
> +++ b/drivers/clk/st/clkgen-mux.c
> @@ -128,7 +128,7 @@ static int clkgena_divmux_is_enabled(struct clk_hw *hw)
>  
>  	__clk_hw_set_clk(mux_hw, hw);
>  
> -	return (s8)clk_mux_ops.get_parent(mux_hw) > 0;
> +	return ((s8)clk_mux_ops.get_parent(mux_hw) >= 0);

Useless parentheses around it all, please drop.

>  }
>  
>  static u8 clkgena_divmux_get_parent(struct clk_hw *hw)
> @@ -138,11 +138,13 @@ static u8 clkgena_divmux_get_parent(struct clk_hw *hw)
>  
>  	__clk_hw_set_clk(mux_hw, hw);
>  
> -	genamux->muxsel = clk_mux_ops.get_parent(mux_hw);
> -	if ((s8)genamux->muxsel < 0) {
> -		pr_debug("%s: %s: Invalid parent, setting to default.\n",
> -		      __func__, __clk_get_name(hw->clk));
> -		genamux->muxsel = 0;
> +	if (genamux->muxsel == CKGAX_CLKOPSRC_SWITCH_OFF) {
> +		genamux->muxsel = clk_mux_ops.get_parent(mux_hw);

Hm.. maybe we should fix clk_mux_ops to return 0 if it can't find the
parent? Or when this clock is registered we should read the hardware and
set a default parent so that we can't get an error code here.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
