From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: [PATCH v5 2/2] bcma: get IRQ numbers from dt
Date: Thu, 25 Sep 2014 00:17:28 +0200
Message-ID: <1411597048-25470-2-git-send-email-hauke@hauke-m.de>
References: <1411597048-25470-1-git-send-email-hauke@hauke-m.de>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411597048-25470-1-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It is not possible to auto detect the irq numbers used by the cores on
an arm SoC. If bcma was registered with device tree it will search for
some device tree nodes with the irq number and add it to the core
configuration.

Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
---
 Documentation/devicetree/bindings/bus/bcma.txt | 24 +++++++++++++++
 drivers/bcma/main.c                            | 42 ++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

This is based on wireless-testing and should go into that tree.

changes since:
v4:
 - make use of interrupt-map
 - only do the irq stuff here

v2:
 - use of_translate_address() to support ranges

RFC:
 - add #ifdef CONFIG_OF

diff --git a/Documentation/devicetree/bindings/bus/bcma.txt b/Documentation/devicetree/bindings/bus/bcma.txt
index e9070c1..1dc75d3 100644
--- a/Documentation/devicetree/bindings/bus/bcma.txt
+++ b/Documentation/devicetree/bindings/bus/bcma.txt
@@ -8,6 +8,10 @@ Required properties:
 
 The cores on the AXI bus are automatically detected by bcma with the
 memory ranges they are using and they get registered afterwards.
+Automatic detection of the IRQ number is not reliable on
+BCM47xx/BCM53xx ARM SoCs. To assign IRQ numbers to the cores, provide
+them manually through device tree. The IRQ number and the device tree
+child entry will get assigned to the core with the matching reg address.
 
 Example:
 
@@ -17,4 +21,24 @@ Example:
 		ranges = <0x00000000 0x18000000 0x00100000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
+
+		#interrupt-cells = <0>;
+		interrupt-map-mask = <0x000fffff>;
+		interrupt-map =
+			/* Ethernet Controller 0 */
+			<0x00024000 &gic GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+
+			/* Ethernet Controller 1 */
+			<0x00025000 &gic GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+
+		pcie@12000 {
+			interrupt-parent = <&gic>;
+			reg = <0x00012000 0x1000>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
diff --git a/drivers/bcma/main.c b/drivers/bcma/main.c
index d1656c2..870f01d 100644
--- a/drivers/bcma/main.c
+++ b/drivers/bcma/main.c
@@ -11,6 +11,7 @@
 #include <linux/bcma/bcma.h>
 #include <linux/slab.h>
 #include <linux/of_address.h>
+#include <linux/of_irq.h>
 
 MODULE_DESCRIPTION("Broadcom's specific AMBA driver");
 MODULE_LICENSE("GPL");
@@ -153,6 +154,45 @@ static struct device_node *bcma_of_find_child_device(struct platform_device *par
 	return NULL;
 }
 
+static int bcma_of_irq_parse(struct platform_device *parent,
+			     struct bcma_device *core,
+			     struct of_phandle_args *out_irq)
+{
+	__be32 laddr[1];
+	int rc;
+
+	if (core->dev.of_node) {
+		rc = of_irq_parse_one(core->dev.of_node, 0, out_irq);
+		if (!rc)
+			return rc;
+	}
+
+	out_irq->np = parent->dev.of_node;
+	out_irq->args_count = 0;
+
+	laddr[0] = cpu_to_be32(core->addr);
+	return of_irq_parse_raw(laddr, out_irq);
+}
+
+static int bcma_of_get_irq(struct platform_device *parent,
+			   struct bcma_device *core)
+{
+	struct of_phandle_args out_irq;
+	int ret;
+
+	if (!parent || !parent->dev.of_node)
+		return 0;
+
+	ret = bcma_of_irq_parse(parent, core, &out_irq);
+	if (ret) {
+		bcma_debug(core->bus, "bcma_of_get_irq() failed with rc=%d\n",
+			   ret);
+		return 0;
+	}
+
+	return irq_create_of_mapping(&out_irq);
+}
+
 static void bcma_of_fill_device(struct platform_device *parent,
 				struct bcma_device *core)
 {
@@ -161,6 +201,8 @@ static void bcma_of_fill_device(struct platform_device *parent,
 	node = bcma_of_find_child_device(parent, core);
 	if (node)
 		core->dev.of_node = node;
+
+	core->irq = bcma_of_get_irq(parent, core);
 }
 #else
 static void bcma_of_fill_device(struct platform_device *parent,
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
