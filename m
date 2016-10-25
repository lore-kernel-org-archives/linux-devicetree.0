From: frowand.list@gmail.com
Subject: [RFC PATCH 05/13] of: Rename functions to more accurately reflect what they do
Date: Tue, 25 Oct 2016 13:58:58 -0700
Message-ID: <1477429146-27039-6-git-send-email-frowand.list@gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@am.sony.com>

Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
---
 drivers/of/resolver.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 31fd3800787a..3d123b612789 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -53,7 +53,7 @@ static struct device_node *__of_find_node_by_full_name(struct device_node *node,
 /*
  * Find live tree's maximum phandle value.
  */
-static phandle of_get_tree_max_phandle(void)
+static phandle live_tree_max_phandle(void)
 {
 	struct device_node *node;
 	phandle phandle;
@@ -74,7 +74,7 @@ static phandle of_get_tree_max_phandle(void)
 /*
  * Adjust a subtree's phandle values by a given delta.
  */
-static void __of_adjust_tree_phandles(struct device_node *node,
+static void adjust_overlay_phandles(struct device_node *node,
 		int phandle_delta)
 {
 	struct device_node *child;
@@ -101,10 +101,10 @@ static void __of_adjust_tree_phandles(struct device_node *node,
 	}
 
 	for_each_child_of_node(node, child)
-		__of_adjust_tree_phandles(child, phandle_delta);
+		adjust_overlay_phandles(child, phandle_delta);
 }
 
-static int __of_adjust_phandle_ref(struct device_node *node,
+static int update_usages_of_a_phandle_reference(struct device_node *node,
 		struct property *rprop, int value)
 {
 	phandle phandle;
@@ -184,7 +184,7 @@ static int __of_node_name_cmp(const struct device_node *dn1,
  * Does not take any devtree locks so make sure you call this on a tree
  * which is at the detached state.
  */
-static int __of_adjust_tree_phandle_references(struct device_node *node,
+static int adjust_local_phandle_references(struct device_node *node,
 		struct device_node *target, int phandle_delta)
 {
 	struct device_node *child, *childtarget;
@@ -238,7 +238,7 @@ static int __of_adjust_tree_phandle_references(struct device_node *node,
 		if (!childtarget)
 			return -EINVAL;
 
-		err = __of_adjust_tree_phandle_references(child, childtarget,
+		err = adjust_local_phandle_references(child, childtarget,
 				phandle_delta);
 		if (err)
 			return err;
@@ -277,8 +277,8 @@ int of_resolve_phandles(struct device_node *resolve)
 	if (!resolve || !of_node_check_flag(resolve, OF_DETACHED))
 		return -EINVAL;
 
-	phandle_delta = of_get_tree_max_phandle() + 1;
-	__of_adjust_tree_phandles(resolve, phandle_delta);
+	phandle_delta = live_tree_max_phandle() + 1;
+	adjust_overlay_phandles(resolve, phandle_delta);
 
 	childroot = NULL;
 	for_each_child_of_node(resolve, childroot)
@@ -286,12 +286,12 @@ int of_resolve_phandles(struct device_node *resolve)
 			break;
 
 	if (childroot != NULL) {
-		err = __of_adjust_tree_phandle_references(childroot,
+		err = adjust_local_phandle_references(childroot,
 				resolve, 0);
 		if (err)
 			return err;
 
-		BUG_ON(__of_adjust_tree_phandle_references(childroot,
+		BUG_ON(adjust_local_phandle_references(childroot,
 				resolve, phandle_delta));
 	}
 
@@ -344,7 +344,7 @@ int of_resolve_phandles(struct device_node *resolve)
 		phandle = refnode->phandle;
 		of_node_put(refnode);
 
-		err = __of_adjust_phandle_ref(resolve, rprop, phandle);
+		err = update_usages_of_a_phandle_reference(resolve, rprop, phandle);
 		if (err)
 			break;
 	}
-- 
1.9.1
