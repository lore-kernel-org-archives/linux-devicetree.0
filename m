Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 3/3] of: Move CONFIG_OF_DYNAMIC code into a separate file
Date: Fri,  4 Jul 2014 19:58:04 +0300
Message-Id: <1404493084-8832-4-git-send-email-pantelis.antoniou@konsulko.com>
In-Reply-To: <1404493084-8832-1-git-send-email-pantelis.antoniou@konsulko.com>
References: <1404493084-8832-1-git-send-email-pantelis.antoniou@konsulko.com>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

From: Grant Likely <grant.likely@linaro.org>

Split the dynamic device tree code into a separate file to make it
really clear what features CONFIF_OF_DYNAMIC add to the kernel. Without
CONFIG_OF_DYNAMIC only properties can be changed, and notifiers do not
get sent. Enabling it turns on reference counting, notifiers and the
ability to add and remove nodes.

Changes by Pantelis Antoniou:
* Added missing prototypes for non-dynamic case.
* Moved of_node_release to dynamic.c
* Cosmetic fixes and changes (checkpatch warnings fixes)

Signed-off-by: Grant Likely <grant.likely@linaro.org>
Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 drivers/of/Makefile     |   1 +
 drivers/of/base.c       | 232 +-----------------------------------------------
 drivers/of/dynamic.c    | 221 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/of/of_private.h |  26 ++++++
 include/linux/of.h      |  26 +++++-
 5 files changed, 275 insertions(+), 231 deletions(-)
 create mode 100644 drivers/of/dynamic.c

diff --git a/drivers/of/Makefile b/drivers/of/Makefile
index 099b1fb..08e6c0f 100644
--- a/drivers/of/Makefile
+++ b/drivers/of/Makefile
@@ -1,4 +1,5 @@
 obj-y = base.o device.o platform.o
+obj-$(CONFIG_OF_DYNAMIC) += dynamic.o
 obj-$(CONFIG_OF_FLATTREE) += fdt.o
 obj-$(CONFIG_OF_EARLY_FLATTREE) += fdt_address.o
 obj-$(CONFIG_OF_PROMTREE) += pdt.o
diff --git a/drivers/of/base.c b/drivers/of/base.c
index e48a1b9..be0ec37 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -88,80 +88,8 @@ int __weak of_node_to_nid(struct device_node *np)
 }
 #endif
 
-#if defined(CONFIG_OF_DYNAMIC)
-/**
- *	of_node_get - Increment refcount of a node
- *	@node:	Node to inc refcount, NULL is supported to
- *		simplify writing of callers
- *
- *	Returns node.
- */
-struct device_node *of_node_get(struct device_node *node)
-{
-	if (node)
-		kobject_get(&node->kobj);
-	return node;
-}
-EXPORT_SYMBOL(of_node_get);
-
-static inline struct device_node *kobj_to_device_node(struct kobject *kobj)
-{
-	return container_of(kobj, struct device_node, kobj);
-}
-
-/**
- *	of_node_release - release a dynamically allocated node
- *	@kref:  kref element of the node to be released
- *
- *	In of_node_put() this function is passed to kref_put()
- *	as the destructor.
- */
-static void of_node_release(struct kobject *kobj)
-{
-	struct device_node *node = kobj_to_device_node(kobj);
-	struct property *prop = node->properties;
-
-	/* We should never be releasing nodes that haven't been detached. */
-	if (!of_node_check_flag(node, OF_DETACHED)) {
-		pr_err("ERROR: Bad of_node_put() on %s\n", node->full_name);
-		dump_stack();
-		return;
-	}
-
-	if (!of_node_check_flag(node, OF_DYNAMIC))
-		return;
-
-	while (prop) {
-		struct property *next = prop->next;
-		kfree(prop->name);
-		kfree(prop->value);
-		kfree(prop);
-		prop = next;
-
-		if (!prop) {
-			prop = node->deadprops;
-			node->deadprops = NULL;
-		}
-	}
-	kfree(node->full_name);
-	kfree(node->data);
-	kfree(node);
-}
-
-/**
- *	of_node_put - Decrement refcount of a node
- *	@node:	Node to dec refcount, NULL is supported to
- *		simplify writing of callers
- *
- */
-void of_node_put(struct device_node *node)
-{
-	if (node)
-		kobject_put(&node->kobj);
-}
-EXPORT_SYMBOL(of_node_put);
-#else
-static void of_node_release(struct kobject *kobj)
+#ifndef CONFIG_OF_DYNAMIC
+void of_node_release(struct kobject *kobj)
 {
 	/* Without CONFIG_OF_DYNAMIC, no nodes gets freed */
 }
