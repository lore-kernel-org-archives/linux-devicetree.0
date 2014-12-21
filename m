From: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Removes OF_UNITTEST dependency on OF_DYNAMIC config symbol
Date: Sat, 20 Dec 2014 23:30:49 -0800
Message-ID: <1419147049-3998-1-git-send-email-gaurav.minocha.os@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch intends to remove the unittests dependency on
the fuctions defined in dynamic.c. So, rather than calling
of_attach_node defined in dynamic.c, minimal functionality
required to attach a new node is re-defined in unittest.c.
Also, now after executing the tests the test data is not
removed from the device tree so there is no need to call
of_detach_node.

Tested with and without OF_DYNAMIC enabled on ppc, arm and
x86

Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/Kconfig    |  1 -
 drivers/of/unittest.c | 69 +++++++++------------------------------------------
 2 files changed, 12 insertions(+), 58 deletions(-)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index b5e0c87..38d1c51 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -10,7 +10,6 @@ menu "Device Tree and Open Firmware support"
 config OF_UNITTEST
 	bool "Device Tree runtime unit tests"
 	depends on OF_IRQ && OF_EARLY_FLATTREE
-	select OF_DYNAMIC
 	select OF_RESOLVE
 	help
 	  This option builds in test cases for the device tree infrastructure
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 844838e..920b3fb 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -822,6 +822,7 @@ static void update_node_properties(struct device_node *np,
 static int attach_node_and_children(struct device_node *np)
 {
 	struct device_node *next, *dup, *child;
+	unsigned long flags;
 
 	dup = of_find_node_by_path(np->full_name);
 	if (dup) {
@@ -839,7 +840,17 @@ static int attach_node_and_children(struct device_node *np)
 	child = np->child;
 	np->child = NULL;
 	np->sibling = NULL;
-	of_attach_node(np);
+
+	mutex_lock(&of_mutex);
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	np->sibling = np->parent->child;
+	np->parent->child = np;
+	of_node_clear_flag(np, OF_DETACHED);
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+
+	__of_attach_node_sysfs(np);
+	mutex_unlock(&of_mutex);
+
 	while (child) {
 		next = child->sibling;
 		attach_node_and_children(child);
@@ -911,59 +922,6 @@ static int __init selftest_data_add(void)
 	return 0;
 }
 
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
-}
-
-/**
- *	selftest_data_remove - removes the selftest data
- *	nodes from the live tree
- */
-static void selftest_data_remove(void)
-{
-	struct device_node *np;
-	struct property *prop;
-
-	if (selftest_live_tree) {
-		of_node_put(of_aliases);
-		of_node_put(of_chosen);
-		of_aliases = NULL;
-		of_chosen = NULL;
-		for_each_child_of_node(of_root, np)
-			detach_node_and_children(np);
-		__of_detach_node_sysfs(of_root);
-		of_root = NULL;
-		return;
-	}
-
-	while (last_node_index-- > 0) {
-		if (nodes[last_node_index]) {
-			np = of_find_node_by_path(nodes[last_node_index]->full_name);
-			if (np == nodes[last_node_index]) {
-				if (of_aliases == np) {
-					of_node_put(of_aliases);
-					of_aliases = NULL;
-				}
-				detach_node_and_children(np);
-			} else {
-				for_each_property_of_node(np, prop) {
-					if (strcmp(prop->name, "testcase-alias") == 0)
-						of_remove_property(np, prop);
-				}
-			}
-		}
-	}
-}
-
 #ifdef CONFIG_OF_OVERLAY
 
 static int selftest_probe(struct platform_device *pdev)
@@ -1475,9 +1433,6 @@ static int __init of_selftest(void)
 	of_selftest_platform_populate();
 	of_selftest_overlay();
 
-	/* removing selftest data from live tree */
-	selftest_data_remove();
-
 	/* Double check linkage after removing testcase data */
 	of_selftest_check_tree_linkage();
 
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
