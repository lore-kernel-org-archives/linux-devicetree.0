From: <VenkataRajesh.Kalakodima@in.bosch.com>
Subject: [PATCH 4/8] drm: rcar-du: Refactor the code with new functions
Date: Wed, 3 Apr 2019 18:44:40 +0530
Message-ID: <1554297284-14009-5-git-send-email-VenkataRajesh.Kalakodima@in.bosch.com>
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

   - Introduce new functions for queueing clu and lut events.
   - Functionality remains same, only some code is moved to
     new functions.

Signed-off-by: Harsha M M <harsha.manjulamallikarjun@in.bosch.com>

      - Resolved checkpatch errors
      - Resolved merge conflicts according to latest version

Signed-off-by: kalakodima venkata rajesh <venkatarajesh.kalakodima@in.bosch.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_cmm.c | 38 +++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_cmm.c b/drivers/gpu/drm/rcar-du/rcar_du_cmm.c
index d380dd9..7983039 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_cmm.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_cmm.c
@@ -246,6 +246,44 @@ static void du_cmm_clk(struct rcar_du_cmm *du_cmm, bool on)
 		clk_disable_unprepare(du_cmm->clock);
 }
 
+static void rcar_du_cmm_queue_lut_update(struct rcar_du_cmm_pending_event *p)
+{
+	mutex_lock(&cmm_event_lock);
+
+	list_add_tail(&p->link, &p->du_cmm->lut.list);
+
+	if (p->fpriv)
+		list_add_tail(&p->fpriv_link, &p->fpriv->list);
+
+	event_prev_cancel_locked(&p->du_cmm->lut);
+
+	if (p->du_cmm->direct)
+		queue_work(p->du_cmm->workqueue, &p->du_cmm->work);
+
+	mutex_unlock(&cmm_event_lock);
+
+	drm_crtc_vblank_get(&p->du_cmm->rcrtc->crtc);
+}
+
+static void rcar_du_cmm_queue_clu_update(struct rcar_du_cmm_pending_event *p)
+{
+	mutex_lock(&cmm_event_lock);
+
+	list_add_tail(&p->link, &p->du_cmm->clu.list);
+
+	if (p->fpriv)
+		list_add_tail(&p->fpriv_link, &p->fpriv->list);
+
+	event_prev_cancel_locked(&p->du_cmm->clu);
+
+	if (p->du_cmm->direct)
+		queue_work(p->du_cmm->workqueue, &p->du_cmm->work);
+
+	mutex_unlock(&cmm_event_lock);
+
+	drm_crtc_vblank_get(&p->du_cmm->rcrtc->crtc);
+}
+
 int rcar_du_cmm_start_stop(struct rcar_du_crtc *rcrtc, bool on)
 {
 	struct rcar_du_cmm *du_cmm = rcrtc->cmm_handle;
-- 
2.7.4
