From: frowand.list@gmail.com
Subject: [PATCH v3 02/12] of: overlay.c: Convert comparisons to zero or NULL to logical expressions
Date: Tue, 17 Oct 2017 16:36:22 -0700
Message-ID: <1508283392-18252-3-git-send-email-frowand.list@gmail.com>
References: <1508283392-18252-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508283392-18252-1-git-send-email-frowand.list@gmail.com>
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
index a42dd7b094c4..d3f4a5974a11 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -169,9 +169,9 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
 
 	tprop = of_find_property(target, prop->name, NULL);
 
-	if (of_prop_cmp(prop->name, "name") == 0 ||
-	    of_prop_cmp(prop->name, "phandle") == 0 ||
-	    of_prop_cmp(prop->name, "linux,phandle") == 0)
+	if (!of_prop_cmp(prop->name, "name") ||
+	    !of_prop_cmp(prop->name, "phandle") ||
+	    !of_prop_cmp(prop->name, "linux,phandle"))
 		return 0;
 
 	if (is_symbols_node) {
@@ -182,10 +182,10 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
 		propn = __of_prop_dup(prop, GFP_KERNEL);
 	}
 
-	if (propn == NULL)
+	if (!propn)
 		return -ENOMEM;
 
-	if (tprop == NULL)
+	if (!tprop)
 		ret = of_changeset_add_property(&ov->cset, target, propn);
 	else
 		ret = of_changeset_update_property(&ov->cset, target, propn);
@@ -206,14 +206,14 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
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
 
@@ -271,7 +271,7 @@ static int of_overlay_apply_one(struct of_overlay *ov,
 
 	for_each_child_of_node(overlay, child) {
 		ret = of_overlay_apply_single_device_node(ov, target, child);
-		if (ret != 0) {
+		if (ret) {
 			pr_err("Failed to apply single node @%pOF/%s\n",
 			       target, child->name);
 			of_node_put(child);
@@ -300,7 +300,7 @@ static int of_overlay_apply(struct of_overlay *ov)
 
 		err = of_overlay_apply_one(ov, ovinfo->target, ovinfo->overlay,
 					   ovinfo->is_symbols_node);
-		if (err != 0) {
+		if (err) {
 			pr_err("apply failed '%pOF'\n", ovinfo->target);
 			return err;
 		}
@@ -323,11 +323,11 @@ static struct device_node *find_target_node(struct device_node *info_node)
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
@@ -354,11 +354,11 @@ static int of_fill_overlay_info(struct of_overlay *ov,
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
@@ -398,13 +398,13 @@ static int of_build_overlay_info(struct of_overlay *ov,
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
 
@@ -422,7 +422,7 @@ static int of_build_overlay_info(struct of_overlay *ov,
 		cnt++;
 	}
 
-	if (cnt == 0) {
+	if (!cnt) {
 		kfree(ovinfo);
 		return -ENODEV;
 	}
@@ -478,7 +478,7 @@ int of_overlay_create(struct device_node *tree)
 	int err, id;
 
 	ov = kzalloc(sizeof(*ov), GFP_KERNEL);
-	if (ov == NULL)
+	if (!ov)
 		return -ENOMEM;
 	ov->id = -1;
 
@@ -629,7 +629,7 @@ int of_overlay_destroy(int id)
 	mutex_lock(&of_mutex);
 
 	ov = idr_find(&ov_idr, id);
-	if (ov == NULL) {
+	if (!ov) {
 		err = -ENODEV;
 		pr_err("destroy: Could not find overlay #%d\n", id);
 		goto out;
-- 
Frank Rowand <frank.rowand@sony.com>
