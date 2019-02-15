From: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 06/11] drm/sun4i: rgb: Add DT property to
 disable strict clock rate check
Date: Thu, 14 Feb 2019 21:09:52 -0800
Message-ID: <20190215050957.20755-7-anarsoul@gmail.com>
References: <20190215050957.20755-1-anarsoul@gmail.com>
Reply-To: anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDV3B667TUHBBRMTTHRQKGQEVRC3YLI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190215050957.20755-1-anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Clock rate check that was added in commit bb43d40d7c83 ("drm/sun4i: rgb:
Validate the clock rate") prevents some panel and bridges from working with
sun4i driver.

Unfortunately, dotclock frequency for some modes are not achievable on
sunxi hardware, and there's a slight deviation in rate returned by
clk_round_rate(), so they fail this check.

Experiments show that panels and bridges work fine with this slight
deviation, e.g. Pinebook that uses ANX6345 bridge with 768p eDP panel
requests 73 MHz, gets 72.296MHz instead (0.96% difference) and works just
fine.

This patch adds DT property to disable strict clock rate check

Signed-off-by: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/display/sunxi/sun4i-drm.txt          | 2 ++
 drivers/gpu/drm/sun4i/sun4i_rgb.c                            | 5 +++++
 drivers/gpu/drm/sun4i/sun4i_tcon.c                           | 3 +++
 drivers/gpu/drm/sun4i/sun4i_tcon.h                           | 1 +
 4 files changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index f426bdb42f18..18c8b053a28d 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -63,6 +63,8 @@ Required properties:
     Documentation/devicetree/bindings/media/video-interfaces.txt. The
     first port should be the input endpoint. The second should be the
     output, usually to an HDMI connector.
+  - no-strict-clock-check: don't reject timings if exact dot clock can't be
+    reached.
 
 DWC HDMI TX Encoder
 -------------------
diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index f4a22689eb54..b392d4b1ebd3 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -94,7 +94,12 @@ static enum drm_mode_status sun4i_rgb_mode_valid(struct drm_encoder *crtc,
 
 	tcon->dclk_min_div = 6;
 	tcon->dclk_max_div = 127;
+
+	if (tcon->no_strict_clock_check)
+		return MODE_OK;
+
 	rounded_rate = clk_round_rate(tcon->dclk, rate);
+
 	if (rounded_rate < rate)
 		return MODE_CLOCK_LOW;
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index cf45d0f940f9..f5f7f479332b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1108,6 +1108,9 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 	tcon->id = engine->id;
 	tcon->quirks = of_device_get_match_data(dev);
 
+	tcon->no_strict_clock_check = of_property_read_bool(dev->of_node,
+						"no-strict-clock-check");
+
 	tcon->lcd_rst = devm_reset_control_get(dev, "lcd");
 	if (IS_ERR(tcon->lcd_rst)) {
 		dev_err(dev, "Couldn't get our reset line\n");
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index b5214d71610f..ab510b80004a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -258,6 +258,7 @@ struct sun4i_tcon {
 	struct reset_control		*lvds_rst;
 
 	struct drm_panel		*panel;
+	bool				no_strict_clock_check;
 
 	/* Platform adjustments */
 	const struct sun4i_tcon_quirks	*quirks;
-- 
2.20.1
