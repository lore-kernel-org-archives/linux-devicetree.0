From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 15/22] drm/hisilicon: Use of_device_match()
Date: Mon,  6 Jun 2016 10:31:57 +0200
Message-ID: <20160606083204.19760-16-thierry.reding@gmail.com>
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
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index 193657259ee9..c153b486c89d 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -15,6 +15,7 @@
  *
  */
 
+#include <linux/of_device.h>
 #include <linux/of_platform.h>
 #include <linux/component.h>
 #include <linux/of_graph.h>
@@ -196,11 +197,6 @@ static struct drm_driver kirin_drm_driver = {
 	.minor			= 0,
 };
 
-static int compare_of(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 static int kirin_drm_bind(struct device *dev)
 {
 	struct drm_driver *driver = &kirin_drm_driver;
@@ -303,7 +299,7 @@ static int kirin_drm_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(remote))
 		return PTR_ERR(remote);
 
-	component_match_add(dev, &match, compare_of, remote);
+	component_match_add(dev, &match, of_device_match, remote);
 
 	return component_master_add_with_match(dev, &kirin_drm_ops, match);
 
-- 
2.8.3
