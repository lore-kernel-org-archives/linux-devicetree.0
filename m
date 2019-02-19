From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 06/11] drm/sun4i: rgb: Add DT property to
 disable strict clock rate check
Date: Tue, 19 Feb 2019 09:56:26 +0100
Message-ID: <20190219085626.7poutwvm3lrilnon@flea>
References: <20190215050957.20755-1-anarsoul@gmail.com>
 <20190215050957.20755-7-anarsoul@gmail.com>
 <20190218182629.GA14714@bogus>
 <CA+E=qVfDfDvVmKQDeh2e0SA=tm6VpBMpu9MPKUqxFPObxYFXDg@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dppndfprzkjywqmh"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBPUJV7RQKGQEMSK6ZPQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CA+E=qVfDfDvVmKQDeh2e0SA=tm6VpBMpu9MPKUqxFPObxYFXDg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-linux <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--dppndfprzkjywqmh
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Feb 18, 2019 at 11:33:05AM -0800, Vasily Khoruzhick wrote:
> On Mon, Feb 18, 2019 at 10:26 AM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >
> > On Thu, Feb 14, 2019 at 09:09:52PM -0800, Vasily Khoruzhick wrote:
> > > Clock rate check that was added in commit bb43d40d7c83 ("drm/sun4i: rgb:
> > > Validate the clock rate") prevents some panel and bridges from working with
> > > sun4i driver.
> >
> > Sounds lile a regression that should be reverted. The fix is not a
> > backwards compatible change either.
> 
> anx6345 driver isn't mainlined yet and I'm not sure if this change
> breaks any mainlined boards. So likely there's not enough
> justification to revert it.
> 
> > > Unfortunately, dotclock frequency for some modes are not achievable on
> > > sunxi hardware, and there's a slight deviation in rate returned by
> > > clk_round_rate(), so they fail this check.
> > >
> > > Experiments show that panels and bridges work fine with this slight
> > > deviation, e.g. Pinebook that uses ANX6345 bridge with 768p eDP panel
> > > requests 73 MHz, gets 72.296MHz instead (0.96% difference) and works just
> > > fine.
> > >
> > > This patch adds DT property to disable strict clock rate check
> > >
> > > Signed-off-by: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > ---
> > >  .../devicetree/bindings/display/sunxi/sun4i-drm.txt          | 2 ++
> > >  drivers/gpu/drm/sun4i/sun4i_rgb.c                            | 5 +++++
> > >  drivers/gpu/drm/sun4i/sun4i_tcon.c                           | 3 +++
> > >  drivers/gpu/drm/sun4i/sun4i_tcon.h                           | 1 +
> > >  4 files changed, 11 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > > index f426bdb42f18..18c8b053a28d 100644
> > > --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > > +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > > @@ -63,6 +63,8 @@ Required properties:
> > >      Documentation/devicetree/bindings/media/video-interfaces.txt. The
> > >      first port should be the input endpoint. The second should be the
> > >      output, usually to an HDMI connector.
> > > +  - no-strict-clock-check: don't reject timings if exact dot clock can't be
> > > +    reached.
> >
> > This should be the default IMO. Most panels are a single timing, so if
> > we reject it the fallback no display?
> 
> As far as I remember the change was introduced to reject some modes
> for which dotclock can't be reached when driver is used with VGA
> bridge. So if we make it default it'll break boards with VGA bridge
> and old DT.
> 
> > I thought we had some mechanism already to allow some range of
> > frequencies. I think the chromeos guys needed something IIRC.
> 
> You can specify frequency range for panels, but there's nothing for
> bridges. In my case EDID doesn't specify clock tolerance.

I gave it some more though, and came up with the following patch. The
basic idea is to leave the boundary check for the bridges that will
have EDID and we need to filter out the modes that have no chance of
being supported. The tolerancy used is the one defined in VESA specs,
but I added a module parameter if you wanted to tune that.

And finally, since most of our panels are single timings without any
tolerancy, we just try our best in this case and that's it, while
leaving the door open to support display_timings and being able to do
more once we have an idea of what the tolerancies are.

If that works for you, I'll submit it.

Maxime

--- >8 ---
diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index f4a22689eb54..0460146aab75 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -43,6 +43,25 @@ drm_encoder_to_sun4i_rgb(struct drm_encoder *encoder)
 			    encoder);
 }
 
+static inline struct drm_connector *
+sun4i_rgb_get_connector_from_encoder(const struct drm_encoder *encoder)
+{
+	struct drm_connector *connector = NULL, *tmp;
+	struct drm_connector_list_iter iter;
+
+	drm_connector_list_iter_begin(encoder->dev, &iter);
+	drm_for_each_connector_iter(tmp, &iter)
+		if (tmp->encoder == encoder) {
+			connector = tmp;
+			goto out;
+		}
+
+out:
+	drm_connector_list_iter_end(&iter);
+
+	return connector;
+}
+
 static int sun4i_rgb_get_modes(struct drm_connector *connector)
 {
 	struct sun4i_rgb *rgb =
@@ -52,11 +71,22 @@ static int sun4i_rgb_get_modes(struct drm_connector *connector)
 	return drm_panel_get_modes(tcon->panel);
 }
 
+/*
+ * VESA DMT defines a tolerancy of 0.5% on the pixel clock, while the
+ * CVT spec reuses that tolerancy in its examples, so it looks to be a
+ * good default tolerancy for the EDID-based modes.
+ */
+static unsigned int clock_tolerancy = 5;
+module_param(clock_tolerancy, uint, 0644);
+MODULE_PARM_DESC(clock_tolerancy,
+		 "Tolerancy of the pixel clock in per mille");
+
 static enum drm_mode_status sun4i_rgb_mode_valid(struct drm_encoder *crtc,
 						 const struct drm_display_mode *mode)
 {
 	struct sun4i_rgb *rgb = drm_encoder_to_sun4i_rgb(crtc);
 	struct sun4i_tcon *tcon = rgb->tcon;
+	struct drm_connector *connector = sun4i_rgb_get_connector_from_encoder(crtc);
 	u32 hsync = mode->hsync_end - mode->hsync_start;
 	u32 vsync = mode->vsync_end - mode->vsync_start;
 	unsigned long rate = mode->clock * 1000;
@@ -92,15 +122,27 @@ static enum drm_mode_status sun4i_rgb_mode_valid(struct drm_encoder *crtc,
 
 	DRM_DEBUG_DRIVER("Vertical parameters OK\n");
 
+	/*
+	 * TODO: We should use the struct display_timing if available
+	 * and / or trying to stretch the timings within that
+	 * tolerancy to take care of panels that we wouldn't be able
+	 * to have a exact match for.
+	 */
+	if (connector->connector_type == DRM_MODE_CONNECTOR_Unknown) {
+		DRM_DEBUG_DRIVER("RGB panel used, skipping clock rate checks");
+		goto out;
+	}
+
 	tcon->dclk_min_div = 6;
 	tcon->dclk_max_div = 127;
 	rounded_rate = clk_round_rate(tcon->dclk, rate);
-	if (rounded_rate < rate)
+	if (rounded_rate < (rate * (1000 - clock_tolerancy) / 1000))
 		return MODE_CLOCK_LOW;
 
-	if (rounded_rate > rate)
+	if (rounded_rate > (rate * (1000 + clock_tolerancy) / 1000))
 		return MODE_CLOCK_HIGH;
 
+out:
 	DRM_DEBUG_DRIVER("Clock rate OK\n");
 
 	return MODE_OK;
--- >8 ---


-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--dppndfprzkjywqmh--
