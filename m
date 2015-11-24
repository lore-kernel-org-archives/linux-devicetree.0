From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] of/irq: optimize device node matching loop in of_irq_init()
Date: Tue, 24 Nov 2015 22:10:26 +0900
Message-ID: <1448370626-15440-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Currently, of_irq_init() iterates over interrupt controller nodes
with for_each_matching_node(), and then gets each init function with
of_match_node() later.

This routine can be optimized with for_each_matching_node_and_match().
It allows to get the interrupt controller node and its init function
at the same time, saving __of_match_node() callings.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/of/irq.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 902b89b..4c0da87 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -472,6 +472,7 @@ EXPORT_SYMBOL_GPL(of_irq_to_resource_table);
 
 struct of_intc_desc {
 	struct list_head	list;
+	of_irq_init_cb_t	irq_init_cb;
 	struct device_node	*dev;
 	struct device_node	*interrupt_parent;
 };
@@ -485,6 +486,7 @@ struct of_intc_desc {
  */
 void __init of_irq_init(const struct of_device_id *matches)
 {
+	const struct of_device_id *match;
 	struct device_node *np, *parent = NULL;
 	struct of_intc_desc *desc, *temp_desc;
 	struct list_head intc_desc_list, intc_parent_list;
@@ -492,10 +494,15 @@ void __init of_irq_init(const struct of_device_id *matches)
 	INIT_LIST_HEAD(&intc_desc_list);
 	INIT_LIST_HEAD(&intc_parent_list);
 
-	for_each_matching_node(np, matches) {
+	for_each_matching_node_and_match(np, matches, &match) {
 		if (!of_find_property(np, "interrupt-controller", NULL) ||
 				!of_device_is_available(np))
 			continue;
+
+		if (WARN(!match->data, "of_irq_init: no init function for %s\n",
+			 match->compatible))
+			continue;
+
 		/*
 		 * Here, we allocate and populate an of_intc_desc with the node
 		 * pointer, interrupt-parent device_node etc.
@@ -506,6 +513,7 @@ void __init of_irq_init(const struct of_device_id *matches)
 			goto err;
 		}
 
+		desc->irq_init_cb = match->data;
 		desc->dev = of_node_get(np);
 		desc->interrupt_parent = of_irq_find_parent(np);
 		if (desc->interrupt_parent == np)
@@ -525,27 +533,18 @@ void __init of_irq_init(const struct of_device_id *matches)
 		 * The assumption is that NULL parent means a root controller.
 		 */
 		list_for_each_entry_safe(desc, temp_desc, &intc_desc_list, list) {
-			const struct of_device_id *match;
 			int ret;
-			of_irq_init_cb_t irq_init_cb;
 
 			if (desc->interrupt_parent != parent)
 				continue;
 
 			list_del(&desc->list);
-			match = of_match_node(matches, desc->dev);
-			if (WARN(!match->data,
-			    "of_irq_init: no init function for %s\n",
-			    match->compatible)) {
-				kfree(desc);
-				continue;
-			}
 
-			pr_debug("of_irq_init: init %s @ %p, parent %p\n",
-				 match->compatible,
+			pr_debug("of_irq_init: init %s (%p), parent %p\n",
+				 desc->dev->full_name,
 				 desc->dev, desc->interrupt_parent);
-			irq_init_cb = (of_irq_init_cb_t)match->data;
-			ret = irq_init_cb(desc->dev, desc->interrupt_parent);
+			ret = desc->irq_init_cb(desc->dev,
+						desc->interrupt_parent);
 			if (ret) {
 				kfree(desc);
 				continue;
-- 
1.9.1
