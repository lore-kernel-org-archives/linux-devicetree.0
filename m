From: Jayant Shekhar <jshekhar@codeaurora.org>
Subject: [v1] drm/msm/dpu: Remove unused enum and comment from dpu mdss
Date: Wed, 19 Dec 2018 00:23:53 +0530
Message-ID: <1545159233-21580-1-git-send-email-jshekhar@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: Jayant Shekhar <jshekhar@codeaurora.org>, linux-kernel@vger.kernel.org, robdclark@gmail.com, seanpaul@chromium.org, hoegsberg@chromium.org, abhinavk@codeaurora.org, jsanka@codeaurora.org, chandanu@codeaurora.org, nganji@codeaurora.org
List-Id: devicetree@vger.kernel.org

Remove enum dpu_iommu_domain from dpu mdss as its unused.

Remove unnecessary comment for variable which is already
removed.

Signed-off-by: Jayant Shekhar <jshekhar@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 68c54d2..1ab8d4a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -258,12 +258,6 @@ enum dpu_vbif {
 	VBIF_NRT = VBIF_1
 };
 
-enum dpu_iommu_domain {
-	DPU_IOMMU_DOMAIN_UNSECURE,
-	DPU_IOMMU_DOMAIN_SECURE,
-	DPU_IOMMU_DOMAIN_MAX
-};
-
 /**
  * DPU HW,Component order color map
  */
@@ -358,7 +352,6 @@ enum dpu_3d_blend_mode {
  * @alpha_enable: whether the format has an alpha channel
  * @num_planes: number of planes (including meta data planes)
  * @fetch_mode: linear, tiled, or ubwc hw fetch behavior
- * @is_yuv: is format a yuv variant
  * @flag: usage bit flags
  * @tile_width: format tile width
  * @tile_height: format tile height
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
