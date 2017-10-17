From: frowand.list@gmail.com
Subject: [PATCH v2 05/12] of: overlay: minor restructuring
Date: Mon, 16 Oct 2017 18:17:47 -0700
Message-ID: <1508203074-26917-6-git-send-email-frowand.list@gmail.com>
References: <1508203074-26917-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508203074-26917-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Continue improving the readability of overlay.c.  The previous patches
renamed identifiers.  This patch is split out from the previous patches
to make the previous patches easier to review.

Changes are:
  - minor code restructuring
  - some initialization of an overlay changeset occurred outside of
    init_overlay_changeset(), move that into init_overlay_changeset()
  - consolidate freeing an overlay changeset into free_overlay_changeset()

This patch is intended to not introduce any functional change.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/overlay.c | 205 +++++++++++++++++++++++----------------------------
 1 file changed, 92 insertions(+), 113 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index c350742ed2a2..0f92a5c26748 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -55,6 +55,9 @@ static int build_changeset_next_level(struct overlay_changeset *ovcs,
 		const struct device_node *overlay_node,
 		bool is_symbols_node);
 
+static LIST_HEAD(ovcs_list);
+static DEFINE_IDR(ovcs_idr);
+
 static BLOCKING_NOTIFIER_HEAD(overlay_notify_chain);
 
 int of_overlay_notifier_register(struct notifier_block *nb)
