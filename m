From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH V2 2/3] of/irq: make of_irq_find_parent static
Date: Mon, 12 Oct 2015 14:43:23 +0200
Message-ID: <1444653804-25544-3-git-send-email-jogo@openwrt.org>
References: <1444653804-25544-1-git-send-email-jogo@openwrt.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444653804-25544-1-git-send-email-jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

of_irq_find_parent has no users outside of of_irq.c, so it does not make
sense to expose it in of_irq.h. Therefore remove the prototype and dummy
implmeentation and make the function static instead.

Signed-off-by: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
---
v1 -> v2:
 * just drop the prototype and the dummy and make it static 

 drivers/of/irq.c       | 2 +-
 include/linux/of_irq.h | 6 ------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 55317fa..0c7f4cb 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -53,7 +53,7 @@ EXPORT_SYMBOL_GPL(irq_of_parse_and_map);
  * Returns a pointer to the interrupt parent node, or NULL if the interrupt
  * parent could not be determined.
  */
-struct device_node *of_irq_find_parent(struct device_node *child)
+static struct device_node *of_irq_find_parent(struct device_node *child)
 {
 	struct device_node *p;
 	const __be32 *parp;
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index 0088038..a58e2e5 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -77,7 +77,6 @@ static inline void of_msi_configure(struct device *dev, struct device_node *np)
  * so declare it here regardless of the CONFIG_OF_IRQ setting.
  */
 extern unsigned int irq_of_parse_and_map(struct device_node *node, int index);
-extern struct device_node *of_irq_find_parent(struct device_node *child);
 
 #else /* !CONFIG_OF */
 static inline unsigned int irq_of_parse_and_map(struct device_node *dev,
@@ -85,11 +84,6 @@ static inline unsigned int irq_of_parse_and_map(struct device_node *dev,
 {
 	return 0;
 }
-
-static inline void *of_irq_find_parent(struct device_node *child)
-{
-	return NULL;
-}
 #endif /* !CONFIG_OF */
 
 #endif /* __OF_IRQ_H */
-- 
2.1.4
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
