From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 10/12] of: overlay: simplify applying symbols from an overlay
Date: Mon,  2 Oct 2017 20:53:44 -0700
Message-ID: <1507002826-16393-11-git-send-email-frowand.list@gmail.com>
References: <1507002826-16393-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507002826-16393-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

The code to apply symbols from an overlay to the live device tree
was implemented with the intent to be minimally intrusive on the
existing code.  After recent restructuring of the overlay apply
code, it is easier to disintangle the code that applies the
symbols, and to make the overlay changeset creation code more
straight forward and understandable.

Remove the extra complexity, and make the code more obvious.

Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---
 drivers/of/overlay.c | 91 +++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 65 insertions(+), 26 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 4ed372af6ce7..172807d3f375 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -32,21 +32,22 @@
 struct fragment {
 	struct device_node *target;
 	struct device_node *overlay;
-	bool is_symbols_node;
 };
 
 /**
  * struct overlay_changeset
- * @ovcs_list:	list on which we are located
- * @count:	count of @fragments structures
- * @fragments:	info about fragment nodes in overlay expanded device tree
- * @cset:	changeset to apply fragments to live device tree
+ * @ovcs_list:		list on which we are located
+ * @count:		count of fragment structures
+ * @fragments:		fragment nodes in the overlay expanded device tree
+ * @symbols_fragment:	last element of @fragments[] is the  __symbols__ node
+ * @cset:		changeset to apply fragments to live device tree
  */
 struct overlay_changeset {
 	int id;
 	struct list_head ovcs_list;
 	int count;
 	struct fragment *fragments;
+	bool symbols_fragment;
 	struct of_changeset cset;
 };
 
