From: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Subject: [RFC 8/8] drivers/of: parse_phandle_with_args to look in node's root
Date: Fri, 11 Mar 2016 16:56:15 +0100
Message-ID: <1457711775-6326-9-git-send-email-franck.jullien@odyssee-systemes.fr>
References: <1457711775-6326-1-git-send-email-franck.jullien@odyssee-systemes.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457711775-6326-1-git-send-email-franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
---
 drivers/of/base.c  |   36 +++++++++++++++++++++++++++++++++++-
 include/linux/of.h |    8 +++++++-
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 331141b..c0165cb 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1080,6 +1080,31 @@ struct device_node *of_find_node_by_phandle(phandle handle)
 EXPORT_SYMBOL(of_find_node_by_phandle);
 
 /**
+ * of_find_node_by_phandle_from - Find a node given a phandle in a given tree
+ * @handle:	phandle of the node to find
+ *
+ * Returns a node pointer with refcount incremented, use
+ * of_node_put() on it when done.
+ */
+struct device_node *of_find_node_by_phandle_from(struct device_node *root, phandle handle)
+{
+	struct device_node *np;
+	unsigned long flags;
+
+	if (!handle)
+		return NULL;
+
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	for_each_of_allnodes_from(root, np)
+		if (np->phandle == handle)
+			break;
+	of_node_get(np);
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+	return np;
+}
+EXPORT_SYMBOL(of_find_node_by_phandle_from);
+
+/**
  * of_property_count_elems_of_size - Count the number of elements in a property
  *
  * @np:		device node from which the property value is to be read.
@@ -1441,6 +1466,15 @@ void of_print_phandle_args(const char *msg, const struct of_phandle_args *args)
 	printk("\n");
 }
 
+struct device_node *find_root_node(struct device_node *np)
+{
+	while (np->parent)
+		np = np->parent;
+
+	return np;
+}
+EXPORT_SYMBOL(find_root_node);
+
 static int __of_parse_phandle_with_args(const struct device_node *np,
 					const char *list_name,
 					const char *cells_name,
@@ -1480,7 +1514,7 @@ static int __of_parse_phandle_with_args(const struct device_node *np,
 			 * below.
 			 */
 			if (cells_name || cur_index == index) {
-				node = of_find_node_by_phandle(phandle);
+				node = of_find_node_by_phandle_from(find_root_node(np), phandle);
 				if (!node) {
 					pr_err("%s: could not find phandle\n",
 						np->full_name);
diff --git a/include/linux/of.h b/include/linux/of.h
index 37da652..21e192f 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -258,6 +258,7 @@ static inline struct device_node *of_find_node_by_path(const char *path)
 }
 
 extern struct device_node *of_find_node_by_phandle(phandle handle);
+extern struct device_node *of_find_node_by_phandle_from(struct device_node *root, phandle handle);
 extern struct device_node *of_get_parent(const struct device_node *node);
 extern struct device_node *of_get_next_parent(struct device_node *node);
 extern struct device_node *of_get_next_child(const struct device_node *node,
@@ -343,7 +344,7 @@ extern int of_machine_is_compatible(const char *compat);
 extern int of_add_property(struct device_node *np, struct property *prop);
 extern int of_remove_property(struct device_node *np, struct property *prop);
 extern int of_update_property(struct device_node *np, struct property *newprop);
-
+extern struct device_node *find_root_node(struct device_node *np);
 extern int of_attach_node_sysfs(struct device_node *np);
 
 /* For updating the device tree at runtime */
@@ -436,6 +437,11 @@ static inline struct device_node *of_find_node_by_phandle(phandle handle)
 	return NULL;
 }
 
+static inline struct device_node *of_find_node_by_phandle_from(phandle handle)
+{
+	return NULL;
+}
+
 static inline struct device_node *of_get_parent(const struct device_node *node)
 {
 	return NULL;
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
