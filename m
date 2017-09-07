From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH v4 4/6] irqdomain: set irq domain flags before the irq domain becomes visible
Date: Thu,  7 Sep 2017 20:42:00 +0900
Message-ID: <1504784522-26841-5-git-send-email-yamada.masahiro@socionext.com>
References: <1504784522-26841-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504784522-26841-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

irq_domain_create_hierarchy() sets additional flags after the domain
is successfully allocated, but the domain becomes visible when it is
added to irq_domain_list.  When a consumer gets the domain, the flags
may not have been set yet.

Move "domain->flags |= flags;" into __irq_domain_add().

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

Changes in v4:
  - Newly added


 include/linux/irqdomain.h | 13 +++++++------
 kernel/irq/irqdomain.c    | 19 +++++++++----------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 31be32d..7609807 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -237,7 +237,8 @@ static inline struct fwnode_handle *irq_domain_alloc_fwnode(void *data)
 }
 
 void irq_domain_free_fwnode(struct fwnode_handle *fwnode);
-struct irq_domain *__irq_domain_add(struct fwnode_handle *fwnode, int size,
+struct irq_domain *__irq_domain_add(struct fwnode_handle *fwnode,
+				    unsigned int flags, int size,
 				    irq_hw_number_t hwirq_max, int direct_max,
 				    const struct irq_domain_ops *ops,
 				    void *host_data);
@@ -309,14 +310,14 @@ static inline struct irq_domain *irq_domain_add_linear(struct device_node *of_no
 					 const struct irq_domain_ops *ops,
 					 void *host_data)
 {
-	return __irq_domain_add(of_node_to_fwnode(of_node), size, size, 0, ops, host_data);
+	return __irq_domain_add(of_node_to_fwnode(of_node), 0, size, size, 0, ops, host_data);
 }
 static inline struct irq_domain *irq_domain_add_nomap(struct device_node *of_node,
 					 unsigned int max_irq,
 					 const struct irq_domain_ops *ops,
 					 void *host_data)
 {
-	return __irq_domain_add(of_node_to_fwnode(of_node), 0, max_irq, max_irq, ops, host_data);
+	return __irq_domain_add(of_node_to_fwnode(of_node), 0, 0, max_irq, max_irq, ops, host_data);
 }
 static inline struct irq_domain *irq_domain_add_legacy_isa(
 				struct device_node *of_node,
@@ -330,7 +331,7 @@ static inline struct irq_domain *irq_domain_add_tree(struct device_node *of_node
 					 const struct irq_domain_ops *ops,
 					 void *host_data)
 {
-	return __irq_domain_add(of_node_to_fwnode(of_node), 0, ~0, 0, ops, host_data);
+	return __irq_domain_add(of_node_to_fwnode(of_node), 0, 0, ~0, 0, ops, host_data);
 }
 
 static inline struct irq_domain *irq_domain_create_linear(struct fwnode_handle *fwnode,
@@ -338,14 +339,14 @@ static inline struct irq_domain *irq_domain_create_linear(struct fwnode_handle *
 					 const struct irq_domain_ops *ops,
 					 void *host_data)
 {
-	return __irq_domain_add(fwnode, size, size, 0, ops, host_data);
+	return __irq_domain_add(fwnode, 0, size, size, 0, ops, host_data);
 }
 
 static inline struct irq_domain *irq_domain_create_tree(struct fwnode_handle *fwnode,
 					 const struct irq_domain_ops *ops,
 					 void *host_data)
 {
-	return __irq_domain_add(fwnode, 0, ~0, 0, ops, host_data);
+	return __irq_domain_add(fwnode, 0, 0, ~0, 0, ops, host_data);
 }
 
 extern void irq_domain_remove(struct irq_domain *host);
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 18d11b9..b317a64 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -115,6 +115,7 @@ EXPORT_SYMBOL_GPL(irq_domain_free_fwnode);
 /**
  * __irq_domain_add() - Allocate a new irq_domain data structure
  * @fwnode: firmware node for the interrupt controller
+ * @flags:	Irq domain flags associated to the domain
  * @size: Size of linear map; 0 for radix mapping only
  * @hwirq_max: Maximum number of interrupts supported by controller
  * @direct_max: Maximum value of direct maps; Use ~0 for no limit; 0 for no
@@ -125,7 +126,8 @@ EXPORT_SYMBOL_GPL(irq_domain_free_fwnode);
  * Allocates and initialize and irq_domain structure.
  * Returns pointer to IRQ domain, or NULL on failure.
  */
-struct irq_domain *__irq_domain_add(struct fwnode_handle *fwnode, int size,
+struct irq_domain *__irq_domain_add(struct fwnode_handle *fwnode,
+				    unsigned int flags, int size,
 				    irq_hw_number_t hwirq_max, int direct_max,
 				    const struct irq_domain_ops *ops,
 				    void *host_data)
@@ -213,6 +215,7 @@ struct irq_domain *__irq_domain_add(struct fwnode_handle *fwnode, int size,
 	INIT_RADIX_TREE(&domain->revmap_tree, GFP_KERNEL);
 	domain->ops = ops;
 	domain->host_data = host_data;
+	domain->flags |= flags;
 	domain->hwirq_max = hwirq_max;
 	domain->revmap_size = size;
 	domain->revmap_direct_max_irq = direct_max;
@@ -319,7 +322,7 @@ struct irq_domain *irq_domain_add_simple(struct device_node *of_node,
 {
 	struct irq_domain *domain;
 
-	domain = __irq_domain_add(of_node_to_fwnode(of_node), size, size, 0, ops, host_data);
+	domain = __irq_domain_add(of_node_to_fwnode(of_node), 0, size, size, 0, ops, host_data);
 	if (!domain)
 		return NULL;
 
@@ -363,7 +366,7 @@ struct irq_domain *irq_domain_add_legacy(struct device_node *of_node,
 {
 	struct irq_domain *domain;
 
-	domain = __irq_domain_add(of_node_to_fwnode(of_node), first_hwirq + size,
+	domain = __irq_domain_add(of_node_to_fwnode(of_node), 0, first_hwirq + size,
 				  first_hwirq + size, 0, ops, host_data);
 	if (domain)
 		irq_domain_associate_many(domain, first_irq, first_hwirq, size);
@@ -1133,14 +1136,10 @@ struct irq_domain *irq_domain_create_hierarchy(struct irq_domain *parent,
 {
 	struct irq_domain *domain;
 
-	if (size)
-		domain = irq_domain_create_linear(fwnode, size, ops, host_data);
-	else
-		domain = irq_domain_create_tree(fwnode, ops, host_data);
-	if (domain) {
+	domain = __irq_domain_add(fwnode, flags, size, size ? size : ~0, 0,
+				  ops, host_data);
+	if (domain)
 		domain->parent = parent;
-		domain->flags |= flags;
-	}
 
 	return domain;
 }
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
