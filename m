From: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Removes OF_SELFTEST dependency on OF_DYNAMIC
Date: Mon, 25 Aug 2014 06:43:34 -0700
Message-ID: <1408974215-24887-1-git-send-email-gaurav.minocha.os@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch is used to remove the selftests dependency on
OF_DYNAMIC config flag. Now, it executes only the tests
that do not depend upon CONFIG_OF_DYNAMIC. Also, it
defines the functions to attach and detach the node
if OF_DYNAMIC flag isn't enabled.

Tested with and without OF_DYNAMIC enabled.

Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/Kconfig    |    1 -
 drivers/of/selftest.c |  103 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index 5160c4e..1fe3805 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -10,7 +10,6 @@ menu "Device Tree and Open Firmware support"
 config OF_SELFTEST
 	bool "Device Tree Runtime self tests"
 	depends on OF_IRQ && OF_EARLY_FLATTREE
-	select OF_DYNAMIC
 	help
 	  This option builds in test cases for the device tree infrastructure
 	  that are executed once at boot time, and the results dumped to the
diff --git a/drivers/of/selftest.c b/drivers/of/selftest.c
index a737cb5..7330007 100644
--- a/drivers/of/selftest.c
+++ b/drivers/of/selftest.c
@@ -39,6 +39,103 @@ static bool selftest_live_tree;
 	} \
 }
 
+#if !defined(CONFIG_OF_DYNAMIC)
+void __of_attach_node(struct device_node *np)
+{
+	const __be32 *phandle;
+	int sz;
+
+	np->name = __of_get_property(np, "name", NULL) ? : "<NULL>";
+	np->type = __of_get_property(np, "device_type", NULL) ? : "<NULL>";
+	phandle = __of_get_property(np, "phandle", &sz);
+	if (!phandle)
+		phandle = __of_get_property(np, "linux,phandle", &sz);
+	if (IS_ENABLED(PPC_PSERIES) && !phandle)
+		phandle = __of_get_property(np, "ibm,phandle", &sz);
+	np->phandle = (phandle && (sz >= 4)) ? be32_to_cpup(phandle) : 0;
+	np->sibling = np->parent->child;
+	np->allnext = np->parent->allnext;
+	np->parent->allnext = np;
+	np->parent->child = np;
+	of_node_clear_flag(np, OF_DETACHED);
+}
+
+/**
+ * of_attach_node() - Plug a device node into the tree and global list.
+ */
+int of_attach_node(struct device_node *np)
+{
+	unsigned long flags;
+
+	mutex_lock(&of_mutex);
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	__of_attach_node(np);
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+	mutex_unlock(&of_mutex);
+
+	return 0;
+}
+
+void __of_detach_node(struct device_node *np)
+{
+	struct device_node *parent;
+
+	if (WARN_ON(of_node_check_flag(np, OF_DETACHED)))
+		return;
+
+	parent = np->parent;
+	if (WARN_ON(!parent))
+		return;
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
+	unsigned long flags;
+	int rc = 0;
+
+	mutex_lock(&of_mutex);
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	__of_detach_node(np);
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+
+	mutex_unlock(&of_mutex);
+
+	return rc;
+}
+#endif
+
 static void __init of_selftest_find_node_by_name(void)
 {
 	struct device_node *np;
@@ -86,6 +183,7 @@ static void __init of_selftest_find_node_by_name(void)
 
 static void __init of_selftest_dynamic(void)
 {
+#ifdef CONFIG_OF_DYNAMIC
 	struct device_node *np;
 	struct property *prop;
 
@@ -143,6 +241,7 @@ static void __init of_selftest_dynamic(void)
 	if (prop->value)
 		selftest(of_add_property(np, prop) == 0,
 			 "Adding a large property should have passed\n");
+#endif
 }
 
 static void __init of_selftest_parse_phandle_with_args(void)
@@ -697,7 +796,9 @@ static int __init selftest_data_add(void)
 		of_allnodes = selftest_data_node;
 
 		for_each_of_allnodes(np)
+#ifdef CONFIG_OF_DYNAMIC
 			__of_attach_node_sysfs(np);
+#endif
 		of_aliases = of_find_node_by_path("/aliases");
 		of_chosen = of_find_node_by_path("/chosen");
 		return 0;
@@ -740,7 +841,9 @@ static void selftest_data_remove(void)
 		of_chosen = NULL;
 		for_each_child_of_node(of_allnodes, np)
 			detach_node_and_children(np);
+#ifdef CONFIG_OF_DYNAMIC
 		__of_detach_node_sysfs(of_allnodes);
+#endif
 		of_allnodes = NULL;
 		return;
 	}
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
