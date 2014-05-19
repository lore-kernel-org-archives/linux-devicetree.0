From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: [RFC PATCH] of/irq: do irq resolution in platform_get_irq_byname()
Date: Mon, 19 May 2014 16:30:59 +0300
Message-ID: <1400506259-18397-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: santosh.shilimkar-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The commit 9ec36cafe43bf835f8f29273597a5b0cbc8267ef
"of/irq: do irq resolution in platform_get_irq" from Rob Herring -
moves resolving of the interrupt resources in platform_get_irq().
But this solution isn't complete because platform_get_irq_byname()
need to be modified the same way.

Hence, fix it by adding interrupt resolution code at the
platform_get_irq_byname() function too.

Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
---
 drivers/base/platform.c |    7 +++++--
 drivers/of/irq.c        |   25 +++++++++++++++++++++++++
 include/linux/of_irq.h  |    5 +++++
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 5b47210..9e9227e 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -131,9 +131,12 @@ EXPORT_SYMBOL_GPL(platform_get_resource_byname);
  */
 int platform_get_irq_byname(struct platform_device *dev, const char *name)
 {
-	struct resource *r = platform_get_resource_byname(dev, IORESOURCE_IRQ,
-							  name);
+	struct resource *r;
+
+	if (IS_ENABLED(CONFIG_OF_IRQ) && dev->dev.of_node)
+		return of_irq_get_byname(dev->dev.of_node, name);
 
+	r = platform_get_resource_byname(dev, IORESOURCE_IRQ, name);
 	return r ? r->start : -ENXIO;
 }
 EXPORT_SYMBOL_GPL(platform_get_irq_byname);
diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 5aeb894..6419de9 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -406,6 +406,31 @@ int of_irq_get(struct device_node *dev, int index)
 }
 
 /**
+ * of_irq_get_byname - Decode a node's IRQ and return it as a Linux irq number
+ * @dev: pointer to device tree node
+ * @name: zero-based index of the irq
+ *
+ * Returns Linux irq number on success, or -EPROBE_DEFER if the irq domain
+ * is not yet created, or errorno in case of failure.
+ *
+ */
+int of_irq_get_byname(struct device_node *dev, const char *name)
+{
+	const char *name_irq = NULL;
+	int index = 0;
+
+	if (unlikely(!name))
+		return -EINVAL;
+
+	while (!of_property_read_string_index(dev, "interrupt-names",
+					      index, &name_irq))
+		if (!strcmp(name, name_irq))
+			return of_irq_get(dev, index);
+
+	return -ENXIO;
+}
+
+/**
  * of_irq_count - Count the number of IRQs a node uses
  * @dev: pointer to device tree node
  */
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index 6404253..bfec136 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -45,6 +45,7 @@ extern void of_irq_init(const struct of_device_id *matches);
 #ifdef CONFIG_OF_IRQ
 extern int of_irq_count(struct device_node *dev);
 extern int of_irq_get(struct device_node *dev, int index);
+extern int of_irq_get_byname(struct device_node *dev, const char *name);
 #else
 static inline int of_irq_count(struct device_node *dev)
 {
@@ -54,6 +55,10 @@ static inline int of_irq_get(struct device_node *dev, int index)
 {
 	return 0;
 }
+static inline int of_irq_get_byname(struct device_node *dev, const char *name)
+{
+	return 0;
+}
 #endif
 
 #if defined(CONFIG_OF)
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
