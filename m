From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: [RFC 5/7] bcma: get IRQ numbers from dt
Date: Sun, 24 Aug 2014 23:24:43 +0200
Message-ID: <1408915485-8078-7-git-send-email-hauke@hauke-m.de>
References: <1408915485-8078-1-git-send-email-hauke@hauke-m.de>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408915485-8078-1-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It is not possible to auto detect the irq numbers used by the cores on
an arm SoC. If bcma was registered with device tree it will search for
some device tree nodes with the irq number and add it to the core
configuration.

Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
---
 drivers/bcma/main.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/bcma/main.c b/drivers/bcma/main.c
index 0ff8d58..3f75776 100644
--- a/drivers/bcma/main.c
+++ b/drivers/bcma/main.c
@@ -10,6 +10,8 @@
 #include <linux/platform_device.h>
 #include <linux/bcma/bcma.h>
 #include <linux/slab.h>
+#include <linux/of_irq.h>
+#include <linux/of_address.h>
 
 MODULE_DESCRIPTION("Broadcom's specific AMBA driver");
 MODULE_LICENSE("GPL");
@@ -120,6 +122,38 @@ static void bcma_release_core_dev(struct device *dev)
 	kfree(core);
 }
 
+static struct device_node *bcma_of_find_child_device(struct platform_device *parent,
+						     struct bcma_device *core)
+{
+	struct device_node *node;
+	u64 size;
+	const __be32 *reg;
+
+	if (!parent || !parent->dev.of_node)
+		return NULL;
+
+	for_each_child_of_node(parent->dev.of_node, node) {
+		reg = of_get_address(node, 0, &size, NULL);
+		if (!reg)
+			continue;
+		if (be32_to_cpup(reg) == core->addr)
+			return node;
+	}
+	return NULL;
+}
+
+static void bcma_of_fill_device(struct platform_device *parent,
+				struct bcma_device *core)
+{
+	struct device_node *node;
+
+	node = bcma_of_find_child_device(parent, core);
+	if (!node)
+		return;
+	core->dev.of_node = node;
+	core->irq = irq_of_parse_and_map(node, 0);
+}
+
 static int bcma_register_cores(struct bcma_bus *bus)
 {
 	struct bcma_device *core;
@@ -155,7 +189,13 @@ static int bcma_register_cores(struct bcma_bus *bus)
 			break;
 		case BCMA_HOSTTYPE_SOC:
 			core->dev.dma_mask = &core->dev.coherent_dma_mask;
-			core->dma_dev = &core->dev;
+			if (bus->host_pdev) {
+				core->dma_dev = &bus->host_pdev->dev;
+				core->dev.parent = &bus->host_pdev->dev;
+				bcma_of_fill_device(bus->host_pdev, core);
+			} else {
+				core->dma_dev = &core->dev;
+			}
 			break;
 		case BCMA_HOSTTYPE_SDIO:
 			break;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
