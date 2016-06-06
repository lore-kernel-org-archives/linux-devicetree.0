From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 12/22] drm/hdlcd: Use of_device_match()
Date: Mon,  6 Jun 2016 10:31:54 +0200
Message-ID: <20160606083204.19760-13-thierry.reding@gmail.com>
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
 drivers/gpu/drm/arm/hdlcd_drv.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 3422ca23cfaf..4fa93123802b 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -14,6 +14,7 @@
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/list.h>
+#include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/pm_runtime.h>
@@ -429,11 +430,6 @@ static const struct component_master_ops hdlcd_master_ops = {
 	.unbind		= hdlcd_drm_unbind,
 };
 
-static int compare_of(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 static void release_of(struct device *dev, void *data)
 {
 	of_node_put(data);
@@ -466,7 +462,7 @@ static int hdlcd_probe(struct platform_device *pdev)
 	}
 
 	component_match_add_release(&pdev->dev, &match, release_of,
-				    compare_of, port);
+				    of_device_match, port);
 
 	return component_master_add_with_match(&pdev->dev, &hdlcd_master_ops,
 					       match);
-- 
2.8.3
