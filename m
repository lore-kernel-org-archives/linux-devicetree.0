From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/7] drm/vc4: Fix vblank handling
Date: Fri,  2 Jun 2017 10:32:07 +0200
Message-ID: <1496392332-8722-3-git-send-email-boris.brezillon@free-electrons.com>
References: <1496392332-8722-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496392332-8722-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eben Upton <eben-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, "Hollingworth, Gordon" <gordon-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, "Cobley, Dom" <dom-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There are two problems related to VBLANK handling in the current CRTC
driver:

* VBLANK events are missed when the CRTC is being disabled because the
  driver does not wait till the end of the frame before stopping the
  HVS and PV blocks. In this case, we should explicitly issue a VBLANK
  event if there's one waiting
* when we are enabling a CRTC, drm_crtc_vblank_get() is called before
  drm_crtc_vblank_on(), which is not supposed to happen (hence the
  WARN_ON() in the code). To solve the problem, we delay the 'update
  display list' operation after the CRTC is actually enabled.

Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 80 ++++++++++++++++++++++++++++++------------
 1 file changed, 57 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index d86c8cce3182..df1d81533076 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -528,6 +528,47 @@ static void vc4_crtc_disable(struct drm_crtc *crtc)
 	WARN_ON_ONCE((HVS_READ(SCALER_DISPSTATX(chan)) &
 		      (SCALER_DISPSTATX_FULL | SCALER_DISPSTATX_EMPTY)) !=
 		     SCALER_DISPSTATX_EMPTY);
+
+	/*
+	 * Make sure we issue a vblank event after disabling the CRTC if
+	 * someone was waiting it.
+	 */
+	if (crtc->state->event) {
+		unsigned long flags;
+
+		spin_lock_irqsave(&dev->event_lock, flags);
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+		spin_unlock_irqrestore(&dev->event_lock, flags);
+	}
+}
+
+static void vc4_crtc_update_dlist(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
+
+	if (crtc->state->event) {
+		unsigned long flags;
+
+		crtc->state->event->pipe = drm_crtc_index(crtc);
+
+		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
+
+		spin_lock_irqsave(&dev->event_lock, flags);
+		vc4_crtc->event = crtc->state->event;
+		crtc->state->event = NULL;
+
+		HVS_WRITE(SCALER_DISPLISTX(vc4_crtc->channel),
+			  vc4_state->mm.start);
+
+		spin_unlock_irqrestore(&dev->event_lock, flags);
+	} else {
+		HVS_WRITE(SCALER_DISPLISTX(vc4_crtc->channel),
+			  vc4_state->mm.start);
+	}
 }
 
 static void vc4_crtc_enable(struct drm_crtc *crtc)
@@ -540,6 +581,12 @@ static void vc4_crtc_enable(struct drm_crtc *crtc)
 
 	require_hvs_enabled(dev);
 
+	/* Enable vblank irq handling before crtc is started otherwise
+	 * drm_crtc_get_vblank() fails in vc4_crtc_update_dlist().
+	 */
+	drm_crtc_vblank_on(crtc);
+	vc4_crtc_update_dlist(crtc);
+
 	/* Turn on the scaler, which will wait for vstart to start
 	 * compositing.
 	 */
@@ -551,9 +598,6 @@ static void vc4_crtc_enable(struct drm_crtc *crtc)
 	/* Turn on the pixel valve, which will emit the vstart signal. */
 	CRTC_WRITE(PV_V_CONTROL,
 		   CRTC_READ(PV_V_CONTROL) | PV_VCONTROL_VIDEN);
-
-	/* Enable vblank irq handling after crtc is started. */
-	drm_crtc_vblank_on(crtc);
 }
 
 static bool vc4_crtc_mode_fixup(struct drm_crtc *crtc,
@@ -608,7 +652,6 @@ static void vc4_crtc_atomic_flush(struct drm_crtc *crtc,
 {
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
 	struct drm_plane *plane;
 	bool debug_dump_regs = false;
@@ -630,25 +673,16 @@ static void vc4_crtc_atomic_flush(struct drm_crtc *crtc,
 
 	WARN_ON_ONCE(dlist_next - dlist_start != vc4_state->mm.size);
 
-	if (crtc->state->event) {
-		unsigned long flags;
-
-		crtc->state->event->pipe = drm_crtc_index(crtc);
-
-		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
-
-		spin_lock_irqsave(&dev->event_lock, flags);
-		vc4_crtc->event = crtc->state->event;
-		crtc->state->event = NULL;
-
-		HVS_WRITE(SCALER_DISPLISTX(vc4_crtc->channel),
-			  vc4_state->mm.start);
-
-		spin_unlock_irqrestore(&dev->event_lock, flags);
-	} else {
-		HVS_WRITE(SCALER_DISPLISTX(vc4_crtc->channel),
-			  vc4_state->mm.start);
-	}
+	/*
+	 * Only update DISPLIST if the CRTC was already running and is not
+	 * being disabled.
+	 * vc4_crtc_enable() takes care of updating the dlist just after
+	 * re-enabling VBLANK interrupts and before enabling the engine.
+	 * If the CRTC is being disabled, there's no point in updating this
+	 * information.
+	 */
+	if (crtc->state->active && old_state->active)
+		vc4_crtc_update_dlist(crtc);
 
 	if (debug_dump_regs) {
 		DRM_INFO("CRTC %d HVS after:\n", drm_crtc_index(crtc));
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
