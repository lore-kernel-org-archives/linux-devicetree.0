From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 03/18] drm/sun4i: Realign Makefile padding and reorder it
Date: Fri, 14 Jul 2017 11:13:53 +0800
Message-ID: <CAGb2v67HmUpSaoJWS6jKg3JvsPmqMtv30EGdWE50YEPm2cyjcg@mail.gmail.com>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
 <fd70853df9e7ee66a20df9d42921f1f6608a2bc9.1499955058.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fd70853df9e7ee66a20df9d42921f1f6608a2bc9.1499955058.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 13, 2017 at 10:12 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Some options were not padded as they should, and the order in the Makefile
> was chaotic. Fix that.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/Makefile | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
> index e29fd3a2ba9c..42871ee7acf6 100644
> --- a/drivers/gpu/drm/sun4i/Makefile
> +++ b/drivers/gpu/drm/sun4i/Makefile
> @@ -1,23 +1,23 @@
> -sun4i-drm-y += sun4i_drv.o
> -sun4i-drm-y += sun4i_framebuffer.o
> +sun4i-backend-y                        += sun4i_backend.o sun4i_layer.o
>
> -sun4i-drm-hdmi-y += sun4i_hdmi_enc.o
> -sun4i-drm-hdmi-y += sun4i_hdmi_ddc_clk.o
> -sun4i-drm-hdmi-y += sun4i_hdmi_tmds_clk.o
> +sun4i-drm-y                    += sun4i_drv.o
> +sun4i-drm-y                    += sun4i_framebuffer.o

I don't think this applies on top of Jonathan's HDMI I2C patch
you already have queued up.

Also you might want to leave a comment describe what the
ordering should be. Otherwise it will still be messed up
down the road.

ChenYu

>
> -sun4i-tcon-y += sun4i_tcon.o
> -sun4i-tcon-y += sun4i_rgb.o
> -sun4i-tcon-y += sun4i_dotclock.o
> -sun4i-tcon-y += sun4i_crtc.o
> +sun4i-drm-hdmi-y               += sun4i_hdmi_enc.o
> +sun4i-drm-hdmi-y               += sun4i_hdmi_ddc_clk.o
> +sun4i-drm-hdmi-y               += sun4i_hdmi_tmds_clk.o
>
> -sun4i-backend-y += sun4i_backend.o sun4i_layer.o
> +sun4i-tcon-y                   += sun4i_tcon.o
> +sun4i-tcon-y                   += sun4i_rgb.o
> +sun4i-tcon-y                   += sun4i_dotclock.o
> +sun4i-tcon-y                   += sun4i_crtc.o
>
> -sun8i-mixer-y += sun8i_mixer.o sun8i_layer.o
> +sun8i-mixer-y                  += sun8i_mixer.o sun8i_layer.o
>
>  obj-$(CONFIG_DRM_SUN4I)                += sun4i-drm.o sun4i-tcon.o
>  obj-$(CONFIG_DRM_SUN4I)                += sun6i_drc.o
>  obj-$(CONFIG_DRM_SUN4I)                += sun4i_tv.o
>
> -obj-$(CONFIG_DRM_SUN4I_BACKEND)                += sun4i-backend.o
> +obj-$(CONFIG_DRM_SUN4I_BACKEND)        += sun4i-backend.o
>  obj-$(CONFIG_DRM_SUN4I_HDMI)   += sun4i-drm-hdmi.o
> -obj-$(CONFIG_DRM_SUN8I_MIXER)          += sun8i-mixer.o
> +obj-$(CONFIG_DRM_SUN8I_MIXER)  += sun8i-mixer.o
> --
> git-series 0.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
