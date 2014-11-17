From: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Patch to improve device tree structure
Date: Sun, 16 Nov 2014 20:52:56 -0800
Message-ID: <1416199976-21147-1-git-send-email-gaurav.minocha.os@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch improves the implementation of device tree structure.

Traditional child and sibling linked list in device tree structure
is removed and is replaced by list_head (i.e. circular doubly linked
 list) already available in Linux kernel.

Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/base.c     |  36 ++++++++++----
 drivers/of/dynamic.c  |  18 ++-----
 drivers/of/fdt.c      |   7 ++-
 drivers/of/selftest.c | 130 +++++++++++++++++++++++---------------------------
 include/linux/of.h    |   4 +-
 5 files changed, 97 insertions(+), 98 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 2305dc0..7acaeca 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -603,16 +603,25 @@ EXPORT_SYMBOL(of_get_next_parent);
 static struct device_node *__of_get_next_child(const struct device_node *node,
 						struct device_node *prev)
 {
-	struct device_node *next;
+	struct device_node *next = NULL, *np;
+	struct list_head *pos;
+	int found = 0;
 
 	if (!node)
 		return NULL;
 
-	next = prev ? prev->sibling : node->child;
-	for (; next; next = next->sibling)
-		if (of_node_get(next))
-			break;
+	// move through the children list, and find the next node
+	list_for_each(pos, &node->children) {
+		np = list_entry(pos, struct device_node, siblings);
+		if ((!prev || (found == 1)) && of_node_get(np)) {
+				next = np;
+				break;
+		}
+		if (prev && strcmp(np->full_name, prev->full_name) == 0)
+			found = 1;
+	}
 	of_node_put(prev);
+
 	return next;
 }
 #define __for_each_child_of_node(parent, child) \
@@ -651,22 +660,29 @@ EXPORT_SYMBOL(of_get_next_child);
 struct device_node *of_get_next_available_child(const struct device_node *node,
 	struct device_node *prev)
 {
-	struct device_node *next;
+	struct device_node *next = NULL, *np;
+	struct list_head *pos;
 	unsigned long flags;
+	int found = 0;
 
 	if (!node)
 		return NULL;
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
-	next = prev ? prev->sibling : node->child;
-	for (; next; next = next->sibling) {
-		if (!__of_device_is_available(next))
+	list_for_each(pos, &node->children) {
+		np = list_entry(pos, struct device_node, siblings);
+		if (!__of_device_is_available(np))
 			continue;
-		if (of_node_get(next))
+		if ((!prev || (found == 1)) && of_node_get(np)) {
+			next = np;
 			break;
+		}
+		if (prev && strcmp(np->full_name, prev->full_name) == 0)
+			found = 1;
 	}
 	of_node_put(prev);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+
 	return next;
 }
 EXPORT_SYMBOL(of_get_next_available_child);
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index f297891..3ffc726 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -115,11 +115,12 @@ void __of_attach_node(struct device_node *np)
 		phandle = __of_get_property(np, "ibm,phandle", &sz);
 	np->phandle = (phandle && (sz >= 4)) ? be32_to_cpup(phandle) : 0;
 
-	np->child = NULL;
-	np->sibling = np->parent->child;
+	INIT_LIST_HEAD(&np->siblings);
+	INIT_LIST_HEAD(&np->children);
+	list_add_tail(&(np->siblings), &(np->parent->children));
+
 	np->allnext = np->parent->allnext;
 	np->parent->allnext = np;
-	np->parent->child = np;
 	of_node_clear_flag(np, OF_DETACHED);
 }
 
@@ -165,16 +166,7 @@ void __of_detach_node(struct device_node *np)
 		prev->allnext = np->allnext;
 	}
 