@@ -68,8 +69,7 @@ static int devicetree_corrupt(void)
 
 static int build_changeset_next_level(struct overlay_changeset *ovcs,
 		struct device_node *target_node,
-		const struct device_node *overlay_node,
-		bool is_symbols_node);
+		const struct device_node *overlay_node);
 
 /*
  * of_resolve_phandles() finds the largest phandle in the live tree.
@@ -221,7 +221,7 @@ static struct property *dup_and_fixup_symbol_prop(
  * @ovcs:		overlay changeset
  * @target_node:	where to place @overlay_prop in live tree
  * @overlay_prop:	property to add or update, from overlay tree
- * is_symbols_node:	1 if @target_node is "/__symbols__"
+ * @is_symbols_prop:	1 if @overlay_prop is from node "/__symbols__"
  *
  * If @overlay_prop does not already exist in @target_node, add changeset entry
  * to add @overlay_prop in @target_node, else add changeset entry to update
@@ -237,7 +237,7 @@ static struct property *dup_and_fixup_symbol_prop(
 static int add_changeset_property(struct overlay_changeset *ovcs,
 		struct device_node *target_node,
 		struct property *overlay_prop,
-		bool is_symbols_node)
+		bool is_symbols_prop)
 {
 	struct property *new_prop = NULL, *prop;
 
@@ -248,7 +248,7 @@ static int add_changeset_property(struct overlay_changeset *ovcs,
 	    !of_prop_cmp(overlay_prop->name, "linux,phandle"))
 		return 0;
 
-	if (is_symbols_node) {
+	if (is_symbols_prop) {
 		if (prop)
 			return -EINVAL;
 		new_prop = dup_and_fixup_symbol_prop(ovcs, overlay_prop);
@@ -321,13 +321,13 @@ static int add_changeset_node(struct overlay_changeset *ovcs,
 		if (ret)
 			return ret;
 
-		return build_changeset_next_level(ovcs, tchild, node, 0);
+		return build_changeset_next_level(ovcs, tchild, node);
 	}
 
 	if (node->phandle && tchild->phandle)
 		ret = -EINVAL;
 	else
-		ret = build_changeset_next_level(ovcs, tchild, node, 0);
+		ret = build_changeset_next_level(ovcs, tchild, node);
 	of_node_put(tchild);
 
 	return ret;
@@ -338,7 +338,6 @@ static int add_changeset_node(struct overlay_changeset *ovcs,
  * @ovcs:		overlay changeset
  * @target_node:	where to place @overlay_node in live tree
  * @overlay_node:	node from within an overlay device tree fragment
- * @is_symbols_node:	@overlay_node is node "/__symbols__"
  *
  * Add the properties (if any) and nodes (if any) from @overlay_node to the
  * @ovcs->cset changeset.  If an added node has child nodes, they will
@@ -351,16 +350,14 @@ static int add_changeset_node(struct overlay_changeset *ovcs,
  */
 static int build_changeset_next_level(struct overlay_changeset *ovcs,
 		struct device_node *target_node,
-		const struct device_node *overlay_node,
-		bool is_symbols_node)
+		const struct device_node *overlay_node)
 {
 	struct device_node *child;
 	struct property *prop;
 	int ret;
 
 	for_each_property_of_node(overlay_node, prop) {
-		ret = add_changeset_property(ovcs, target_node, prop,
-					     is_symbols_node);
+		ret = add_changeset_property(ovcs, target_node, prop, 0);
 		if (ret) {
 			pr_debug("Failed to apply prop @%pOF/%s, err=%d\n",
 				 target_node, prop->name, ret);
@@ -368,9 +365,6 @@ static int build_changeset_next_level(struct overlay_changeset *ovcs,
 		}
 	}
 
-	if (is_symbols_node)
-		return 0;
-
 	for_each_child_of_node(overlay_node, child) {
 		ret = add_changeset_node(ovcs, target_node, child);
 		if (ret) {
@@ -384,6 +378,28 @@ static int build_changeset_next_level(struct overlay_changeset *ovcs,
 	return 0;
 }
 
+/*
+ * Add the properties from __overlay__ node to the @ovcs->cset changeset.
+ */
+static int build_changeset_symbols_node(struct overlay_changeset *ovcs,
+		struct device_node *target_node,
+		const struct device_node *overlay_symbols_node)
+{
+	struct property *prop;
+	int ret;
+
+	for_each_property_of_node(overlay_symbols_node, prop) {
+		ret = add_changeset_property(ovcs, target_node, prop, 1);
+		if (ret) {
+			pr_debug("Failed to apply prop @%pOF/%s, err=%d\n",
+				 target_node, prop->name, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * build_changeset() - populate overlay changeset in @ovcs from @ovcs->fragments
  * @ovcs:	Overlay changeset
@@ -398,14 +414,33 @@ static int build_changeset_next_level(struct overlay_changeset *ovcs,
  */
 static int build_changeset(struct overlay_changeset *ovcs)
 {
-	int i, ret;
+	struct fragment *fragment;
+	int fragments_count, i, ret;
 
-	for (i = 0; i < ovcs->count; i++) {
-		struct fragment *fragment = &ovcs->fragments[i];
+	/*
+	 * if there is a symbols fragment in ovcs->fragments[i] it is
+	 * the final element in the array
+	 */
+	if (ovcs->symbols_fragment)
+		fragments_count = ovcs->count - 1;
+	else
+		fragments_count = ovcs->count;
+
+	for (i = 0; i < fragments_count; i++) {
+		fragment = &ovcs->fragments[i];
 
 		ret = build_changeset_next_level(ovcs, fragment->target,
-					       fragment->overlay,
-					       fragment->is_symbols_node);
+						 fragment->overlay);
+		if (ret) {
+			pr_debug("apply failed '%pOF'\n", fragment->target);
+			return ret;
+		}
+	}
+
+	if (ovcs->symbols_fragment) {
+		fragment = &ovcs->fragments[ovcs->count - 1];
+		ret = build_changeset_symbols_node(ovcs, fragment->target,
+						   fragment->overlay);
 		if (ret) {
 			pr_debug("apply failed '%pOF'\n", fragment->target);
 			return ret;
@@ -522,12 +557,16 @@ static int init_overlay_changeset(struct overlay_changeset *ovcs,
 		}
 	}
 
+	/*
+	 * if there is a symbols fragment in ovcs->fragments[i] it is
+	 * the final element in the array
+	 */
 	node = of_get_child_by_name(tree, "__symbols__");
 	if (node) {
+		ovcs->symbols_fragment = 1;
 		fragment = &fragments[cnt];
 		fragment->overlay = node;
 		fragment->target = of_find_node_by_path("/__symbols__");
-		fragment->is_symbols_node = 1;
 
 		if (!fragment->target) {
 			pr_err("no symbols in root of device tree.\n");
-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
