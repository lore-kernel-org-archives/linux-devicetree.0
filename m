From: frowand.list@gmail.com
Subject: [PATCH v2 03/12] of: overlay: rename identifiers to more reflect what they do
Date: Mon, 16 Oct 2017 18:17:45 -0700
Message-ID: <1508203074-26917-4-git-send-email-frowand.list@gmail.com>
References: <1508203074-26917-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508203074-26917-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

This patch is aimed primarily at drivers/of/overlay.c, but those
changes also have a small impact in a few other files.

overlay.c is difficult to read and maintain.  Improve readability:
  - Rename functions, types and variables to better reflect what
    they do and to be consistent with names in other places,
    such as the device tree overlay FDT (flattened device tree),
    and make the algorithms more clear
  - Use the same names consistently throughout the file
  - Update comments for name changes
  - Fix incorrect comments

This patch is intended to not introduce any functional change.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 Documentation/devicetree/overlay-notes.txt   |  12 +-
 drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c |   5 +-
 drivers/of/dynamic.c                         |   2 +-
 drivers/of/overlay.c                         | 506 ++++++++++++++-------------
 drivers/of/unittest.c                        |  20 +-
 include/linux/of.h                           |  12 +-
 6 files changed, 294 insertions(+), 263 deletions(-)

diff --git a/Documentation/devicetree/overlay-notes.txt b/Documentation/devicetree/overlay-notes.txt
index eb7f2685fda1..c4aa0adf13ec 100644
--- a/Documentation/devicetree/overlay-notes.txt
+++ b/Documentation/devicetree/overlay-notes.txt
@@ -87,15 +87,15 @@ Overlay in-kernel API
 
 The API is quite easy to use.
 
-1. Call of_overlay_create() to create and apply an overlay. The return value
-is a cookie identifying this overlay.
+1. Call of_overlay_apply() to create and apply an overlay changeset. The return
+value is an error or a cookie identifying this overlay.
 
-2. Call of_overlay_destroy() to remove and cleanup the overlay previously
-created via the call to of_overlay_create(). Removal of an overlay that
-is stacked by another will not be permitted.
+2. Call of_overlay_remove() to remove and cleanup the overlay changeset
+previously created via the call to of_overlay_apply(). Removal of an overlay
+changeset that is stacked by another will not be permitted.
 
 Finally, if you need to remove all overlays in one-go, just call
-of_overlay_destroy_all() which will remove every single one in the correct
+of_overlay_remove_all() which will remove every single one in the correct
 order.
 
 Overlay DTS Format
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
index 623a9140493c..5f5b7ba35f1d 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
@@ -247,9 +247,10 @@ static void __init tilcdc_convert_slave_node(void)
 
 	tilcdc_node_disable(slave);
 
-	ret = of_overlay_create(overlay);
+	ret = of_overlay_apply(overlay);
 	if (ret)
-		pr_err("%s: Creating overlay failed: %d\n", __func__, ret);
+		pr_err("%s: Applying overlay changeset failed: %d\n",
+			__func__, ret);
 	else
 		pr_info("%s: ti,tilcdc,slave node successfully converted\n",
 			__func__);
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 301b6db2b48d..124510d56421 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -775,7 +775,7 @@ int of_changeset_revert(struct of_changeset *ocs)
 EXPORT_SYMBOL_GPL(of_changeset_revert);
 
 /**
- * of_changeset_action - Perform a changeset action
+ * of_changeset_action - Add an action to the tail of the changeset list
  *
  * @ocs:	changeset pointer
  * @action:	action to perform
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 8e0c7eb4858c..397ef10d1f26 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -25,67 +25,63 @@
 #include "of_private.h"
 
 /**
- * struct of_overlay_info - Holds a single overlay info
+ * struct fragment - info about fragment nodes in overlay expanded device tree
  * @target:	target of the overlay operation
- * @overlay:	pointer to the overlay contents node
- *
- * Holds a single overlay state, including all the overlay logs &
- * records.
+ * @overlay:	pointer to the __overlay__ node
  */
