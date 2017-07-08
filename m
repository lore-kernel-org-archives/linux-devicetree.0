From: frowand.list@gmail.com
Subject: [PATCH 3/3] of: overlay: add overlay symbols to live device tree
Date: Fri,  7 Jul 2017 17:28:45 -0700
Message-ID: <1499473725-13361-4-git-send-email-frowand.list@gmail.com>
References: <1499473725-13361-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499473725-13361-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Add overlay __symbols__ properties to live tree when an overlay
is added to the live tree so that the symbols are available to
subsequent overlays.

Expected test result is new __symbols__ entries for labels from
the overlay after the patch is applied.

Before this patch is applied:

   Console error message near end of unittest:
      ### dt-test ### FAIL of_unittest_overlay_high_level():2296 Adding overlay 'overlay_bad_symbol' failed
      ### dt-test ### end of unittest - 190 passed, 1 failed

   The new unittest "fails" because the expected result of loading the
   new overlay is an error instead of success.

   $ # node hvac-medium-2 exists because the overlay loaded
   $ # since the duplicate symbol was not detected
   $ cd /proc/device-tree/testcase-data-2/substation@100/
   $ ls
   compatible     hvac-medium-2  motor-8        reg
   hvac-large-1   linux,phandle  name           status
   hvac-medium-1  motor-1        phandle

   $ cd /proc/device-tree/__symbols__/
   $ ls
   electric_1   lights_1     name         rides_1      spin_ctrl_2
   hvac_1       lights_2     retail_1     spin_ctrl_1

After this patch is applied:

   Previous console error message no longer occurs, but expected error
   occurs:
      OF: overlay: Failed to apply prop @/__symbols__/hvac_1
      OF: overlay: apply failed '/__symbols__'
      ### dt-test ### end of unittest - 191 passed, 0 failed

   $ # node hvac-medium-2 does not exist because the overlay
   $ # properly failed to load due to the duplicate symbol
   $ cd /proc/device-tree/testcase-data-2/substation@100/
   $ ls
   compatible     hvac-medium-1  motor-1        name           reg
   hvac-large-1   linux,phandle  motor-8        phandle        status

   $ cd /proc/device-tree/__symbols__/
   $ ls
   electric_1      lights_1        retail_1        ride_200_right  spin_ctrl_2
   hvac_1          lights_2        ride_200        rides_1
   hvac_2          name            ride_200_left   spin_ctrl_1
   $ cat ride_200; echo
   /testcase-data-2/fairway-1/ride@200
   $ cat ride_200_left ; echo
   /testcase-data-2/fairway-1/ride@200/track@1
   $ cat ride_200_right ; echo
   /testcase-data-2/fairway-1/ride@200/track@2

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/overlay.c | 116 +++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 107 insertions(+), 9 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 30aef51eeee5..c484712d124a 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -35,6 +35,7 @@
 struct of_overlay_info {
 	struct device_node *target;
 	struct device_node *overlay;
+	bool is_symbols_node;
 };
 
 /**
@@ -55,7 +56,8 @@ struct of_overlay {
 };
 
 static int of_overlay_apply_one(struct of_overlay *ov,
-		struct device_node *target, const struct device_node *overlay);
+		struct device_node *target, const struct device_node *overlay,
+		bool is_symbols_node);
 
 static BLOCKING_NOTIFIER_HEAD(of_overlay_chain);
 
@@ -92,10 +94,74 @@ static int of_overlay_notify(struct of_overlay *ov,
 	return 0;
 }
 
+static struct property *dup_and_fixup_symbol_prop(struct of_overlay *ov,
+		const struct property *prop)
+{
+	struct of_overlay_info *ovinfo;
+	struct property *new;
+	const char *overlay_name;
+	char *label_path;
+	char *symbol_path;
+	const char *target_path;
+	int k;
+	int label_path_len;
+	int overlay_name_len;
+	int target_path_len;
+
+	if (!prop->value)
+		return NULL;
+	symbol_path = prop->value;
+
+	new = kzalloc(sizeof(*new), GFP_KERNEL);
+	if (!new)
+		return NULL;
+
+	for (k = 0; k < ov->count; k++) {
+		ovinfo = &ov->ovinfo_tab[k];
+		overlay_name = ovinfo->overlay->full_name;
+		overlay_name_len = strlen(overlay_name);
+		if (!strncasecmp(symbol_path, overlay_name, overlay_name_len))
+			break;
+	}
+
+	if (k >= ov->count)
+		goto err_free;
+
+	target_path = ovinfo->target->full_name;
+	target_path_len = strlen(target_path);
+
+	label_path = symbol_path + overlay_name_len;
+	label_path_len = strlen(label_path);
+
+	new->name = kstrdup(prop->name, GFP_KERNEL);
+	new->length = target_path_len + label_path_len + 1;
+	new->value = kzalloc(new->length, GFP_KERNEL);
+
+	if (!new->name || !new->value)
+		goto err_free;
+
+	strcpy(new->value, target_path);
+	strcpy(new->value + target_path_len, label_path);
+
+	/* mark the property as dynamic */
+	of_property_set_flag(new, OF_DYNAMIC);
+
+	return new;
+
+ err_free:
+	kfree(new->name);
+	kfree(new->value);
+	kfree(new);
+	return NULL;
+
+
+}
+
 static int of_overlay_apply_single_property(struct of_overlay *ov,
-		struct device_node *target, struct property *prop)
+		struct device_node *target, struct property *prop,
+		bool is_symbols_node)
 {
-	struct property *propn, *tprop;
+	struct property *propn = NULL, *tprop;
 
 	/* NOTE: Multiple changes of single properties not supported */
 	tprop = of_find_property(target, prop->name, NULL);
@@ -106,7 +172,15 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
 	    of_prop_cmp(prop->name, "linux,phandle") == 0)
 		return 0;
 
