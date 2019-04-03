From: <VenkataRajesh.Kalakodima@in.bosch.com>
Subject: [PATCH 6/8] drm: rcar-du: Implement atomic_check to check for gamma and ctm properties
Date: Wed, 3 Apr 2019 18:44:42 +0530
Message-ID: <1554297284-14009-7-git-send-email-VenkataRajesh.Kalakodima@in.bosch.com>
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

    Implement atomic helper check and allocate memory necessary for
    lut and clu tables

Signed-off-by: Harsha M M <harsha.manjulamallikarjun@in.bosch.com>

      - Resolved checkpatch errors
      - Resolved merge conflicts according to latest version
Signed-off-by: kalakodima venkata rajesh <venkatarajesh.kalakodima@in.bosch.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 58 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  3 +-
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 864fb94..a00b7a7 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -622,6 +622,63 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
  * CRTC Functions
  */
 
+static bool rcar_du_crtc_is_ctm_updated(struct drm_crtc *crtc,
+					struct drm_crtc_state *state)
+{
+	return (state->color_mgmt_changed && state->ctm &&
+		crtc->state->ctm &&
+		(crtc->state->ctm->base.id != state->ctm->base.id));
+}
+
+static bool rcar_du_crtc_is_gamma_updated(struct drm_crtc *crtc,
+					  struct drm_crtc_state *state)
+{
+	return (state->color_mgmt_changed && state->gamma_lut &&
+		crtc->state->gamma_lut &&
+		(crtc->state->gamma_lut->base.id != state->gamma_lut->base.id));
+}
+
+static int rcar_du_crtc_cmm_atomic_check(struct drm_crtc *crtc,
+					 struct drm_crtc_state *state)
+{
+	int ret = 0;
+	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+	/*Check gamma update and allocate memory*/
+	if (rcar_du_crtc_is_gamma_updated(crtc, state) &&
+	    !rcrtc->lut_handle) {
+		ret = rcar_du_cmm_lut_valid((crtc->state->gamma_lut->length /
+					     sizeof(struct drm_color_lut)));
+		if (ret >= 0) {
+			rcrtc->lut_handle =
+				rcar_du_cmm_alloc_lut(rcrtc->cmm_handle);
+			if (!rcrtc->lut_handle)
+				ret = -ENOMEM;
+		}
+	}
+
+	/*Check update of ctm and allocate memory*/
+	if (ret >= 0 && rcar_du_crtc_is_ctm_updated(crtc, state) &&
+	    !rcrtc->clu_handle) {
+		rcrtc->clu_handle = rcar_du_cmm_alloc_clu(rcrtc->cmm_handle);
+		if (!rcrtc->clu_handle) {
+			if (!rcrtc->lut_handle) {
+				rcar_du_cmm_free_lut(rcrtc->lut_handle);
+				rcrtc->lut_handle = NULL;
+			}
+			ret = -ENOMEM;
+		}
+	}
+
+	return ret;
+}
+
+static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
+				     struct drm_crtc_state *state)
+{
+	return rcar_du_crtc_cmm_atomic_check(crtc, state);
+}
+
 static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 				       struct drm_crtc_state *old_state)
 {
@@ -708,6 +765,7 @@ static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
 	.atomic_flush = rcar_du_crtc_atomic_flush,
 	.atomic_enable = rcar_du_crtc_atomic_enable,
 	.atomic_disable = rcar_du_crtc_atomic_disable,
+	.atomic_check = rcar_du_crtc_atomic_check,
 };
 
 static struct drm_crtc_state *
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 5b85de4..b79080e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -70,7 +70,8 @@ struct rcar_du_crtc {
 	int lvds_ch;
 
 	void *cmm_handle;
-
+	void *lut_handle;
+	void *clu_handle;
 };
 
 #define to_rcar_crtc(c)	container_of(c, struct rcar_du_crtc, crtc)
-- 
2.7.4
