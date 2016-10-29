From: frowand.list@gmail.com
Subject: [PATCH 09/12] of: Update comments to reflect changes and increase clarity
Date: Fri, 28 Oct 2016 23:26:29 -0700
Message-ID: <1477722392-32172-10-git-send-email-frowand.list@gmail.com>
References: <1477722392-32172-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477722392-32172-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@am.sony.com>

Update comments to better explain what functions are doing.

Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
---
 drivers/of/resolver.c | 66 ++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 76c09cb57eae..f842dbd1585c 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -50,9 +50,6 @@ static struct device_node *find_node_by_full_name(struct device_node *node,
 	return NULL;
 }
 
-/*
- * Find live tree's maximum phandle value.
- */
 static phandle live_tree_max_phandle(void)
 {
 	struct device_node *node;
@@ -71,9 +68,6 @@ static phandle live_tree_max_phandle(void)
 	return phandle;
 }
 
-/*
- * Adjust a subtree's phandle values by a given delta.
- */
 static void adjust_overlay_phandles(struct device_node *overlay,
 		int phandle_delta)
 {
@@ -81,9 +75,11 @@ static void adjust_overlay_phandles(struct device_node *overlay,
 	struct property *prop;
 	phandle phandle;
 
+	/* adjust node's phandle in node */
 	if (overlay->phandle != 0 && overlay->phandle != OF_PHANDLE_ILLEGAL)
 		overlay->phandle += phandle_delta;
 
+	/* copy adjusted phandle into *phandle properties */
 	for_each_property_of_node(overlay, prop) {
 
 		if (of_prop_cmp(prop->name, "phandle") &&
@@ -118,6 +114,7 @@ static int update_usages_of_a_phandle_reference(struct device_node *overlay,
 		return -ENOMEM;
 	memcpy(value, prop_fixup->value, prop_fixup->length);
 
+	/* prop_fixup contains a list of tuples of path:property_name:offset */
 	end = value + prop_fixup->length;
 	for (cur = value; cur < end; cur += len + 1) {
 		len = strlen(cur);
@@ -177,10 +174,14 @@ static int node_name_cmp(const struct device_node *dn1,
 
 /*
  * Adjust the local phandle references by the given phandle delta.
- * Assumes the existances of a __local_fixups__ node at the root.
- * Assumes that __of_verify_tree_phandle_references has been called.
- * Does not take any devtree locks so make sure you call this on a tree
- * which is at the detached state.
+ *
+ * Subtree @local_fixups, which is overlay node __local_fixups__,
+ * mirrors the fragment node structure at the root of the overlay.
+ *
+ * For each property in the fragments that contains a phandle reference,
+ * @local_fixups has a property of the same name that contains a list
+ * of offsets of the phandle reference(s) within the respective property
+ * value(s).  The values at these offsets will be fixed up.
  */
 static int adjust_local_phandle_references(struct device_node *local_fixups,
 		struct device_node *overlay, int phandle_delta)
@@ -225,6 +226,13 @@ static int adjust_local_phandle_references(struct device_node *local_fixups,
 		}
 	}
 
+	/*
+	 * These nested loops recurse down two subtrees in parallel, where the
+	 * node names in the two subtrees match.
+	 *
+	 * The roots of the subtrees are the overlay's __local_fixups__ node
+	 * and the overlay's root node.
+	 */
 	for_each_child_of_node(local_fixups, child) {
 
 		for_each_child_of_node(overlay, overlay_child)
@@ -244,17 +252,37 @@ static int adjust_local_phandle_references(struct device_node *local_fixups,
 }
 
 /**
- * of_resolve	- Resolve the given node against the live tree.
+ * of_resolve_phandles - Relocate and resolve overlay against live tree
+ *
+ * @overlay:	Pointer to devicetree overlay to relocate and resolve
+ *
+ * Modify (relocate) values of local phandles in @overlay to a range that
+ * does not conflict with the live expanded devicetree.  Update references
+ * to the local phandles in @overlay.  Update (resolve) phandle references
+ * in @overlay that refer to the live expanded devicetree.
+ *
+ * Phandle values in the live tree are in the range of
+ * 1 .. live_tree_max_phandle().  The range of phandle values in the overlay
+ * also begin with at 1.  Adjust the phandle values in the overlay to begin
+ * at live_tree_max_phandle() + 1.  Update references to the phandles to
+ * the adjusted phandle values.
+ *
+ * The name of each property in the "__fixups__" node in the overlay matches
+ * the name of a symbol (a label) in the live tree.  The values of each
+ * property in the "__fixups__" node is a list of the property values in the
+ * overlay that need to be updated to contain the phandle reference
+ * corresponding to that symbol in the live tree.  Update the references in
+ * the overlay with the phandle values in the live tree.
+ *
+ * @overlay must be detached.
  *
- * @resolve:	Node to resolve
+ * Resolving and applying @overlay to the live expanded devicetree must be
+ * protected by a mechanism to ensure that multiple overlays are processed
+ * in a single threaded manner so that multiple overlays will not relocate
+ * phandles to overlapping ranges.  The mechanism to enforce this is not
+ * yet implemented.
  *
- * Perform dynamic Device Tree resolution against the live tree
- * to the given node to resolve. This depends on the live tree
- * having a __symbols__ node, and the resolve node the __fixups__ &
- * __local_fixups__ nodes (if needed).
- * The result of the operation is a resolve node that it's contents
- * are fit to be inserted or operate upon the live tree.
- * Returns 0 on success or a negative error value on error.
+ * Return: %0 on success or a negative error value on error.
  */
 int of_resolve_phandles(struct device_node *overlay)
 {
-- 
1.9.1
