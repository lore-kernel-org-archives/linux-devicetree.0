From: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v4 1/4] drm/tilcdc: Recover from sync lost error flood by resetting the LCDC
Date: Tue, 22 Nov 2016 16:49:50 +0200
Message-ID: <f5b3b49589bada08b234bf1f0268af3d69bffce8.1479825908.git.jsarha@ti.com>
References: <cover.1479825908.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1479825908.git.jsarha-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Recover from sync lost error flood by resetting the LCDC instead of
turning off the SYNC_LOST error IRQ. When LCDC starves on limited
memory bandwidth it may sometimes result an error situation when the
picture may have shifted couple of pixels to right and SYNC_LOST
interrupt is generated on every frame. LCDC main reset recovers from
this situation and causes a brief blanking on the screen.

Signed-off-by: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 0d09acc..c787349 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -55,6 +55,7 @@ struct tilcdc_crtc {
 
 	int sync_lost_count;
 	bool frame_intact;
+	struct work_struct recover_work;
 };
 #define to_tilcdc_crtc(x) container_of(x, struct tilcdc_crtc, base)
 
@@ -252,6 +253,25 @@ static bool tilcdc_crtc_is_on(struct drm_crtc *crtc)
 	return crtc->state && crtc->state->enable && crtc->state->active;
 }
 
+static void tilcdc_crtc_recover_work(struct work_struct *work)
+{
+	struct tilcdc_crtc *tilcdc_crtc =
+		container_of(work, struct tilcdc_crtc, recover_work);
+	struct drm_crtc *crtc = &tilcdc_crtc->base;
+
+	dev_info(crtc->dev->dev, "%s: Reset CRTC", __func__);
+
+	drm_modeset_lock_crtc(crtc, NULL);
+
+	if (!tilcdc_crtc_is_on(crtc))
+		goto out;
+
+	tilcdc_crtc_disable(crtc);
+	tilcdc_crtc_enable(crtc);
+out:
+	drm_modeset_unlock_crtc(crtc);
+}
+
 static void tilcdc_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
@@ -838,9 +858,12 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
 			tilcdc_crtc->frame_intact = false;
 			if (tilcdc_crtc->sync_lost_count++ >
 			    SYNC_LOST_COUNT_LIMIT) {
-				dev_err(dev->dev, "%s(0x%08x): Sync lost flood detected, disabling the interrupt", __func__, stat);
+				dev_err(dev->dev, "%s(0x%08x): Sync lost flood detected, recovering", __func__, stat);
+				queue_work(system_wq,
+					   &tilcdc_crtc->recover_work);
 				tilcdc_write(dev, LCDC_INT_ENABLE_CLR_REG,
 					     LCDC_SYNC_LOST);
+				tilcdc_crtc->sync_lost_count = 0;
 			}
 		}
 
@@ -880,6 +903,7 @@ struct drm_crtc *tilcdc_crtc_create(struct drm_device *dev)
 			"unref", unref_worker);
 
 	spin_lock_init(&tilcdc_crtc->irq_lock);
+	INIT_WORK(&tilcdc_crtc->recover_work, tilcdc_crtc_recover_work);
 
 	ret = drm_crtc_init_with_planes(dev, crtc,
 					&tilcdc_crtc->primary,
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
