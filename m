From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH] make of_device_make_bus_id() static
Date: Mon, 17 Oct 2016 08:50:26 -0700
Message-ID: <1476719426-12549-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

of_device_make_bus_id() was changed to non-static by commit c66012253800
("of/device: Make of_device_make_bus_id() usable by other code") more than
6 years ago, but there are no users of it outside of platform.c.  Make the
function static again.

Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
