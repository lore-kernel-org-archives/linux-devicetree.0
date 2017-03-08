From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 10/15] drm/sun4i: tcon: Switch mux on only
 for composite
Date: Wed, 8 Mar 2017 11:51:39 +0800
Message-ID: <CAGb2v67iTOV-=u5rReu6_wi6NFoCoJkbJKshTpmFYUmJ=ggKUw@mail.gmail.com>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <3f70bcfe2ec03188c06d54a262d49ad91963a510.1488876832.git-series.maxime.ripard@free-electrons.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBZH77XCQKGQEKXXDZXY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <3f70bcfe2ec03188c06d54a262d49ad91963a510.1488876832.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 7, 2017 at 4:56 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Even though that mux is undocumented, it seems like it needs to be set to 1
> when using composite, and 0 when using HDMI.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index d2335f109601..93249c5ab1e4 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -268,11 +268,16 @@ void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon, struct drm_encoder *encoder,
>                            SUN4I_TCON_GCTL_IOMAP_MASK,
>                            SUN4I_TCON_GCTL_IOMAP_TCON1);
>
> +       if (encoder->encoder_type == DRM_MODE_ENCODER_TVDAC)
> +               val = 1;
> +       else
> +               val = 0;
> +
>         /*
>          * FIXME: Undocumented bits
>          */
>         if (tcon->quirks->has_unknown_mux)
> -               regmap_write(tcon->regs, SUN4I_TCON_MUX_CTRL_REG, 1);
> +               regmap_write(tcon->regs, SUN4I_TCON_MUX_CTRL_REG, val);

We might want to do this the other way around, i.e. exporting

    int sun4i_tcon_mux_set(struct drm_device *drm, int encoder_type,
                           int pipeline)

and have downstream encoders call it. For the A31, the mux is not exclusively
used for channel 1; there is a mux setting for MIPI DSI as well, but AFAIK
DSI is connected to channel 0.

Additionally, the mux registers are only valid in the first TCON, meaning
it must available be active in 2 pipeline chips. It's also why we'd pass
"struct drm_device *" instead of "struct sun4i_tcon *".


Regards
ChenYu

>  }
>  EXPORT_SYMBOL(sun4i_tcon1_mode_set);
>
> --
> git-series 0.8.11
