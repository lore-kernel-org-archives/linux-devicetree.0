From: frowand.list@gmail.com
Subject: [PATCH] of: make of_device_make_bus_id() static
Date: Mon, 17 Oct 2016 12:17:43 -0700
Message-ID: <1476731863-13878-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@am.sony.com>

of_device_make_bus_id() was changed to non-static by commit c66012253800
("of/device: Make of_device_make_bus_id() usable by other code") more than
6 years ago, but there are no users of it outside of platform.c.  Make the
function static again.

Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
---
 drivers/of/platform.c     | 2 +-
 include/linux/of_device.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index e4bf07d20f9b..b232063174cc 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -73,7 +73,7 @@ struct platform_device *of_find_device_by_node(struct device_node *np)
  * derive a unique name. If it cannot, then it will prepend names from
  * parent nodes until a unique name can be derived.
  */
-void of_device_make_bus_id(struct device *dev)
+static void of_device_make_bus_id(struct device *dev)
 {
 	struct device_node *node = dev->of_node;
 	const __be32 *reg;
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index cc7dd687a89d..5c2aeed17dd4 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -13,7 +13,6 @@
 #ifdef CONFIG_OF
 extern const struct of_device_id *of_match_device(
 	const struct of_device_id *matches, const struct device *dev);
-extern void of_device_make_bus_id(struct device *dev);
 
 /**
  * of_driver_match_device - Tell if a driver's of_match_table matches a device.
-- 
1.9.1
