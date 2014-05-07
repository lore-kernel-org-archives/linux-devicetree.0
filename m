From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/4] of/selftest: add testcase for nodes with same name and address
Date: Wed,  7 May 2014 16:48:15 -0500
Message-ID: <1399499298-8830-2-git-send-email-robherring2@gmail.com>
References: <1399499298-8830-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399499298-8830-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Add a test case for nodes which have the same name and same
non-translatable unit address.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/of/selftest.c                        | 23 ++++++++++++++++++
 drivers/of/testcase-data/testcases.dtsi      |  1 +
 drivers/of/testcase-data/tests-platform.dtsi | 35 ++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 drivers/of/testcase-data/tests-platform.dtsi

diff --git a/drivers/of/selftest.c b/drivers/of/selftest.c
index ae44500..c93cb4a 100644
--- a/drivers/of/selftest.c
+++ b/drivers/of/selftest.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
+#include <linux/of_platform.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
@@ -427,6 +428,27 @@ static void __init of_selftest_match_node(void)
 	}
 }
 
+static void __init of_selftest_platform_populate(void)
+{
+	struct device_node *np, *child;
+	int rc;
+	struct of_device_id match[] = {
+		{ .compatible = "test-device", },
+		{}
+	};
+
+	np = of_find_node_by_path("/testcase-data/platform-tests");
+	if (!np) {
+		pr_err("No testcase data in device tree\n");
+		return;
+	}
+
+	for_each_child_of_node(np, child) {
+		rc = of_platform_populate(child, match, NULL, NULL);
+		selftest(!rc, "Could not create device for node '%s'\n", child->name);
+	}
+}
+
 static int __init of_selftest(void)
 {
 	struct device_node *np;
@@ -445,6 +467,7 @@ static int __init of_selftest(void)
 	of_selftest_parse_interrupts();
 	of_selftest_parse_interrupts_extended();
 	of_selftest_match_node();
+	of_selftest_platform_populate();
 	pr_info("end of selftest - %i passed, %i failed\n",
 		selftest_results.passed, selftest_results.failed);
 	return 0;
diff --git a/drivers/of/testcase-data/testcases.dtsi b/drivers/of/testcase-data/testcases.dtsi
index 3a5b75a..6d8d980a 100644
--- a/drivers/of/testcase-data/testcases.dtsi
+++ b/drivers/of/testcase-data/testcases.dtsi
@@ -1,3 +1,4 @@
 #include "tests-phandle.dtsi"
 #include "tests-interrupts.dtsi"
 #include "tests-match.dtsi"
+#include "tests-platform.dtsi"
diff --git a/drivers/of/testcase-data/tests-platform.dtsi b/drivers/of/testcase-data/tests-platform.dtsi
new file mode 100644
index 0000000..eb20eeb
--- /dev/null
+++ b/drivers/of/testcase-data/tests-platform.dtsi
@@ -0,0 +1,35 @@
+
+/ {
+	testcase-data {
+		platform-tests {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			test-device@0 {
+				compatible = "test-device";
+				reg = <0x0>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dev@100 {
+					compatible = "test-sub-device";
+					reg = <0x100>;
+				};
+			};
+
+			test-device@1 {
+				compatible = "test-device";
+				reg = <0x1>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dev@100 {
+					compatible = "test-sub-device";
+					reg = <0x100>;
+				};
+			};
+		};
+	};
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
