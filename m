From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 7/8] drm/sun4i: call drm_vblank_init with correct number of crtcs
Date: Fri,  8 Sep 2017 15:50:15 +0800
Message-ID: <20170908075016.18657-8-wens@csie.org>
References: <20170908075016.18657-1-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170908075016.18657-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

If we want to have vblank on both pipelines at the same time, we need
to call drm_vblank_init with num_crtcs = 2.

Instead, since the crtc init calls correctly set mode_config.num_crtc,
we can move the drm_vblank_init call to after the crtc init code is
called, which is the component bind part. Then we can just pass
mode_config.num_crtc in.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 2ff4233fe2da..a2012638d5f7 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -106,11 +106,6 @@ static int sun4i_drv_bind(struct device *dev)
 		goto free_drm;
 	}
 
-	/* drm_vblank_init calls kcalloc, which can fail */
-	ret = drm_vblank_init(drm, 1);
-	if (ret)
-		goto free_mem_region;
-
 	drm_mode_config_init(drm);
 
 	ret = component_bind_all(drm->dev, drm);
@@ -119,6 +114,11 @@ static int sun4i_drv_bind(struct device *dev)
 		goto cleanup_mode_config;
 	}
 
+	/* drm_vblank_init calls kcalloc, which can fail */
+	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
+	if (ret)
+		goto free_mem_region;
+
 	drm->irq_enabled = true;
 
 	/* Remove early framebuffers (ie. simplefb) */
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
