From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 09/18] drm/sun4i: tcon: Adjust dotclock dividers range
Date: Fri, 14 Jul 2017 12:14:37 +0800
Message-ID: <CAGb2v67WtqukOHPNkyzA+s8GAUR6fnomvT6Sqp8547euHH3G-Q@mail.gmail.com>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
 <74db696da66cffafe1e729fe2df73b437c8fd483.1499955058.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74db696da66cffafe1e729fe2df73b437c8fd483.1499955058.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 13, 2017 at 10:13 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> It seems like the dotclock dividers are a bit less strict range, and can
> operate even with a smaller than 6 divider. Loose the boundaries a bit.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/sun4i_dotclock.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_dotclock.c b/drivers/gpu/drm/sun4i/sun4i_dotclock.c
> index d401156490f3..0b844c0dd102 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_dotclock.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_dotclock.c
> @@ -77,7 +77,25 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
>         u8 best_div = 1;
>         int i;
>
> -       for (i = 6; i <= 127; i++) {
> +       /*
> +        * There's something odd here.
> +        *
> +        * In the A13 user manual, this is stated to be >= 6 when
> +        * dclk1 and dclk2 are used (without any hint on how to use
> +        * them), and >= 4 when only dclk is used.

You set it in TCON0_IO_POL_REG, which sets the clock phase delay.
I think we were setting this before, but you removed it as part of
the previous TCON clean up patches?

In the A33, there are even more options, like DCLK / 2 (with 0 or 90
degree phase delay).

> +        *
> +        * In the A33 user manual, when only dclk is used, it is set
> +        * to be >= 6 in the former case, and >= 1 in the
> +        * latter. There's also some (obscure) explanations about the
> +        * dclk1 and dclk2 vs dclk that seems to be in the upper 4
> +        * bits. What those clocks are and what bit does what is not
> +        * really clear.

Looks like mux bits to me. How they differ from TCON0_IO_POL_REG is
beyond me ATM.

ChenYu

> +        *
> +        * On the A33 however, while something lower than 4 works, it
> +        * does have a few artifacts. Let's not use those values, and
> +        * see how it goes.
> +        */
> +       for (i = 4; i <= 127; i++) {
>                 unsigned long ideal = rate * i;
>                 unsigned long rounded;
>
> --
> git-series 0.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
