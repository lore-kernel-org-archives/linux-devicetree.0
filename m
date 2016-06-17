From: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 01/20] clk: fixed-factor: Pass clk rates change to the parent
Date: Fri, 17 Jun 2016 16:05:33 -0700
Message-ID: <20160617230533.27203.82622@quark.deferred.io>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
 <1463402840-17062-2-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463402840-17062-2-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Quoting Maxime Ripard (2016-05-16 05:47:01)
> A fixed factor clock, if it needs to change its rate, by definition do not
> have any choice but to modify its parent rate.

Logically it makes sense to always propagate the rate-change request up
to the parent for a fixed-factor clock if we desire to change its rate.
However, I wonder if doing this for all users of fixed-factor-clock in
DT is safe? Some users may be counting on it not changing.

There are 397 instances of fixed-factor-clock in .dts[i] today, so this
change worries me a bit.

> 
> Add the CLK_SET_RATE_PARENT flag to that clock so that it can happen
> 
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/clk/clk-fixed-factor.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
> index 75cd6c792cb8..3363abd9b4ae 100644
> --- a/drivers/clk/clk-fixed-factor.c
> +++ b/drivers/clk/clk-fixed-factor.c
> @@ -167,7 +167,8 @@ void __init of_fixed_factor_clk_setup(struct device_node *node)
>         of_property_read_string(node, "clock-output-names", &clk_name);
>         parent_name = of_clk_get_parent_name(node, 0);
>  
> -       clk = clk_register_fixed_factor(NULL, clk_name, parent_name, 0,
> +       clk = clk_register_fixed_factor(NULL, clk_name, parent_name,
> +                                       CLK_SET_RATE_PARENT,

An alternative would be to pass in the flags you want, somehow. For the
clock you are trying to fix, is it inside of the SoC or external? If it
is internal, and part of a larger clock controller driver, is this for
the legacy style allwinner clock drivers that put everything in DT? If
not, it would better to initialize it statically and shove this flag
into the struct clk_init_data storage.

Regards,
Mike

>                                         mult, div);
>         if (!IS_ERR(clk))
>                 of_clk_add_provider(node, of_clk_src_simple_get, clk);
> -- 
> 2.8.2
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