@@ -264,25 +192,6 @@ int of_node_add(struct device_node *np)
 	return rc;
 }
 
-#if defined(CONFIG_OF_DYNAMIC)
-static void of_node_remove(struct device_node *np)
-{
-	struct property *pp;
-
-	BUG_ON(!of_node_is_initialized(np));
-
-	/* only remove properties if on sysfs */
-	if (of_node_is_attached(np)) {
-		for_each_property_of_node(np, pp)
-			sysfs_remove_bin_file(&np->kobj, &pp->attr);
-		kobject_del(&np->kobj);
-	}
-
-	/* finally remove the kobj_init ref */
-	of_node_put(np);
-}
-#endif
-
 static int __init of_init(void)
 {
 	struct device_node *np;
@@ -1747,28 +1656,6 @@ int of_count_phandle_with_args(const struct device_node *np, const char *list_na
 }
 EXPORT_SYMBOL(of_count_phandle_with_args);
 
-#if defined(CONFIG_OF_DYNAMIC)
-static int of_property_notify(int action, struct device_node *np,
-			      struct property *prop)
-{
-	struct of_prop_reconfig pr;
-
-	/* only call notifiers if the node is attached */
-	if (!of_node_is_attached(np))
-		return 0;
-
-	pr.dn = np;
-	pr.prop = prop;
-	return of_reconfig_notify(action, &pr);
-}
-#else
-static int of_property_notify(int action, struct device_node *np,
-			      struct property *prop)
-{
-	return 0;
-}
-#endif
-
 /**
  * __of_add_property - Add a property to a node without lock operations
  */
@@ -1915,121 +1802,6 @@ int of_update_property(struct device_node *np, struct property *newprop)
 	return 0;
 }
 
