From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/2] of: Ensure unique names without sacrificing determinism
Date: Fri, 23 May 2014 08:36:08 +0900
Message-ID: <1400801769-4506-2-git-send-email-grant.likely@linaro.org>
References: <1400801769-4506-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400801769-4506-1-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The way the driver core is implemented, every device using the same bus
type is required to have a unique name because a symlink to each device
is created in the appropriate /sys/bus/*/devices directory, and two
identical names causes a collision.

The current code handles the requirement by using an globally
incremented counter that is appended to the device name. It works, but
it means any change to device registration will change the assigned
numbers. Instead, if we build up the name by using information from the
parent nodes, then it can be guaranteed to be unique without adding a
random number to the end of it.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/of/platform.c | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index d0009b3614af..95c133a0554b 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -68,17 +68,15 @@ EXPORT_SYMBOL(of_find_device_by_node);
  * of_device_make_bus_id - Use the device node data to assign a unique name
  * @dev: pointer to device structure that is linked to a device tree node
  *
- * This routine will first try using either the dcr-reg or the reg property
- * value to derive a unique name.  As a last resort it will use the node
- * name followed by a unique number.
+ * This routine will first try using the translated bus address to
+ * derive a unique name. If it cannot, then it will prepend names from
+ * parent nodes until a unique name can be derived.
  */
 void of_device_make_bus_id(struct device *dev)
 {
-	static atomic_t bus_no_reg_magic;
 	struct device_node *node = dev->of_node;
 	const __be32 *reg;
 	u64 addr;
-	int magic;
 
 #ifdef CONFIG_PPC_DCR
 	/*
@@ -100,25 +98,25 @@ void of_device_make_bus_id(struct device *dev)
 	}
 #endif /* CONFIG_PPC_DCR */
 
-	/*
-	 * For MMIO, get the physical address
-	 */
-	reg = of_get_property(node, "reg", NULL);
-	if (reg) {
-		addr = of_translate_address(node, reg);
-		if (addr != OF_BAD_ADDR) {
-			dev_set_name(dev, "%llx.%s",
-				     (unsigned long long)addr, node->name);
+	/* Construct the name, using parent nodes if necessary to ensure uniqueness */
+	while (node->parent) {
+		/*
+		 * If the address can be translated, then that is as much
+		 * uniqueness as we need. Make it the first component and return
+		 */
+		reg = of_get_property(node, "reg", NULL);
+		if (reg && (addr = of_translate_address(node, reg)) != OF_BAD_ADDR) {
+			dev_set_name(dev, dev_name(dev) ? "%llx.%s:%s" : "%llx.%s",
+				     (unsigned long long)addr, node->name,
+				     dev_name(dev));
 			return;
 		}
-	}
 
-	/*
-	 * No BusID, use the node name and add a globally incremented
-	 * counter (and pray...)
-	 */
-	magic = atomic_add_return(1, &bus_no_reg_magic);
-	dev_set_name(dev, "%s.%d", node->name, magic - 1);
+		/* format arguments only used if dev_name() resolves to NULL */
+		dev_set_name(dev, dev_name(dev) ? "%s:%s" : "%s",
+			     strrchr(node->full_name, '/') + 1, dev_name(dev));
+		node = node->parent;
+	}
 }
 
 /**
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
