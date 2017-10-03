From: frowand.list@gmail.com
Subject: [PATCH 11/12] of: overlay: remove a dependency on device node full_name
Date: Mon,  2 Oct 2017 20:53:45 -0700
Message-ID: <1507002826-16393-12-git-send-email-frowand.list@gmail.com>
References: <1507002826-16393-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507002826-16393-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

The "%pOF" printf format was recently added to print the
full name of a device tree node, with the intent of changing
the node full_name field to contain only the node name instead
of the full path of the node.

dup_and_fixup_symbol_prop() duplicates a property from the
"/__symbols__" node of an overlay device tree.  The value
of each duplicated property must be fixed up to include
the full path of a node in the live device tree.  The
current code uses the node's full_name for that purpose.
Update the code to use the "%pOF" printf format to
determine the node's full path.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/base.c       |  2 +-
 drivers/of/of_private.h |  2 ++
 drivers/of/overlay.c    | 90 ++++++++++++++++++++++++++++++-------------------
 3 files changed, 59 insertions(+), 35 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 260d33c0f26c..6f91fa67e5bb 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -760,7 +760,7 @@ struct device_node *of_get_child_by_name(const struct device_node *node,
 }
 EXPORT_SYMBOL(of_get_child_by_name);
 
-static struct device_node *__of_find_node_by_path(struct device_node *parent,
+struct device_node *__of_find_node_by_path(struct device_node *parent,
 						const char *path)
 {
 	struct device_node *child;
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index b66e8a812147..0c9e473801f2 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -81,6 +81,8 @@ extern void *__unflatten_device_tree(const void *blob,
 struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags);
 __printf(2, 3) struct device_node *__of_node_dup(const struct device_node *np, const char *fmt, ...);
 
+struct device_node *__of_find_node_by_path(struct device_node *parent,
+						const char *path);
 struct device_node *__of_find_node_by_full_path(struct device_node *node,
 						const char *path);
 
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 172807d3f375..81881e45f273 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -37,6 +37,7 @@ struct fragment {
 /**
  * struct overlay_changeset
  * @ovcs_list:		list on which we are located
+ * @overlay_tree:	expanded device tree that contains the fragment nodes
  * @count:		count of fragment structures
  * @fragments:		fragment nodes in the overlay expanded device tree
  * @symbols_fragment:	last element of @fragments[] is the  __symbols__ node
@@ -45,6 +46,7 @@ struct fragment {
 struct overlay_changeset {
 	int id;
 	struct list_head ovcs_list;
+	struct device_node *overlay_tree;
 	int count;
 	struct fragment *fragments;
 	bool symbols_fragment;
@@ -145,12 +147,13 @@ static int overlay_notify(struct overlay_changeset *ovcs,
 }
 
 /*
- * The properties in the "/__symbols__" node are "symbols".
+ * The values of properties in the "/__symbols__" node are paths in
+ * the ovcs->overlay_tree.  When duplicating the properties, the paths
+ * need to be adjusted to be the correct path for the live device tree.
  *
- * The value of properties in the "/__symbols__" node is the path of a
- * node in the subtree of a fragment node's "__overlay__" node, for
- * example "/fragment@0/__overlay__/symbol_path_tail".  Symbol_path_tail
- * can be a single node or it may be a multi-node path.
+ * The paths refer to a node in the subtree of a fragment node's "__overlay__"
+ * node, for example "/fragment@0/__overlay__/symbol_path_tail",
+ * where symbol_path_tail can be a single node or it may be a multi-node path.
  *
  * The duplicated property value will be modified by replacing the
  * "/fragment_name/__overlay/" portion of the value  with the target
@@ -160,59 +163,76 @@ static struct property *dup_and_fixup_symbol_prop(
 		struct overlay_changeset *ovcs, const struct property *prop)
 {
 	struct fragment *fragment;
-	struct property *new;
-	const char *overlay_name;
-	char *symbol_path_tail;
-	char *symbol_path;
+	struct property *new_prop;
+	struct device_node *fragment_node;
+	struct device_node *overlay_node;
+	const char *path;
+	const char *path_tail;
 	const char *target_path;
 	int k;
-	int symbol_path_tail_len;
 	int overlay_name_len;
+	int path_len;
+	int path_tail_len;
 	int target_path_len;
 
 	if (!prop->value)
 		return NULL;
-	symbol_path = prop->value;
+	if (strnlen(prop->value, prop->length) >= prop->length)
+		return NULL;
+	path = prop->value;
+	path_len = strlen(path);
 
-	new = kzalloc(sizeof(*new), GFP_KERNEL);
-	if (!new)
+	if (path_len < 1)
 		return NULL;
+	fragment_node = __of_find_node_by_path(ovcs->overlay_tree, path + 1);
+	overlay_node = __of_find_node_by_path(fragment_node, "__overlay__/");
+	of_node_put(fragment_node);
+	of_node_put(overlay_node);
 
 	for (k = 0; k < ovcs->count; k++) {
 		fragment = &ovcs->fragments[k];
-		overlay_name = fragment->overlay->full_name;
-		overlay_name_len = strlen(overlay_name);
-		if (!strncasecmp(symbol_path, overlay_name, overlay_name_len))
+		if (fragment->overlay == overlay_node)
 			break;
 	}
-
 	if (k >= ovcs->count)
-		goto err_free;
+		return NULL;
+
+	overlay_name_len = snprintf(NULL, 0, "%pOF", fragment->overlay);
 
-	target_path = fragment->target->full_name;
+	if (overlay_name_len > path_len)
+		return NULL;
+	path_tail = path + overlay_name_len;
+	path_tail_len = strlen(path_tail);
+
+	target_path = kasprintf(GFP_KERNEL, "%pOF", fragment->target);
+	if (!target_path)
+		return NULL;
 	target_path_len = strlen(target_path);
 
-	symbol_path_tail = symbol_path + overlay_name_len;
-	symbol_path_tail_len = strlen(symbol_path_tail);
+	new_prop = kzalloc(sizeof(*new_prop), GFP_KERNEL);
+	if (!new_prop)
+		goto err_free_target_path;
 
-	new->name = kstrdup(prop->name, GFP_KERNEL);
-	new->length = target_path_len + symbol_path_tail_len + 1;
-	new->value = kzalloc(new->length, GFP_KERNEL);
+	new_prop->name = kstrdup(prop->name, GFP_KERNEL);
+	new_prop->length = target_path_len + path_tail_len + 1;
+	new_prop->value = kzalloc(new_prop->length, GFP_KERNEL);
+	if (!new_prop->name || !new_prop->value)
+		goto err_free_new_prop;
 
-	if (!new->name || !new->value)
-		goto err_free;
+	strcpy(new_prop->value, target_path);
+	strcpy(new_prop->value + target_path_len, path_tail);
 
-	strcpy(new->value, target_path);
-	strcpy(new->value + target_path_len, symbol_path_tail);
+	of_property_set_flag(new_prop, OF_DYNAMIC);
 
-	of_property_set_flag(new, OF_DYNAMIC);
+	return new_prop;
 
-	return new;
+err_free_new_prop:
+	kfree(new_prop->name);
+	kfree(new_prop->value);
+	kfree(new_prop);
+err_free_target_path:
+	kfree(target_path);
 
- err_free:
-	kfree(new->name);
-	kfree(new->value);
-	kfree(new);
 	return NULL;
 }
 
@@ -510,6 +530,8 @@ static int init_overlay_changeset(struct overlay_changeset *ovcs,
 	if (!of_node_is_root(tree))
 		pr_debug("%s() tree is not root\n", __func__);
 
+	ovcs->overlay_tree = tree;
+
 	INIT_LIST_HEAD(&ovcs->ovcs_list);
 
 	of_changeset_init(&ovcs->cset);
-- 
Frank Rowand <frank.rowand@sony.com>
