From: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Subject: [PATCH] drivers/of: add option to load a default Device Tree
Date: Wed, 22 Jun 2016 17:05:54 +0200
Message-ID: <1466607954-2821-1-git-send-email-franck.jullien@odyssee-systemes.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jose.abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Even if a platform doesn't use a device tree during its
boot process it can be useful to enable CONFIG_OF and get
an empty device tree.

Then, devices can use device tree overlays to populate this
default tree.

Signed-off-by: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
---
 drivers/of/Kconfig     |  9 +++++++++
 drivers/of/Makefile    |  3 +++
 drivers/of/base.c      | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/of/default.dts |  4 ++++
 drivers/of/unittest.c  | 33 +++++----------------------------
 include/linux/of.h     |  2 ++
 6 files changed, 73 insertions(+), 28 deletions(-)
 create mode 100644 drivers/of/default.dts

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index b3bec3a..ed60af7 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -11,6 +11,15 @@ menuconfig OF
 
 if OF
 
+config OF_DEFAULT_DTB
+	bool "Load default empty Device Tree"
+	depends on OF_IRQ
+	select OF_EARLY_FLATTREE
+	select OF_RESOLVE
+	help
+	  This option builds in an empty device tree.
+	  If unsure, say N here, but this option is safe to enable.
+
 config OF_UNITTEST
 	bool "Device Tree runtime unit tests"
 	depends on OF_IRQ
diff --git a/drivers/of/Makefile b/drivers/of/Makefile
index d7efd9d..e611dc0 100644
--- a/drivers/of/Makefile
+++ b/drivers/of/Makefile
@@ -15,4 +15,7 @@ obj-$(CONFIG_OF_RESOLVE)  += resolver.o
 obj-$(CONFIG_OF_OVERLAY) += overlay.o
 obj-$(CONFIG_OF_NUMA) += of_numa.o
 
+obj-y += default.dtb.o
+targets += default.dtb default.dtb.S
+
 obj-$(CONFIG_OF_UNITTEST) += unittest-data/
diff --git a/drivers/of/base.c b/drivers/of/base.c
index ebf84e3..43ebf5f 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -23,6 +23,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
+#include <linux/of_fdt.h>
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 #include <linux/string.h>
@@ -189,10 +190,55 @@ int __of_attach_node_sysfs(struct device_node *np)
 	return 0;
 }
 
+int of_get_builtin_dtb(uint8_t *dtb_begin, uint8_t *dtb_end, struct device_node **dtb_node)
+{
+	const int size = dtb_end - dtb_begin;
+	void *dtb;
+	struct device_node *node;
+	int rc;
+
+	if (!size) {
+		pr_warn("%s: No DTB to attach\n", __func__);
+		return -ENODATA;
+	}
+
+	dtb = kmemdup(dtb_begin, size, GFP_KERNEL);
+
+	if (!dtb_begin) {
+		pr_warn("%s: Failed to allocate memory for built-in dtb\n", __func__);
+		return -ENOMEM;
+	}
+
+	of_fdt_unflatten_tree(dtb, NULL, &node);
+	if (!node) {
+		pr_warn("%s: No tree to attach\n", __func__);
+		return -ENODATA;
+	}
+
+	of_node_set_flag(node, OF_DETACHED);
+	rc = of_resolve_phandles(node);
+	if (rc) {
+		pr_err("%s: Failed to resolve phandles (rc=%i)\n", __func__, rc);
+		return -EINVAL;
+	}
+
+	*dtb_node = node;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_get_builtin_dtb);
+
 void __init of_core_init(void)
 {
 	struct device_node *np;
 
+	/*
+	 * __dtb_default_begin[] and __dtb_default_end[] are magically
+	 * created by cmd_dt_S_dtb in scripts/Makefile.lib
+	 */
+	extern uint8_t __dtb_default_begin[];
+	extern uint8_t __dtb_default_end[];
+
 	/* Create the kset, and register existing nodes */
 	mutex_lock(&of_mutex);
 	of_kset = kset_create_and_add("devicetree", NULL, firmware_kobj);
@@ -201,6 +247,10 @@ void __init of_core_init(void)
 		pr_err("devicetree: failed to register existing nodes\n");
 		return;
 	}
+
+	if (!of_root && IS_ENABLED(CONFIG_OF_DEFAULT_DTB))
+		of_get_builtin_dtb(__dtb_default_begin, __dtb_default_end, &of_root);
+
 	for_each_of_allnodes(np)
 		__of_attach_node_sysfs(np);
 	mutex_unlock(&of_mutex);
diff --git a/drivers/of/default.dts b/drivers/of/default.dts
new file mode 100644
index 0000000..fc387fb
--- /dev/null
+++ b/drivers/of/default.dts
@@ -0,0 +1,4 @@
+/dts-v1/;
+/ {
+
+};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index f34ed93..2400e78 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -895,42 +895,19 @@ static int attach_node_and_children(struct device_node *np)
  */
 static int __init unittest_data_add(void)
 {
-	void *unittest_data;
 	struct device_node *unittest_data_node, *np;
+	int rc;
+
 	/*
 	 * __dtb_testcases_begin[] and __dtb_testcases_end[] are magically
 	 * created by cmd_dt_S_dtb in scripts/Makefile.lib
 	 */
 	extern uint8_t __dtb_testcases_begin[];
 	extern uint8_t __dtb_testcases_end[];
-	const int size = __dtb_testcases_end - __dtb_testcases_begin;
-	int rc;
-
-	if (!size) {
-		pr_warn("%s: No testcase data to attach; not running tests\n",
-			__func__);
-		return -ENODATA;
-	}
-
-	/* creating copy */
-	unittest_data = kmemdup(__dtb_testcases_begin, size, GFP_KERNEL);
 
-	if (!unittest_data) {
-		pr_warn("%s: Failed to allocate memory for unittest_data; "
-			"not running tests\n", __func__);
-		return -ENOMEM;
-	}
-	of_fdt_unflatten_tree(unittest_data, NULL, &unittest_data_node);
-	if (!unittest_data_node) {
-		pr_warn("%s: No tree to attach; not running tests\n", __func__);
-		return -ENODATA;
-	}
-	of_node_set_flag(unittest_data_node, OF_DETACHED);
-	rc = of_resolve_phandles(unittest_data_node);
-	if (rc) {
-		pr_err("%s: Failed to resolve phandles (rc=%i)\n", __func__, rc);
-		return -EINVAL;
-	}
+	rc = of_get_builtin_dtb(__dtb_testcases_begin, __dtb_testcases_end, &unittest_data_node);
+	if (rc)
+		return rc;
 
 	if (!of_root) {
 		of_root = unittest_data_node;
diff --git a/include/linux/of.h b/include/linux/of.h
index 74eb28c..5cab2b5 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -406,6 +406,8 @@ const char *of_prop_next_string(struct property *prop, const char *cur);
 
 bool of_console_check(struct device_node *dn, char *name, int index);
 
+int of_get_builtin_dtb(uint8_t *dtb_begin, uint8_t *dtb_end, struct device_node **dtb_node);
+
 #else /* CONFIG_OF */
 
 static inline void of_core_init(void)
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
