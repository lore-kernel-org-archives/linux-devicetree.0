From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 20/22] drm/sun4i: Use of_device_match()
Date: Mon,  6 Jun 2016 10:32:02 +0200
Message-ID: <20160606083204.19760-21-thierry.reding@gmail.com>
References: <20160606083204.19760-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160606083204.19760-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Use the common implementation instead of the driver-private variant.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 257d2b4f3645..6a61d9c8afa1 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/component.h>
+#include <linux/of_device.h>
 #include <linux/of_graph.h>
 
 #include <drm/drmP.h>
@@ -219,15 +220,6 @@ static bool sun4i_drv_node_is_tcon(struct device_node *node)
 	return of_device_is_compatible(node, "allwinner,sun5i-a13-tcon");
 }
 
-static int compare_of(struct device *dev, void *data)
-{
-	DRM_DEBUG_DRIVER("Comparing of node %s with %s\n",
-			 of_node_full_name(dev->of_node),
-			 of_node_full_name(data));
-
-	return dev->of_node == data;
-}
-
 static int sun4i_drv_add_endpoints(struct device *dev,
 				   struct component_match **match,
 				   struct device_node *node)
@@ -248,7 +240,7 @@ static int sun4i_drv_add_endpoints(struct device *dev,
 		/* Add current component */
 		DRM_DEBUG_DRIVER("Adding component %s\n",
 				 of_node_full_name(node));
-		component_match_add(dev, match, compare_of, node);
+		component_match_add(dev, match, of_device_match, node);
 		count++;
 	}
 
-- 
2.8.3
