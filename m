From: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Enabling OF selftest to run without machine's devicetree
Date: Sat, 26 Jul 2014 12:48:50 -0700
Message-ID: <1406404130-27289-1-git-send-email-gaurav.minocha.os@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

If there is no devicetree present, this patch adds the selftest
data as a live devicetree. It also removes the same after the
testcase execution is complete.

Tested with and without machine's devicetree.

Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/fdt.c      |    3 +++
 drivers/of/selftest.c |   34 ++++++++++++++++++++++++++++++----
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index b777d8f..18088c0 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -366,6 +366,9 @@ void of_fdt_unflatten_tree(unsigned long *blob,
 			struct device_node **mynodes)
 {
 	__unflatten_device_tree(blob, mynodes, &kernel_tree_alloc);
+
+	/* Get pointer to "/chosen" and "/aliases" nodes for use everywhere */
+	of_alias_scan(&kernel_tree_alloc);
 }
 EXPORT_SYMBOL_GPL(of_fdt_unflatten_tree);
 
diff --git a/drivers/of/selftest.c b/drivers/of/selftest.c
index 3a1c5b5..34c9899 100644
--- a/drivers/of/selftest.c
+++ b/drivers/of/selftest.c
@@ -16,6 +16,7 @@
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/device.h>
+#include <linux/proc_fs.h>
 
 static struct selftest_results {
 	int passed;
@@ -25,6 +26,7 @@ static struct selftest_results {
 #define NO_OF_NODES 2
 static struct device_node *nodes[NO_OF_NODES];
 static int last_node_index;
+static bool selftest_live_tree;
 
 #define selftest(result, fmt, ...) { \
 	if (!(result)) { \
@@ -595,7 +597,7 @@ static int attach_node_and_children(struct device_node *np)
 static int __init selftest_data_add(void)
 {
 	void *selftest_data;
-	struct device_node *selftest_data_node;
+	struct device_node *selftest_data_node, *np;
 	extern uint8_t __dtb_testcases_begin[];
 	extern uint8_t __dtb_testcases_end[];
 	const int size = __dtb_testcases_end - __dtb_testcases_begin;
@@ -614,10 +616,31 @@ static int __init selftest_data_add(void)
 			"not running tests\n", __func__);
 		return -ENOMEM;
 	}
-	of_fdt_unflatten_tree(selftest_data, &selftest_data_node);
 
-	/* attach the sub-tree to live tree */
-	return attach_node_and_children(selftest_data_node);
+	if (!of_allnodes) {
+		/* enabling flag for removing nodes */
+		selftest_live_tree = true;
+
+		of_fdt_unflatten_tree(selftest_data, &of_allnodes);
+		if (!of_allnodes) {
+			pr_warn("%s: No tree to attach; not running tests\n",
+				__func__);
+			return -ENODATA;
+		}
+
+		for_each_of_allnodes(np)
+			of_node_add(np);
+
+		/* Symlink in /proc as required by userspace ABI */
+		proc_symlink("device-tree", NULL, "/sys/firmware/devicetree/base");
+
+		return 0;
+	} else {
+		of_fdt_unflatten_tree(selftest_data, &selftest_data_node);
+
+		/* attach the sub-tree to live tree */
+		return attach_node_and_children(selftest_data_node);
+	}
 }
 
 /**
@@ -646,6 +669,9 @@ static void selftest_data_remove(void)
 	struct device_node *np;
 	struct property *prop;
 
+	if (selftest_live_tree)
+		return detach_node_and_children(of_allnodes);
+
 	while (last_node_index >= 0) {
 		if (nodes[last_node_index]) {
 			np = of_find_node_by_path(nodes[last_node_index]->full_name);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
