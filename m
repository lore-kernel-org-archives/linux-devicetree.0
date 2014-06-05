From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [RFC 3/3] of: Refactor device_node child list to use list_head
Date: Thu,  5 Jun 2014 16:43:41 +0100
Message-ID: <1401983021-13829-4-git-send-email-grant.likely@linaro.org>
References: <1401983021-13829-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401983021-13829-1-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The device tree data structure uses a custom linked list implemenation
which is baroque and prone to bugs. Replace the child node lists with a
list_head and the common list_head accessor functions.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/base.c  | 43 +++++++++++++++++++------------------------
 drivers/of/fdt.c   | 12 +++---------
 include/linux/of.h |  8 +++++---
 3 files changed, 27 insertions(+), 36 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 6c0bd86b802f..69f5648babd8 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -47,6 +47,12 @@ static struct kset *of_kset;
 #define for_each_of_allnodes_continue(dn) \
 	list_for_each_entry_continue(dn, &of_allnodes, allnext)
 
+#define of_children_prepare(parent, child) \
+	list_prepare_entry(child, &parent->children, childnext)
+#define for_each_of_children(parent, child) \
+	list_for_each_entry(child, &parent->children, childnext)
+#define for_each_of_children_continue(parent, child) \
+	list_for_each_entry_continue(child, &parent->children, childnext)
 /*
  * Used to protect the of_aliases; but also overloaded to hold off addition of
  * nodes to sysfs
@@ -711,11 +717,11 @@ static struct device_node *__of_get_next_child(const struct device_node *node,
 	if (!node)
 		return NULL;
 
-	next = prev ? prev->sibling : node->child;
-	for (; next; next = next->sibling)
-		if (of_node_get(next))
-			break;
 	of_node_put(prev);
+	next = list_next_entry(of_children_prepare(node, prev), childnext);
+	if (&next->childnext == &node->children)
+		next = NULL;
+	of_node_get(next);
 	return next;
 }
 #define __for_each_child_of_node(parent, child) \
@@ -754,21 +760,21 @@ EXPORT_SYMBOL(of_get_next_child);
 struct device_node *of_get_next_available_child(const struct device_node *node,
 	struct device_node *prev)
 {
-	struct device_node *next;
+	struct device_node *next = NULL;
 	unsigned long flags;
 
 	if (!node)
 		return NULL;
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
-	next = prev ? prev->sibling : node->child;
-	for (; next; next = next->sibling) {
-		if (!__of_device_is_available(next))
-			continue;
-		if (of_node_get(next))
+	of_node_put(prev);
+	prev = of_children_prepare(node, prev);
+	for_each_of_children_continue(node, prev) {
+		if (__of_device_is_available(prev)) {
+			next = of_node_get(prev);
 			break;
+		}
 	}
-	of_node_put(prev);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 	return next;
 }
@@ -1976,8 +1982,7 @@ int of_attach_node(struct device_node *np)
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	list_add_tail(&np->allnext, &of_allnodes);
-	np->sibling = np->parent->child;
-	np->parent->child = np;
+	list_add_tail(&np->childnext, &np->parent->children);
 	of_node_clear_flag(np, OF_DETACHED);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
@@ -2016,17 +2021,7 @@ int of_detach_node(struct device_node *np)
 	}
 
 	list_del(&np->allnext);
-
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
+	list_del(&np->childnext);
 
 	of_node_set_flag(np, OF_DETACHED);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 6876ac3d4b30..2ff96cac1496 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -155,6 +155,7 @@ static void * unflatten_dt_node(void *blob,
 		char *fn;
 		of_node_init(np);
 		np->full_name = fn = ((char *)np) + sizeof(*np);
+		np->parent = dad;
 		if (new_format) {
 			/* rebuild full path for new format */
 			if (dad && dad->parent) {
@@ -174,15 +175,8 @@ static void * unflatten_dt_node(void *blob,
 
 		prev_pp = &np->properties;
 		list_add_tail(&np->allnext, allnext);
-		if (dad != NULL) {
-			np->parent = dad;
-			/* we temporarily use the next field as `last_child'*/
-			if (dad->next == NULL)
-				dad->child = np;
-			else
-				dad->next->sibling = np;
-			dad->next = np;
-		}
+		if (np->parent)
+			list_add_tail(&np->childnext, &np->parent->children);
 	}
 	/* process properties */
 	for (offset = fdt_first_property_offset(blob, *poffset);
diff --git a/include/linux/of.h b/include/linux/of.h
index e082db3c284f..11bef100bc43 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -52,10 +52,11 @@ struct device_node {
 
 	struct	property *properties;
 	struct	property *deadprops;	/* removed properties */
+
+	struct	list_head children;	/* next device of same type */
 	struct	device_node *parent;
-	struct	device_node *child;
-	struct	device_node *sibling;
-	struct	device_node *next;	/* next device of same type */
+
+	struct	list_head childnext;
 	struct	list_head allnext;
 	struct	kobject kobj;
 	unsigned long _flags;
@@ -80,6 +81,7 @@ extern int of_node_add(struct device_node *node);
 extern struct kobj_type of_node_ktype;
 static inline void of_node_init(struct device_node *node)
 {
+	INIT_LIST_HEAD(&node->children);
 	kobject_init(&node->kobj, &of_node_ktype);
 }
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
