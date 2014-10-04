From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 2/6] of/selftest: Test structure of device tree
Date: Sat,  4 Oct 2014 21:29:58 +0100
Message-ID: <1412454602-28518-2-git-send-email-grant.likely@linaro.org>
References: <1412454602-28518-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412454602-28518-1-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a testcase to verify that the device tree is properly constructed
and the lists are in a correct order. The new testcase gets run twice;
once after adding the testcase data, and once after removing it again.
It is run twice to make sure adding and removing the testcase data
doesn't corrupt the data structure.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/selftest.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/of/selftest.c b/drivers/of/selftest.c
index 883e60b04eb5..252a7eda8d6a 100644
--- a/drivers/of/selftest.c
+++ b/drivers/of/selftest.c
@@ -145,6 +145,53 @@ static void __init of_selftest_dynamic(void)
 			 "Adding a large property should have passed\n");
 }
 
+static int __init of_selftest_check_node_linkage(struct device_node *np)
+{
+	struct device_node *child, *allnext_index = np;
+	int count = 0, rc;
+
+	for_each_child_of_node(np, child) {
+		if (child->parent != np) {
+			pr_err("Child node %s links to wrong parent %s\n",
+				 child->name, np->name);
+			return -EINVAL;
+		}
+
+		while (allnext_index && allnext_index != child)
+			allnext_index = allnext_index->allnext;
+		if (allnext_index != child) {
+			pr_err("Node %s is ordered differently in sibling and allnode lists\n",
+				 child->name);
+			return -EINVAL;
+		}
+
+		rc = of_selftest_check_node_linkage(child);
+		if (rc < 0)
+			return rc;
+		count += rc;
+	}
+
+	return count + 1;
+}
+
+static void __init of_selftest_check_tree_linkage(void)
+{
+	struct device_node *np;
+	int allnode_count = 0, child_count;
+
+	if (!of_allnodes)
+		return;
+
+	for_each_of_allnodes(np)
+		allnode_count++;
+	child_count = of_selftest_check_node_linkage(of_allnodes);
+
+	selftest(child_count > 0, "Device node data structure is corrupted\n");
+	selftest(child_count == allnode_count, "allnodes list size (%i) doesn't match"
+		 "sibling lists size (%i)\n", allnode_count, child_count);
+	pr_debug("allnodes list size (%i); sibling lists size (%i)\n", allnode_count, child_count);
+}
+
 static void __init of_selftest_parse_phandle_with_args(void)
 {
 	struct device_node *np;
@@ -777,6 +824,7 @@ static int __init of_selftest(void)
 	of_node_put(np);
 
 	pr_info("start of selftest - you will see error messages\n");
+	of_selftest_check_tree_linkage();
 	of_selftest_find_node_by_name();
 	of_selftest_dynamic();
 	of_selftest_parse_phandle_with_args();
@@ -787,12 +835,16 @@ static int __init of_selftest(void)
 	of_selftest_parse_interrupts_extended();
 	of_selftest_match_node();
 	of_selftest_platform_populate();
-	pr_info("end of selftest - %i passed, %i failed\n",
-		selftest_results.passed, selftest_results.failed);
 
 	/* removing selftest data from live tree */
 	selftest_data_remove();
 
+	/* Double check linkage after removing testcase data */
+	of_selftest_check_tree_linkage();
+
+	pr_info("end of selftest - %i passed, %i failed\n",
+		selftest_results.passed, selftest_results.failed);
+
 	return 0;
 }
 late_initcall(of_selftest);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