-	propn = __of_prop_dup(prop, GFP_KERNEL);
+	if (is_symbols_node) {
+		/* changing a property in __symbols__ node not allowed */
+		if (tprop)
+			return -EINVAL;
+		propn = dup_and_fixup_symbol_prop(ov, prop);
+	} else {
+		propn = __of_prop_dup(prop, GFP_KERNEL);
+	}
+
 	if (propn == NULL)
 		return -ENOMEM;
 
@@ -155,7 +229,7 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
 			return -EINVAL;
 
 		/* apply overlay recursively */
-		ret = of_overlay_apply_one(ov, tchild, child);
+		ret = of_overlay_apply_one(ov, tchild, child, 0);
 		of_node_put(tchild);
 	} else {
 		/* create empty tree as a target */
@@ -170,7 +244,7 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
 		if (ret)
 			return ret;
 
-		ret = of_overlay_apply_one(ov, tchild, child);
+		ret = of_overlay_apply_one(ov, tchild, child, 0);
 		if (ret)
 			return ret;
 	}
@@ -186,14 +260,16 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
  * by using the changeset.
  */
 static int of_overlay_apply_one(struct of_overlay *ov,
-		struct device_node *target, const struct device_node *overlay)
+		struct device_node *target, const struct device_node *overlay,
+		bool is_symbols_node)
 {
 	struct device_node *child;
 	struct property *prop;
 	int ret;
 
 	for_each_property_of_node(overlay, prop) {
-		ret = of_overlay_apply_single_property(ov, target, prop);
+		ret = of_overlay_apply_single_property(ov, target, prop,
+						       is_symbols_node);
 		if (ret) {
 			pr_err("Failed to apply prop @%s/%s\n",
 			       target->full_name, prop->name);
@@ -201,6 +277,10 @@ static int of_overlay_apply_one(struct of_overlay *ov,
 		}
 	}
 
+	/* do not allow symbols node to have any children */
+	if (is_symbols_node)
+		return 0;
+
 	for_each_child_of_node(overlay, child) {
 		ret = of_overlay_apply_single_device_node(ov, target, child);
 		if (ret != 0) {
@@ -231,7 +311,8 @@ static int of_overlay_apply(struct of_overlay *ov)
 	for (i = 0; i < ov->count; i++) {
 		struct of_overlay_info *ovinfo = &ov->ovinfo_tab[i];
 
-		err = of_overlay_apply_one(ov, ovinfo->target, ovinfo->overlay);
+		err = of_overlay_apply_one(ov, ovinfo->target, ovinfo->overlay,
+					   ovinfo->is_symbols_node);
 		if (err != 0) {
 			pr_err("apply failed '%s'\n", ovinfo->target->full_name);
 			return err;
@@ -329,6 +410,9 @@ static int of_build_overlay_info(struct of_overlay *ov,
 	for_each_child_of_node(tree, node)
 		cnt++;
 
+	if (of_get_child_by_name(tree, "__symbols__"))
+		cnt++;
+
 	ovinfo = kcalloc(cnt, sizeof(*ovinfo), GFP_KERNEL);
 	if (ovinfo == NULL)
 		return -ENOMEM;
@@ -340,6 +424,20 @@ static int of_build_overlay_info(struct of_overlay *ov,
 			cnt++;
 	}
 
+	node = of_get_child_by_name(tree, "__symbols__");
+	if (node) {
+		ovinfo[cnt].overlay = node;
+		ovinfo[cnt].target = of_find_node_by_path("/__symbols__");
+		ovinfo[cnt].is_symbols_node = 1;
+
+		if (!ovinfo[cnt].target) {
+			pr_err("no symbols in root of device tree.\n");
+			return -EINVAL;
+		}
+
+		cnt++;
+	}
+
 	/* if nothing filled, return error */
 	if (cnt == 0) {
 		kfree(ovinfo);
-- 
Frank Rowand <frank.rowand@sony.com>
