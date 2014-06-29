From: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Adding selftest testdata dynamically into live tree
Date: Sun, 29 Jun 2014 16:49:03 -0700
Message-ID: <1404085743-6974-1-git-send-email-gaurav.minocha.os@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gaurav.minocha-cmaem7PIVQRC8prJL3GQQw@public.gmane.org, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch attaches selftest's device tree data (required by /drivers/of/selftest.c)
dynamically into live device tree. First, it links selftest device tree data into the
kernel image and then iterates over all the nodes and attaches them into the live tree.

This patch will remove the manual process of addition and removal of selftest device
tree data into the machine's dts file.

Tested successfully with current selftest's testcases.

Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/versatile-pb.dts                 |    2 -
 drivers/of/Kconfig                                 |    3 +-
 drivers/of/Makefile                                |    3 +-
 drivers/of/selftest.c                              |  102 ++++++++++++++++++++
 .../{testcases.dtsi => testcases.dts}              |    1 +
 5 files changed, 107 insertions(+), 4 deletions(-)
 rename drivers/of/testcase-data/{testcases.dtsi => testcases.dts} (92%)

diff --git a/arch/arm/boot/dts/versatile-pb.dts b/arch/arm/boot/dts/versatile-pb.dts
index 65f6577..8d39677 100644
--- a/arch/arm/boot/dts/versatile-pb.dts
+++ b/arch/arm/boot/dts/versatile-pb.dts
@@ -46,5 +46,3 @@
 		};
 	};
 };
-
-#include <testcases.dtsi>
diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index 2dcb054..4e4f6f3 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -8,8 +8,9 @@ menu "Device Tree and Open Firmware support"
 	depends on OF
 
 config OF_SELFTEST
-	bool "Device Tree Runtime self tests"
+	tristate "Device Tree Runtime self tests"
 	depends on OF_IRQ
+	select OF_DYNAMIC
 	help
 	  This option builds in test cases for the device tree infrastructure
 	  that are executed once at boot time, and the results dumped to the
diff --git a/drivers/of/Makefile b/drivers/of/Makefile
index 099b1fb..b9e753b 100644
--- a/drivers/of/Makefile
+++ b/drivers/of/Makefile
@@ -5,7 +5,8 @@ obj-$(CONFIG_OF_PROMTREE) += pdt.o
 obj-$(CONFIG_OF_ADDRESS)  += address.o
 obj-$(CONFIG_OF_IRQ)    += irq.o
 obj-$(CONFIG_OF_NET)	+= of_net.o
-obj-$(CONFIG_OF_SELFTEST) += selftest.o
+obj-$(CONFIG_OF_SELFTEST) += of_selftest.o
+of_selftest-objs := selftest.o testcase-data/testcases.dtb.o
 obj-$(CONFIG_OF_MDIO)	+= of_mdio.o
 obj-$(CONFIG_OF_PCI)	+= of_pci.o
 obj-$(CONFIG_OF_PCI_IRQ)  += of_pci_irq.o
diff --git a/drivers/of/selftest.c b/drivers/of/selftest.c
index 077314e..fa68f91 100644
--- a/drivers/of/selftest.c
+++ b/drivers/of/selftest.c
@@ -9,6 +9,7 @@
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_fdt.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/list.h>
@@ -21,6 +22,9 @@ static struct selftest_results {
 	int failed;
 } selftest_results;
 
+static void *selftest_data;
+static struct device_node *selftest_data_node;
+
 #define selftest(result, fmt, ...) { \
 	if (!(result)) { \
 		selftest_results.failed++; \
@@ -517,9 +521,107 @@ static void __init of_selftest_platform_populate(void)
 	}
 }
 
+/**
+ *	update_node_properties - adds the properties
+ *	of np into dup node (present in live tree) and
+ *	updates parent of children of np to dup.
+ *
+ *	@np:	node already present in live tree
+ *	@dup:	node present in live tree to be updated
+ */
+static void update_node_properties(struct device_node *np,
+					struct device_node *dup)
+{
+	struct property *prop;
+	struct device_node *child;
+
+	for_each_property_of_node(np, prop)
+		of_add_property(dup, prop);
+
+	for_each_child_of_node(np, child)
+		child->parent = dup;
+}
+
+/**
+ *	attach_node_and_children - attaches nodes
+ *	and its children to live tree
+ *
+ *	@np:	Node to attach to live tree
+ */
+static int attach_node_and_children(struct device_node *np)
+{
+	struct device_node *next, *root = np, *dup;
+
+	if (!np) {
+		pr_warn("%s: No tree to attach; not running tests\n",
+			__func__);
+		return -ENODATA;
+	}
+
+
+	/* skip root node */
+	np = np->child;
+
+	while (np) {
+		next = np->allnext;
+		dup = of_find_node_by_path(np->full_name);
+		if (dup)
+			update_node_properties(np, dup);
+		else {
+			np->child = NULL;
+			if (np->parent == root)
+				np->parent = of_allnodes;
+			of_attach_node(np);
+		}
+		np = next;
+	}
+
+	return 0;
+}
+
+/**
+ *	selftest_data_init - Reads, copies data from
+ *	linked tree and attaches it to the live tree
+ */
+static int selftest_data_init(void)
+{
+	int size;
+	extern uint8_t __dtb_testcases_begin[];
+	extern uint8_t __dtb_testcases_end[];
+
+	selftest_data = (void *)__dtb_testcases_begin;
+
+	if (!selftest_data) {
+		pr_warn("%s: No testcase data to attach; not running tests\n",
+			__func__);
+		return -ENODATA;
+	}
+
+	size = __dtb_testcases_end - __dtb_testcases_begin;
+
+	/* creating copy */
+	selftest_data = kmemdup(selftest_data, size, GFP_KERNEL);
+	if (!selftest_data) {
+		pr_warn("%s: Failed to allocate memory for selftest_data; "
+			"not running tests\n", __func__);
+		return -ENOMEM;
+	}
+	of_fdt_unflatten_tree((unsigned long *)selftest_data,
+						&selftest_data_node);
+
+	/* attach the sub-tree to live tree */
+	return attach_node_and_children(selftest_data_node);
+}
+
 static int __init of_selftest(void)
 {
 	struct device_node *np;
+	int res;
+
+	/* adding data for selftest */
+	res = selftest_data_init();
+	if (res)
+		return res;
 
 	np = of_find_node_by_path("/testcase-data/phandle-tests/consumer-a");
 	if (!np) {
diff --git a/drivers/of/testcase-data/testcases.dtsi b/drivers/of/testcase-data/testcases.dts
similarity index 92%
rename from drivers/of/testcase-data/testcases.dtsi
rename to drivers/of/testcase-data/testcases.dts
index 6d8d980a..8e7568e 100644
--- a/drivers/of/testcase-data/testcases.dtsi
+++ b/drivers/of/testcase-data/testcases.dts
@@ -1,3 +1,4 @@
+/dts-v1/;
 #include "tests-phandle.dtsi"
 #include "tests-interrupts.dtsi"
 #include "tests-match.dtsi"
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
