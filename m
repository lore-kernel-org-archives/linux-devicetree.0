From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH V2 1/3] of/irq: move of_msi_configure to the right guard and add a dummy
Date: Mon, 12 Oct 2015 14:43:22 +0200
Message-ID: <1444653804-25544-2-git-send-email-jogo@openwrt.org>
References: <1444653804-25544-1-git-send-email-jogo@openwrt.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444653804-25544-1-git-send-email-jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

of_msi_configure is part of of_irq.c, which is compiled in when OF_IRQ
is enabled, not just OF.
Also It is unconditionally called from of_platform_device_create_pdata,
which does not depend on OF_IRQ, just OF_ADDRESS, so we need a dummy
implementation in case of OF_ADDRESS=y but OF_IRQ=n.

Fixes: c706c239 ("of/platform: Assign MSI domain to platform device")
Signed-off-by: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
---
v1 -> v2:
 * fix both issues (guard and missing dummy) at once.

 include/linux/of_irq.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index 4bcbd58..0088038 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -46,6 +46,7 @@ extern int of_irq_get(struct device_node *dev, int index);
 extern int of_irq_get_byname(struct device_node *dev, const char *name);
 extern int of_irq_to_resource_table(struct device_node *dev,
 		struct resource *res, int nr_irqs);
+extern void of_msi_configure(struct device *dev, struct device_node *np);
 #else
 static inline int of_irq_count(struct device_node *dev)
 {
@@ -64,6 +65,9 @@ static inline int of_irq_to_resource_table(struct device_node *dev,
 {
 	return 0;
 }
+static inline void of_msi_configure(struct device *dev, struct device_node *np)
+{
+}
 #endif
 
 #if defined(CONFIG_OF)
@@ -74,7 +78,6 @@ static inline int of_irq_to_resource_table(struct device_node *dev,
  */
 extern unsigned int irq_of_parse_and_map(struct device_node *node, int index);
 extern struct device_node *of_irq_find_parent(struct device_node *child);
-extern void of_msi_configure(struct device *dev, struct device_node *np);
 
 #else /* !CONFIG_OF */
 static inline unsigned int irq_of_parse_and_map(struct device_node *dev,
-- 
2.1.4
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
