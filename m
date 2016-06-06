From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 07/22] of/platform: Use of_device_match()
Date: Mon,  6 Jun 2016 10:31:49 +0200
Message-ID: <20160606083204.19760-8-thierry.reding@gmail.com>
References: <20160606083204.19760-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160606083204.19760-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Use the common implementation rather than the OF-private variant.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/of/platform.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 16e8daffac06..61d00cce9291 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -33,11 +33,6 @@ const struct of_device_id of_default_bus_match_table[] = {
 };
 EXPORT_SYMBOL(of_default_bus_match_table);
 
-static int of_dev_node_match(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 /**
  * of_find_device_by_node - Find the platform_device associated with a node
  * @np: Pointer to device tree node
@@ -48,7 +43,7 @@ struct platform_device *of_find_device_by_node(struct device_node *np)
 {
 	struct device *dev;
 
-	dev = bus_find_device(&platform_bus_type, NULL, np, of_dev_node_match);
+	dev = bus_find_device(&platform_bus_type, NULL, np, of_device_match);
 	return dev ? to_platform_device(dev) : NULL;
 }
 EXPORT_SYMBOL(of_find_device_by_node);
-- 
2.8.3
