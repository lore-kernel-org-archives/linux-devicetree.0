From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 21/22] drm/tilcdc: Use of_device_match()
Date: Mon,  6 Jun 2016 10:32:03 +0200
Message-ID: <20160606083204.19760-22-thierry.reding@gmail.com>
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
 drivers/gpu/drm/tilcdc/tilcdc_external.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index 7e11b5ecdd4a..78196a90d7ba 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/component.h>
+#include <linux/of_device.h>
 #include <linux/of_graph.h>
 
 #include "tilcdc_drv.h"
@@ -130,11 +131,6 @@ void tilcdc_remove_external_encoders(struct drm_device *dev)
 						 priv->connector_funcs[i]);
 }
 
-static int dev_match_of(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 static void dev_release_of(struct device *dev, void *data)
 {
 	of_node_put(data);
@@ -158,7 +154,7 @@ int tilcdc_get_external_components(struct device *dev,
 		dev_dbg(dev, "Subdevice node '%s' found\n", node->name);
 		if (match)
 			component_match_add_release(dev, match, dev_release_of,
-						    dev_match_of, node);
+						    of_device_match, node);
 		count++;
 	}
 
-- 
2.8.3
