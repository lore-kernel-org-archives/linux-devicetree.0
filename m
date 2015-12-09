From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] of/irq: move of_msi_map_rid declaration to the correct ifdef section
Date: Wed,  9 Dec 2015 09:24:01 -0600
Message-ID: <1449674641-24094-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In checking fixes for of_irq_find_parent declaration location, I found
that of_msi_map_rid is also wrong. of_msi_map_rid is not implemented for
Sparc, so it should not be in the Sparc specific section of the header.
Move it to just depend on OF_IRQ.

Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 include/linux/of_irq.h | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index f648acf..1e0deb8 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -53,6 +53,7 @@ extern struct irq_domain *of_msi_get_domain(struct device *dev,
 extern struct irq_domain *of_msi_map_get_device_domain(struct device *dev,
 						       u32 rid);
 extern void of_msi_configure(struct device *dev, struct device_node *np);
+u32 of_msi_map_rid(struct device *dev, struct device_node *msi_np, u32 rid_in);
 #else
 static inline int of_irq_count(struct device_node *dev)
 {
@@ -90,6 +91,11 @@ static inline struct irq_domain *of_msi_map_get_device_domain(struct device *dev
 static inline void of_msi_configure(struct device *dev, struct device_node *np)
 {
 }
+static inline u32 of_msi_map_rid(struct device *dev,
+				 struct device_node *msi_np, u32 rid_in)
+{
+	return rid_in;
+}
 #endif
 
 #if defined(CONFIG_OF_IRQ) || defined(CONFIG_SPARC)
@@ -99,7 +105,6 @@ static inline void of_msi_configure(struct device *dev, struct device_node *np)
  * so declare it here regardless of the CONFIG_OF_IRQ setting.
  */
 extern unsigned int irq_of_parse_and_map(struct device_node *node, int index);
-u32 of_msi_map_rid(struct device *dev, struct device_node *msi_np, u32 rid_in);
 
 #else /* !CONFIG_OF && !CONFIG_SPARC */
 static inline unsigned int irq_of_parse_and_map(struct device_node *dev,
@@ -107,12 +112,6 @@ static inline unsigned int irq_of_parse_and_map(struct device_node *dev,
 {
 	return 0;
 }
-
-static inline u32 of_msi_map_rid(struct device *dev,
-				 struct device_node *msi_np, u32 rid_in)
-{
-	return rid_in;
-}
 #endif /* !CONFIG_OF */
 
 #endif /* __OF_IRQ_H */
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
