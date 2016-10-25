From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [RFC PATCH 07/13] of: Rename variables to better reflect purpose or follow convention
Date: Tue, 25 Oct 2016 13:59:00 -0700
Message-ID: <1477429146-27039-8-git-send-email-frowand.list@gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477429146-27039-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
---
 drivers/of/resolver.c | 172 +++++++++++++++++++++++++-------------------------
 1 file changed, 85 insertions(+), 87 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 0ce38aa0ed3c..0778747cdd58 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -74,17 +74,17 @@ static phandle live_tree_max_phandle(void)
 /*
  * Adjust a subtree's phandle values by a given delta.
  */
-static void adjust_overlay_phandles(struct device_node *node,
+static void adjust_overlay_phandles(struct device_node *overlay,
 		int phandle_delta)
 {
 	struct device_node *child;
 	struct property *prop;
 	phandle phandle;
 
-	if (node->phandle != 0 && node->phandle != OF_PHANDLE_ILLEGAL)
-		node->phandle += phandle_delta;
+	if (overlay->phandle != 0 && overlay->phandle != OF_PHANDLE_ILLEGAL)
+		overlay->phandle += phandle_delta;
 
-	for_each_property_of_node(node, prop) {
+	for_each_property_of_node(overlay, prop) {
 
 		if (of_prop_cmp(prop->name, "phandle") &&
 		    of_prop_cmp(prop->name, "linux,phandle"))
@@ -97,41 +97,40 @@ static void adjust_overlay_phandles(struct device_node *node,
 		if (phandle == OF_PHANDLE_ILLEGAL)
 			continue;
 
-		*(uint32_t *)prop->value = cpu_to_be32(node->phandle);
+		*(uint32_t *)prop->value = cpu_to_be32(overlay->phandle);
 	}
 
-	for_each_child_of_node(node, child)
+	for_each_child_of_node(overlay, child)
 		adjust_overlay_phandles(child, phandle_delta);
 }
 
-static int update_usages_of_a_phandle_reference(struct device_node *node,
-		struct property *rprop, int value)
+static int update_usages_of_a_phandle_reference(struct device_node *overlay,
+		struct property *prop_fixup, phandle phandle)
 {
-	phandle phandle;
 	struct device_node *refnode;
-	struct property *sprop;
-	char *propval, *propcur, *propend, *nodestr, *propstr, *s;
-	int offset, propcurlen;
+	struct property *prop;
+	char *value, *cur, *end, *node_path, *prop_name, *s;
+	int offset, len;
 	int err = 0;
 
-	propval = kmalloc(rprop->length, GFP_KERNEL);
-	if (!propval)
+	value = kmalloc(prop_fixup->length, GFP_KERNEL);
+	if (!value)
 		return -ENOMEM;
-	memcpy(propval, rprop->value, rprop->length);
+	memcpy(value, prop_fixup->value, prop_fixup->length);
 
-	propend = propval + rprop->length;
-	for (propcur = propval; propcur < propend; propcur += propcurlen + 1) {
-		propcurlen = strlen(propcur);
+	end = value + prop_fixup->length;
+	for (cur = value; cur < end; cur += len + 1) {
+		len = strlen(cur);
 
-		nodestr = propcur;
-		s = strchr(propcur, ':');
+		node_path = cur;
+		s = strchr(cur, ':');
 		if (!s) {
 			err = -EINVAL;
 			goto err_fail;
 		}
 		*s++ = '\0';
 
-		propstr = s;
+		prop_name = s;
 		s = strchr(s, ':');
 		if (!s) {
 			err = -EINVAL;
@@ -143,27 +142,26 @@ static int update_usages_of_a_phandle_reference(struct device_node *node,
 		if (err)
 			goto err_fail;
 
-		refnode = find_node_by_full_name(node, nodestr);
+		refnode = find_node_by_full_name(overlay, node_path);
 		if (!refnode)
 			continue;
 
-		for_each_property_of_node(refnode, sprop) {
-			if (!of_prop_cmp(sprop->name, propstr))
+		for_each_property_of_node(refnode, prop) {
+			if (!of_prop_cmp(prop->name, prop_name))
 				break;
 		}
 		of_node_put(refnode);
 
-		if (!sprop) {
+		if (!prop) {
 			err = -ENOENT;
 			goto err_fail;
 		}
 
-		phandle = value;
-		*(__be32 *)(sprop->value + offset) = cpu_to_be32(phandle);
+		*(__be32 *)(prop->value + offset) = cpu_to_be32(phandle);
 	}
 
 err_fail:
-	kfree(propval);
+	kfree(value);
 	return err;
 }
 
@@ -184,61 +182,61 @@ static int node_name_cmp(const struct device_node *dn1,
  * Does not take any devtree locks so make sure you call this on a tree
  * which is at the detached state.
  */
-static int adjust_local_phandle_references(struct device_node *node,
-		struct device_node *target, int phandle_delta)
+static int adjust_local_phandle_references(struct device_node *local_fixups,
+		struct device_node *overlay, int phandle_delta)
 {
-	struct device_node *child, *childtarget;
-	struct property *rprop, *sprop;
+	struct device_node *child, *overlay_child;
+	struct property *prop_fix, *prop;
 	int err, i, count;
 	unsigned int off;
 	phandle phandle;
 
-	if (!node)
+	if (!local_fixups)
 		return 0;
 
-	for_each_property_of_node(node, rprop) {
+	for_each_property_of_node(local_fixups, prop_fix) {
 
 		/* skip properties added automatically */
-		if (!of_prop_cmp(rprop->name, "name") ||
-		    !of_prop_cmp(rprop->name, "phandle") ||
-		    !of_prop_cmp(rprop->name, "linux,phandle"))
+		if (!of_prop_cmp(prop_fix->name, "name") ||
+		    !of_prop_cmp(prop_fix->name, "phandle") ||
+		    !of_prop_cmp(prop_fix->name, "linux,phandle"))
 			continue;
 
-		if ((rprop->length % 4) != 0 || rprop->length == 0)
+		if ((prop_fix->length % 4) != 0 || prop_fix->length == 0)
 			return -EINVAL;
-		count = rprop->length / sizeof(__be32);
+		count = prop_fix->length / sizeof(__be32);
 
-		for_each_property_of_node(target, sprop) {
-			if (!of_prop_cmp(sprop->name, rprop->name))
+		for_each_property_of_node(overlay, prop) {
+			if (!of_prop_cmp(prop->name, prop_fix->name))
 				break;
 		}
 
-		if (!sprop)
+		if (!prop)
 			return -EINVAL;
 
 		for (i = 0; i < count; i++) {
-			off = be32_to_cpu(((__be32 *)rprop->value)[i]);
-			if (off >= sprop->length || (off + 4) > sprop->length)
+			off = be32_to_cpu(((__be32 *)prop_fix->value)[i]);
+			if (off >= prop->length || (off + 4) > prop->length)
 				return -EINVAL;
 
 			if (phandle_delta) {
-				phandle = be32_to_cpu(*(__be32 *)(sprop->value + off));
+				phandle = be32_to_cpu(*(__be32 *)(prop->value + off));
 				phandle += phandle_delta;
-				*(__be32 *)(sprop->value + off) = cpu_to_be32(phandle);
+				*(__be32 *)(prop->value + off) = cpu_to_be32(phandle);
 			}
 		}
 	}
 
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node(local_fixups, child) {
 
-		for_each_child_of_node(target, childtarget)
-			if (!node_name_cmp(child, childtarget))
+		for_each_child_of_node(overlay, overlay_child)
+			if (!node_name_cmp(child, overlay_child))
 				break;
 
-		if (!childtarget)
+		if (!overlay_child)
 			return -EINVAL;
 
-		err = adjust_local_phandle_references(child, childtarget,
+		err = adjust_local_phandle_references(child, overlay_child,
 				phandle_delta);
 		if (err)
 			return err;
@@ -260,78 +258,78 @@ static int adjust_local_phandle_references(struct device_node *node,
  * are fit to be inserted or operate upon the live tree.
  * Returns 0 on success or a negative error value on error.
  */
-int of_resolve_phandles(struct device_node *resolve)
+int of_resolve_phandles(struct device_node *overlay)
 {
-	struct device_node *child, *childroot, *refnode;
-	struct device_node *root_sym, *resolve_sym, *resolve_fix;
-	struct property *rprop;
+	struct device_node *child, *local_fixups, *refnode;
+	struct device_node *tree_symbols, *overlay_symbols, *overlay_fixups;
+	struct property *prop;
 	const char *refpath;
 	phandle phandle, phandle_delta;
 	int err;
 
-	if (!resolve)
-		pr_err("%s: null node\n", __func__);
-	if (resolve && !of_node_check_flag(resolve, OF_DETACHED))
+	if (!overlay)
+		pr_err("%s: null overlay\n", __func__);
+	if (overlay && !of_node_check_flag(overlay, OF_DETACHED))
 		pr_err("%s: node %s not detached\n", __func__,
-			 resolve->full_name);
-	if (!resolve || !of_node_check_flag(resolve, OF_DETACHED))
+			 overlay->full_name);
+	if (!overlay || !of_node_check_flag(overlay, OF_DETACHED))
 		return -EINVAL;
 
 	phandle_delta = live_tree_max_phandle() + 1;
-	adjust_overlay_phandles(resolve, phandle_delta);
+	adjust_overlay_phandles(overlay, phandle_delta);
 
-	childroot = NULL;
-	for_each_child_of_node(resolve, childroot)
-		if (!of_node_cmp(childroot->name, "__local_fixups__"))
+	local_fixups = NULL;
+	for_each_child_of_node(overlay, local_fixups)
+		if (!of_node_cmp(local_fixups->name, "__local_fixups__"))
 			break;
 
-	if (childroot != NULL) {
-		err = adjust_local_phandle_references(childroot,
-				resolve, 0);
+	if (local_fixups != NULL) {
+		err = adjust_local_phandle_references(local_fixups,
+				overlay, 0);
 		if (err)
 			return err;
 
-		BUG_ON(adjust_local_phandle_references(childroot,
-				resolve, phandle_delta));
+		BUG_ON(adjust_local_phandle_references(local_fixups,
+				overlay, phandle_delta));
 	}
 
-	root_sym = NULL;
-	resolve_sym = NULL;
-	resolve_fix = NULL;
+	tree_symbols = NULL;
+	overlay_symbols = NULL;
+	overlay_fixups = NULL;
 
-	root_sym = of_find_node_by_path("/__symbols__");
+	tree_symbols = of_find_node_by_path("/__symbols__");
 
-	for_each_child_of_node(resolve, child) {
+	for_each_child_of_node(overlay, child) {
 
-		if (!resolve_sym && !of_node_cmp(child->name, "__symbols__"))
-			resolve_sym = child;
+		if (!overlay_symbols && !of_node_cmp(child->name, "__symbols__"))
+			overlay_symbols = child;
 
-		if (!resolve_fix && !of_node_cmp(child->name, "__fixups__"))
-			resolve_fix = child;
+		if (!overlay_fixups && !of_node_cmp(child->name, "__fixups__"))
+			overlay_fixups = child;
 
-		if (resolve_sym && resolve_fix)
+		if (overlay_symbols && overlay_fixups)
 			break;
 	}
 
-	if (!resolve_fix) {
+	if (!overlay_fixups) {
 		err = 0;
 		goto out;
 	}
 
-	if (!root_sym) {
+	if (!tree_symbols) {
 		pr_err("%s: no symbols in root of device tree.\n", __func__);
 		err = -EINVAL;
 		goto out;
 	}
 
-	for_each_property_of_node(resolve_fix, rprop) {
+	for_each_property_of_node(overlay_fixups, prop) {
 
 		/* skip properties added automatically */
-		if (!of_prop_cmp(rprop->name, "name"))
+		if (!of_prop_cmp(prop->name, "name"))
 			continue;
 
-		err = of_property_read_string(root_sym,
-				rprop->name, &refpath);
+		err = of_property_read_string(tree_symbols,
+				prop->name, &refpath);
 		if (err)
 			goto out;
 
@@ -344,13 +342,13 @@ int of_resolve_phandles(struct device_node *resolve)
 		phandle = refnode->phandle;
 		of_node_put(refnode);
 
-		err = update_usages_of_a_phandle_reference(resolve, rprop, phandle);
+		err = update_usages_of_a_phandle_reference(overlay, prop, phandle);
 		if (err)
 			break;
 	}
 
 out:
-	of_node_put(root_sym);
+	of_node_put(tree_symbols);
 
 	return err;
 }
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
