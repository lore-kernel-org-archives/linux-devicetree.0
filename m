From: <VenkataRajesh.Kalakodima@in.bosch.com>
Subject: [PATCH 7/8] drm: rcar-du: update gamma and ctm properties in commit tail
Date: Wed, 3 Apr 2019 18:44:43 +0530
Message-ID: <1554297284-14009-8-git-send-email-VenkataRajesh.Kalakodima@in.bosch.com>
References: <1554297284-14009-1-git-send-email-VenkataRajesh.Kalakodima@in.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554297284-14009-1-git-send-email-VenkataRajesh.Kalakodima@in.bosch.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: kalakodima venkata rajesh <venkatarajesh.kalakodima@in.bosch.com>, Harsha M M <harsha.manjulamallikarjun@in.bosch.com>
List-Id: devicetree@vger.kernel.org

From: kalakodima venkata rajesh <venkatarajesh.kalakodima@in.bosch.com>

Update gamma and ctm properties if there is a change.

Signed-off-by: Harsha M M <harsha.manjulamallikarjun@in.bosch.com>

   - Fix compilation issues when for_each_crtc_in_state is not defined
   - Resolved checkpatch errors
   - Resolved merge conflicts according to latest version

Signed-off-by: kalakodima venkata rajesh <venkatarajesh.kalakodima@in.bosch.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 25 +++++++++++++++++++++++++
 include/drm/drm_atomic.h              | 25 +++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index f0bc7cc..4d9a19c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -246,6 +246,10 @@ static int rcar_du_atomic_check(struct drm_device *dev,
 static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = old_state->dev;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
+	struct rcar_du_crtc *rcrtc;
+	int i;
 
 	/* Apply the atomic update. */
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
@@ -253,6 +257,27 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
 	drm_atomic_helper_commit_modeset_enables(dev, old_state);
 
+	/* Update gamma and ctm properties for all crtc in present
+	 * state. Update is done only if there is a change
+	 */
+	for_each_crtc_in_state(old_state, crtc, crtc_state, i) {
+		rcrtc = to_rcar_crtc(crtc);
+
+		if (rcrtc->lut_handle) {
+			rcar_du_cmm_update_lut_and_free
+			  (rcrtc->lut_handle,
+			   (struct drm_color_lut *)crtc->state->gamma_lut->data,
+			   (crtc->state->gamma_lut->length /
+			   sizeof(struct drm_color_lut)));
+			rcrtc->lut_handle = NULL;
+		}
+		if (rcrtc->clu_handle) {
+			rcar_du_cmm_update_clu_and_free
+			  (rcrtc->clu_handle,
+			   (struct drm_color_ctm *)crtc->state->ctm->data);
+			rcrtc->clu_handle = NULL;
+		}
+	}
 	drm_atomic_helper_commit_hw_done(old_state);
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);
 
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 1e71315..d22ccd8 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -693,6 +693,31 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
 			     (new_connector_state) = (__state)->connectors[__i].new_state, 1))
 
 /**
+ * for_each_crtc_in_state - iterate over all connectors in an atomic update
+ * @__state: &struct drm_atomic_state pointer
+ * @crtc: &struct drm_crtc iteration cursor
+ * @crtc_state: &struct drm_crtc_state iteration cursor
+ * @__i: int iteration cursor, for macro-internal use
+ *
+ * This iterates over all CRTCs in an atomic update. Note that before the
+ * software state is committed (by calling drm_atomic_helper_swap_state(), this
+ * points to the new state, while afterwards it points to the old state. Due to
+ * this tricky confusion this macro is deprecated.
+ *
+ * FIXME:
+ *
+ * Replace all usage of this with one of the explicit iterators below and then
+ * remove this macro.
+ */
+#define for_each_crtc_in_state(__state, crtc, crtc_state, __i)	\
+	for ((__i) = 0;						\
+	     ((__i) < ((__state)->dev->mode_config.num_crtc)) &&	\
+	     ((crtc) = ((__state)->crtcs[__i].ptr),			\
+	     (crtc_state) = ((__state)->crtcs[__i].state), 1);	\
+	     (__i)++)						\
+		for_each_if(crtc_state)
+
+/**
  * for_each_oldnew_crtc_in_state - iterate over all CRTCs in an atomic update
  * @__state: &struct drm_atomic_state pointer
  * @crtc: &struct drm_crtc iteration cursor
-- 
2.7.4
