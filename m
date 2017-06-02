From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 3/7] drm/vc4: Mimic drm_atomic_helper_commit() behavior
Date: Fri,  2 Jun 2017 10:32:08 +0200
Message-ID: <1496392332-8722-4-git-send-email-boris.brezillon@free-electrons.com>
References: <1496392332-8722-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496392332-8722-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eben Upton <eben-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, "Hollingworth, Gordon" <gordon-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, "Cobley, Dom" <dom-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The VC4 KMS driver is implementing its own ->atomic_commit() but there
are a few generic helpers we can use instead of open-coding the logic.

Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 38 ++++++++++++--------------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index ad7925a9e0ea..f229abc0991b 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -42,6 +42,10 @@ vc4_atomic_complete_commit(struct vc4_commit *c)
 	struct drm_device *dev = state->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
+	drm_atomic_helper_wait_for_fences(dev, state, false);
+
+	drm_atomic_helper_wait_for_dependencies(state);
+
 	drm_atomic_helper_commit_modeset_disables(dev, state);
 
 	drm_atomic_helper_commit_planes(dev, state, 0);
@@ -57,10 +61,14 @@ vc4_atomic_complete_commit(struct vc4_commit *c)
 	 */
 	state->legacy_cursor_update = false;
 
+	drm_atomic_helper_commit_hw_done(state);
+
 	drm_atomic_helper_wait_for_vblanks(dev, state);
 
 	drm_atomic_helper_cleanup_planes(dev, state);
 
+	drm_atomic_helper_commit_cleanup_done(state);
+
 	drm_atomic_state_put(state);
 
 	up(&vc4->async_modeset);
@@ -117,32 +125,10 @@ static int vc4_atomic_commit(struct drm_device *dev,
 	if (!c)
 		return -ENOMEM;
 
-	/* Make sure that any outstanding modesets have finished. */
-	if (nonblock) {
-		struct drm_crtc *crtc;
-		struct drm_crtc_state *crtc_state;
-		unsigned long flags;
-		bool busy = false;
-
-		/*
-		 * If there's an undispatched event to send then we're
-		 * obviously still busy.  If there isn't, then we can
-		 * unconditionally wait for the semaphore because it
-		 * shouldn't be contended (for long).
-		 *
-		 * This is to prevent a race where queuing a new flip
-		 * from userspace immediately on receipt of an event
-		 * beats our clean-up and returns EBUSY.
-		 */
-		spin_lock_irqsave(&dev->event_lock, flags);
-		for_each_crtc_in_state(state, crtc, crtc_state, i)
-			busy |= vc4_event_pending(crtc);
-		spin_unlock_irqrestore(&dev->event_lock, flags);
-		if (busy) {
-			kfree(c);
-			return -EBUSY;
-		}
-	}
+	ret = drm_atomic_helper_setup_commit(state, nonblock);
+	if (ret)
+		return ret;
+
 	ret = down_interruptible(&vc4->async_modeset);
 	if (ret) {
 		kfree(c);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
