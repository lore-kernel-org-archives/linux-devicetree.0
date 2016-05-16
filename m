From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 5/5] of: overlay: Add pr_fmt for clarity
Date: Mon, 16 May 2016 19:52:36 +0300
Message-ID: <1463417556-23087-6-git-send-email-pantelis.antoniou@konsulko.com>
References: <1463417556-23087-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463417556-23087-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There are a bunch of pr_.*() messages in the file, use a common pr_fmt
for making them a little bit shorter.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 drivers/of/overlay.c | 84 ++++++++++++++++++++++++----------------------------
 1 file changed, 38 insertions(+), 46 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 89ebb70..eecd6d2 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -9,6 +9,8 @@
  * version 2 as published by the Free Software Foundation.
  */
 
+#define pr_fmt(fmt) "overlay: %s() " fmt, __func__
+
 #undef DEBUG
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -175,8 +177,8 @@ static int of_overlay_apply_one(struct of_overlay *ov,
 	for_each_property_of_node(overlay, prop) {
 		ret = of_overlay_apply_single_property(ov, target, prop);
 		if (ret) {
-			pr_err("%s: Failed to apply prop @%s/%s\n",
-				__func__, target->full_name, prop->name);
+			pr_err("Failed to apply prop @%s/%s\n",
+				target->full_name, prop->name);
 			return ret;
 		}
 	}
@@ -184,9 +186,8 @@ static int of_overlay_apply_one(struct of_overlay *ov,
 	for_each_child_of_node(overlay, child) {
 		ret = of_overlay_apply_single_device_node(ov, target, child);
 		if (ret != 0) {
-			pr_err("%s: Failed to apply single node @%s/%s\n",
-					__func__, target->full_name,
-					child->name);
+			pr_err("Failed to apply single node @%s/%s\n",
+					target->full_name, child->name);
 			of_node_put(child);
 			return ret;
 		}
@@ -214,8 +215,8 @@ static int of_overlay_apply(struct of_overlay *ov)
 
 		err = of_overlay_apply_one(ov, ovinfo->target, ovinfo->overlay);
 		if (err != 0) {
-			pr_err("%s: overlay failed '%s'\n",
-				__func__, ovinfo->target->full_name);
+			pr_err("overlay failed '%s'\n",
+				ovinfo->target->full_name);
 			return err;
 		}
 	}
@@ -237,8 +238,7 @@ static struct device_node *find_target_node_direct(struct of_overlay *ov,
 	if (ret == 0) {
 		target = of_find_node_by_phandle(val);
 		if (!target) {
-			pr_err("%s: Could not find target phandle 0x%x\n",
-					__func__, val);
+			pr_err("Could not find target phandle 0x%x\n", val);
 			return NULL;
 		}
 		goto check_root;
@@ -251,8 +251,8 @@ static struct device_node *find_target_node_direct(struct of_overlay *ov,
 		if (!ov->target_root) {
 			target = of_find_node_by_path(path);
 			if (!target)
-				pr_err("%s: Could not find target path \"%s\"\n",
-						__func__, path);
+				pr_err("Could not find target path \"%s\"\n",
+						path);
 			return target;
 		}
 
@@ -265,8 +265,7 @@ static struct device_node *find_target_node_direct(struct of_overlay *ov,
 					of_node_full_name(ov->target_root),
 					*path ? "/" : "", path);
 			if (!newpath) {
-				pr_err("%s: Could not allocate \"%s%s%s\"\n",
-					__func__,
+				pr_err("Could not allocate \"%s%s%s\"\n",
 					of_node_full_name(ov->target_root),
 					*path ? "/" : "", path);
 				return NULL;
@@ -280,8 +279,7 @@ static struct device_node *find_target_node_direct(struct of_overlay *ov,
 		/* target is an alias, need to check */
 		target = of_find_node_by_path(path);
 		if (!target) {
-			pr_err("%s: Could not find alias \"%s\"\n",
-					__func__, path);
+			pr_err("Could not find alias \"%s\"\n", path);
 			return NULL;
 		}
 		goto check_root;
@@ -298,8 +296,8 @@ check_root:
 		if (np == ov->target_root)
 			return target;
 	}
-	pr_err("%s: target \"%s\" not under target_root \"%s\"\n",
-			__func__, of_node_full_name(target),
+	pr_err("target \"%s\" not under target_root \"%s\"\n",
+			of_node_full_name(target),
 			of_node_full_name(ov->target_root));
 	/* target is not under target_root */
 	of_node_put(target);
@@ -331,8 +329,7 @@ static struct device_node *find_target_node(struct of_overlay *ov,
 
 	target_indirect = of_get_child_by_name(info_node, "target-indirect");
 	if (!target_indirect) {
-		pr_err("%s: Failed to find target-indirect node at %s\n",
-				__func__,
+		pr_err("Failed to find target-indirect node at %s\n",
 				of_node_full_name(info_node));
 		return NULL;
 	}
@@ -340,8 +337,8 @@ static struct device_node *find_target_node(struct of_overlay *ov,
 	indirect = of_get_child_by_name(target_indirect, ov->indirect_id);
 	of_node_put(target_indirect);
 	if (!indirect) {
-		pr_err("%s: Failed to find indirect child node \"%s\" at %s\n",
-				__func__, ov->indirect_id,
+		pr_err("Failed to find indirect child node \"%s\" at %s\n",
+				ov->indirect_id,
 				of_node_full_name(info_node));
 		return NULL;
 	}
@@ -349,8 +346,8 @@ static struct device_node *find_target_node(struct of_overlay *ov,
 	target = find_target_node_direct(ov, indirect);
 
 	if (!target) {
-		pr_err("%s: Failed to find target for \"%s\" at %s\n",
-				__func__, ov->indirect_id,
+		pr_err("Failed to find target for \"%s\" at %s\n",
+				ov->indirect_id,
 				of_node_full_name(indirect));
 	}
 	of_node_put(indirect);
@@ -705,8 +702,7 @@ static int __of_overlay_create(struct device_node *tree,
 
 	id = idr_alloc(&ov_idr, ov, 0, 0, GFP_KERNEL);
 	if (id < 0) {
-		pr_err("%s: idr_alloc() failed for tree@%s\n",
-				__func__, tree->full_name);
+		pr_err("idr_alloc() failed for tree@%s\n", tree->full_name);
 		err = id;
 		goto err_destroy_trans;
 	}
@@ -715,46 +711,46 @@ static int __of_overlay_create(struct device_node *tree,
 	/* build the overlay info structures */
 	err = of_build_overlay_info(ov, tree);
 	if (err) {
-		pr_err("%s: of_build_overlay_info() failed for tree@%s\n",
-				__func__, tree->full_name);
+		pr_err("of_build_overlay_info() failed for tree@%s\n",
+				tree->full_name);
 		goto err_free_idr;
 	}
 
 	/* apply the overlay */
 	err = of_overlay_apply(ov);
 	if (err) {
-		pr_err("%s: of_overlay_apply() failed for tree@%s\n",
-				__func__, tree->full_name);
+		pr_err("of_overlay_apply() failed for tree@%s\n",
+				tree->full_name);
 		goto err_abort_trans;
 	}
 
 	err = of_overlay_add_symbols(tree, ov);
 	if (err) {
-		pr_err("%s: of_overlay_add_symbols() failed for tree@%s\n",
-				__func__, tree->full_name);
+		pr_err("of_overlay_add_symbols() failed for tree@%s\n",
+				tree->full_name);
 		goto err_abort_trans;
 	}
 
 	/* apply the changeset */
 	err = __of_changeset_apply(&ov->cset);
 	if (err) {
-		pr_err("%s: __of_changeset_apply() failed for tree@%s\n",
-				__func__, tree->full_name);
+		pr_err("__of_changeset_apply() failed for tree@%s\n",
+				tree->full_name);
 		goto err_revert_overlay;
 	}
 
 	ov->kobj.kset = ov_kset;
 	err = kobject_add(&ov->kobj, NULL, "%d", id);
 	if (err != 0) {
-		pr_err("%s: kobject_add() failed for tree@%s\n",
-				__func__, tree->full_name);
+		pr_err("kobject_add() failed for tree@%s\n",
+				tree->full_name);
 		goto err_cancel_overlay;
 	}
 
 	err = sysfs_create_groups(&ov->kobj, ov->attr_groups);
 	if (err != 0) {
-		pr_err("%s: sysfs_create_groups() failed for tree@%s\n",
-				__func__, tree->full_name);
+		pr_err("sysfs_create_groups() failed for tree@%s\n",
+				tree->full_name);
 		goto err_remove_kobj;
 	}
 
@@ -871,9 +867,8 @@ static int overlay_is_topmost(struct of_overlay *ov, struct device_node *dn)
 		/* check against each subtree affected by this overlay */
 		list_for_each_entry(ce, &ovt->cset.entries, node) {
 			if (overlay_subtree_check(ce->np, dn)) {
-				pr_err("%s: #%d clashes #%d @%s\n",
-					__func__, ov->id, ovt->id,
-					dn->full_name);
+				pr_err("#%d clashes #%d @%s\n",
+					ov->id, ovt->id, dn->full_name);
 				return 0;
 			}
 		}
@@ -899,8 +894,7 @@ static int overlay_removal_is_ok(struct of_overlay *ov)
 
 	list_for_each_entry(ce, &ov->cset.entries, node) {
 		if (!overlay_is_topmost(ov, ce->np)) {
-			pr_err("%s: overlay #%d is not topmost\n",
-					__func__, ov->id);
+			pr_err("overlay #%d is not topmost\n", ov->id);
 			return 0;
 		}
 	}
@@ -926,16 +920,14 @@ int of_overlay_destroy(int id)
 	ov = idr_find(&ov_idr, id);
 	if (ov == NULL) {
 		err = -ENODEV;
-		pr_err("%s: Could not find overlay #%d\n",
-				__func__, id);
+		pr_err("Could not find overlay #%d\n", id);
 		goto out;
 	}
 
 	/* check whether the overlay is safe to remove */
 	if (!overlay_removal_is_ok(ov)) {
 		err = -EBUSY;
-		pr_err("%s: removal check failed for overlay #%d\n",
-				__func__, id);
+		pr_err("removal check failed for overlay #%d\n", id);
 		goto out;
 	}
 
-- 
1.7.12

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
