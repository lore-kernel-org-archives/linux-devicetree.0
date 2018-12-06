From: Jayant Shekhar <jshekhar@codeaurora.org>
Subject: [DPU PATCH] drm/msm/dpu: Fix vblank refcount mismatch
Date: Thu,  6 Dec 2018 12:16:53 +0530
Message-ID: <1544078813-10945-1-git-send-email-jshekhar@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: Jayant Shekhar <jshekhar@codeaurora.org>, linux-kernel@vger.kernel.org, robdclark@gmail.com, seanpaul@chromium.org, hoegsberg@chromium.org, abhinavk@codeaurora.org, jsanka@codeaurora.org, chandanu@codeaurora.org, nganji@codeaurora.org
List-Id: devicetree@vger.kernel.org

_dpu_crtc_vblank_enable_no_lock releases crtc_lock as
its needed for power handle operations. This opens up a
window where in a thread running dpu_crtc_disable and a thread
running dpu_crtc_vblank can race in using dpu_crtc->enabled.

dpu_crtc_disable will change the state, where as dpu_crtc_vblank
use the variable. The fix is to cache the crtc enabled state
while holding the lock and use it as a gate in calling
_dpu_crtc_vblank_enable_no_lock.

This issue was introduced with the commit cf871c48
(drm/msm/dpu: Remove suspend state tracking from crtc).

Below are stack traces of thread 1 and thread 2 in good case
and bad case:

Bad case:
-------------
Thread 1
dpu_encoder_phys_vid_control_vblank_irq+0xd0/0x170
dpu_encoder_register_vblank_callback+0xb8/0x100
_dpu_crtc_vblank_enable_no_lock+0x240/0x288
dpu_crtc_disable+0xc4/0x288
drm_atomic_helper_commit_modeset_disables+0x19c/0x350
msm_atomic_commit_tail+0x48/0x144
commit_tail+0x44/0x70
drm_atomic_helper_commit+0xf0/0xf8
drm_atomic_commit+0x40/0x4c
drm_mode_atomic_ioctl+0x374/0x90c
drm_ioctl_kernel+0xac/0xec
drm_ioctl+0x218/0x384
drm_compat_ioctl+0xd8/0xe8

Thread 2:
dpu_encoder_phys_vid_control_vblank_irq+0x74/0x170
dpu_encoder_register_vblank_callback+0xb8/0x100
_dpu_crtc_vblank_enable_no_lock+0x240/0x288
dpu_crtc_vblank+0xa8/0x118
dpu_kms_disable_vblank+0x20/0x2c
vblank_ctrl_worker+0xa0/0xe0
kthread_worker_fn+0xe4/0x1a4
kthread+0x11c/0x12c
ret_from_fork+0x10/0x18

Good case:
--------------
Thread 1:
dpu_encoder_phys_vid_control_vblank_irq+0xd0/0x170
dpu_encoder_phys_vid_irq_control+0xc8/0x110
_dpu_encoder_irq_control+0x48/0xa0
_dpu_encoder_resource_control_helper+0xb4/0x10c
dpu_encoder_resource_control+0x4e0/0x664
dpu_encoder_virt_enable+0xb8/0x120
dpu_kms_encoder_enable+0x34/0xcc
drm_atomic_helper_commit_modeset_enables+0x120/0x1b8
msm_atomic_commit_tail+0x5c/0x144
commit_tail+0x44/0x70
drm_atomic_helper_commit+0xf0/0xf8
drm_atomic_commit+0x40/0x4c
drm_mode_atomic_ioctl+0x374/0x90c

Thread 2:
dpu_crtc_vblank+0xc8/0x118
dpu_kms_disable_vblank+0x20/0x2c
vblank_ctrl_worker+0xa0/0xe0
kthread_worker_fn+0xe4/0x1a4
kthread+0x11c/0x12c

Signed-off-by: Jayant Shekhar <jshekhar@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 630cbaa..e81ad8c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -877,6 +877,7 @@ static void dpu_crtc_disable(struct drm_crtc *crtc)
 	struct drm_encoder *encoder;
 	struct msm_drm_private *priv;
 	unsigned long flags;
+	bool crtc_en;
 
 	if (!crtc || !crtc->dev || !crtc->dev->dev_private || !crtc->state) {
 		DPU_ERROR("invalid crtc\n");
@@ -901,11 +902,21 @@ static void dpu_crtc_disable(struct drm_crtc *crtc)
 				atomic_read(&dpu_crtc->frame_pending));
 
 	trace_dpu_crtc_disable(DRMID(crtc), false, dpu_crtc);
-	if (dpu_crtc->enabled && dpu_crtc->vblank_requested) {
-		_dpu_crtc_vblank_enable_no_lock(dpu_crtc, false);
-	}
+
+	/*
+	 * Cache vblank enabled before calling _dpu_crtc_vblank_enable_no_lock,
+	 * because we release crtc_lock inside and acquire it back. While lock
+	 * is released, there are cases where dpu_crtc_vblank comes in between
+	 * while disable is going on. dpu_crtc_vblank further calls
+	 * _dpu_crtc_vblank_enable_no_lock which tries vblank disable again
+	 * resulting in refcount mismatch.
+	 */
+	crtc_en = dpu_crtc->enabled;
 	dpu_crtc->enabled = false;
 
+	if (crtc_en && dpu_crtc->vblank_requested)
+		_dpu_crtc_vblank_enable_no_lock(dpu_crtc, false);
+
 	if (atomic_read(&dpu_crtc->frame_pending)) {
 		trace_dpu_crtc_disable_frame_pending(DRMID(crtc),
 				     atomic_read(&dpu_crtc->frame_pending));
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