-struct of_overlay_info {
+struct fragment {
 	struct device_node *target;
 	struct device_node *overlay;
 	bool is_symbols_node;
 };
 
 /**
- * struct of_overlay - Holds a complete overlay transaction
- * @node:	List on which we are located
- * @count:	Count of ovinfo structures
- * @ovinfo_tab:	Overlay info table (count sized)
- * @cset:	Changeset to be used
- *
- * Holds a complete overlay transaction
+ * struct overlay_changeset
+ * @ovcs_list:	list on which we are located
+ * @count:	count of @fragments structures
+ * @fragments:	info about fragment nodes in overlay expanded device tree
+ * @cset:	changeset to apply fragments to live device tree
  */
-struct of_overlay {
+struct overlay_changeset {
 	int id;
-	struct list_head node;
+	struct list_head ovcs_list;
 	int count;
-	struct of_overlay_info *ovinfo_tab;
+	struct fragment *fragments;
 	struct of_changeset cset;
 };
 
-static int of_overlay_apply_one(struct of_overlay *ov,
-		struct device_node *target, const struct device_node *overlay,
+static int build_changeset_next_level(struct overlay_changeset *ovcs,
+		struct device_node *target_node,
+		const struct device_node *overlay_node,
 		bool is_symbols_node);
 
-static BLOCKING_NOTIFIER_HEAD(of_overlay_chain);
+static BLOCKING_NOTIFIER_HEAD(overlay_notify_chain);
 
 int of_overlay_notifier_register(struct notifier_block *nb)
 {
-	return blocking_notifier_chain_register(&of_overlay_chain, nb);
+	return blocking_notifier_chain_register(&overlay_notify_chain, nb);
 }
 EXPORT_SYMBOL_GPL(of_overlay_notifier_register);
 
 int of_overlay_notifier_unregister(struct notifier_block *nb)
 {
-	return blocking_notifier_chain_unregister(&of_overlay_chain, nb);
+	return blocking_notifier_chain_unregister(&overlay_notify_chain, nb);
 }
 EXPORT_SYMBOL_GPL(of_overlay_notifier_unregister);
 
-static int of_overlay_notify(struct of_overlay *ov,
-			     enum of_overlay_notify_action action)
+static int overlay_notify(struct overlay_changeset *ovcs,
+		enum of_overlay_notify_action action)
 {
 	struct of_overlay_notify_data nd;
 	int i, ret;
 
-	for (i = 0; i < ov->count; i++) {
-		struct of_overlay_info *ovinfo = &ov->ovinfo_tab[i];
+	for (i = 0; i < ovcs->count; i++) {
+		struct fragment *fragment = &ovcs->fragments[i];
 
-		nd.target = ovinfo->target;
-		nd.overlay = ovinfo->overlay;
+		nd.target = fragment->target;
+		nd.overlay = fragment->overlay;
 
-		ret = blocking_notifier_call_chain(&of_overlay_chain,
+		ret = blocking_notifier_call_chain(&overlay_notify_chain,
 						   action, &nd);
 		if (ret)
 			return notifier_to_errno(ret);
@@ -94,10 +90,10 @@ static int of_overlay_notify(struct of_overlay *ov,
 	return 0;
 }
 
-static struct property *dup_and_fixup_symbol_prop(struct of_overlay *ov,
-		const struct property *prop)
+static struct property *dup_and_fixup_symbol_prop(
+		struct overlay_changeset *ovcs, const struct property *prop)
 {
-	struct of_overlay_info *ovinfo;
+	struct fragment *fragment;
 	struct property *new;
 	const char *overlay_name;
 	char *label_path;
@@ -116,18 +112,18 @@ static struct property *dup_and_fixup_symbol_prop(struct of_overlay *ov,
 	if (!new)
 		return NULL;
 
-	for (k = 0; k < ov->count; k++) {
-		ovinfo = &ov->ovinfo_tab[k];
-		overlay_name = ovinfo->overlay->full_name;
+	for (k = 0; k < ovcs->count; k++) {
+		fragment = &ovcs->fragments[k];
+		overlay_name = fragment->overlay->full_name;
 		overlay_name_len = strlen(overlay_name);
 		if (!strncasecmp(symbol_path, overlay_name, overlay_name_len))
 			break;
 	}
 
-	if (k >= ov->count)
+	if (k >= ovcs->count)
 		goto err_free;
 
-	target_path = ovinfo->target->full_name;
+	target_path = fragment->target->full_name;
 	target_path_len = strlen(target_path);
 
 	label_path = symbol_path + overlay_name_len;
@@ -156,81 +152,110 @@ static struct property *dup_and_fixup_symbol_prop(struct of_overlay *ov,
 
 }
 
-/*
+/**
+ * add_changeset_property() - add @overlay_prop to overlay changeset
+ * @ovcs:		overlay changeset
+ * @target_node:	where to place @overlay_prop in live tree
+ * @overlay_prop:	property to add or update, from overlay tree
+ * is_symbols_node:	1 if @target_node is "/__symbols__"
+ *
+ * If @overlay_prop does not already exist in @target_node, add changeset entry
+ * to add @overlay_prop in @target_node, else add changeset entry to update
+ * value of @overlay_prop.
+ *
  * Some special properties are not updated (no error returned).
+ *
  * Update of property in symbols node is not allowed.
+ *
+ * Returns 0 on success, -ENOMEM if memory allocation failure, or -EINVAL if
+ * invalid @overlay.
  */
-static int of_overlay_apply_single_property(struct of_overlay *ov,
-		struct device_node *target, struct property *prop,
+static int add_changeset_property(struct overlay_changeset *ovcs,
+		struct device_node *target_node,
+		struct property *overlay_prop,
 		bool is_symbols_node)
 {
-	struct property *propn = NULL, *tprop;
+	struct property *new_prop = NULL, *prop;
 
-	tprop = of_find_property(target, prop->name, NULL);
+	prop = of_find_property(target_node, overlay_prop->name, NULL);
 
-	if (!of_prop_cmp(prop->name, "name") ||
-	    !of_prop_cmp(prop->name, "phandle") ||
-	    !of_prop_cmp(prop->name, "linux,phandle"))
+	if (!of_prop_cmp(overlay_prop->name, "name") ||
+	    !of_prop_cmp(overlay_prop->name, "phandle") ||
+	    !of_prop_cmp(overlay_prop->name, "linux,phandle"))
 		return 0;
 
 	if (is_symbols_node) {
-		if (tprop)
+		if (prop)
 			return -EINVAL;
-		propn = dup_and_fixup_symbol_prop(ov, prop);
+		new_prop = dup_and_fixup_symbol_prop(ovcs, overlay_prop);
 	} else {
-		propn = __of_prop_dup(prop, GFP_KERNEL);
+		new_prop = __of_prop_dup(overlay_prop, GFP_KERNEL);
 	}
 
-	if (!propn)
+	if (!new_prop)
 		return -ENOMEM;
 
-	if (!tprop)
-		return of_changeset_add_property(&ov->cset, target, propn);
+	if (!prop)
+		return of_changeset_add_property(&ovcs->cset, target_node,
+						 new_prop);
 
-	return of_changeset_update_property(&ov->cset, target, propn);
+	return of_changeset_update_property(&ovcs->cset, target_node, new_prop);
 }
 
-/*
+/**
+ * add_changeset_node() - add @node (and children) to overlay changeset
+ * @ovcs:		overlay changeset
+ * @target_node:	where to place @node in live tree
+ * @node:		node from within overlay device tree fragment
+ *
+ * If @node does not already exist in @target_node, add changeset entry
+ * to add @node in @target_node.
+ *
+ * If @node already exists in @target_node, and the existing node has
+ * a phandle, the overlay node is not allowed to have a phandle.
+ *
+ * If @node has child nodes, add the children recursively via
+ * build_changeset_next_level().
+ *
  * NOTE: Multiple mods of created nodes not supported.
  *
- * Return
- *  -ENOMEM if memory allocation fails
- *  -EINVAL if existing node has a phandle and overlay node has a phandle
+ * Returns 0 on success, -ENOMEM if memory allocation failure, or -EINVAL if
+ * invalid @overlay.
  */
-static int of_overlay_apply_single_device_node(struct of_overlay *ov,
-		struct device_node *target, struct device_node *child)
+static int add_changeset_node(struct overlay_changeset *ovcs,
+		struct device_node *target_node, struct device_node *node)
 {
-	const char *cname;
+	const char *node_kbasename;
 	struct device_node *tchild;
 	int ret = 0;
 
-	cname = kbasename(child->full_name);
-	if (!cname)
+	node_kbasename = kbasename(node->full_name);
+	if (!node_kbasename)
 		return -ENOMEM;
 
-	for_each_child_of_node(target, tchild)
-		if (!of_node_cmp(cname, kbasename(tchild->full_name)))
+	for_each_child_of_node(target_node, tchild)
+		if (!of_node_cmp(node_kbasename, kbasename(tchild->full_name)))
 			break;
 
 	if (tchild) {
-		if (child->phandle)
+		if (node->phandle)
 			return -EINVAL;
 
-		/* apply overlay recursively */
-		ret = of_overlay_apply_one(ov, tchild, child, 0);
+		ret = build_changeset_next_level(ovcs, tchild, node, 0);
 		of_node_put(tchild);
 	} else {
-		tchild = __of_node_dup(child, "%pOF/%s", target, cname);
+		tchild = __of_node_dup(node, "%pOF/%s",
+				       target_node, node_kbasename);
 		if (!tchild)
 			return -ENOMEM;
 
-		tchild->parent = target;
+		tchild->parent = target_node;
 
-		ret = of_changeset_attach_node(&ov->cset, tchild);
+		ret = of_changeset_attach_node(&ovcs->cset, tchild);
 		if (ret)
 			return ret;
 
-		ret = of_overlay_apply_one(ov, tchild, child, 0);
+		ret = build_changeset_next_level(ovcs, tchild, node, 0);
 		if (ret)
 			return ret;
 	}
@@ -238,29 +263,37 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
 	return ret;
 }
 
-/*
- * Apply a single overlay node recursively.
+/**
+ * build_changeset_next_level() - add level of overlay changeset
+ * @ovcs:		overlay changeset
+ * @target_node:	where to place @overlay_node in live tree
+ * @overlay_node:	node from within an overlay device tree fragment
+ * @is_symbols_node:	@overlay_node is node "/__symbols__"
  *
- * Note that the in case of an error the target node is left
- * in a inconsistent state. Error recovery should be performed
- * by using the changeset.
+ * Add the properties (if any) and nodes (if any) from @overlay_node to the
+ * @ovcs->cset changeset.  If an added node has child nodes, they will
+ * be added recursively.
  *
  * Do not allow symbols node to have any children.
+ *
+ * Returns 0 on success, -ENOMEM if memory allocation failure, or -EINVAL if
+ * invalid @overlay_node.
  */
-static int of_overlay_apply_one(struct of_overlay *ov,
-		struct device_node *target, const struct device_node *overlay,
+static int build_changeset_next_level(struct overlay_changeset *ovcs,
+		struct device_node *target_node,
+		const struct device_node *overlay_node,
 		bool is_symbols_node)
 {
 	struct device_node *child;
 	struct property *prop;
 	int ret;
 
-	for_each_property_of_node(overlay, prop) {
-		ret = of_overlay_apply_single_property(ov, target, prop,
-						       is_symbols_node);
+	for_each_property_of_node(overlay_node, prop) {
+		ret = add_changeset_property(ovcs, target_node, prop,
+					     is_symbols_node);
 		if (ret) {
 			pr_err("Failed to apply prop @%pOF/%s\n",
-			       target, prop->name);
+			       target_node, prop->name);
 			return ret;
 		}
 	}
@@ -268,11 +301,11 @@ static int of_overlay_apply_one(struct of_overlay *ov,
 	if (is_symbols_node)
 		return 0;
 
-	for_each_child_of_node(overlay, child) {
-		ret = of_overlay_apply_single_device_node(ov, target, child);
+	for_each_child_of_node(overlay_node, child) {
+		ret = add_changeset_node(ovcs, target_node, child);
 		if (ret) {
-			pr_err("Failed to apply single node @%pOF/%s\n",
-			       target, child->name);
+			pr_err("Failed to apply node @%pOF/%s\n",
+			       target_node, child->name);
 			of_node_put(child);
 			return ret;
 		}
@@ -282,26 +315,30 @@ static int of_overlay_apply_one(struct of_overlay *ov,
 }
 
 /**
- * of_overlay_apply() - Apply @count overlays pointed at by @ovinfo_tab
- * @ov:		Overlay to apply
+ * build_changeset() - populate overlay changeset in @ovcs from @ovcs->fragments
+ * @ovcs:	Overlay changeset
  *
- * Applies the overlays given, while handling all error conditions
- * appropriately. Either the operation succeeds, or if it fails the
- * live tree is reverted to the state before the attempt.
- * Returns 0, or an error if the overlay attempt failed.
+ * Create changeset @ovcs->cset to contain the nodes and properties of the
+ * overlay device tree fragments in @ovcs->fragments[].  If an error occurs,
+ * any portions of the changeset that were successfully created will remain
+ * in @ovcs->cset.
+ *
+ * Returns 0 on success, -ENOMEM if memory allocation failure, or -EINVAL if
+ * invalid overlay in @ovcs->fragments[].
  */
-static int of_overlay_apply(struct of_overlay *ov)
+static int build_changeset(struct overlay_changeset *ovcs)
 {
-	int i, err;
+	int i, ret;
 
-	for (i = 0; i < ov->count; i++) {
-		struct of_overlay_info *ovinfo = &ov->ovinfo_tab[i];
+	for (i = 0; i < ovcs->count; i++) {
+		struct fragment *fragment = &ovcs->fragments[i];
 
-		err = of_overlay_apply_one(ov, ovinfo->target, ovinfo->overlay,
-					   ovinfo->is_symbols_node);
-		if (err) {
-			pr_err("apply failed '%pOF'\n", ovinfo->target);
-			return err;
+		ret = build_changeset_next_level(ovcs, fragment->target,
+					       fragment->overlay,
+					       fragment->is_symbols_node);
+		if (ret) {
+			pr_err("apply failed '%pOF'\n", fragment->target);
+			return ret;
 		}
 	}
 
@@ -371,23 +408,24 @@ static int of_fill_overlay_info(struct of_overlay *ov,
 }
 
 /**
- * of_build_overlay_info() - Build an overlay info array
- * @ov		Overlay to build
- * @tree:	Device node containing all the overlays
+ * init_overlay_changeset() - initialize overlay changeset from overlay tree
+ * @ovcs	Overlay changeset to build
+ * @tree:	Contains all the overlay fragments and overlay fixup nodes
  *
- * Helper function that given a tree containing overlay information,
- * allocates and builds an overlay info array containing it, ready
- * for use using of_overlay_apply.
+ * Initialize @ovcs.  Populate @ovcs->fragments with node information from
+ * the top level of @tree.  The relevant top level nodes are the fragment
+ * nodes and the __symbols__ node.  Any other top level node will be ignored.
  *
- * Returns 0 on success with the @cntp @ovinfop pointers valid,
- * while on error a negative error value is returned.
+ * Returns 0 on success, -ENOMEM if memory allocation failure, -EINVAL if error
+ * detected in @tree, or -ENODEV if no valid nodes found.
  */
-static int of_build_overlay_info(struct of_overlay *ov,
+static int init_overlay_changeset(struct overlay_changeset *ovcs,
 		struct device_node *tree)
 {
 	struct device_node *node;
-	struct of_overlay_info *ovinfo;
-	int cnt, err;
+	struct fragment *fragment;
+	struct fragment *fragments;
+	int cnt, ret;
 
 	cnt = 0;
 	for_each_child_of_node(tree, node)
@@ -396,24 +434,25 @@ static int of_build_overlay_info(struct of_overlay *ov,
 	if (of_get_child_by_name(tree, "__symbols__"))
 		cnt++;
 
-	ovinfo = kcalloc(cnt, sizeof(*ovinfo), GFP_KERNEL);
-	if (!ovinfo)
+	fragments = kcalloc(cnt, sizeof(*fragments), GFP_KERNEL);
+	if (!fragments)
 		return -ENOMEM;
 
 	cnt = 0;
 	for_each_child_of_node(tree, node) {
-		err = of_fill_overlay_info(ov, node, &ovinfo[cnt]);
-		if (!err)
+		ret = of_fill_overlay_info(ovcs, node, &fragments[cnt]);
+		if (!ret)
 			cnt++;
 	}
 
 	node = of_get_child_by_name(tree, "__symbols__");
 	if (node) {
-		ovinfo[cnt].overlay = node;
-		ovinfo[cnt].target = of_find_node_by_path("/__symbols__");
-		ovinfo[cnt].is_symbols_node = 1;
+		fragment = &fragments[cnt];
+		fragment->overlay = node;
+		fragment->target = of_find_node_by_path("/__symbols__");
+		fragment->is_symbols_node = 1;
 
-		if (!ovinfo[cnt].target) {
+		if (!fragment->target) {
 			pr_err("no symbols in root of device tree.\n");
 			return -EINVAL;
 		}
@@ -422,137 +461,127 @@ static int of_build_overlay_info(struct of_overlay *ov,
 	}
 
 	if (!cnt) {
-		kfree(ovinfo);
+		kfree(fragments);
 		return -ENODEV;
 	}
 
-	ov->count = cnt;
-	ov->ovinfo_tab = ovinfo;
+	ovcs->count = cnt;
+	ovcs->fragments = fragments;
 
 	return 0;
 }
 
 /**
- * of_free_overlay_info() - Free an overlay info array
- * @ov		Overlay to free the overlay info from
- * @ovinfo_tab:	Array of overlay_info's to free
+ * free_overlay_fragments() - Free a fragments array
+ * @ovcs	Overlay to free the overlay info from
  *
- * Releases the memory of a previously allocated ovinfo array
- * by of_build_overlay_info.
- * Returns 0, or an error if the arguments are bogus.
+ * Frees the memory of an ovcs->fragments[] array.
  */
-static int of_free_overlay_info(struct of_overlay *ov)
+static void free_overlay_fragments(struct overlay_changeset *ovcs)
 {
-	struct of_overlay_info *ovinfo;
 	int i;
 
 	/* do it in reverse */
-	for (i = ov->count - 1; i >= 0; i--) {
-		ovinfo = &ov->ovinfo_tab[i];
-
-		of_node_put(ovinfo->target);
-		of_node_put(ovinfo->overlay);
+	for (i = ovcs->count - 1; i >= 0; i--) {
+		of_node_put(ovcs->fragments[i].target);
+		of_node_put(ovcs->fragments[i].overlay);
 	}
-	kfree(ov->ovinfo_tab);
 
-	return 0;
+	kfree(ovcs->fragments);
 }
 
-static LIST_HEAD(ov_list);
-static DEFINE_IDR(ov_idr);
+static LIST_HEAD(ovcs_list);
+static DEFINE_IDR(ovcs_idr);
 
 /**
- * of_overlay_create() - Create and apply an overlay
- * @tree:	Device node containing all the overlays
+ * of_overlay_apply() - Create and apply an overlay changeset
+ * @tree:	Expanded overlay device tree
  *
- * Creates and applies an overlay while also keeping track
- * of the overlay in a list. This list can be used to prevent
- * illegal overlay removals.
+ * Creates and applies an overlay changeset.  If successful, the overlay
+ * changeset is added to the overlay changeset list.
  *
- * Returns the id of the created overlay, or a negative error number
+ * Returns the id of the created overlay changeset, or a negative error number
  */
-int of_overlay_create(struct device_node *tree)
+int of_overlay_apply(struct device_node *tree)
 {
-	struct of_overlay *ov;
-	int err, id;
+	struct overlay_changeset *ovcs;
+	int id, ret;
 
-	ov = kzalloc(sizeof(*ov), GFP_KERNEL);
-	if (!ov)
+	ovcs = kzalloc(sizeof(*ovcs), GFP_KERNEL);
+	if (!ovcs)
 		return -ENOMEM;
-	ov->id = -1;
+	ovcs->id = -1;
 
-	INIT_LIST_HEAD(&ov->node);
+	INIT_LIST_HEAD(&ovcs->ovcs_list);
 
-	of_changeset_init(&ov->cset);
+	of_changeset_init(&ovcs->cset);
 
 	mutex_lock(&of_mutex);
 
-	id = idr_alloc(&ov_idr, ov, 0, 0, GFP_KERNEL);
+	id = idr_alloc(&ovcs_idr, ovcs, 0, 0, GFP_KERNEL);
 	if (id < 0) {
-		err = id;
+		ret = id;
 		goto err_destroy_trans;
 	}
-	ov->id = id;
+	ovcs->id = id;
 
-	err = of_build_overlay_info(ov, tree);
-	if (err) {
-		pr_err("of_build_overlay_info() failed for tree@%pOF\n",
+	ret = init_overlay_changeset(ovcs, tree);
+	if (ret) {
+		pr_err("init_overlay_changeset() failed for tree@%pOF\n",
 		       tree);
 		goto err_free_idr;
 	}
 
-	err = of_overlay_notify(ov, OF_OVERLAY_PRE_APPLY);
-	if (err < 0) {
-		pr_err("%s: Pre-apply notifier failed (err=%d)\n",
-		       __func__, err);
-		goto err_free_idr;
+	ret = overlay_notify(ovcs, OF_OVERLAY_PRE_APPLY);
+	if (ret < 0) {
+		pr_err("%s: Pre-apply notifier failed (ret=%d)\n",
+		       __func__, ret);
+		goto err_free_overlay_fragments;
 	}
 
-	err = of_overlay_apply(ov);
-	if (err)
-		goto err_abort_trans;
+	ret = build_changeset(ovcs);
+	if (ret)
+		goto err_free_overlay_fragments;
 
-	err = __of_changeset_apply(&ov->cset);
-	if (err)
-		goto err_revert_overlay;
+	ret = __of_changeset_apply(&ovcs->cset);
+	if (ret)
+		goto err_free_overlay_fragments;
 
+	list_add_tail(&ovcs->ovcs_list, &ovcs_list);
 
-	list_add_tail(&ov->node, &ov_list);
-
-	of_overlay_notify(ov, OF_OVERLAY_POST_APPLY);
+	overlay_notify(ovcs, OF_OVERLAY_POST_APPLY);
 
 	mutex_unlock(&of_mutex);
 
 	return id;
 
-err_revert_overlay:
-err_abort_trans:
-	of_free_overlay_info(ov);
+err_free_overlay_fragments:
+	free_overlay_fragments(ovcs);
 err_free_idr:
-	idr_remove(&ov_idr, ov->id);
+	idr_remove(&ovcs_idr, ovcs->id);
 err_destroy_trans:
-	of_changeset_destroy(&ov->cset);
-	kfree(ov);
+	of_changeset_destroy(&ovcs->cset);
+	kfree(ovcs);
 	mutex_unlock(&of_mutex);
 
-	return err;
+	return ret;
 }
-EXPORT_SYMBOL_GPL(of_overlay_create);
+EXPORT_SYMBOL_GPL(of_overlay_apply);
 
 /*
- * check whether the given node, lies under the given tree
- * return 1 if under tree, else 0
+ * Find @np in @tree.
+ *
+ * Returns 1 if @np is @tree or is contained in @tree, else 0
  */
-static int overlay_subtree_check(struct device_node *tree,
-		struct device_node *dn)
+static int find_node(struct device_node *tree, struct device_node *np)
 {
 	struct device_node *child;
 
-	if (tree == dn)
+	if (tree == np)
 		return 1;
 
 	for_each_child_of_node(tree, child) {
-		if (overlay_subtree_check(child, dn)) {
+		if (find_node(child, np)) {
 			of_node_put(child);
 			return 1;
 		}
@@ -562,30 +591,32 @@ static int overlay_subtree_check(struct device_node *tree,
 }
 
 /*
- * check whether this overlay is the topmost
- * return 1 if topmost, else 0
+ * Is @remove_ce_np a child of or the same as any
+ * node in an overlay changeset more topmost than @remove_ovcs?
+ *
+ * Returns 1 if found, else 0
  */
-static int overlay_is_topmost(struct of_overlay *ov, struct device_node *dn)
+static int node_in_later_cs(struct overlay_changeset *remove_ovcs,
+		struct device_node *remove_ce_np)
 {
-	struct of_overlay *ovt;
+	struct overlay_changeset *ovcs;
 	struct of_changeset_entry *ce;
 
-	list_for_each_entry_reverse(ovt, &ov_list, node) {
-		/* if we hit ourselves, we're done */
-		if (ovt == ov)
+	list_for_each_entry_reverse(ovcs, &ovcs_list, ovcs_list) {
+		if (ovcs == remove_ovcs)
 			break;
 
-		/* check against each subtree affected by this overlay */
-		list_for_each_entry(ce, &ovt->cset.entries, node) {
-			if (overlay_subtree_check(ce->np, dn)) {
+		list_for_each_entry(ce, &ovcs->cset.entries, node) {
+			if (find_node(ce->np, remove_ce_np)) {
 				pr_err("%s: #%d clashes #%d @%pOF\n",
-					__func__, ov->id, ovt->id, dn);
-				return 0;
+					__func__, remove_ovcs->id, ovcs->id,
+					remove_ce_np);
+				return 1;
 			}
 		}
 	}
 
-	return 1;
+	return 0;
 }
 
 /*
@@ -598,13 +629,13 @@ static int overlay_is_topmost(struct of_overlay *ov, struct device_node *dn)
  * the one closest to the tail. If another overlay has affected this
  * device node and is closest to the tail, then removal is not permited.
  */
-static int overlay_removal_is_ok(struct of_overlay *ov)
+static int overlay_removal_is_ok(struct overlay_changeset *remove_ovcs)
 {
-	struct of_changeset_entry *ce;
+	struct of_changeset_entry *remove_ce;
 
-	list_for_each_entry(ce, &ov->cset.entries, node) {
-		if (!overlay_is_topmost(ov, ce->np)) {
-			pr_err("overlay #%d is not topmost\n", ov->id);
+	list_for_each_entry(remove_ce, &remove_ovcs->cset.entries, node) {
+		if (node_in_later_cs(remove_ovcs, remove_ce->np)) {
+			pr_err("overlay #%d is not topmost\n", remove_ovcs->id);
 			return 0;
 		}
 	}
@@ -613,74 +644,73 @@ static int overlay_removal_is_ok(struct of_overlay *ov)
 }
 
 /**
- * of_overlay_destroy() - Removes an overlay
- * @id:	Overlay id number returned by a previous call to of_overlay_create
+ * of_overlay_remove() - Revert and free an overlay changeset
+ * @ovcs_id:	Overlay changeset id number
  *
- * Removes an overlay if it is permissible.
+ * Removes an overlay if it is permissible.  ovcs_id was previously returned
+ * by of_overlay_apply().
  *
  * Returns 0 on success, or a negative error number
  */
-int of_overlay_destroy(int id)
+int of_overlay_remove(int ovcs_id)
 {
-	struct of_overlay *ov;
-	int err;
+	struct overlay_changeset *ovcs;
+	int ret = 0;
 
 	mutex_lock(&of_mutex);
 
-	ov = idr_find(&ov_idr, id);
-	if (!ov) {
-		err = -ENODEV;
-		pr_err("destroy: Could not find overlay #%d\n", id);
+	ovcs = idr_find(&ovcs_idr, ovcs_id);
+	if (!ovcs) {
+		ret = -ENODEV;
+		pr_err("remove: Could not find overlay #%d\n", ovcs_id);
 		goto out;
 	}
 
-	if (!overlay_removal_is_ok(ov)) {
-		err = -EBUSY;
+	if (!overlay_removal_is_ok(ovcs)) {
+		ret = -EBUSY;
 		goto out;
 	}
 
-	of_overlay_notify(ov, OF_OVERLAY_PRE_REMOVE);
-	list_del(&ov->node);
-	__of_changeset_revert(&ov->cset);
-	of_overlay_notify(ov, OF_OVERLAY_POST_REMOVE);
-	of_free_overlay_info(ov);
-	idr_remove(&ov_idr, id);
-	of_changeset_destroy(&ov->cset);
-	kfree(ov);
-
-	err = 0;
+	overlay_notify(ovcs, OF_OVERLAY_PRE_REMOVE);
+	list_del(&ovcs->ovcs_list);
+	__of_changeset_revert(&ovcs->cset);
+	overlay_notify(ovcs, OF_OVERLAY_POST_REMOVE);
+	free_overlay_fragments(ovcs);
+	idr_remove(&ovcs_idr, ovcs_id);
+	of_changeset_destroy(&ovcs->cset);
+	kfree(ovcs);
 
 out:
 	mutex_unlock(&of_mutex);
 
-	return err;
+	return ret;
 }
-EXPORT_SYMBOL_GPL(of_overlay_destroy);
+EXPORT_SYMBOL_GPL(of_overlay_remove);
 
 /**
- * of_overlay_destroy_all() - Removes all overlays from the system
+ * of_overlay_remove_all() - Reverts and frees all overlay changesets
  *
  * Removes all overlays from the system in the correct order.
  *
  * Returns 0 on success, or a negative error number
  */
-int of_overlay_destroy_all(void)
+int of_overlay_remove_all(void)
 {
-	struct of_overlay *ov, *ovn;
+	struct overlay_changeset *ovcs, *ovcs_n;
 
 	mutex_lock(&of_mutex);
 
 	/* the tail of list is guaranteed to be safe to remove */
-	list_for_each_entry_safe_reverse(ov, ovn, &ov_list, node) {
-		list_del(&ov->node);
-		__of_changeset_revert(&ov->cset);
-		of_free_overlay_info(ov);
-		idr_remove(&ov_idr, ov->id);
-		kfree(ov);
+	list_for_each_entry_safe_reverse(ovcs, ovcs_n, &ovcs_list, ovcs_list) {
+		list_del(&ovcs->ovcs_list);
+		__of_changeset_revert(&ovcs->cset);
+		free_overlay_fragments(ovcs);
+		idr_remove(&ovcs_idr, ovcs->id);
+		kfree(ovcs);
 	}
 
 	mutex_unlock(&of_mutex);
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(of_overlay_destroy_all);
+EXPORT_SYMBOL_GPL(of_overlay_remove_all);
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 29a35cb1da64..e19dcd80e7a7 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1231,7 +1231,7 @@ static void of_unittest_destroy_tracked_overlays(void)
 			if (!(overlay_id_bits[BIT_WORD(id)] & BIT_MASK(id)))
 				continue;
 
-			ret = of_overlay_destroy(id + overlay_first_id);
+			ret = of_overlay_remove(id + overlay_first_id);
 			if (ret == -ENODEV) {
 				pr_warn("%s: no overlay to destroy for #%d\n",
 					__func__, id + overlay_first_id);
@@ -1263,7 +1263,7 @@ static int of_unittest_apply_overlay(int overlay_nr, int unittest_nr,
 		goto out;
 	}
 
-	ret = of_overlay_create(np);
+	ret = of_overlay_apply(np);
 	if (ret < 0) {
 		unittest(0, "could not create overlay from \"%s\"\n",
 				overlay_path(overlay_nr));
@@ -1348,7 +1348,7 @@ static int of_unittest_apply_revert_overlay_check(int overlay_nr,
 		return -EINVAL;
 	}
 
-	ret = of_overlay_destroy(ov_id);
+	ret = of_overlay_remove(ov_id);
 	if (ret != 0) {
 		unittest(0, "overlay @\"%s\" failed to be destroyed @\"%s\"\n",
 				overlay_path(overlay_nr),
@@ -1477,7 +1477,7 @@ static void of_unittest_overlay_6(void)
 			return;
 		}
 
-		ret = of_overlay_create(np);
+		ret = of_overlay_apply(np);
 		if (ret < 0)  {
 			unittest(0, "could not create overlay from \"%s\"\n",
 					overlay_path(overlay_nr + i));
@@ -1501,7 +1501,7 @@ static void of_unittest_overlay_6(void)
 	}
 
 	for (i = 1; i >= 0; i--) {
-		ret = of_overlay_destroy(ov_id[i]);
+		ret = of_overlay_remove(ov_id[i]);
 		if (ret != 0) {
 			unittest(0, "overlay @\"%s\" failed destroy @\"%s\"\n",
 					overlay_path(overlay_nr + i),
@@ -1547,7 +1547,7 @@ static void of_unittest_overlay_8(void)
 			return;
 		}
 
-		ret = of_overlay_create(np);
+		ret = of_overlay_apply(np);
 		if (ret < 0)  {
 			unittest(0, "could not create overlay from \"%s\"\n",
 					overlay_path(overlay_nr + i));
@@ -1558,7 +1558,7 @@ static void of_unittest_overlay_8(void)
 	}
 
 	/* now try to remove first overlay (it should fail) */
-	ret = of_overlay_destroy(ov_id[0]);
+	ret = of_overlay_remove(ov_id[0]);
 	if (ret == 0) {
 		unittest(0, "overlay @\"%s\" was destroyed @\"%s\"\n",
 				overlay_path(overlay_nr + 0),
@@ -1569,7 +1569,7 @@ static void of_unittest_overlay_8(void)
 
 	/* removing them in order should work */
 	for (i = 1; i >= 0; i--) {
-		ret = of_overlay_destroy(ov_id[i]);
+		ret = of_overlay_remove(ov_id[i]);
 		if (ret != 0) {
 			unittest(0, "overlay @\"%s\" not destroyed @\"%s\"\n",
 					overlay_path(overlay_nr + i),
@@ -2151,9 +2151,9 @@ static int __init overlay_data_add(int onum)
 		goto out_free_np_overlay;
 	}
 
-	ret = of_overlay_create(info->np_overlay);
+	ret = of_overlay_apply(info->np_overlay);
 	if (ret < 0) {
-		pr_err("of_overlay_create() (ret=%d), %d\n", ret, onum);
+		pr_err("of_overlay_apply() (ret=%d), %d\n", ret, onum);
 		goto out_free_np_overlay;
 	} else {
 		info->overlay_id = ret;
diff --git a/include/linux/of.h b/include/linux/of.h
index cfc34117fc92..45e787e28ce7 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1306,26 +1306,26 @@ struct of_overlay_notify_data {
 #ifdef CONFIG_OF_OVERLAY
 
 /* ID based overlays; the API for external users */
-int of_overlay_create(struct device_node *tree);
-int of_overlay_destroy(int id);
-int of_overlay_destroy_all(void);
+int of_overlay_apply(struct device_node *tree);
+int of_overlay_remove(int id);
+int of_overlay_remove_all(void);
 
 int of_overlay_notifier_register(struct notifier_block *nb);
 int of_overlay_notifier_unregister(struct notifier_block *nb);
 
 #else
 
-static inline int of_overlay_create(struct device_node *tree)
+static inline int of_overlay_apply(struct device_node *tree)
 {
 	return -ENOTSUPP;
 }
 
-static inline int of_overlay_destroy(int id)
+static inline int of_overlay_remove(int id)
 {
 	return -ENOTSUPP;
 }
 
-static inline int of_overlay_destroy_all(void)
+static inline int of_overlay_remove_all(void)
 {
 	return -ENOTSUPP;
 }
-- 
Frank Rowand <frank.rowand@sony.com>
