From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v2 06/11] drm: sun4i: add color space correction
 support for DE2 mixer
Date: Mon,  5 Jun 2017 00:01:44 +0800
Message-ID: <20170604160149.30230-7-icenowy@aosc.io>
References: <20170604160149.30230-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBO662DEQKGQE5RTYYOI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170604160149.30230-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The DE2 mixer can do color space correction needed by TV Encoder with
its DCSC sub-engine.

Add support for it.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 35 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_mixer.h |  6 +++++-
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index d658a3a8159a..65f86641eca3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -29,6 +29,14 @@
 #include "sun8i_layer.h"
 #include "sunxi_engine.h"
 
+static const u32 sun8i_rgb2yuv_coef[12] = {
+	0x00000107, 0x00000204, 0x00000064, 0x00004200,
+	0x00001f68, 0x00001ed6, 0x000001c2, 0x00020200,
+	0x000001c2, 0x00001e87, 0x00001fb7, 0x00020200,
+};
+
+static const u32 sun8i_rgb2yuv_dcsc_alpha = 0x00020200;
+
 static void sun8i_mixer_commit(struct sunxi_engine *engine)
 {
 	DRM_DEBUG_DRIVER("Committing changes\n");
@@ -37,6 +45,31 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine)
 		     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
 }
 
+static void sun8i_mixer_apply_color_correction(struct sunxi_engine *engine)
+{
+	int i;
+
+	DRM_DEBUG_DRIVER("Applying RGB to YUV color correction\n");
+
+	/* Set color correction */
+	regmap_write(engine->regs, SUN8I_MIXER_DCSC_EN, 1);
+
+	for (i = 0; i < 12; i++)
+		regmap_write(engine->regs, SUN8I_MIXER_DCSC_COEF_REG(i),
+			     sun8i_rgb2yuv_coef[i]);
+
+	regmap_write(engine->regs, SUN8I_MIXER_DCSC_COEF_ALPHA,
+		     sun8i_rgb2yuv_dcsc_alpha);
+}
+
+static void sun8i_mixer_disable_color_correction(struct sunxi_engine *engine)
+{
+	DRM_DEBUG_DRIVER("Disabling color correction\n");
+
+	/* Disable color correction */
+	regmap_write(engine->regs, SUN8I_MIXER_DCSC_EN, 0);
+}
+
 void sun8i_mixer_layer_enable(struct sun8i_mixer *mixer,
 				int layer, bool enable)
 {
@@ -229,6 +262,8 @@ int sun8i_mixer_update_layer_buffer(struct sun8i_mixer *mixer,
 static const struct sunxi_engine_ops sun8i_engine_ops = {
 	.commit		= sun8i_mixer_commit,
 	.layers_init	= sun8i_layers_init,
+	.apply_color_correction		= sun8i_mixer_apply_color_correction,
+	.disable_color_correction	= sun8i_mixer_disable_color_correction,
 };
 
 static struct regmap_config sun8i_mixer_regmap_config = {
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 4785ac090b8c..d7f7513898b6 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -88,6 +88,11 @@
 #define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_RGB888	(8 << 8)
 #define SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_DEF	(0xff << 24)
 
+/* The DCSC sub-engine is used to do color space conversation */
+#define SUN8I_MIXER_DCSC_EN			0xb0000
+#define SUN8I_MIXER_DCSC_COEF_REG(x)		(0xb0010 + 0x4 * x)
+#define SUN8I_MIXER_DCSC_COEF_ALPHA		0xb0040
+
 /*
  * These sub-engines are still unknown now, the EN registers are here only to
  * be used to disable these sub-engines.
@@ -102,7 +107,6 @@
 #define SUN8I_MIXER_PEAK_EN			0xa6000
 #define SUN8I_MIXER_ASE_EN			0xa8000
 #define SUN8I_MIXER_FCC_EN			0xaa000
-#define SUN8I_MIXER_DCSC_EN			0xb0000
 
 struct sun8i_mixer_cfg {
 	int		vi_num;
-- 
2.12.2
