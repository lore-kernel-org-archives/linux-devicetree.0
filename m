From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v4 1/6] irqdomain: rename variables in irq_domain_{push,pop}_irq()
Date: Thu,  7 Sep 2017 20:41:57 +0900
Message-ID: <1504784522-26841-2-git-send-email-yamada.masahiro@socionext.com>
References: <1504784522-26841-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1504784522-26841-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Masami Hiramatsu <mhiramat@kernel.org>, David Daney <david.daney@cavium.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The meaning of "root" in irq_domain_{push,pop} is opposite to the
documentation.  Documentation/IRQ-domain.txt depicts the hierarchy
IRQ domain as follows:

    CPU Vector irq_domain (root irq_domain to manage CPU vectors)
            ^
            |
    Interrupt Remapping irq_domain (manage irq_remapping entries)
            ^
            |
    IOAPIC irq_domain (manage IOAPIC delivery entries/pins)

>From above, the inner-most domain (nearest to the CPU) is "root".

The document also says, "When building irq_domain hierarchy, the
irq_domain near to the device is child and the irq_domain near to
CPU is parent."  This is how irq_data->parent_data works.  In
contrast, these function use a variable "child_irq_data" for that.

To avoid confusion, flip the direction as follows:

  root_irq_data  -> tail_irq_data
  child_irq_data -> parent_irq_data

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v4:
 - Newly added


 kernel/irq/irqdomain.c | 68 +++++++++++++++++++++++++-------------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index e84b705..da3e0b6 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1467,20 +1467,20 @@ static void irq_domain_fix_revmap(struct irq_data *d)
 }
 
 /**
- * irq_domain_push_irq() - Push a domain in to the top of a hierarchy.
+ * irq_domain_push_irq() - Push a domain in to the tail of a hierarchy.
  * @domain:	Domain to push.
  * @virq:	Irq to push the domain in to.
  * @arg:	Passed to the irq_domain_ops alloc() function.
  *
  * For an already existing irqdomain hierarchy, as might be obtained
  * via a call to pci_enable_msix(), add an additional domain to the
- * head of the processing chain.  Must be called before request_irq()
+ * tail of the processing chain.  Must be called before request_irq()
  * has been called.
  */
 int irq_domain_push_irq(struct irq_domain *domain, int virq, void *arg)
 {
-	struct irq_data *child_irq_data;
-	struct irq_data *root_irq_data = irq_get_irq_data(virq);
+	struct irq_data *parent_irq_data;
+	struct irq_data *tail_irq_data = irq_get_irq_data(virq);
 	struct irq_desc *desc;
 	int rv = 0;
 
@@ -1505,43 +1505,43 @@ int irq_domain_push_irq(struct irq_domain *domain, int virq, void *arg)
 	if (WARN_ON(!irq_domain_is_hierarchy(domain)))
 		return -EINVAL;
 
-	if (!root_irq_data)
+	if (!tail_irq_data)
 		return -EINVAL;
 
-	if (domain->parent != root_irq_data->domain)
+	if (domain->parent != tail_irq_data->domain)
 		return -EINVAL;
 
-	child_irq_data = kzalloc_node(sizeof(*child_irq_data), GFP_KERNEL,
-				      irq_data_get_node(root_irq_data));
-	if (!child_irq_data)
+	parent_irq_data = kzalloc_node(sizeof(*parent_irq_data), GFP_KERNEL,
+				      irq_data_get_node(tail_irq_data));
+	if (!parent_irq_data)
 		return -ENOMEM;
 
 	mutex_lock(&irq_domain_mutex);
 
 	/* Copy the original irq_data. */
-	*child_irq_data = *root_irq_data;
+	*parent_irq_data = *tail_irq_data;
 
 	/*
-	 * Overwrite the root_irq_data, which is embedded in struct
+	 * Overwrite the tail_irq_data, which is embedded in struct
 	 * irq_desc, with values for this domain.
 	 */
-	root_irq_data->parent_data = child_irq_data;
-	root_irq_data->domain = domain;
-	root_irq_data->mask = 0;
-	root_irq_data->hwirq = 0;
-	root_irq_data->chip = NULL;
-	root_irq_data->chip_data = NULL;
+	tail_irq_data->parent_data = parent_irq_data;
+	tail_irq_data->domain = domain;
+	tail_irq_data->mask = 0;
+	tail_irq_data->hwirq = 0;
+	tail_irq_data->chip = NULL;
+	tail_irq_data->chip_data = NULL;
 
 	/* May (probably does) set hwirq, chip, etc. */
 	rv = irq_domain_alloc_irqs_hierarchy(domain, virq, 1, arg);
 	if (rv) {
 		/* Restore the original irq_data. */
-		*root_irq_data = *child_irq_data;
+		*tail_irq_data = *parent_irq_data;
 		goto error;
 	}
 
-	irq_domain_fix_revmap(child_irq_data);
-	irq_domain_set_mapping(domain, root_irq_data->hwirq, root_irq_data);
+	irq_domain_fix_revmap(parent_irq_data);
+	irq_domain_set_mapping(domain, tail_irq_data->hwirq, tail_irq_data);
 
 error:
 	mutex_unlock(&irq_domain_mutex);
@@ -1551,7 +1551,7 @@ int irq_domain_push_irq(struct irq_domain *domain, int virq, void *arg)
 EXPORT_SYMBOL_GPL(irq_domain_push_irq);
 
 /**
- * irq_domain_pop_irq() - Remove a domain from the top of a hierarchy.
+ * irq_domain_pop_irq() - Remove a domain from the tail of a hierarchy.
  * @domain:	Domain to remove.
  * @virq:	Irq to remove the domain from.
  *
@@ -1560,8 +1560,8 @@ EXPORT_SYMBOL_GPL(irq_domain_push_irq);
  */
 int irq_domain_pop_irq(struct irq_domain *domain, int virq)
 {
-	struct irq_data *root_irq_data = irq_get_irq_data(virq);
-	struct irq_data *child_irq_data;
+	struct irq_data *tail_irq_data = irq_get_irq_data(virq);
+	struct irq_data *parent_irq_data;
 	struct irq_data *tmp_irq_data;
 	struct irq_desc *desc;
 
@@ -1583,37 +1583,37 @@ int irq_domain_pop_irq(struct irq_domain *domain, int virq)
 	if (domain == NULL)
 		return -EINVAL;
 
-	if (!root_irq_data)
+	if (!tail_irq_data)
 		return -EINVAL;
 
 	tmp_irq_data = irq_domain_get_irq_data(domain, virq);
 
-	/* We can only "pop" if this domain is at the top of the list */
-	if (WARN_ON(root_irq_data != tmp_irq_data))
+	/* We can only "pop" if this domain is at the tail of the list */
+	if (WARN_ON(tail_irq_data != tmp_irq_data))
 		return -EINVAL;
 
-	if (WARN_ON(root_irq_data->domain != domain))
+	if (WARN_ON(tail_irq_data->domain != domain))
 		return -EINVAL;
 
-	child_irq_data = root_irq_data->parent_data;
-	if (WARN_ON(!child_irq_data))
+	parent_irq_data = tail_irq_data->parent_data;
+	if (WARN_ON(!parent_irq_data))
 		return -EINVAL;
 
 	mutex_lock(&irq_domain_mutex);
 
-	root_irq_data->parent_data = NULL;
+	tail_irq_data->parent_data = NULL;
 
-	irq_domain_clear_mapping(domain, root_irq_data->hwirq);
+	irq_domain_clear_mapping(domain, tail_irq_data->hwirq);
 	irq_domain_free_irqs_hierarchy(domain, virq, 1);
 
 	/* Restore the original irq_data. */
-	*root_irq_data = *child_irq_data;
+	*tail_irq_data = *parent_irq_data;
 
-	irq_domain_fix_revmap(root_irq_data);
+	irq_domain_fix_revmap(tail_irq_data);
 
 	mutex_unlock(&irq_domain_mutex);
 
-	kfree(child_irq_data);
+	kfree(parent_irq_data);
 
 	return 0;
 }
-- 
2.7.4
