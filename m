From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v5 11/11] lib/test_printf: Add tests for %pfw printk modifier
Date: Mon,  2 Sep 2019 16:57:32 +0300
Message-ID: <20190902135732.23455-12-sakari.ailus@linux.intel.com>
References: <20190902135732.23455-1-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190902135732.23455-1-sakari.ailus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Add a test for the %pfw printk modifier using software nodes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 lib/test_printf.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/lib/test_printf.c b/lib/test_printf.c
index 944eb50f38625..9c6d716979fb1 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -22,6 +22,8 @@
 #include <linux/gfp.h>
 #include <linux/mm.h>
 
+#include <linux/property.h>
+
 #include "../tools/testing/selftests/kselftest_module.h"
 
 #define BUF_SIZE 256
@@ -588,6 +590,40 @@ flags(void)
 	kfree(cmp_buffer);
 }
 
+static void __init fwnode_pointer(void)
+{
+	const struct software_node softnodes[] = {
+		{ .name = "first", },
+		{ .name = "second", .parent = &softnodes[0], },
+		{ .name = "third", .parent = &softnodes[1], },
+		{ NULL /* Guardian */ },
+	};
+	const char * const full_name = "/second/third";
+	const char * const full_name_second = "/second";
+	const char * const second_name = "second";
+	const char * const third_name = "third";
+	int rval;
+
+	rval = software_node_register_nodes(softnodes);
+	if (rval) {
+		pr_warn("cannot register softnodes; rval %d\n", rval);
+		return;
+	}
+
+	test(full_name_second, "%pfw",
+	     software_node_fwnode(&softnodes[ARRAY_SIZE(softnodes) - 3]));
+	test(full_name, "%pfw",
+	     software_node_fwnode(&softnodes[ARRAY_SIZE(softnodes) - 2]));
+	test(full_name, "%pfwf",
+	     software_node_fwnode(&softnodes[ARRAY_SIZE(softnodes) - 2]));
+	test(second_name, "%pfwP",
+	     software_node_fwnode(&softnodes[ARRAY_SIZE(softnodes) - 3]));
+	test(third_name, "%pfwP",
+	     software_node_fwnode(&softnodes[ARRAY_SIZE(softnodes) - 2]));
+
+	software_node_unregister_nodes(softnodes);
+}
+
 static void __init
 test_pointer(void)
 {
@@ -610,6 +646,7 @@ test_pointer(void)
 	bitmap();
 	netdev_features();
 	flags();
+	fwnode_pointer();
 }
 
 static void __init selftest(void)
-- 
2.20.1
