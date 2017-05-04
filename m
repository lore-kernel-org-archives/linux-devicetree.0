From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 14/20] drm/sun4i: tcon: multiply the
 vtotal when not in interlace
Date: Thu, 4 May 2017 12:07:46 +0800
Message-ID: <CAGb2v64mHfj8MLTtvdJCs7h76uMmq-uJuaSEPoQ5CAv-nyrTNA@mail.gmail.com>
References: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
 <59bdbadc4d3adc6d75c2cef38df0af332bd313db.1493812478.git-series.maxime.ripard@free-electrons.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBKWSVLEAKGQETFVYP5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <59bdbadc4d3adc6d75c2cef38df0af332bd313db.1493812478.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 3, 2017 at 7:59 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> It appears that the total vertical resolution needs to be doubled when
> we're not in interlaced. Make sure that is the case.

I think the total vertical resolution needs to be doubled in all cases.
It just happens that you should've been using mode->crtc_vtotal, which
is halved when the mode is interlaced. Instead you used mode->vtotal,
which is double the actual scan resolution in interlaced mode.

ChenYu

> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index 0f91ec8a4b26..efa079c1a3f5 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -272,9 +272,9 @@ void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
>         /* Set vertical display timings */
>         bp = mode->crtc_vtotal - mode->crtc_vsync_start;
>         DRM_DEBUG_DRIVER("Setting vertical total %d, backporch %d\n",
> -                        mode->vtotal, bp);
> +                        mode->crtc_vtotal, bp);
>         regmap_write(tcon->regs, SUN4I_TCON1_BASIC4_REG,
> -                    SUN4I_TCON1_BASIC4_V_TOTAL(mode->vtotal) |
> +                    SUN4I_TCON1_BASIC4_V_TOTAL(mode->crtc_vtotal * 2) |
>                      SUN4I_TCON1_BASIC4_V_BACKPORCH(bp));
>
>         /* Set Hsync and Vsync length */
> --
> git-series 0.8.11
