From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/5] of/irq: export of_irq_find_parent again
Date: Mon, 23 Nov 2015 11:16:52 +0100
Message-ID: <1448273816-11290-2-git-send-email-carlo@caione.org>
References: <1448273816-11290-1-git-send-email-carlo@caione.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448273816-11290-1-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, drake-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org
Cc: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

of_irq_find_parent was made static since it had no users outside of
of_irq.c. Export it again since we are going to use it again.

Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
---
 drivers/of/irq.c       | 2 +-
 include/linux/of_irq.h | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 902b89b..45735d5 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -53,7 +53,7 @@ EXPORT_SYMBOL_GPL(irq_of_parse_and_map);
  * Returns a pointer to the interrupt parent node, or NULL if the interrupt
  * parent could not be determined.
  */
-static struct device_node *of_irq_find_parent(struct device_node *child)
+struct device_node *of_irq_find_parent(struct device_node *child)
 {
 	struct device_node *p;
 	const __be32 *parp;
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index 039f2ee..6f879c6 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -94,6 +94,7 @@ static inline void of_msi_configure(struct device *dev, struct device_node *np)
  */
 extern unsigned int irq_of_parse_and_map(struct device_node *node, int index);
 u32 of_msi_map_rid(struct device *dev, struct device_node *msi_np, u32 rid_in);
+extern struct device_node *of_irq_find_parent(struct device_node *child);
 
 #else /* !CONFIG_OF && !CONFIG_SPARC */
 static inline unsigned int irq_of_parse_and_map(struct device_node *dev,
@@ -107,6 +108,11 @@ static inline u32 of_msi_map_rid(struct device *dev,
 {
 	return rid_in;
 }
+
+static inline void *of_irq_find_parent(struct device_node *child)
+{
+	return NULL;
+}
 #endif /* !CONFIG_OF */
 
 #endif /* __OF_IRQ_H */
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
