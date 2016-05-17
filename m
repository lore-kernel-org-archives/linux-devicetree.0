From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 09/20] drm/sun4i: defer only if we didn't find our panel
Date: Tue, 17 May 2016 11:52:10 +0800
Message-ID: <CAGb2v655q_w8s7Eg8xnpzdX9PDxSEhRLvMu3bNOd==U4APgg0Q@mail.gmail.com>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
 <1463402840-17062-10-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463402840-17062-10-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, May 16, 2016 at 8:47 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Our code currently defers our probe on any error, even if we were not
> expecting to have one at all.
>
> Make sure we return -EPROBE_DEFER only when we were supposed to have a
> panel, but it's not probed yet.
>
> Fixes: 29e57fab97fc ("drm: sun4i: Add RGB output")
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index 9f19b0e08560..eed6a9e8d9a6 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -429,7 +429,7 @@ static struct drm_panel *sun4i_tcon_find_panel(struct device_node *node)
>                 return ERR_PTR(-EINVAL);
>         }
>
> -       return of_drm_find_panel(remote);
> +       return of_drm_find_panel(remote) ?: ERR_PTR(-EPROBE_DEFER);

There's also a typo in the DRM_DEBUG_DRIVER call a few lines up. Could you
fix it as well?

ChenYu

>  }
>
>  static int sun4i_tcon_bind(struct device *dev, struct device *master,
> @@ -522,12 +522,13 @@ static int sun4i_tcon_probe(struct platform_device *pdev)
>          * Defer the probe.
>          */
>         panel = sun4i_tcon_find_panel(node);
> -       if (IS_ERR(panel)) {
> -               /*
> -                * If we don't have a panel endpoint, just go on
> -                */
> -               if (PTR_ERR(panel) != -ENODEV)
> -                       return -EPROBE_DEFER;
> +
> +       /*
> +        * If we don't have a panel endpoint, just go on
> +        */
> +       if (PTR_ERR(panel) == -EPROBE_DEFER) {
> +               DRM_DEBUG_DRIVER("Still waiting for our panel. Deferring...\n");
> +               return -EPROBE_DEFER;
>         }
>
>         return component_add(&pdev->dev, &sun4i_tcon_ops);
> --
> 2.8.2
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
