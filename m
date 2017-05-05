From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH v2 14/20] drm/sun4i: tcon: multiply the vtotal when not in
 interlace
Date: Fri, 05 May 2017 16:16:29 +0800
Message-ID: <3683ca88e5dd7ab9f26f1c12beb15cb8@aosc.io>
References: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
 <59bdbadc4d3adc6d75c2cef38df0af332bd313db.1493812478.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <59bdbadc4d3adc6d75c2cef38df0af332bd313db.1493812478.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

在 2017-05-03 19:59，Maxime Ripard 写道：
> It appears that the total vertical resolution needs to be doubled when
> we're not in interlaced. Make sure that is the case.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index 0f91ec8a4b26..efa079c1a3f5 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -272,9 +272,9 @@ void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
>  	/* Set vertical display timings */
>  	bp = mode->crtc_vtotal - mode->crtc_vsync_start;
>  	DRM_DEBUG_DRIVER("Setting vertical total %d, backporch %d\n",
> -			 mode->vtotal, bp);
> +			 mode->crtc_vtotal, bp);
>  	regmap_write(tcon->regs, SUN4I_TCON1_BASIC4_REG,
> -		     SUN4I_TCON1_BASIC4_V_TOTAL(mode->vtotal) |
> +		     SUN4I_TCON1_BASIC4_V_TOTAL(mode->crtc_vtotal * 2) |

For TVE the value should directly be mode->vtotal, but not
mode->crtc_vtotal * 2.

vtotal is 625 when PAL. crtc_vtotal is thus 312, but if we restore the
vtotal value by doubling crtv_vtotal, we got 624, which will lead to
instability of the image displayed. (the image will loop to go higher
and then go lower, because wrong vtotal value)

Tested on patched H3 TV encoder.

I used a logic slightly changed from your v1 code:

```
	val = mode->vtotal;
	if (!(mode->flags & DRM_MODE_FLAG_INTERLACE))
		val = val * 2;
	regmap_write(tcon->regs, SUN4I_TCON1_BASIC4_REG,
		     SUN4I_TCON1_BASIC4_V_TOTAL(val) |
		     SUN4I_TCON1_BASIC4_V_BACKPORCH(bp));
```

>  		     SUN4I_TCON1_BASIC4_V_BACKPORCH(bp));
> 
>  	/* Set Hsync and Vsync length */
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
