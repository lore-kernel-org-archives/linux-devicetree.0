From: Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] Revert "of/irq: make of_irq_find_parent static"
Date: Wed, 2 Dec 2015 16:14:47 +0000
Message-ID: <1449072887-2734-1-git-send-email-qais.yousef@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This reverts commit 52493d446141b07c8ba28dd6a529513f8b2342bd.

Signed-off-by: Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

Conflicts:
	include/linux/of_irq.h
---
I have a patch series that is under review that makes use of of_irq_find_parent()

The affected patch is this:

	https://lkml.org/lkml/2015/11/25/291

Is it wrong to use this function? If yes, what's the alternative?
If no, OK to revert?

Thanks,
Qais


 drivers/of/irq.c       | 2 +-
 include/linux/of_irq.h | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 902b89be7217..45735d56e435 100644
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
index 039f2eec49ce..0c9ea9fb5b63 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -93,6 +93,7 @@ static inline void of_msi_configure(struct device *dev, struct device_node *np)
  * so declare it here regardless of the CONFIG_OF_IRQ setting.
  */
 extern unsigned int irq_of_parse_and_map(struct device_node *node, int index);
+extern struct device_node *of_irq_find_parent(struct device_node *child);
 u32 of_msi_map_rid(struct device *dev, struct device_node *msi_np, u32 rid_in);
 
 #else /* !CONFIG_OF && !CONFIG_SPARC */
@@ -102,6 +103,11 @@ static inline unsigned int irq_of_parse_and_map(struct device_node *dev,
 	return 0;
 }
 
+static inline void *of_irq_find_parent(struct device_node *child)
+{
+	return NULL;
+}
+
 static inline u32 of_msi_map_rid(struct device *dev,
 				 struct device_node *msi_np, u32 rid_in)
 {
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
