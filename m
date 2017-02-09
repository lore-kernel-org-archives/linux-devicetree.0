From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 4/8] drm/sun4i: Grab reserved memory region
Date: Thu,  9 Feb 2017 17:39:18 +0100
Message-ID: <cf185f6de351837a9a29c123ca801682c983b83d.1486655917.git-series.maxime.ripard@free-electrons.com>
References: <cover.7101c7323e6f22e281ad70b93488cf44caca4ca0.1486655917.git-series.maxime.ripard@free-electrons.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <cover.7101c7323e6f22e281ad70b93488cf44caca4ca0.1486655917.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.7101c7323e6f22e281ad70b93488cf44caca4ca0.1486655917.git-series.maxime.ripard@free-electrons.com>
References: <cover.7101c7323e6f22e281ad70b93488cf44caca4ca0.1486655917.git-series.maxime.ripard@free-electrons.com>
Sender: owner-linux-mm@kvack.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Allow to provide an optional memory region to allocate from for our DRM
driver.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 4ce665349f6b..7ed7a159c9c1 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -12,6 +12,7 @@
 
 #include <linux/component.h>
 #include <linux/of_graph.h>
+#include <linux/of_reserved_mem.h>
 
 #include <drm/drmP.h>
 #include <drm/drm_crtc_helper.h>
@@ -133,10 +134,16 @@ static int sun4i_drv_bind(struct device *dev)
 	drm_vblank_init(drm, 1);
 	drm_mode_config_init(drm);
 
+	ret = of_reserved_mem_device_init(dev);
+	if (ret && ret != -ENODEV) {
+		dev_err(drm->dev, "Couldn't claim our memory region\n");
+		goto free_drm;
+	}
+
 	ret = component_bind_all(drm->dev, drm);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't bind all pipelines components\n");
-		goto free_drm;
+		goto free_mem_region;
 	}
 
 	/* Create our layers */
@@ -144,7 +151,7 @@ static int sun4i_drv_bind(struct device *dev)
 	if (IS_ERR(drv->layers)) {
 		dev_err(drm->dev, "Couldn't create the planes\n");
 		ret = PTR_ERR(drv->layers);
-		goto free_drm;
+		goto free_mem_region;
 	}
 
 	/* Create our CRTC */
@@ -152,7 +159,7 @@ static int sun4i_drv_bind(struct device *dev)
 	if (!drv->crtc) {
 		dev_err(drm->dev, "Couldn't create the CRTC\n");
 		ret = -EINVAL;
-		goto free_drm;
+		goto free_mem_region;
 	}
 	drm->irq_enabled = true;
 
@@ -164,7 +171,7 @@ static int sun4i_drv_bind(struct device *dev)
 	if (IS_ERR(drv->fbdev)) {
 		dev_err(drm->dev, "Couldn't create our framebuffer\n");
 		ret = PTR_ERR(drv->fbdev);
-		goto free_drm;
+		goto free_mem_region;
 	}
 
 	/* Enable connectors polling */
@@ -172,10 +179,12 @@ static int sun4i_drv_bind(struct device *dev)
 
 	ret = drm_dev_register(drm, 0);
 	if (ret)
-		goto free_drm;
+		goto free_mem_region;
 
 	return 0;
 
+free_mem_region:
+	of_reserved_mem_device_release(dev);
 free_drm:
 	drm_dev_unref(drm);
 	return ret;
-- 
git-series 0.8.11

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
