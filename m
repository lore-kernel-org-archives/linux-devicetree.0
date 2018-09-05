From: Rob Herring <robh@kernel.org>
Subject: [PATCH 01/21] of: Add cpu node iterator for_each_of_cpu_node()
Date: Wed,  5 Sep 2018 14:37:18 -0500
Message-ID: <20180905193738.19325-2-robh@kernel.org>
References: <20180905193738.19325-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905193738.19325-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Iterating thru cpu nodes is a common pattern. Create a common iterator
which can find child nodes either by node name or device_type == cpu.
Using the former will allow for eventually dropping device_type
properties which are deprecated for FDT.

Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/base.c  | 39 +++++++++++++++++++++++++++++++++++++++
 include/linux/of.h | 11 +++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index a055cd1ef96d..4807db0a35b3 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -741,6 +741,45 @@ struct device_node *of_get_next_available_child(const struct device_node *node,
 }
 EXPORT_SYMBOL(of_get_next_available_child);

+/**
+ *	of_get_next_cpu_node - Iterate on cpu nodes
+ *	@prev:	previous child of the /cpus node, or NULL to get first
+ *
+ *	Returns a cpu node pointer with refcount incremented, use of_node_put()
+ *	on it when done. Returns NULL when prev is the last child. Decrements
+ *	the refcount of prev.
+ */
+struct device_node *of_get_next_cpu_node(struct device_node *prev)
+{
+	struct device_node *next = NULL;
+	unsigned long flags;
+	struct device_node *node;
+
+	if (!prev)
+		node = of_find_node_by_path("/cpus");
+
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	if (prev)
+		next = prev->sibling;
+	else if (node) {
+		next = node->child;
+		of_node_put(node);
+	}
+	for (; next; next = next->sibling) {
+		if (!(of_node_name_eq(next, "cpu") ||
+		      (next->type && !of_node_cmp(next->type, "cpu"))))
+			continue;
+		if (!__of_device_is_available(next))
+			continue;
+		if (of_node_get(next))
+			break;
+	}
+	of_node_put(prev);
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+	return next;
+}
+EXPORT_SYMBOL(of_get_next_cpu_node);
+
 /**
  * of_get_compatible_child - Find compatible child node
  * @parent:	parent node
diff --git a/include/linux/of.h b/include/linux/of.h
index 99b0ebf49632..1aca0dbd35df 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -353,6 +353,8 @@ extern const void *of_get_property(const struct device_node *node,
 				const char *name,
 				int *lenp);
 extern struct device_node *of_get_cpu_node(int cpu, unsigned int *thread);
+extern struct device_node *of_get_next_cpu_node(struct device_node *prev);
+
 #define for_each_property_of_node(dn, pp) \
 	for (pp = dn->properties; pp != NULL; pp = pp->next)

@@ -754,6 +756,11 @@ static inline struct device_node *of_get_cpu_node(int cpu,
 	return NULL;
 }

+static inline struct device_node *of_get_next_cpu_node(struct device_node *prev)
+{
+	return NULL;
+}
+
 static inline int of_n_addr_cells(struct device_node *np)
 {
 	return 0;
@@ -1217,6 +1224,10 @@ static inline int of_property_read_s32(const struct device_node *np,
 	for (child = of_get_next_available_child(parent, NULL); child != NULL; \
 	     child = of_get_next_available_child(parent, child))

+#define for_each_of_cpu_node(cpu) \
+	for (cpu = of_get_next_cpu_node(NULL); cpu != NULL; \
+	     cpu = of_get_next_cpu_node(cpu))
+
 #define for_each_node_with_property(dn, prop_name) \
 	for (dn = of_find_node_with_property(NULL, prop_name); dn; \
 	     dn = of_find_node_with_property(dn, prop_name))
--
2.17.1
