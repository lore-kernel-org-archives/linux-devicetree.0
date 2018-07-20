From: Liu Xiang <liu.xiang6@zte.com.cn>
Subject: [PATCH] of: irq: Add a helper function for irq_of_parse_and_map
Date: Fri, 20 Jul 2018 23:52:21 +0800
Message-ID: <1532101941-13130-1-git-send-email-liu.xiang6@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org
Cc: frowand.list@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Liu Xiang <liu.xiang6@zte.com.cn>
List-Id: devicetree@vger.kernel.org

Implement a resource managed irq_of_parse_and_map function.

Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>
---
 drivers/of/irq.c       | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/of_irq.h |  7 +++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 02ad93a..947fe41 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -45,6 +45,44 @@ unsigned int irq_of_parse_and_map(struct device_node *dev, int index)
 }
 EXPORT_SYMBOL_GPL(irq_of_parse_and_map);
 
+static void devm_irq_dispose_mapping(struct device *dev, void *res)
+{
+	irq_dispose_mapping(*(unsigned int *)res);
+}
+
+/**
+ * devm_irq_of_parse_and_map - Resource-managed irq_of_parse_and_map
+ * @dev: Device whose interrupt is to be mapped
+ * @index: Index of the interrupt to map
+ *
+ * Managed irq_of_parse_and_map. Irq mapping created by this function is
+ * automatically disposed on driver detach.
+ *
+ * RETURNS:
+ * Returns a linux irq number on success, 0 on failure.
+ */
+unsigned int devm_irq_of_parse_and_map(struct device *dev, int index)
+{
+	struct device_node *np = dev->of_node;
+	unsigned int *dr = NULL;
+	unsigned int rc = 0;
+
+	dr = devres_alloc(devm_irq_dispose_mapping, sizeof(unsigned int),
+			  GFP_KERNEL);
+	if (!dr)
+		return 0;
+
+	rc = irq_of_parse_and_map(np, index);
+	if (rc > 0) {
+		*dr = rc;
+		devres_add(dev, dr);
+	} else
+		devres_free(dr);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(devm_irq_of_parse_and_map);
+
 /**
  * of_irq_find_parent - Given a device node, find its interrupt parent node
  * @child: pointer to device node
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index 1214cab..1ac26ff 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -55,6 +55,7 @@ extern struct irq_domain *of_msi_map_get_device_domain(struct device *dev,
 						       u32 rid);
 extern void of_msi_configure(struct device *dev, struct device_node *np);
 u32 of_msi_map_rid(struct device *dev, struct device_node *msi_np, u32 rid_in);
+extern unsigned int devm_irq_of_parse_and_map(struct device *dev, int index);
 #else
 static inline int of_irq_count(struct device_node *dev)
 {
@@ -97,6 +98,12 @@ static inline u32 of_msi_map_rid(struct device *dev,
 {
 	return rid_in;
 }
+
+static inline unsigned int devm_irq_of_parse_and_map(struct device *dev,
+						     int index)
+{
+	return 0;
+}
 #endif
 
 #if defined(CONFIG_OF_IRQ) || defined(CONFIG_SPARC)
-- 
1.9.1
