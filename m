From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 01/26] reset: Move DT cell size check to the core
Date: Fri, 15 Jan 2016 16:50:12 +0100
Message-ID: <1452873012.6067.78.camel@pengutronix.de>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
	 <1452785109-6172-2-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452785109-6172-2-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Wynter Woods <wynter-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

Am Donnerstag, den 14.01.2016, 16:24 +0100 schrieb Maxime Ripard:
> The core currently doesn't check that the DT cell size matches what the
> driver declares, which means that every xlate function needs to duplicate
> that check.
> 
> Make sure that of_reset_control_get checks for this to avoid duplication
> and errors.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/reset/core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 7955e00d04d4..d53b2b980bdd 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -46,9 +46,6 @@ struct reset_control {
>  static int of_reset_simple_xlate(struct reset_controller_dev *rcdev,
>  			  const struct of_phandle_args *reset_spec)
>  {
> -	if (WARN_ON(reset_spec->args_count != rcdev->of_reset_n_cells))
> -		return -EINVAL;
> -
>  	if (reset_spec->args[0] >= rcdev->nr_resets)
>  		return -EINVAL;
>  
> @@ -182,6 +179,9 @@ struct reset_control *of_reset_control_get(struct device_node *node,
>  		return ERR_PTR(-EPROBE_DEFER);
>  	}
>  
> +	if (WARN_ON(args.args_count != rcdev->of_reset_n_cells))
> +		return ERR_PTR(-EINVAL);
> +

Applied with this fix:
 
-	if (WARN_ON(args.args_count != rcdev->of_reset_n_cells))
+	if (WARN_ON(args.args_count != rcdev->of_reset_n_cells)) {
+		mutex_unlock(&reset_controller_list_mutex);
 		return ERR_PTR(-EINVAL);
+	}
 
No further action needed if you agree, otherwise let me know and I'll
back it out.

best regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