-	if (parent->child == np)
-		parent->child = np->sibling;
-	else {
-		struct device_node *prevsib;
-		for (prevsib = np->parent->child;
-		     prevsib->sibling != np;
-		     prevsib = prevsib->sibling)
-			;
-		prevsib->sibling = np->sibling;
-	}
+	list_del(&np->siblings);
 
 	of_node_set_flag(np, OF_DETACHED);
 }
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index d1ffca8..4cf2356 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -224,13 +224,12 @@ static void * unflatten_dt_node(void *blob,
 		prev_pp = &np->properties;
 		**allnextpp = np;
 		*allnextpp = &np->allnext;
+		INIT_LIST_HEAD(&np->siblings);
+		INIT_LIST_HEAD(&np->children);
 		if (dad != NULL) {
 			np->parent = dad;
 			/* we temporarily use the next field as `last_child'*/
-			if (dad->next == NULL)
-				dad->child = np;
-			else
-				dad->next->sibling = np;
+			list_add_tail(&(np->siblings), &(dad->children));
 			dad->next = np;
 		}
 	}
diff --git a/drivers/of/selftest.c b/drivers/of/selftest.c
index 7800127..8ec8a22 100644
--- a/drivers/of/selftest.c
+++ b/drivers/of/selftest.c
@@ -25,10 +25,11 @@ static struct selftest_results {
 	int failed;
 } selftest_results;
 
-#define NO_OF_NODES 3
-static struct device_node *nodes[NO_OF_NODES];
-static int last_node_index;
+#define MAX_NODES 50
+
+static int no_of_nodes;
 static bool selftest_live_tree;
