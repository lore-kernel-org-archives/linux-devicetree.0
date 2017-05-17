From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v8 2/9] drm/sun4i: add a dedicated module for
 sun4i-backend and sun4i-layer
Date: Wed, 17 May 2017 22:47:18 +0800
Message-ID: <20170517144725.3463-3-icenowy@aosc.io>
References: <20170517144725.3463-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB7GF6HEAKGQEFNRIJ7I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170517144725.3463-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Currently the direct call from CRTC code to layer code has disappeared,
instead the layer's init function is called via the backend's ops.

Add a dedicated module for sun4i-backend and sun4i-layer, and drop the
EXPORT_SYMBOL from backend code to layer code.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
Changes in v7:
- Added Chen-Yu's Reviewed-by.

 drivers/gpu/drm/sun4i/Makefile        | 5 +++--
 drivers/gpu/drm/sun4i/sun4i_backend.c | 4 ----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
index 59b757350a1f..a251fb36c951 100644
--- a/drivers/gpu/drm/sun4i/Makefile
+++ b/drivers/gpu/drm/sun4i/Makefile
@@ -5,9 +5,10 @@ sun4i-tcon-y += sun4i_tcon.o
 sun4i-tcon-y += sun4i_rgb.o
 sun4i-tcon-y += sun4i_dotclock.o
 sun4i-tcon-y += sun4i_crtc.o
-sun4i-tcon-y += sun4i_layer.o
+
+sun4i-backend-y += sun4i_backend.o sun4i_layer.o
 
 obj-$(CONFIG_DRM_SUN4I)		+= sun4i-drm.o sun4i-tcon.o
-obj-$(CONFIG_DRM_SUN4I)		+= sun4i_backend.o
+obj-$(CONFIG_DRM_SUN4I)		+= sun4i-backend.o
 obj-$(CONFIG_DRM_SUN4I)		+= sun6i_drc.o
 obj-$(CONFIG_DRM_SUN4I)		+= sun4i_tv.o
diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 4af8ccb10bff..cf480218daa5 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -83,7 +83,6 @@ void sun4i_backend_layer_enable(struct sun4i_backend *backend,
 	regmap_update_bits(backend->engine.regs, SUN4I_BACKEND_MODCTL_REG,
 			   SUN4I_BACKEND_MODCTL_LAY_EN(layer), val);
 }
-EXPORT_SYMBOL(sun4i_backend_layer_enable);
 
 static int sun4i_backend_drm_format_to_layer(struct drm_plane *plane,
 					     u32 format, u32 *mode)
@@ -170,7 +169,6 @@ int sun4i_backend_update_layer_coord(struct sun4i_backend *backend,
 
 	return 0;
 }
-EXPORT_SYMBOL(sun4i_backend_update_layer_coord);
 
 int sun4i_backend_update_layer_formats(struct sun4i_backend *backend,
 				       int layer, struct drm_plane *plane)
@@ -205,7 +203,6 @@ int sun4i_backend_update_layer_formats(struct sun4i_backend *backend,
 
 	return 0;
 }
-EXPORT_SYMBOL(sun4i_backend_update_layer_formats);
 
 int sun4i_backend_update_layer_buffer(struct sun4i_backend *backend,
 				      int layer, struct drm_plane *plane)
@@ -246,7 +243,6 @@ int sun4i_backend_update_layer_buffer(struct sun4i_backend *backend,
 
 	return 0;
 }
-EXPORT_SYMBOL(sun4i_backend_update_layer_buffer);
 
 static int sun4i_backend_init_sat(struct device *dev) {
 	struct sun4i_backend *backend = dev_get_drvdata(dev);
-- 
2.12.2
