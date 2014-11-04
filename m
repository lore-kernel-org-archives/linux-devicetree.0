From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] of/unittest: Remove test devices after adding them
Date: Tue,  4 Nov 2014 13:37:52 +0000
Message-ID: <1415108273-4536-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The of_platform_populate() test cases don't remove the test devices
after they are added. Fix this by adding tests for
of_platform_depopulate().

At the same time rework the selftest() macro to return the test result
value. This makes it easy to use the macro inside an if() condition.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/selftest.c | 39 ++++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/of/selftest.c b/drivers/of/selftest.c
index bf7d99317a94..082bb2b6a5ad 100644
--- a/drivers/of/selftest.c
+++ b/drivers/of/selftest.c
@@ -30,15 +30,17 @@ static struct device_node *nodes[NO_OF_NODES];
 static int last_node_index;
 static bool selftest_live_tree;
 
-#define selftest(result, fmt, ...) { \
-	if (!(result)) { \
+#define selftest(result, fmt, ...) ({ \
+	bool failed = !(result); \
+	if (failed) { \
 		selftest_results.failed++; \
 		pr_err("FAIL %s():%i " fmt, __func__, __LINE__, ##__VA_ARGS__); \
 	} else { \
 		selftest_results.passed++; \
 		pr_debug("pass %s():%i\n", __func__, __LINE__); \
 	} \
-}
+	failed; \
+})
 
 static void __init of_selftest_find_node_by_name(void)
 {
@@ -694,10 +696,13 @@ static void __init of_selftest_match_node(void)
 	}
 }
 
+struct device test_bus = {
+	.init_name = "unittest-bus",
+};
 static void __init of_selftest_platform_populate(void)
 {
-	int irq;
-	struct device_node *np, *child;
+	int irq, rc;
+	struct device_node *np, *child, *grandchild;
 	struct platform_device *pdev;
 	struct of_device_id match[] = {
 		{ .compatible = "test-device", },
@@ -722,20 +727,32 @@ static void __init of_selftest_platform_populate(void)
 	irq = platform_get_irq(pdev, 0);
 	selftest(irq < 0 && irq != -EPROBE_DEFER, "device parsing error failed - %d\n", irq);
 
-	np = of_find_node_by_path("/testcase-data/platform-tests");
-	if (!np) {
-		pr_err("No testcase data in device tree\n");
+	if (selftest(np = of_find_node_by_path("/testcase-data/platform-tests"),
+		     "No testcase data in device tree\n"));
+		return;
+
+	if (selftest(!(rc = device_register(&test_bus)),
+		     "testbus registration failed; rc=%i\n", rc));
 		return;
-	}
 
 	for_each_child_of_node(np, child) {
-		struct device_node *grandchild;
-		of_platform_populate(child, match, NULL, NULL);
+		of_platform_populate(child, match, NULL, &test_bus);
 		for_each_child_of_node(child, grandchild)
 			selftest(of_find_device_by_node(grandchild),
 				 "Could not create device for node '%s'\n",
 				 grandchild->name);
 	}
+
+	of_platform_depopulate(&test_bus);
+	for_each_child_of_node(np, child) {
+		for_each_child_of_node(child, grandchild)
+			selftest(!of_find_device_by_node(grandchild),
+				 "device didn't get destroyed '%s'\n",
+				 grandchild->name);
+	}
+
+	device_unregister(&test_bus);
+	of_node_put(np);
 }
 
 /**
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
