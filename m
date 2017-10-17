From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH v3 01/12] of: overlay.c: Remove comments that state the obvious, to reduce clutter
Date: Tue, 17 Oct 2017 16:36:21 -0700
Message-ID: <1508283392-18252-2-git-send-email-frowand.list@gmail.com>
References: <1508283392-18252-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508283392-18252-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Follows recommendations in Documentation/process/coding-style.rst,
section 8, Commenting.

Some in function comments are promoted to function header comments.

Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---
 drivers/of/overlay.c | 47 ++++++++++++++++++-----------------------------
 1 file changed, 18 insertions(+), 29 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index af3b9a16df26..a42dd7b094c4 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -143,7 +143,6 @@ static struct property *dup_and_fixup_symbol_prop(struct of_overlay *ov,
 	strcpy(new->value, target_path);
 	strcpy(new->value + target_path_len, label_path);
 
-	/* mark the property as dynamic */
 	of_property_set_flag(new, OF_DYNAMIC);
 
 	return new;
@@ -157,6 +156,10 @@ static struct property *dup_and_fixup_symbol_prop(struct of_overlay *ov,
 
 }
 
+/*
+ * Some special properties are not updated (no error returned).
+ * Update of property in symbols node is not allowed.
+ */
 static int of_overlay_apply_single_property(struct of_overlay *ov,
 		struct device_node *target, struct property *prop,
 		bool is_symbols_node)
@@ -164,17 +167,14 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
 	struct property *propn = NULL, *tprop;
 	int ret = 0;
 
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
@@ -185,10 +185,9 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
 	if (propn == NULL)
 		return -ENOMEM;
 
-	/* not found? add */
 	if (tprop == NULL)
 		ret = of_changeset_add_property(&ov->cset, target, propn);
-	else /* found? update */
+	else
 		ret = of_changeset_update_property(&ov->cset, target, propn);
 
 	if (ret) {
@@ -210,13 +209,11 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
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
 
@@ -224,12 +221,10 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
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
@@ -250,6 +245,8 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
  * Note that the in case of an error the target node is left
  * in a inconsistent state. Error recovery should be performed
  * by using the changeset.
+ *
+ * Do not allow symbols node to have any children.
  */
 static int of_overlay_apply_one(struct of_overlay *ov,
 		struct device_node *target, const struct device_node *overlay,
@@ -269,7 +266,6 @@ static int of_overlay_apply_one(struct of_overlay *ov,
 		}
 	}
 
-	/* do not allow symbols node to have any children */
 	if (is_symbols_node)
 		return 0;
 
@@ -299,7 +295,6 @@ static int of_overlay_apply(struct of_overlay *ov)
 {
 	int i, err;
 
-	/* first we apply the overlays atomically */
 	for (i = 0; i < ov->count; i++) {
 		struct of_overlay_info *ovinfo = &ov->ovinfo_tab[i];
 
@@ -316,10 +311,10 @@ static int of_overlay_apply(struct of_overlay *ov)
 
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
@@ -327,12 +322,10 @@ static struct device_node *find_target_node(struct device_node *info_node)
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
@@ -397,7 +390,6 @@ static int of_build_overlay_info(struct of_overlay *ov,
 	struct of_overlay_info *ovinfo;
 	int cnt, err;
 
-	/* worst case; every child is a node */
 	cnt = 0;
 	for_each_child_of_node(tree, node)
 		cnt++;
@@ -430,7 +422,6 @@ static int of_build_overlay_info(struct of_overlay *ov,
 		cnt++;
 	}
 
-	/* if nothing filled, return error */
 	if (cnt == 0) {
 		kfree(ovinfo);
 		return -ENODEV;
@@ -486,7 +477,6 @@ int of_overlay_create(struct device_node *tree)
 	struct of_overlay *ov;
 	int err, id;
 
-	/* allocate the overlay structure */
 	ov = kzalloc(sizeof(*ov), GFP_KERNEL);
 	if (ov == NULL)
 		return -ENOMEM;
@@ -505,7 +495,6 @@ int of_overlay_create(struct device_node *tree)
 	}
 	ov->id = id;
 
-	/* build the overlay info structures */
 	err = of_build_overlay_info(ov, tree);
 	if (err) {
 		pr_err("of_build_overlay_info() failed for tree@%pOF\n",
@@ -520,18 +509,15 @@ int of_overlay_create(struct device_node *tree)
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
@@ -554,13 +540,15 @@ int of_overlay_create(struct device_node *tree)
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
 
@@ -574,7 +562,10 @@ static int overlay_subtree_check(struct device_node *tree,
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
@@ -595,7 +586,6 @@ static int overlay_is_topmost(struct of_overlay *ov, struct device_node *dn)
 		}
 	}
 
-	/* overlay is topmost */
 	return 1;
 }
 
@@ -645,7 +635,6 @@ int of_overlay_destroy(int id)
 		goto out;
 	}
 
-	/* check whether the overlay is safe to remove */
 	if (!overlay_removal_is_ok(ov)) {
 		err = -EBUSY;
 		goto out;
-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
