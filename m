From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] of/irq: introduce of_has_named_irqs helper
Date: Fri, 24 Jul 2015 11:26:55 -0700
Message-ID: <20150724182655.GA22007@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Sometimes drivers might wish to transition from index-based to named
interrupt descriptions. To aid in decision-making when parsing device
tree data let's provide a helper that will indicate the scheme that is
being used.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

The intent is to it like this:

	if (of_has_named_irqs(np) {
		/* Wake IRQ is optional */
		dev->wakeirq = of_irq_get_byname(np, "wakeup");
		if (dev->wakeirq < 0 && dev->wakeirq != -ENODATA)
			return dev->wakeirq;
	}

 drivers/of/irq.c       | 14 ++++++++++++++
 include/linux/of_irq.h |  5 +++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 3cf7a01..e02c43e 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -384,6 +384,19 @@ int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
 EXPORT_SYMBOL_GPL(of_irq_to_resource);
 
 /**
+ * of_has_named_irq - Check if given node contains named interrupts
+ * @dev: pointer to device tree node
+ *
+ * Returns %true if node contains non-empty "interrupt-names" property.
+ */
+bool of_has_named_irqs(struct device_node *dev)
+{
+	struct property *prop = of_find_property(dev, "interrupt-names", NULL);
+
+	return prop && prop->value;
+}
+
+/**
  * of_irq_get - Decode a node's IRQ and return it as a Linux irq number
  * @dev: pointer to device tree node
  * @index: zero-based index of the irq
@@ -410,6 +423,7 @@ int of_irq_get(struct device_node *dev, int index)
 }
 EXPORT_SYMBOL_GPL(of_irq_get);
 
+
 /**
  * of_irq_get_byname - Decode a node's IRQ and return it as a Linux irq number
  * @dev: pointer to device tree node
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index d884929..fed6ccc 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -46,6 +46,7 @@ extern int of_irq_get(struct device_node *dev, int index);
 extern int of_irq_get_byname(struct device_node *dev, const char *name);
 extern int of_irq_to_resource_table(struct device_node *dev,
 		struct resource *res, int nr_irqs);
+extern bool of_has_named_irqs(struct device_node *dev);
 #else
 static inline int of_irq_count(struct device_node *dev)
 {
@@ -64,6 +65,10 @@ static inline int of_irq_to_resource_table(struct device_node *dev,
 {
 	return 0;
 }
+static inline bool of_has_named_irqs(struct device_node *dev)
+{
+	return false;
+}
 #endif
 
 #if defined(CONFIG_OF)
-- 
2.5.0.rc2.392.g76e840b


-- 
Dmitry
