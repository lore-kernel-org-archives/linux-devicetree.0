From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 14/22] drm/etnaviv: Use of_device_match()
Date: Mon,  6 Jun 2016 10:31:56 +0200
Message-ID: <20160606083204.19760-15-thierry.reding@gmail.com>
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
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 3d4f56df8359..187523110d58 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -15,6 +15,7 @@
  */
 
 #include <linux/component.h>
+#include <linux/of_device.h>
 #include <linux/of_platform.h>
 
 #include "etnaviv_drv.h"
@@ -606,13 +607,6 @@ static const struct component_master_ops etnaviv_master_ops = {
 	.unbind = etnaviv_unbind,
 };
 
-static int compare_of(struct device *dev, void *data)
-{
-	struct device_node *np = data;
-
-	return dev->of_node == np;
-}
-
 static int compare_str(struct device *dev, void *data)
 {
 	return !strcmp(dev_name(dev), data);
@@ -635,8 +629,8 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 			if (!core_node)
 				break;
 
-			component_match_add(&pdev->dev, &match, compare_of,
-					    core_node);
+			component_match_add(&pdev->dev, &match,
+					    of_device_match, core_node);
 			of_node_put(core_node);
 		}
 	} else if (dev->platform_data) {
-- 
2.8.3