+static struct device_node* nodes[MAX_NODES];
 
 #define selftest(result, fmt, ...) { \
 	if (!(result)) { \
@@ -417,7 +418,6 @@ static void __init of_selftest_changeset(void)
 	n1->parent = parent;
 	n2->parent = parent;
 	n21->parent = n2;
-	n2->child = n21;
 	ppremove = of_find_property(parent, "prop-remove", NULL);
 	selftest(ppremove, "failed to find removal prop");
 
@@ -713,44 +713,34 @@ static void update_node_properties(struct device_node *np,
 		child->parent = dup;
 }
 
-/**
- *	attach_node_and_children - attaches nodes
- *	and its children to live tree
- *
- *	@np:	Node to attach to live tree
- */
-static int attach_node_and_children(struct device_node *np)
-{
-	struct device_node *next, *root = np, *dup;
 
-	/* skip root node */
-	np = np->child;
-	/* storing a copy in temporary node */
-	dup = np;
+static void populate_node_list(struct device_node *np)
+{
+	struct list_head *pos;
 
-	while (dup) {
-		if (WARN_ON(last_node_index >= NO_OF_NODES))
-			return -EINVAL;
-		nodes[last_node_index++] = dup;
-		dup = dup->sibling;
+	list_for_each(pos, &np->children) {
+		nodes[no_of_nodes] = list_entry(pos, struct device_node, siblings);
+		populate_node_list(nodes[no_of_nodes++]);
 	}
-	dup = NULL;
+}
 
-	while (np) {
-		next = np->allnext;
-		dup = of_find_node_by_path(np->full_name);
+static void attach_node_and_children(struct device_node *np)
+{
+	struct device_node *root = np, *dup, *temp;
+	int i;
+
+	populate_node_list(np);
+
+	for (i = 0; i < no_of_nodes && nodes[i]; i++) {
+		temp = nodes[i];
+		if (temp->parent == root)
+			temp->parent = of_allnodes;
+		dup = of_find_node_by_path(temp->full_name);
 		if (dup)
-			update_node_properties(np, dup);
-		else {
-			np->child = NULL;
-			if (np->parent == root)
-				np->parent = of_allnodes;
-			of_attach_node(np);
-		}
-		np = next;
+			update_node_properties(temp, dup);
+		else
+			of_attach_node(temp);
 	}
-
-	return 0;
 }
 
 /**
@@ -764,7 +754,8 @@ static int __init selftest_data_add(void)
 	extern uint8_t __dtb_testcases_begin[];
 	extern uint8_t __dtb_testcases_end[];
 	const int size = __dtb_testcases_end - __dtb_testcases_begin;
-	int rc;
+	struct list_head *pos;
+	int rc, i = 0;
 
 	if (!size) {
 		pr_warn("%s: No testcase data to attach; not running tests\n",
@@ -796,65 +787,66 @@ static int __init selftest_data_add(void)
 		/* enabling flag for removing nodes */
 		selftest_live_tree = true;
 		of_allnodes = selftest_data_node;
+		populate_node_list(selftest_data_node);
+
+		// attach the root node
+		__of_attach_node_sysfs(selftest_data_node);
+
+		while (i < no_of_nodes && nodes[i])
+			__of_attach_node_sysfs(nodes[i++]);
 
-		for_each_of_allnodes(np)
-			__of_attach_node_sysfs(np);
 		of_aliases = of_find_node_by_path("/aliases");
 		of_chosen = of_find_node_by_path("/chosen");
 		return 0;
 	}
 
+	list_for_each(pos, &selftest_data_node->children) {
+		np = list_entry(pos, struct device_node, siblings);
+		np->parent = of_allnodes;
+	}
+
+
 	/* attach the sub-tree to live tree */
-	return attach_node_and_children(selftest_data_node);
-}
+	attach_node_and_children(selftest_data_node);
 
-/**
- *	detach_node_and_children - detaches node
- *	and its children from live tree
- *
- *	@np:	Node to detach from live tree
- */
-static void detach_node_and_children(struct device_node *np)
-{
-	while (np->child)
-		detach_node_and_children(np->child);
-	of_detach_node(np);
+	return 0;
 }
 
-/**
- *	selftest_data_remove - removes the selftest data
- *	nodes from the live tree
- */
 static void selftest_data_remove(void)
 {
-	struct device_node *np;
 	struct property *prop;
+	struct device_node *np, *temp;
+	int i = no_of_nodes;
 
 	if (selftest_live_tree) {
 		of_node_put(of_aliases);
 		of_node_put(of_chosen);
 		of_aliases = NULL;
 		of_chosen = NULL;
-		for_each_child_of_node(of_allnodes, np)
-			detach_node_and_children(np);
+		while (i >= 0) {
+			temp = nodes[i--];
+			if (temp)
+				of_detach_node(temp);
+		}
 		__of_detach_node_sysfs(of_allnodes);
 		of_allnodes = NULL;
 		return;
 	}
 
-	while (last_node_index >= 0) {
-		if (nodes[last_node_index]) {
-			np = of_find_node_by_path(nodes[last_node_index]->full_name);
-			if (strcmp(np->full_name, "/aliases") != 0) {
-				detach_node_and_children(np);
-			} else {
-				for_each_property_of_node(np, prop) {
-					if (strcmp(prop->name, "testcase-alias") == 0)
+	while (i >= 0) {
+		temp = nodes[i--];
+		if (temp) {
+			if (strcmp(temp->full_name, "/aliases") == 0) {
+				for_each_property_of_node(temp, prop) {
+					if (strcmp(prop->name, "testcase-alias") == 0) {
+						np = of_find_node_by_path(temp->full_name);
 						of_remove_property(np, prop);
+					}
 				}
 			}
+			else
+				of_detach_node(temp);
 		}
-		last_node_index--;
 	}
 }
 
@@ -865,6 +857,7 @@ static int __init of_selftest(void)
 
 	/* adding data for selftest */
 	res = selftest_data_add();
+
 	if (res)
 		return res;
 
@@ -891,7 +884,6 @@ static int __init of_selftest(void)
 
 	/* removing selftest data from live tree */
 	selftest_data_remove();
-
 	/* Double check linkage after removing testcase data */
 	of_selftest_check_tree_linkage();
 
diff --git a/include/linux/of.h b/include/linux/of.h
index 6545e7a..84c708c 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -53,10 +53,10 @@ struct device_node {
 	struct	property *properties;
 	struct	property *deadprops;	/* removed properties */
 	struct	device_node *parent;
-	struct	device_node *child;
-	struct	device_node *sibling;
 	struct	device_node *next;	/* next device of same type */
 	struct	device_node *allnext;	/* next in list of all nodes */
+	struct	list_head children;
+	struct	list_head siblings;
 	struct	kobject kobj;
 	unsigned long _flags;
 	void	*data;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
