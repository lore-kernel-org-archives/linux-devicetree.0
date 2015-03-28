From: Grant Likely <grant.likely@linaro.org>
Subject: [PATCH] of/unittest: Fix of_platform_depopulate test case
Date: Fri, 27 Mar 2015 21:08:27 -0700
Message-ID: <1427515707-29879-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Frank Rowand <frank.rowand@sonymobile.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pawel Moll <pawel.moll@arm.com>
List-Id: devicetree@vger.kernel.org

The previous commit, "of/unittest: early return from test skips tests"
exposed broken tests for the of_platform_unpopulate() function. The
problem was the populate and depopulate calls were not symmetrical like
they were intended to be, and unpopulate depends on the parent device to
have it's of_node pointer pointing to the parent device node. Fix these
bugs so that the test case works correctly.

In the process, the test_bus used as a container for the test devices
has been changed from a statically allocated struct device (which is
bad) to a properly allocated device with a .release() method (which is
good). This stops the test code from being a bad example of abusing the
device model.

Signed-off-by: Grant Likely <grant.likely@linaro.org>
Cc: Frank Rowand <frank.rowand@sonymobile.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Pawel Moll <pawel.moll@arm.com>
---

(I've already got this commit in my tree queued up after the patch that
exposes the bug, which is why I've written the description the way I
did.)

 drivers/of/unittest.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 3b155774dfee..a4f90c238e78 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -751,14 +751,14 @@ static void __init of_selftest_match_node(void)
 	}
 }
 
-struct device test_bus = {
-	.init_name = "unittest-bus",
+static const struct platform_device_info test_bus_info = {
+	.name = "unittest-bus",
 };
 static void __init of_selftest_platform_populate(void)
 {
 	int irq, rc;
 	struct device_node *np, *child, *grandchild;
-	struct platform_device *pdev;
+	struct platform_device *pdev, *test_bus;
 	const struct of_device_id match[] = {
 		{ .compatible = "test-device", },
 		{}
@@ -787,20 +787,22 @@ static void __init of_selftest_platform_populate(void)
 	if (!np)
 		return;
 
-	rc = device_register(&test_bus);
+	test_bus = platform_device_register_full(&test_bus_info);
+	rc = PTR_ERR_OR_ZERO(test_bus);
 	selftest(!rc, "testbus registration failed; rc=%i\n", rc);
 	if (rc)
 		return;
+	test_bus->dev.of_node = np;
 
+	of_platform_populate(np, match, NULL, &test_bus->dev);
 	for_each_child_of_node(np, child) {
-		of_platform_populate(child, match, NULL, &test_bus);
 		for_each_child_of_node(child, grandchild)
 			selftest(of_find_device_by_node(grandchild),
 				 "Could not create device for node '%s'\n",
 				 grandchild->name);
 	}
 
-	of_platform_depopulate(&test_bus);
+	of_platform_depopulate(&test_bus->dev);
 	for_each_child_of_node(np, child) {
 		for_each_child_of_node(child, grandchild)
 			selftest(!of_find_device_by_node(grandchild),
@@ -808,7 +810,7 @@ static void __init of_selftest_platform_populate(void)
 				 grandchild->name);
 	}
 
-	device_unregister(&test_bus);
+	platform_device_unregister(test_bus);
 	of_node_put(np);
 }
 
-- 
2.1.0