@@ -160,8 +163,6 @@ static struct property *dup_and_fixup_symbol_prop(
 	kfree(new->value);
 	kfree(new);
 	return NULL;
-
-
 }
 
 /**
@@ -249,13 +250,7 @@ static int add_changeset_node(struct overlay_changeset *ovcs,
 		if (!of_node_cmp(node_kbasename, kbasename(tchild->full_name)))
 			break;
 
-	if (tchild) {
-		if (node->phandle)
-			return -EINVAL;
-
-		ret = build_changeset_next_level(ovcs, tchild, node, 0);
-		of_node_put(tchild);
-	} else {
+	if (!tchild) {
 		tchild = __of_node_dup(node, "%pOF/%s",
 				       target_node, node_kbasename);
 		if (!tchild)
@@ -267,11 +262,15 @@ static int add_changeset_node(struct overlay_changeset *ovcs,
 		if (ret)
 			return ret;
 
-		ret = build_changeset_next_level(ovcs, tchild, node, 0);
-		if (ret)
-			return ret;
+		return build_changeset_next_level(ovcs, tchild, node, 0);
 	}
 
+	if (node->phandle)
+		return -EINVAL;
+
+	ret = build_changeset_next_level(ovcs, tchild, node, 0);
+	of_node_put(tchild);
+
 	return ret;
 }
 
@@ -385,41 +384,6 @@ static struct device_node *find_target_node(struct device_node *info_node)
 }
 
 /**
- * of_fill_overlay_info() - Fill an overlay info structure
- * @ov		Overlay to fill
- * @info_node:	Device node containing the overlay
- * @ovinfo:	Pointer to the overlay info structure to fill
- *
- * Fills an overlay info structure with the overlay information
- * from a device node. This device node must have a target property
- * which contains a phandle of the overlay target node, and an
- * __overlay__ child node which has the overlay contents.
- * Both ovinfo->target & ovinfo->overlay have their references taken.
- *
- * Returns 0 on success, or a negative error value.
- */
-static int of_fill_overlay_info(struct of_overlay *ov,
-		struct device_node *info_node, struct of_overlay_info *ovinfo)
-{
-	ovinfo->overlay = of_get_child_by_name(info_node, "__overlay__");
-	if (!ovinfo->overlay)
-		goto err_fail;
-
-	ovinfo->target = find_target_node(info_node);
-	if (!ovinfo->target)
-		goto err_fail;
-
-	return 0;
-
-err_fail:
-	of_node_put(ovinfo->target);
-	of_node_put(ovinfo->overlay);
-
-	memset(ovinfo, 0, sizeof(*ovinfo));
-	return -EINVAL;
-}
-
-/**
  * init_overlay_changeset() - initialize overlay changeset from overlay tree
  * @ovcs	Overlay changeset to build
  * @tree:	Contains all the overlay fragments and overlay fixup nodes
@@ -429,32 +393,61 @@ static int of_fill_overlay_info(struct of_overlay *ov,
  * nodes and the __symbols__ node.  Any other top level node will be ignored.
  *
  * Returns 0 on success, -ENOMEM if memory allocation failure, -EINVAL if error
- * detected in @tree, or -ENODEV if no valid nodes found.
+ * detected in @tree, or -ENOSPC if idr_alloc() error.
  */
 static int init_overlay_changeset(struct overlay_changeset *ovcs,
 		struct device_node *tree)
 {
-	struct device_node *node;
+	struct device_node *node, *overlay_node;
 	struct fragment *fragment;
 	struct fragment *fragments;
 	int cnt, ret;
 
+	INIT_LIST_HEAD(&ovcs->ovcs_list);
+
+	of_changeset_init(&ovcs->cset);
+
+	ovcs->id = idr_alloc(&ovcs_idr, ovcs, 1, 0, GFP_KERNEL);
+	if (ovcs->id <= 0)
+		return ovcs->id;
+
 	cnt = 0;
-	for_each_child_of_node(tree, node)
-		cnt++;
 
-	if (of_get_child_by_name(tree, "__symbols__"))
+	/* fragment nodes */
+	for_each_child_of_node(tree, node) {
+		overlay_node = of_get_child_by_name(node, "__overlay__");
+		if (overlay_node) {
+			cnt++;
+			of_node_put(overlay_node);
+		}
+	}
+
+	node = of_get_child_by_name(tree, "__symbols__");
+	if (node) {
 		cnt++;
+		of_node_put(node);
+	}
 
 	fragments = kcalloc(cnt, sizeof(*fragments), GFP_KERNEL);
-	if (!fragments)
-		return -ENOMEM;
+	if (!fragments) {
+		ret = -ENOMEM;
+		goto err_free_idr;
+	}
 
 	cnt = 0;
 	for_each_child_of_node(tree, node) {
-		ret = of_fill_overlay_info(ovcs, node, &fragments[cnt]);
-		if (!ret)
-			cnt++;
+		fragment = &fragments[cnt];
+		fragment->overlay = of_get_child_by_name(node, "__overlay__");
+		if (fragment->overlay) {
+			fragment->target = find_target_node(node);
+			if (!fragment->target) {
+				of_node_put(fragment->overlay);
+				ret = -EINVAL;
+				goto err_free_fragments;
+			} else {
+				cnt++;
+			}
+		}
 	}
 
 	node = of_get_child_by_name(tree, "__symbols__");
@@ -466,44 +459,51 @@ static int init_overlay_changeset(struct overlay_changeset *ovcs,
 
 		if (!fragment->target) {
 			pr_err("no symbols in root of device tree.\n");
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_free_fragments;
 		}
 
 		cnt++;
 	}
 
 	if (!cnt) {
-		kfree(fragments);
-		return -ENODEV;
+		ret = -EINVAL;
+		goto err_free_fragments;
 	}
 
 	ovcs->count = cnt;
 	ovcs->fragments = fragments;
 
 	return 0;
+
+
+err_free_fragments:
+	kfree(fragments);
+err_free_idr:
+	idr_remove(&ovcs_idr, ovcs->id);
+
+	return ret;
 }
 