-#if defined(CONFIG_OF_DYNAMIC)
-/*
- * Support for dynamic device trees.
- *
- * On some platforms, the device tree can be manipulated at runtime.
- * The routines in this section support adding, removing and changing
- * device tree nodes.
- */
-
-static BLOCKING_NOTIFIER_HEAD(of_reconfig_chain);
-
-int of_reconfig_notifier_register(struct notifier_block *nb)
-{
-	return blocking_notifier_chain_register(&of_reconfig_chain, nb);
-}
-EXPORT_SYMBOL_GPL(of_reconfig_notifier_register);
-
-int of_reconfig_notifier_unregister(struct notifier_block *nb)
-{
-	return blocking_notifier_chain_unregister(&of_reconfig_chain, nb);
-}
-EXPORT_SYMBOL_GPL(of_reconfig_notifier_unregister);
-
-int of_reconfig_notify(unsigned long action, void *p)
-{
-	int rc;
-
-	rc = blocking_notifier_call_chain(&of_reconfig_chain, action, p);
-	return notifier_to_errno(rc);
-}
-
-/**
- * of_attach_node - Plug a device node into the tree and global list.
- */
-int of_attach_node(struct device_node *np)
-{
-	unsigned long flags;
-	int rc;
-
-	rc = of_reconfig_notify(OF_RECONFIG_ATTACH_NODE, np);
-	if (rc)
-		return rc;
-
-	raw_spin_lock_irqsave(&devtree_lock, flags);
-	np->sibling = np->parent->child;
-	np->allnext = np->parent->allnext;
-	np->parent->allnext = np;
-	np->parent->child = np;
-	of_node_clear_flag(np, OF_DETACHED);
-	raw_spin_unlock_irqrestore(&devtree_lock, flags);
-
-	of_node_add(np);
-	return 0;
-}
-
-/**
- * of_detach_node - "Unplug" a node from the device tree.
- *
- * The caller must hold a reference to the node.  The memory associated with
- * the node is not freed until its refcount goes to zero.
- */
-int of_detach_node(struct device_node *np)
-{
-	struct device_node *parent;
-	unsigned long flags;
-	int rc = 0;
-
-	rc = of_reconfig_notify(OF_RECONFIG_DETACH_NODE, np);
-	if (rc)
-		return rc;
-
-	raw_spin_lock_irqsave(&devtree_lock, flags);
-
-	if (of_node_check_flag(np, OF_DETACHED)) {
-		/* someone already detached it */
-		raw_spin_unlock_irqrestore(&devtree_lock, flags);
-		return rc;
-	}
-
-	parent = np->parent;
-	if (!parent) {
-		raw_spin_unlock_irqrestore(&devtree_lock, flags);
-		return rc;
-	}
-
-	if (of_allnodes == np)
-		of_allnodes = np->allnext;
-	else {
-		struct device_node *prev;
-		for (prev = of_allnodes;
-		     prev->allnext != np;
-		     prev = prev->allnext)
-			;
-		prev->allnext = np->allnext;
-	}
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
-
-	of_node_set_flag(np, OF_DETACHED);
-	raw_spin_unlock_irqrestore(&devtree_lock, flags);
-
-	of_node_remove(np);
-	return rc;
-}
-#endif /* defined(CONFIG_OF_DYNAMIC) */
-
 static void of_alias_add(struct alias_prop *ap, struct device_node *np,
 			 int id, const char *stem, int stem_len)
 {
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
new file mode 100644
index 0000000..a5d6f4f
--- /dev/null
+++ b/drivers/of/dynamic.c
@@ -0,0 +1,221 @@
+/*
+ * Support for dynamic device trees.
+ *
+ * On some platforms, the device tree can be manipulated at runtime.
+ * The routines in this section support adding, removing and changing
+ * device tree nodes.
+ */
+
+#include <linux/of.h>
+#include <linux/spinlock.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/proc_fs.h>
+
+#include "of_private.h"
+
+/**
+ *	of_node_get - Increment refcount of a node
+ *	@node:	Node to inc refcount, NULL is supported to
+ *		simplify writing of callers
+ *
+ *	Returns node.
+ */
+struct device_node *of_node_get(struct device_node *node)
+{
+	if (node)
+		kobject_get(&node->kobj);
+	return node;
+}
+EXPORT_SYMBOL(of_node_get);
+
+/**
+ *	of_node_put - Decrement refcount of a node
+ *	@node:	Node to dec refcount, NULL is supported to
+ *		simplify writing of callers
+ *
+ */
+void of_node_put(struct device_node *node)
+{
+	if (node)
+		kobject_put(&node->kobj);
+}
+EXPORT_SYMBOL(of_node_put);
+
+static void of_node_remove(struct device_node *np)
+{
+	struct property *pp;
+
+	BUG_ON(!of_node_is_initialized(np));
+
+	/* only remove properties if on sysfs */
+	if (of_node_is_attached(np)) {
+		for_each_property_of_node(np, pp)
+			sysfs_remove_bin_file(&np->kobj, &pp->attr);
+		kobject_del(&np->kobj);
+	}
+
+	/* finally remove the kobj_init ref */
+	of_node_put(np);
+}
+
+static BLOCKING_NOTIFIER_HEAD(of_reconfig_chain);
+
+int of_reconfig_notifier_register(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&of_reconfig_chain, nb);
+}
+EXPORT_SYMBOL_GPL(of_reconfig_notifier_register);
+
+int of_reconfig_notifier_unregister(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&of_reconfig_chain, nb);
+}
+EXPORT_SYMBOL_GPL(of_reconfig_notifier_unregister);
+
+int of_reconfig_notify(unsigned long action, void *p)
+{
+	int rc;
+
+	rc = blocking_notifier_call_chain(&of_reconfig_chain, action, p);
+	return notifier_to_errno(rc);
+}
+
+int of_property_notify(int action, struct device_node *np,
+			      struct property *prop)
+{
+	struct of_prop_reconfig pr;
+
+	/* only call notifiers if the node is attached */
+	if (!of_node_is_attached(np))
+		return 0;
+
+	pr.dn = np;
+	pr.prop = prop;
+	return of_reconfig_notify(action, &pr);
+}
+
+/**
+ * of_attach_node() - Plug a device node into the tree and global list.
+ */
+int of_attach_node(struct device_node *np)
+{
+	unsigned long flags;
+	int rc;
+
+	rc = of_reconfig_notify(OF_RECONFIG_ATTACH_NODE, np);
+	if (rc)
+		return rc;
+
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	np->sibling = np->parent->child;
+	np->allnext = of_allnodes;
+	np->parent->child = np;
+	of_allnodes = np;
+	of_node_clear_flag(np, OF_DETACHED);
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+
+	of_node_add(np);
+	return 0;
+}
+
+/**
+ * of_detach_node() - "Unplug" a node from the device tree.
+ *
+ * The caller must hold a reference to the node.  The memory associated with
+ * the node is not freed until its refcount goes to zero.
+ */
+int of_detach_node(struct device_node *np)
+{
+	struct device_node *parent;
+	unsigned long flags;
+	int rc = 0;
+
+	rc = of_reconfig_notify(OF_RECONFIG_DETACH_NODE, np);
+	if (rc)
+		return rc;
+
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+
+	if (of_node_check_flag(np, OF_DETACHED)) {
+		/* someone already detached it */
+		raw_spin_unlock_irqrestore(&devtree_lock, flags);
+		return rc;
+	}
+
+	parent = np->parent;
+	if (!parent) {
+		raw_spin_unlock_irqrestore(&devtree_lock, flags);
+		return rc;
+	}
+
+	if (of_allnodes == np)
+		of_allnodes = np->allnext;
+	else {
+		struct device_node *prev;
+
+		for (prev = of_allnodes;
+		     prev->allnext != np;
+		     prev = prev->allnext)
+			;
+		prev->allnext = np->allnext;
+	}
+
+	if (parent->child == np)
+		parent->child = np->sibling;
+	else {
+		struct device_node *prevsib;
+
+		for (prevsib = np->parent->child;
+		     prevsib->sibling != np;
+		     prevsib = prevsib->sibling)
+			;
+		prevsib->sibling = np->sibling;
+	}
+
+	of_node_set_flag(np, OF_DETACHED);
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+
+	of_node_remove(np);
+	return rc;
+}
+
+/**
+ *	of_node_release - release a dynamically allocated node
+ *	@kref:  kref element of the node to be released
+ *
+ *	In of_node_put() this function is passed to kref_put()
+ *	as the destructor.
+ */
+static void of_node_release(struct kobject *kobj)
+{
+	struct device_node *node = kobj_to_device_node(kobj);
+	struct property *prop = node->properties;
+
+	/* We should never be releasing nodes that haven't been detached. */
+	if (!of_node_check_flag(node, OF_DETACHED)) {
+		pr_err("ERROR: Bad of_node_put() on %s\n", node->full_name);
+		dump_stack();
+		return;
+	}
+
+	if (!of_node_check_flag(node, OF_DYNAMIC))
+		return;
+
+	while (prop) {
+		struct property *next = prop->next;
+
+		kfree(prop->name);
+		kfree(prop->value);
+		kfree(prop);
+		prop = next;
+
+		if (!prop) {
+			prop = node->deadprops;
+			node->deadprops = NULL;
+		}
+	}
+	kfree(node->full_name);
+	kfree(node->data);
+	kfree(node);
+}
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index fcc70e7..a541b81 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -33,4 +33,30 @@ struct alias_prop {
 
 extern struct mutex of_mutex;
 extern struct list_head aliases_lookup;
+
+static inline struct device_node *kobj_to_device_node(struct kobject *kobj)
+{
+	return container_of(kobj, struct device_node, kobj);
+}
+
+/* if dynamic is located in dynamic.c, otherwise in base.c */
+extern void of_node_release(struct kobject *kobj);
+
+#if defined(CONFIG_OF_DYNAMIC)
+extern int of_property_notify(int action, struct device_node *np,
+			      struct property *prop);
+extern int of_reconfig_notify(unsigned long action, void *p);
+#else /* CONFIG_OF_DYNAMIC */
+static inline int of_property_notify(int action, struct device_node *np,
+				     struct property *prop)
+{
+	return 0;
+}
+
+static inline int of_reconfig_notify(unsigned long action, void *p)
+{
+	return 0;
+}
+#endif /* CONFIG_OF_DYNAMIC */
+
 #endif /* _LINUX_OF_PRIVATE_H */
diff --git a/include/linux/of.h b/include/linux/of.h
index 2603311..8e4fb82 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -314,6 +314,8 @@ extern int of_add_property(struct device_node *np, struct property *prop);
 extern int of_remove_property(struct device_node *np, struct property *prop);
 extern int of_update_property(struct device_node *np, struct property *newprop);
 
+#if defined(CONFIG_OF_DYNAMIC)
+
 /* For updating the device tree at runtime */
 #define OF_RECONFIG_ATTACH_NODE		0x0001
 #define OF_RECONFIG_DETACH_NODE		0x0002
@@ -328,11 +330,33 @@ struct of_prop_reconfig {
 
 extern int of_reconfig_notifier_register(struct notifier_block *);
 extern int of_reconfig_notifier_unregister(struct notifier_block *);
-extern int of_reconfig_notify(unsigned long, void *);
 
 extern int of_attach_node(struct device_node *);
 extern int of_detach_node(struct device_node *);
 
+#else
+
+static inline int of_reconfig_notifier_register(struct notifier_block *);
+{
+	return 0;
+}
+
+static inline int of_reconfig_notifier_unregister(struct notifier_block *)
+{
+	return 0;
+}
+
+static inline int of_attach_node(struct device_node *)
+{
+	return -ENOTSUPP;
+}
+
+static inline int of_detach_node(struct device_node *)
+{
+	return -ENOTSUPP;
+}
+#endif
+
 #define of_match_ptr(_ptr)	(_ptr)
 
 /*
-- 
1.7.12
