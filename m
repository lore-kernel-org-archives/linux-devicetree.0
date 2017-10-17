From: frowand.list@gmail.com
Subject: [PATCH v2 02/12] of: overlay.c: Convert comparisons to zero or NULL to logical expressions
Date: Mon, 16 Oct 2017 18:17:44 -0700
Message-ID: <1508203074-26917-3-git-send-email-frowand.list@gmail.com>
References: <1508203074-26917-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508203074-26917-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Use normal shorthand for comparing a variable to zero.
For variable "XXX":
   convert (XXX == 0) to (!XXX)
   convert (XXX != 0) to (XXX)

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/overlay.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 26f63f10f4b0..8e0c7eb4858c 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -168,9 +168,9 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
 
 	tprop = of_find_property(target, prop->name, NULL);
 
-	if (of_prop_cmp(prop->name, "name") == 0 ||
-	    of_prop_cmp(prop->name, "phandle") == 0 ||
-	    of_prop_cmp(prop->name, "linux,phandle") == 0)
+	if (!of_prop_cmp(prop->name, "name") ||
+	    !of_prop_cmp(prop->name, "phandle") ||
+	    !of_prop_cmp(prop->name, "linux,phandle"))
 		return 0;
 
 	if (is_symbols_node) {
@@ -181,10 +181,10 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
 		propn = __of_prop_dup(prop, GFP_KERNEL);
 	}
 
-	if (propn == NULL)
+	if (!propn)
 		return -ENOMEM;
 
-	if (tprop == NULL)
+	if (!tprop)
 		return of_changeset_add_property(&ov->cset, target, propn);
 
 	return of_changeset_update_property(&ov->cset, target, propn);
@@ -205,14 +205,14 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
 	int ret = 0;
 
 	cname = kbasename(child->full_name);
-	if (cname == NULL)
+	if (!cname)
 		return -ENOMEM;
 
 	for_each_child_of_node(target, tchild)
 		if (!of_node_cmp(cname, kbasename(tchild->full_name)))
 			break;
 
-	if (tchild != NULL) {
+	if (tchild) {
 		if (child->phandle)
 			return -EINVAL;
 
@@ -270,7 +270,7 @@ static int of_overlay_apply_one(struct of_overlay *ov,
 
 	for_each_child_of_node(overlay, child) {
 		ret = of_overlay_apply_single_device_node(ov, target, child);
-		if (ret != 0) {
+		if (ret) {
 			pr_err("Failed to apply single node @%pOF/%s\n",
 			       target, child->name);
 			of_node_put(child);
@@ -299,7 +299,7 @@ static int of_overlay_apply(struct of_overlay *ov)
 
 		err = of_overlay_apply_one(ov, ovinfo->target, ovinfo->overlay,
 					   ovinfo->is_symbols_node);
-		if (err != 0) {
+		if (err) {
 			pr_err("apply failed '%pOF'\n", ovinfo->target);
 			return err;
 		}
@@ -322,11 +322,11 @@ static struct device_node *find_target_node(struct device_node *info_node)
 	int ret;
 
 	ret = of_property_read_u32(info_node, "target", &val);
-	if (ret == 0)
+	if (!ret)
 		return of_find_node_by_phandle(val);
 
 	ret = of_property_read_string(info_node, "target-path", &path);
-	if (ret == 0)
+	if (!ret)
 		return of_find_node_by_path(path);
 
 	pr_err("Failed to find target for node %p (%s)\n",
@@ -353,11 +353,11 @@ static int of_fill_overlay_info(struct of_overlay *ov,
 		struct device_node *info_node, struct of_overlay_info *ovinfo)
 {
 	ovinfo->overlay = of_get_child_by_name(info_node, "__overlay__");
-	if (ovinfo->overlay == NULL)
+	if (!ovinfo->overlay)
 		goto err_fail;
 
 	ovinfo->target = find_target_node(info_node);
-	if (ovinfo->target == NULL)
+	if (!ovinfo->target)
 		goto err_fail;
 
 	return 0;
@@ -397,13 +397,13 @@ static int of_build_overlay_info(struct of_overlay *ov,
 		cnt++;
 
 	ovinfo = kcalloc(cnt, sizeof(*ovinfo), GFP_KERNEL);
-	if (ovinfo == NULL)
+	if (!ovinfo)
 		return -ENOMEM;
 
 	cnt = 0;
 	for_each_child_of_node(tree, node) {
 		err = of_fill_overlay_info(ov, node, &ovinfo[cnt]);
-		if (err == 0)
+		if (!err)
 			cnt++;
 	}
 
@@ -421,7 +421,7 @@ static int of_build_overlay_info(struct of_overlay *ov,
 		cnt++;
 	}
 
-	if (cnt == 0) {
+	if (!cnt) {
 		kfree(ovinfo);
 		return -ENODEV;
 	}
@@ -477,7 +477,7 @@ int of_overlay_create(struct device_node *tree)
 	int err, id;
 
 	ov = kzalloc(sizeof(*ov), GFP_KERNEL);
-	if (ov == NULL)
+	if (!ov)
 		return -ENOMEM;
 	ov->id = -1;
 
@@ -628,7 +628,7 @@ int of_overlay_destroy(int id)
 	mutex_lock(&of_mutex);
 
 	ov = idr_find(&ov_idr, id);
-	if (ov == NULL) {
+	if (!ov) {
 		err = -ENODEV;
 		pr_err("destroy: Could not find overlay #%d\n", id);
 		goto out;
-- 
Frank Rowand <frank.rowand@sony.com>
