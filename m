From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 4/6] of/selftest: Add a test for duplicate phandles
Date: Sat,  4 Oct 2014 21:30:00 +0100
Message-ID: <1412454602-28518-4-git-send-email-grant.likely@linaro.org>
References: <1412454602-28518-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412454602-28518-1-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

All phandles in the tree should be unique. Add a testcase to make sure
that this is so.

Note: this testcase fails on the current kernel because the selftest
code itself ends up adding duplicate phandles. Before this testcase is
merged the selftest code needs to be modified to resolve phandles before
adding them.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 drivers/of/selftest.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/of/selftest.c b/drivers/of/selftest.c
index 252a7eda8d6a..4f83e97f8788 100644
--- a/drivers/of/selftest.c
+++ b/drivers/of/selftest.c
@@ -7,6 +7,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/hashtable.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
@@ -192,6 +193,51 @@ static void __init of_selftest_check_tree_linkage(void)
 	pr_debug("allnodes list size (%i); sibling lists size (%i)\n", allnode_count, child_count);
 }
 
+struct node_hash {
+	struct hlist_node node;
+	struct device_node *np;
+};
+
+static void __init of_selftest_check_phandles(void)
+{
+	struct device_node *np;
+	struct node_hash *nh;
+	struct hlist_node *tmp;
+	int i, dup_count = 0, phandle_count = 0;
+	DECLARE_HASHTABLE(ht, 8);
+
+	hash_init(ht);
+	for_each_of_allnodes(np) {
+		if (!np->phandle)
+			continue;
+
+		hash_for_each_possible(ht, nh, node, np->phandle) {
+			if (nh->np->phandle == np->phandle) {
+				pr_info("Duplicate phandle! %i used by %s and %s\n",
+					np->phandle, nh->np->full_name, np->full_name);
+				dup_count++;
+				break;
+			}
+		}
+
+		nh = kzalloc(sizeof(*nh), GFP_KERNEL);
+		if (WARN_ON(!nh))
+			return;
+
+		nh->np = np;
+		hash_add(ht, &nh->node, np->phandle);
+		phandle_count++;
+	}
+	selftest(dup_count == 0, "Found %i duplicates in %i phandles\n",
+		 dup_count, phandle_count);
+
+	/* Clean up */
+	hash_for_each_safe(ht, i, tmp, nh, node) {
+		hash_del(&nh->node);
+		kfree(nh);
+	}
+}
+
 static void __init of_selftest_parse_phandle_with_args(void)
 {
 	struct device_node *np;
@@ -825,6 +871,7 @@ static int __init of_selftest(void)
 
 	pr_info("start of selftest - you will see error messages\n");
 	of_selftest_check_tree_linkage();
+	of_selftest_check_phandles();
 	of_selftest_find_node_by_name();
 	of_selftest_dynamic();
 	of_selftest_parse_phandle_with_args();
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
