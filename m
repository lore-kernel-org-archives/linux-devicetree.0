From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 1/5] irqdomain: Allow domain matching on irq_fwspec
Date: Mon, 11 Apr 2016 09:57:51 +0100
Message-ID: <1460365075-7316-2-git-send-email-marc.zyngier@arm.com>
References: <1460365075-7316-1-git-send-email-marc.zyngier@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460365075-7316-1-git-send-email-marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

When iterating over the irq domain list, we try to match a domain
either by calling a match() function or by comparing a number
of fields passed as parameters.

Both approaches are a bit restrictive:
- match() is DT specific and only takes a device node
- the fallback case only deals with the fwnode_handle

It would be useful if we had a per-domain function that would
actually perform the matching check on the whole of the
irq_fwspec structure. This would allow for a domain to triage
matching attempts that need to extend beyond the fwnode.

Let's introduce irq_find_matching_fwspec(), which takes a full
blown irq_fwspec structure, and call into a select() function
implemented by the irqdomain. irq_find_matching_fwnode() is
made a wrapper around irq_find_matching_fwspec in order to
preserve compatibility.

Signed-off-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
---
 include/linux/irqdomain.h | 15 ++++++++++++++-
 kernel/irq/irqdomain.c    | 19 ++++++++++---------
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 2aed043..997373b 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -96,6 +96,8 @@ enum irq_domain_bus_token {
 struct irq_domain_ops {
 	int (*match)(struct irq_domain *d, struct device_node *node,
 		     enum irq_domain_bus_token bus_token);
+	int (*select)(struct irq_domain *d, struct irq_fwspec *fwspec,
+		      enum irq_domain_bus_token bus_token);
 	int (*map)(struct irq_domain *d, unsigned int virq, irq_hw_number_t hw);
 	void (*unmap)(struct irq_domain *d, unsigned int virq);
 	int (*xlate)(struct irq_domain *d, struct device_node *node,
@@ -211,7 +213,7 @@ struct irq_domain *irq_domain_add_legacy(struct device_node *of_node,
 					 irq_hw_number_t first_hwirq,
 					 const struct irq_domain_ops *ops,
 					 void *host_data);
-extern struct irq_domain *irq_find_matching_fwnode(struct fwnode_handle *fwnode,
+extern struct irq_domain *irq_find_matching_fwspec(struct irq_fwspec *fwspec,
 						   enum irq_domain_bus_token bus_token);
 extern void irq_set_default_host(struct irq_domain *host);
 extern int irq_domain_alloc_descs(int virq, unsigned int nr_irqs,
@@ -227,6 +229,17 @@ static inline bool is_fwnode_irqchip(struct fwnode_handle *fwnode)
 	return fwnode && fwnode->type == FWNODE_IRQCHIP;
 }
 
+static inline
+struct irq_domain *irq_find_matching_fwnode(struct fwnode_handle *fwnode,
+					    enum irq_domain_bus_token bus_token)
+{
+	struct irq_fwspec fwspec = {
+		.fwnode = fwnode,
+	};
+
+	return irq_find_matching_fwspec(&fwspec, bus_token);
+}
+
 static inline struct irq_domain *irq_find_matching_host(struct device_node *node,
 							enum irq_domain_bus_token bus_token)
 {
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 3a519a0..503c5b9 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -243,14 +243,15 @@ struct irq_domain *irq_domain_add_legacy(struct device_node *of_node,
 EXPORT_SYMBOL_GPL(irq_domain_add_legacy);
 
 /**
- * irq_find_matching_fwnode() - Locates a domain for a given fwnode
- * @fwnode: FW descriptor of the interrupt controller
+ * irq_find_matching_fwspec() - Locates a domain for a given fwspec
+ * @fwspec: FW specifier for an interrupt
  * @bus_token: domain-specific data
  */
-struct irq_domain *irq_find_matching_fwnode(struct fwnode_handle *fwnode,
+struct irq_domain *irq_find_matching_fwspec(struct irq_fwspec *fwspec,
 					    enum irq_domain_bus_token bus_token)
 {
 	struct irq_domain *h, *found = NULL;
+	struct fwnode_handle *fwnode = fwspec->fwnode;
 	int rc;
 
 	/* We might want to match the legacy controller last since
@@ -264,7 +265,9 @@ struct irq_domain *irq_find_matching_fwnode(struct fwnode_handle *fwnode,
 	 */
 	mutex_lock(&irq_domain_mutex);
 	list_for_each_entry(h, &irq_domain_list, link) {
-		if (h->ops->match)
+		if (h->ops->select && fwspec->param_count)
+			rc = h->ops->select(h, fwspec, bus_token);
+		else if (h->ops->match)
 			rc = h->ops->match(h, to_of_node(fwnode), bus_token);
 		else
 			rc = ((fwnode != NULL) && (h->fwnode == fwnode) &&
@@ -279,7 +282,7 @@ struct irq_domain *irq_find_matching_fwnode(struct fwnode_handle *fwnode,
 	mutex_unlock(&irq_domain_mutex);
 	return found;
 }
-EXPORT_SYMBOL_GPL(irq_find_matching_fwnode);
+EXPORT_SYMBOL_GPL(irq_find_matching_fwspec);
 
 /**
  * irq_set_default_host() - Set a "default" irq domain
@@ -574,11 +577,9 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 	int virq;
 
 	if (fwspec->fwnode) {
-		domain = irq_find_matching_fwnode(fwspec->fwnode,
-						  DOMAIN_BUS_WIRED);
+		domain = irq_find_matching_fwspec(fwspec, DOMAIN_BUS_WIRED);
 		if (!domain)
-			domain = irq_find_matching_fwnode(fwspec->fwnode,
-							  DOMAIN_BUS_ANY);
+			domain = irq_find_matching_fwspec(fwspec, DOMAIN_BUS_ANY);
 	} else {
 		domain = irq_default_domain;
 	}
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
