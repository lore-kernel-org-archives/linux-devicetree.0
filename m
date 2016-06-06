From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 16/22] drm/mediatek: Use of_device_match()
Date: Mon,  6 Jun 2016 10:31:58 +0200
Message-ID: <20160606083204.19760-17-thierry.reding@gmail.com>
References: <20160606083204.19760-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160606083204.19760-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Use the common implementation rather than the driver-private variant.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 06a417b2f91e..9ab44224dcc0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -21,6 +21,7 @@
 #include <linux/component.h>
 #include <linux/iommu.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 
@@ -265,11 +266,6 @@ static struct drm_driver mtk_drm_driver = {
 	.minor = DRIVER_MINOR,
 };
 
-static int compare_of(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 static int mtk_drm_bind(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
@@ -406,7 +402,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		    comp_type == MTK_DPI) {
 			dev_info(dev, "Adding component match for %s\n",
 				 node->full_name);
-			component_match_add(dev, &match, compare_of, node);
+			component_match_add(dev, &match, of_device_match, node);
 		} else {
 			struct mtk_ddp_comp *comp;
 
-- 
2.8.3
