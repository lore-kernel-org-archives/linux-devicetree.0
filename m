From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] of: irq: don't return 0 from of_irq_get()
Date: Sun, 29 May 2016 00:53:08 +0300
Message-ID: <20938812.efaALfQEUn@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, frowand.list@gmail.com
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

of_irq_get() returns 0 iff irq_create_of_mapping() call fails. Returning
both error code  and 0 on failure is a sign of a misdesigned API. Return
-ENXIO instead like one of the callers, platform_get_irq(), does; fix up
the kernel-doc as well...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against Linus' 'linux.git' repo (Grant Likely's repo is outdated)
plus the patch just posted, however it's intended to be merged in the next
kernel release (v4.8-rc1)...

 drivers/of/irq.c       |   13 ++++++-------
 include/linux/of_irq.h |    4 ++--
 2 files changed, 8 insertions(+), 9 deletions(-)

Index: linux/drivers/of/irq.c
===================================================================
--- linux.orig/drivers/of/irq.c
+++ linux/drivers/of/irq.c
@@ -390,9 +390,8 @@ EXPORT_SYMBOL_GPL(of_irq_to_resource);
  * @dev: pointer to device tree node
  * @index: zero-based index of the IRQ
  *
- * Returns Linux IRQ number on success, or 0 on the IRQ mapping failure, or
- * -EPROBE_DEFER if the IRQ domain is not yet created, or error code in case
- * of any other failure.
+ * Returns Linux IRQ number on success, or -EPROBE_DEFER if the IRQ domain
+ * is not yet created, or error code in case of any other failure.
  */
 int of_irq_get(struct device_node *dev, int index)
 {
@@ -408,7 +407,8 @@ int of_irq_get(struct device_node *dev,
 	if (!domain)
 		return -EPROBE_DEFER;
 
-	return irq_create_of_mapping(&oirq);
+	rc = irq_create_of_mapping(&oirq);
+	return rc > 0 ? rc : -ENXIO;
 }
 EXPORT_SYMBOL_GPL(of_irq_get);
 
@@ -417,9 +417,8 @@ EXPORT_SYMBOL_GPL(of_irq_get);
  * @dev: pointer to device tree node
  * @name: IRQ name
  *
- * Returns Linux IRQ number on success, or 0 on the IRQ mapping failure, or
- * -EPROBE_DEFER if the IRQ domain is not yet created, or error code in case
- * of any other failure.
+ * Returns Linux IRQ number on success, or -EPROBE_DEFER if the IRQ domain
+ * is not yet created, or error code in case of any other failure.
  */
 int of_irq_get_byname(struct device_node *dev, const char *name)
 {
Index: linux/include/linux/of_irq.h
===================================================================
--- linux.orig/include/linux/of_irq.h
+++ linux/include/linux/of_irq.h
@@ -61,11 +61,11 @@ static inline int of_irq_count(struct de
 }
 static inline int of_irq_get(struct device_node *dev, int index)
 {
-	return 0;
+	return -ENXIO;
 }
 static inline int of_irq_get_byname(struct device_node *dev, const char *name)
 {
-	return 0;
+	return -ENXIO;
 }
 static inline int of_irq_to_resource_table(struct device_node *dev,
 					   struct resource *res, int nr_irqs)
