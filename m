From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 2/3] drm/vc4: Don't try to initialize FBDEV if we're only bound to V3D.
Date: Tue, 18 Apr 2017 12:11:56 -0700
Message-ID: <20170418191157.18517-2-eric@anholt.net>
References: <20170418191157.18517-1-eric@anholt.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170418191157.18517-1-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The FBDEV initialization would throw an error in dmesg, when we just
want to silently not initialize fbdev on a V3D-only VC4 instance.

Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index ad7925a9e0ea..237a504f11f0 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -230,10 +230,12 @@ int vc4_kms_load(struct drm_device *dev)
 
 	drm_mode_config_reset(dev);
 
-	vc4->fbdev = drm_fbdev_cma_init(dev, 32,
-					dev->mode_config.num_connector);
-	if (IS_ERR(vc4->fbdev))
-		vc4->fbdev = NULL;
+	if (dev->mode_config.num_connector) {
+		vc4->fbdev = drm_fbdev_cma_init(dev, 32,
+						dev->mode_config.num_connector);
+		if (IS_ERR(vc4->fbdev))
+			vc4->fbdev = NULL;
+	}
 
 	drm_kms_helper_poll_init(dev);
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
