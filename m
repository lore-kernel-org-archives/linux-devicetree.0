From: frowand.list@gmail.com
Subject: [PATCH v2 01/12] of: overlay.c: Remove comments that state the obvious, to reduce clutter
Date: Mon, 16 Oct 2017 18:17:43 -0700
Message-ID: <1508203074-26917-2-git-send-email-frowand.list@gmail.com>
References: <1508203074-26917-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508203074-26917-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Follows recommendations in Documentation/process/coding-style.rst,
section 8, Commenting.

Some in function comments are promoted to function header comments.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/overlay.c | 53 ++++++++++++++++++++++++----------------------------
 1 file changed, 24 insertions(+), 29 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 8ecfee31ab6d..26f63f10f4b0 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -143,7 +143,6 @@ static struct property *dup_and_fixup_symbol_prop(struct of_overlay *ov,
 	strcpy(new->value, target_path);
 	strcpy(new->value + target_path_len, label_path);
 
-	/* mark the property as dynamic */
 	of_property_set_flag(new, OF_DYNAMIC);
 
 	return new;
@@ -157,23 +156,24 @@ static struct property *dup_and_fixup_symbol_prop(struct of_overlay *ov,
 
 }
 
+/*
+ * Some special properties are not updated (no error returned).
+ * Update of property in symbols node is not allowed.
+ */
 static int of_overlay_apply_single_property(struct of_overlay *ov,
 		struct device_node *target, struct property *prop,
 		bool is_symbols_node)
 {
 	struct property *propn = NULL, *tprop;
 
-	/* NOTE: Multiple changes of single properties not supported */
 	tprop = of_find_property(target, prop->name, NULL);
 
-	/* special properties are not meant to be updated (silent NOP) */
 	if (of_prop_cmp(prop->name, "name") == 0 ||
 	    of_prop_cmp(prop->name, "phandle") == 0 ||
 	    of_prop_cmp(prop->name, "linux,phandle") == 0)
 		return 0;
 
 	if (is_symbols_node) {
-		/* changing a property in __symbols__ node not allowed */
 		if (tprop)
 			return -EINVAL;
 		propn = dup_and_fixup_symbol_prop(ov, prop);
@@ -184,14 +184,19 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
 	if (propn == NULL)
 		return -ENOMEM;
 
-	/* not found? add */
 	if (tprop == NULL)
 		return of_changeset_add_property(&ov->cset, target, propn);
 
-	/* found? update */
 	return of_changeset_update_property(&ov->cset, target, propn);
 }
 
+/*
+ * NOTE: Multiple mods of created nodes not supported.
+ *
+ * Return
+ *  -ENOMEM if memory allocation fails
+ *  -EINVAL if existing node has a phandle and overlay node has a phandle
+ */
 static int of_overlay_apply_single_device_node(struct of_overlay *ov,
 		struct device_node *target, struct device_node *child)
 {
@@ -203,13 +208,11 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
 	if (cname == NULL)
 		return -ENOMEM;
 
-	/* NOTE: Multiple mods of created nodes not supported */
 	for_each_child_of_node(target, tchild)
 		if (!of_node_cmp(cname, kbasename(tchild->full_name)))
 			break;
 
 	if (tchild != NULL) {
-		/* new overlay phandle value conflicts with existing value */
 		if (child->phandle)
 			return -EINVAL;
 
@@ -217,12 +220,10 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
 		ret = of_overlay_apply_one(ov, tchild, child, 0);
 		of_node_put(tchild);
 	} else {
-		/* create empty tree as a target */
 		tchild = __of_node_dup(child, "%pOF/%s", target, cname);
 		if (!tchild)
 			return -ENOMEM;
 
-		/* point to parent */
 		tchild->parent = target;
 
 		ret = of_changeset_attach_node(&ov->cset, tchild);
@@ -243,6 +244,8 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
  * Note that the in case of an error the target node is left
  * in a inconsistent state. Error recovery should be performed
  * by using the changeset.
+ *
+ * Do not allow symbols node to have any children.
  */
 static int of_overlay_apply_one(struct of_overlay *ov,
 		struct device_node *target, const struct device_node *overlay,
@@ -262,7 +265,6 @@ static int of_overlay_apply_one(struct of_overlay *ov,
 		}
 	}
 
-	/* do not allow symbols node to have any children */
 	if (is_symbols_node)
 		return 0;
 
@@ -292,7 +294,6 @@ static int of_overlay_apply(struct of_overlay *ov)
 {
 	int i, err;
 
-	/* first we apply the overlays atomically */
 	for (i = 0; i < ov->count; i++) {
 		struct of_overlay_info *ovinfo = &ov->ovinfo_tab[i];
 
@@ -309,10 +310,10 @@ static int of_overlay_apply(struct of_overlay *ov)
 
 /*
  * Find the target node using a number of different strategies
- * in order of preference
+ * in order of preference:
  *
- * "target" property containing the phandle of the target
- * "target-path" property containing the path of the target
+ * 1) "target" property containing the phandle of the target
+ * 2) "target-path" property containing the path of the target
  */
 static struct device_node *find_target_node(struct device_node *info_node)
 {
@@ -320,12 +321,10 @@ static struct device_node *find_target_node(struct device_node *info_node)
 	u32 val;
 	int ret;
 
-	/* first try to go by using the target as a phandle */
 	ret = of_property_read_u32(info_node, "target", &val);
 	if (ret == 0)
 		return of_find_node_by_phandle(val);
 
-	/* now try to locate by path */
 	ret = of_property_read_string(info_node, "target-path", &path);
 	if (ret == 0)
 		return of_find_node_by_path(path);
@@ -390,7 +389,6 @@ static int of_build_overlay_info(struct of_overlay *ov,
 	struct of_overlay_info *ovinfo;
 	int cnt, err;
 
-	/* worst case; every child is a node */
 	cnt = 0;
 	for_each_child_of_node(tree, node)
 		cnt++;
@@ -423,7 +421,6 @@ static int of_build_overlay_info(struct of_overlay *ov,
 		cnt++;
 	}
 
-	/* if nothing filled, return error */
 	if (cnt == 0) {
 		kfree(ovinfo);
 		return -ENODEV;
@@ -479,7 +476,6 @@ int of_overlay_create(struct device_node *tree)
 	struct of_overlay *ov;
 	int err, id;
 
-	/* allocate the overlay structure */
 	ov = kzalloc(sizeof(*ov), GFP_KERNEL);
 	if (ov == NULL)
 		return -ENOMEM;
@@ -498,7 +494,6 @@ int of_overlay_create(struct device_node *tree)
 	}
 	ov->id = id;
 
-	/* build the overlay info structures */
 	err = of_build_overlay_info(ov, tree);
 	if (err) {
 		pr_err("of_build_overlay_info() failed for tree@%pOF\n",
@@ -513,18 +508,15 @@ int of_overlay_create(struct device_node *tree)
 		goto err_free_idr;
 	}
 
-	/* apply the overlay */
 	err = of_overlay_apply(ov);
 	if (err)
 		goto err_abort_trans;
 
-	/* apply the changeset */
 	err = __of_changeset_apply(&ov->cset);
 	if (err)
 		goto err_revert_overlay;
 
 
-	/* add to the tail of the overlay list */
 	list_add_tail(&ov->node, &ov_list);
 
 	of_overlay_notify(ov, OF_OVERLAY_POST_APPLY);
@@ -547,13 +539,15 @@ int of_overlay_create(struct device_node *tree)
 }
 EXPORT_SYMBOL_GPL(of_overlay_create);
 
-/* check whether the given node, lies under the given tree */
+/*
+ * check whether the given node, lies under the given tree
+ * return 1 if under tree, else 0
+ */
 static int overlay_subtree_check(struct device_node *tree,
 		struct device_node *dn)
 {
 	struct device_node *child;
 
-	/* match? */
 	if (tree == dn)
 		return 1;
 
@@ -567,7 +561,10 @@ static int overlay_subtree_check(struct device_node *tree,
 	return 0;
 }
 
-/* check whether this overlay is the topmost */
+/*
+ * check whether this overlay is the topmost
+ * return 1 if topmost, else 0
+ */
 static int overlay_is_topmost(struct of_overlay *ov, struct device_node *dn)
 {
 	struct of_overlay *ovt;
@@ -588,7 +585,6 @@ static int overlay_is_topmost(struct of_overlay *ov, struct device_node *dn)
 		}
 	}
 
-	/* overlay is topmost */
 	return 1;
 }
 
@@ -638,7 +634,6 @@ int of_overlay_destroy(int id)
 		goto out;
 	}
 
-	/* check whether the overlay is safe to remove */
 	if (!overlay_removal_is_ok(ov)) {
 		err = -EBUSY;
 		goto out;
-- 
Frank Rowand <frank.rowand@sony.com>