-/**
- * free_overlay_fragments() - Free a fragments array
- * @ovcs	Overlay to free the overlay info from
- *
- * Frees the memory of an ovcs->fragments[] array.
- */
-static void free_overlay_fragments(struct overlay_changeset *ovcs)
+static void free_overlay_changeset(struct overlay_changeset *ovcs)
 {
 	int i;
 
-	/* do it in reverse */
-	for (i = ovcs->count - 1; i >= 0; i--) {
+	if (!ovcs->cset.entries.next)
+		return;
+	of_changeset_destroy(&ovcs->cset);
+
+	if (ovcs->id)
+		idr_remove(&ovcs_idr, ovcs->id);
+
+	for (i = 0; i < ovcs->count; i++) {
 		of_node_put(ovcs->fragments[i].target);
 		of_node_put(ovcs->fragments[i].overlay);
 	}
-
 	kfree(ovcs->fragments);
-}
 
-static LIST_HEAD(ovcs_list);
-static DEFINE_IDR(ovcs_idr);
+	kfree(ovcs);
+}
 
 /**
  * of_overlay_apply() - Create and apply an overlay changeset
@@ -517,47 +517,34 @@ static void free_overlay_fragments(struct overlay_changeset *ovcs)
 int of_overlay_apply(struct device_node *tree)
 {
 	struct overlay_changeset *ovcs;
-	int id, ret;
+	int ret;
 
 	ovcs = kzalloc(sizeof(*ovcs), GFP_KERNEL);
 	if (!ovcs)
 		return -ENOMEM;
-	ovcs->id = -1;
-
-	INIT_LIST_HEAD(&ovcs->ovcs_list);
-
-	of_changeset_init(&ovcs->cset);
 
 	mutex_lock(&of_mutex);
 
-	id = idr_alloc(&ovcs_idr, ovcs, 0, 0, GFP_KERNEL);
-	if (id < 0) {
-		ret = id;
-		goto err_destroy_trans;
-	}
-	ovcs->id = id;
-
 	ret = init_overlay_changeset(ovcs, tree);
 	if (ret) {
-		pr_err("init_overlay_changeset() failed for tree@%pOF\n",
-		       tree);
-		goto err_free_idr;
+		pr_err("init_overlay_changeset() failed, ret = %d\n", ret);
+		goto err_free_overlay_changeset;
 	}
 
 	ret = overlay_notify(ovcs, OF_OVERLAY_PRE_APPLY);
 	if (ret < 0) {
 		pr_err("%s: Pre-apply notifier failed (ret=%d)\n",
 		       __func__, ret);
-		goto err_free_overlay_fragments;
+		goto err_free_overlay_changeset;
 	}
 
 	ret = build_changeset(ovcs);
 	if (ret)
-		goto err_free_overlay_fragments;
+		goto err_free_overlay_changeset;
 
 	ret = __of_changeset_apply(&ovcs->cset);
 	if (ret)
-		goto err_free_overlay_fragments;
+		goto err_free_overlay_changeset;
 
 	list_add_tail(&ovcs->ovcs_list, &ovcs_list);
 
@@ -565,15 +552,11 @@ int of_overlay_apply(struct device_node *tree)
 
 	mutex_unlock(&of_mutex);
 
-	return id;
+	return ovcs->id;
+
+err_free_overlay_changeset:
+	free_overlay_changeset(ovcs);
 
-err_free_overlay_fragments:
-	free_overlay_fragments(ovcs);
-err_free_idr:
-	idr_remove(&ovcs_idr, ovcs->id);
-err_destroy_trans:
-	of_changeset_destroy(&ovcs->cset);
-	kfree(ovcs);
 	mutex_unlock(&of_mutex);
 
 	return ret;
@@ -684,13 +667,14 @@ int of_overlay_remove(int ovcs_id)
 	}
 
 	overlay_notify(ovcs, OF_OVERLAY_PRE_REMOVE);
+
 	list_del(&ovcs->ovcs_list);
+
 	__of_changeset_revert(&ovcs->cset);
+
 	overlay_notify(ovcs, OF_OVERLAY_POST_REMOVE);
-	free_overlay_fragments(ovcs);
-	idr_remove(&ovcs_idr, ovcs_id);
-	of_changeset_destroy(&ovcs->cset);
-	kfree(ovcs);
+
+	free_overlay_changeset(ovcs);
 
 out:
 	mutex_unlock(&of_mutex);
@@ -709,20 +693,15 @@ int of_overlay_remove(int ovcs_id)
 int of_overlay_remove_all(void)
 {
 	struct overlay_changeset *ovcs, *ovcs_n;
-
-	mutex_lock(&of_mutex);
+	int ret;
 
 	/* the tail of list is guaranteed to be safe to remove */
 	list_for_each_entry_safe_reverse(ovcs, ovcs_n, &ovcs_list, ovcs_list) {
-		list_del(&ovcs->ovcs_list);
-		__of_changeset_revert(&ovcs->cset);
-		free_overlay_fragments(ovcs);
-		idr_remove(&ovcs_idr, ovcs->id);
-		kfree(ovcs);
+		ret = of_overlay_remove(ovcs->id);
+		if (ret)
+			return ret;
 	}
 
-	mutex_unlock(&of_mutex);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_overlay_remove_all);
-- 
Frank Rowand <frank.rowand@sony.com>
