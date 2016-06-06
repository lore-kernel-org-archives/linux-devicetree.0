From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 19/22] drm/sti: Use of_device_match()
Date: Mon,  6 Jun 2016 10:32:01 +0200
Message-ID: <20160606083204.19760-20-thierry.reding@gmail.com>
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
 drivers/gpu/drm/sti/sti_drv.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index 4ee6fa4f1beb..d0ea8c3b8e3c 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -10,6 +10,7 @@
 #include <linux/debugfs.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/of_platform.h>
 
 #include <drm/drm_atomic.h>
@@ -341,11 +342,6 @@ static struct drm_driver sti_driver = {
 	.minor = DRIVER_MINOR,
 };
 
-static int compare_of(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 static void release_of(struct device *dev, void *data)
 {
 	of_node_put(data);
@@ -381,7 +377,7 @@ static int sti_platform_probe(struct platform_device *pdev)
 
 	while (child_np) {
 		component_match_add_release(dev, &match, release_of,
-					    compare_of, child_np);
+					    of_device_match, child_np);
 		child_np = of_get_next_available_child(node, child_np);
 	}
 
-- 
2.8.3
