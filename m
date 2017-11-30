From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v3 3/3] drm/omap: Filter displays mode based on bandwidth limit
Date: Thu, 30 Nov 2017 14:12:37 +0200
Message-ID: <20171130121237.30431-4-peter.ujfalusi@ti.com>
References: <20171130121237.30431-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171130121237.30431-1-peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tomi.valkeinen-l0cyMroinI0@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, jsarha-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

If we have memory bandwidth limit configured, reject the modes which would
require more bandwidth than the limit if it is used with one full
resolution plane (most common use case).

This filtering is not providing full protection as it is possible that
application would pick smaller crtc resolution with high resolution planes
and down scaling, or can enable more smaller planes where the sum of their
bandwidth need would be higher than the limit.

This patch only allows us to filter out modes which would need more
bandwidth if they were used with one full screen plane.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
---
 drivers/gpu/drm/omapdrm/omap_crtc.c | 37 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/omapdrm/omap_drv.c  |  5 +++++
 drivers/gpu/drm/omapdrm/omap_drv.h  |  3 +++
 3 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index cc85c16cbc2a..ae2e16ed3874 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -23,6 +23,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_mode.h>
 #include <drm/drm_plane_helper.h>
+#include <linux/math64.h>
 
 #include "omap_drv.h"
 
@@ -400,6 +401,41 @@ static void omap_crtc_atomic_disable(struct drm_crtc *crtc,
 	drm_crtc_vblank_off(crtc);
 }
 
+static enum drm_mode_status omap_crtc_mode_valid(struct drm_crtc *crtc,
+					const struct drm_display_mode *mode)
+{
+	struct omap_drm_private *priv = crtc->dev->dev_private;
+
+	/* Check for bandwidth limit */
+	if (priv->max_bandwidth) {
+		/*
+		 * Estimation for the bandwidth need of a given mode with one
+		 * full screen plane:
+		 * bandwidth = resolution * 32bpp * (pclk / (vtotal * htotal))
+		 *					^^ Refresh rate ^^
+		 *
+		 * The interlaced mode is taken into account by using the
+		 * pixelclock in the calculation.
+		 *
+		 * The equation is rearranged for 64bit arithmetic.
+		 */
+		uint64_t bandwidth = mode->clock * 1000;
+		unsigned int bpp = 4;
+
+		bandwidth = bandwidth * mode->hdisplay * mode->vdisplay * bpp;
+		bandwidth = div_u64(bandwidth, mode->htotal * mode->vtotal);
+
+		/*
+		 * Reject modes which would need more bandwidth if used with one
+		 * full resolution plane (most common use case).
+		 */
+		if (priv->max_bandwidth < bandwidth)
+			return MODE_BAD;
+	}
+
+	return MODE_OK;
+}
+
 static void omap_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
@@ -621,6 +657,7 @@ static const struct drm_crtc_helper_funcs omap_crtc_helper_funcs = {
 	.atomic_flush = omap_crtc_atomic_flush,
 	.atomic_enable = omap_crtc_atomic_enable,
 	.atomic_disable = omap_crtc_atomic_disable,
+	.mode_valid = omap_crtc_mode_valid,
 };
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index cdf5b0601eba..ba3d22fae55b 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -593,6 +593,11 @@ static int pdev_probe(struct platform_device *pdev)
 	ddev->dev_private = priv;
 	platform_set_drvdata(pdev, ddev);
 
+	/* Get memory bandwidth limits */
+	if (priv->dispc_ops->get_memory_bandwidth_limit)
+		priv->max_bandwidth =
+				priv->dispc_ops->get_memory_bandwidth_limit();
+
 	omap_gem_init(ddev);
 
 	ret = omap_modeset_init(ddev);
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
index 4bd1e9070b31..d404e8c56b61 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.h
+++ b/drivers/gpu/drm/omapdrm/omap_drv.h
@@ -83,6 +83,9 @@ struct omap_drm_private {
 	spinlock_t wait_lock;		/* protects the wait_list */
 	struct list_head wait_list;	/* list of omap_irq_wait */
 	uint32_t irq_mask;		/* enabled irqs in addition to wait_list */
+
+	/* memory bandwidth limit if it is needed on the platform */
+	unsigned int max_bandwidth;
 };
 
 
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
