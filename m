From: Shubhashree Dhar <dhar@codeaurora.org>
Subject: drm/msm/dpu: Correct dpu encoder spinlock initialization
Date: Mon, 24 Jun 2019 11:57:12 +0530
Message-ID: <1561357632-15361-1-git-send-email-dhar@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: Shubhashree Dhar <dhar@codeaurora.org>, linux-kernel@vger.kernel.org, robdclark@gmail.com, seanpaul@chromium.org, hoegsberg@chromium.org, abhinavk@codeaurora.org, jsanka@codeaurora.org, chandanu@codeaurora.org, nganji@codeaurora.org, jshekhar@codeaurora.org
List-Id: devicetree@vger.kernel.org

dpu encoder spinlock should be initialized during dpu encoder
init instead of dpu encoder setup which is part of commit.
There are chances that vblank control uses the uninitialized
spinlock if not initialized during encoder init.

Change-Id: I5a18b95fa47397c834a266b22abf33a517b03a4e
Signed-off-by: Shubhashree Dhar <dhar@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5f085b5..22938c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2195,8 +2195,6 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 	if (ret)
 		goto fail;
 
-	spin_lock_init(&dpu_enc->enc_spinlock);
-
 	atomic_set(&dpu_enc->frame_done_timeout, 0);
 	timer_setup(&dpu_enc->frame_done_timer,
 			dpu_encoder_frame_done_timeout, 0);
@@ -2250,6 +2248,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 
 	drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
 
+	spin_lock_init(&dpu_enc->enc_spinlock);
 	dpu_enc->enabled = false;
 
 	return &dpu_enc->base;
-- 
1.9.1
