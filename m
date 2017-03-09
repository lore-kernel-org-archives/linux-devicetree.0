From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 12/15] drm/sun4i: tcon: multiply the vtotal
 when not in interlace
Date: Thu, 9 Mar 2017 11:54:50 +0100
Message-ID: <20170309105450.44l26dbry56an65d@lukather>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <0b3b516527c42e745ed8a35736948a383411bd50.1488876832.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v67t7O4AuSXUupB3EU7OZdxgQbeyB6qL_g3x_BXOFLg9Bg@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x77cuo2tpcmr2jkt"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB67IQTDAKGQECD3K3GA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v67t7O4AuSXUupB3EU7OZdxgQbeyB6qL_g3x_BXOFLg9Bg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--x77cuo2tpcmr2jkt
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, Mar 07, 2017 at 06:05:17PM +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> On Tue, Mar 7, 2017 at 4:56 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > It appears that the total vertical resolution needs to be doubled when
> > we're not in interlaced. Make sure that is the case.
> 
> This is true for both channels, though we handle them differently.
> 
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > index e44217fb4f6f..515fa56c1e6a 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -248,10 +248,13 @@ void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon, struct drm_encoder *encoder,
> >                      SUN4I_TCON1_BASIC3_H_BACKPORCH(bp));
> >
> >         bp = mode->crtc_vtotal - mode->crtc_vsync_start;
> > +       val = mode->crtc_vtotal;
> > +       if (!(mode->flags & DRM_MODE_FLAG_INTERLACE))
> > +               val = val * 2;
> >         DRM_DEBUG_DRIVER("Setting vertical total %d, backporch %d\n",
> >                          mode->vtotal, bp);
> >         regmap_write(tcon->regs, SUN4I_TCON1_BASIC4_REG,
> > -                    SUN4I_TCON1_BASIC4_V_TOTAL(mode->vtotal) |
> > +                    SUN4I_TCON1_BASIC4_V_TOTAL(val) |
> 
> For channel 0, the SUN4I_TCON0_BASIC2_V_TOTAL macro multiplies the passed in
> value by 2. I think we should do the same for channel 1, and instead halve the
> value passed in if we are outputting interlaced data. I think this makes more
> sense because:
> 
> 1) The register description for both channels are the same. Handling them
>    consistently will result in less confusion, such as this one.
> 
> 2) The definition of interlaced modes is a frame is separated into odd and
>    even fields, with each field contains half the number of lines of the
>    full frame. One field is displayed during each VSYNC cycle. The TCON does
>    not know whether it's interlaced video or not. It only knows the display
>    timings. In this case, the number of horizontal lines per cycle is key.

Hmm, yes, you're right. I'll fix it in the next release.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--x77cuo2tpcmr2jkt--
