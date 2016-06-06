From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 18/22] drm/rockchip: Use of_device_match()
Date: Mon,  6 Jun 2016 10:32:00 +0200
Message-ID: <20160606083204.19760-19-thierry.reding@gmail.com>
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
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index f5a68fc031ed..afd08288ee86 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -22,6 +22,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/pm_runtime.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/component.h>
 
@@ -414,13 +415,6 @@ static const struct dev_pm_ops rockchip_drm_pm_ops = {
 				rockchip_drm_sys_resume)
 };
 
-static int compare_of(struct device *dev, void *data)
-{
-	struct device_node *np = data;
-
-	return dev->of_node == np;
-}
-
 static void release_of(struct device *dev, void *data)
 {
 	of_node_put(data);
@@ -445,7 +439,7 @@ static void rockchip_add_endpoints(struct device *dev,
 		}
 
 		component_match_add_release(dev, match, release_of,
-					    compare_of, remote);
+					    of_device_match, remote);
 	}
 }
 
@@ -525,7 +519,7 @@ static int rockchip_drm_platform_probe(struct platform_device *pdev)
 
 		of_node_get(port->parent);
 		component_match_add_release(dev, &match, release_of,
-					    compare_of, port->parent);
+					    of_device_match, port->parent);
 		of_node_put(port);
 	}
 
-- 
2.8.3
