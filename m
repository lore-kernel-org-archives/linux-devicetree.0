From: frowand.list@gmail.com
Subject: [PATCH v3 06/12] of: overlay: detect cases where device tree may become corrupt
Date: Tue, 17 Oct 2017 16:36:26 -0700
Message-ID: <1508283392-18252-7-git-send-email-frowand.list@gmail.com>
References: <1508283392-18252-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508283392-18252-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

When an attempt to apply an overlay changeset fails, an effort
is made to revert any partial application of the changeset.
When an attempt to remove an overlay changeset fails, an effort
is made to re-apply any partial reversion of the changeset.

The existing code does not check for failure to recover a failed
overlay changeset application or overlay changeset revert.

Add the missing checks and flag the devicetree as corrupt if the
state of the devicetree can not be determined.

Improve and expand the returned errors to more fully reflect the
result of the effort to undo the partial effects of a failed attempt
to apply or remove an overlay changeset.

If the device tree might be corrupt, do not allow further attempts
to apply or remove an overlay changeset.

When creating an overlay changeset from an overlay device tree,
add some additional warnings if the state of the overlay device
tree is not as expected.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c |   5 +-
 drivers/of/dynamic.c                         | 135 +++++++++++---
 drivers/of/of_private.h                      |   8 +-
 drivers/of/overlay.c                         | 253 ++++++++++++++++++++++-----
 drivers/of/unittest.c                        |  57 +++---
 include/linux/of.h                           |  10 +-
 6 files changed, 372 insertions(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
index 5f5b7ba35f1d..7a7be0515bfd 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
@@ -204,7 +204,7 @@ static void __init tilcdc_convert_slave_node(void)
 	/* For all memory needed for the overlay tree. This memory can
 	   be freed after the overlay has been applied. */
 	struct kfree_table kft;
-	int ret;
+	int ovcs_id, ret;
 
 	if (kfree_table_init(&kft))
 		return;
@@ -247,7 +247,8 @@ static void __init tilcdc_convert_slave_node(void)
 
 	tilcdc_node_disable(slave);
 
-	ret = of_overlay_apply(overlay);
+	ovcs_id = 0;
+	ret = of_overlay_apply(overlay, &ovcs_id);
 	if (ret)
 		pr_err("%s: Applying overlay changeset failed: %d\n",
 			__func__, ret);
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 4bc96af4d8e2..747d87619faf 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -491,11 +491,12 @@ static void __of_changeset_entry_invert(struct of_changeset_entry *ce,
 	}
 }
 
-static void __of_changeset_entry_notify(struct of_changeset_entry *ce, bool revert)
+static int __of_changeset_entry_notify(struct of_changeset_entry *ce,
+		bool revert)
 {
 	struct of_reconfig_data rd;
 	struct of_changeset_entry ce_inverted;
-	int ret;
+	int ret = 0;
 
 	if (revert) {
 		__of_changeset_entry_invert(ce, &ce_inverted);
@@ -517,11 +518,12 @@ static void __of_changeset_entry_notify(struct of_changeset_entry *ce, bool reve
 	default:
 		pr_err("invalid devicetree changeset action: %i\n",
 			(int)ce->action);
-		return;
+		ret = -EINVAL;
 	}
 
 	if (ret)
 		pr_err("changeset notifier error @%pOF\n", ce->np);
+	return ret;
 }
 
 static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
@@ -655,32 +657,82 @@ void of_changeset_destroy(struct of_changeset *ocs)
 }
 EXPORT_SYMBOL_GPL(of_changeset_destroy);
 
-int __of_changeset_apply(struct of_changeset *ocs)
+/*
+ * Apply the changeset entries in @ocs.
+ * If apply fails, an attempt is made to revert the entries that were
+ * successfully applied.
+ *
+ * If multiple revert errors occur then only the final revert error is reported.
+ *
+ * Returns 0 on success, a negative error value in case of an error.
+ * If a revert error occurs, it is returned in *ret_revert.
+ */
+int __of_changeset_apply_entries(struct of_changeset *ocs, int *ret_revert)
 {
 	struct of_changeset_entry *ce;
-	int ret;
+	int ret, ret_tmp;
 
-	/* perform the rest of the work */
 	pr_debug("changeset: applying...\n");
 	list_for_each_entry(ce, &ocs->entries, node) {
 		ret = __of_changeset_entry_apply(ce);
 		if (ret) {
 			pr_err("Error applying changeset (%d)\n", ret);
-			list_for_each_entry_continue_reverse(ce, &ocs->entries, node)
-				__of_changeset_entry_revert(ce);
+			list_for_each_entry_continue_reverse(ce, &ocs->entries,
+							     node) {
+				ret_tmp = __of_changeset_entry_revert(ce);
+				if (ret_tmp)
+					*ret_revert = ret_tmp;
+			}
 			return ret;
 		}
 	}
-	pr_debug("changeset: applied, emitting notifiers.\n");
+
+	return 0;
+}
+
+/*
+ * Returns 0 on success, a negative error value in case of an error.
+ *
+ * If multiple changset entry notification errors occur then only the
+ * final notification error is reported.
+ */
+int __of_changeset_apply_notify(struct of_changeset *ocs)
+{
+	struct of_changeset_entry *ce;
+	int ret = 0, ret_tmp;
+
+	pr_debug("changeset: emitting notifiers.\n");
 
 	/* drop the global lock while emitting notifiers */
 	mutex_unlock(&of_mutex);
-	list_for_each_entry(ce, &ocs->entries, node)
-		__of_changeset_entry_notify(ce, 0);
+	list_for_each_entry(ce, &ocs->entries, node) {
+		ret_tmp = __of_changeset_entry_notify(ce, 0);
+		if (ret_tmp)
+			ret = ret_tmp;
+	}
 	mutex_lock(&of_mutex);
 	pr_debug("changeset: notifiers sent.\n");
 
-	return 0;
+	return ret;
+}
+
+/*
+ * Returns 0 on success, a negative error value in case of an error.
+ *
+ * If a changeset entry apply fails, an attempt is made to revert any
+ * previous entries in the changeset.  If any of the reverts fails,
+ * that failure is not reported.  Thus the state of the device tree
+ * is unknown if an apply error occurs.
+ */
+static int __of_changeset_apply(struct of_changeset *ocs)
+{
+	int ret, ret_revert = 0;
+
+	ret = __of_changeset_apply_entries(ocs, &ret_revert);
+	if (!ret)
+		ret = __of_changeset_apply_notify(ocs);
+
+	return ret;
 }
 
 /**
@@ -707,31 +759,74 @@ int of_changeset_apply(struct of_changeset *ocs)
 }
 EXPORT_SYMBOL_GPL(of_changeset_apply);
 
-int __of_changeset_revert(struct of_changeset *ocs)
+/*
+ * Revert the changeset entries in @ocs.
+ * If revert fails, an attempt is made to re-apply the entries that were
+ * successfully removed.
+ *
+ * If multiple re-apply errors occur then only the final apply error is
+ * reported.
+ *
+ * Returns 0 on success, a negative error value in case of an error.
+ * If an apply error occurs, it is returned in *ret_apply.
+ */
+int __of_changeset_revert_entries(struct of_changeset *ocs, int *ret_apply)
 {
 	struct of_changeset_entry *ce;
-	int ret;
+	int ret, ret_tmp;
 
 	pr_debug("changeset: reverting...\n");
 	list_for_each_entry_reverse(ce, &ocs->entries, node) {
 		ret = __of_changeset_entry_revert(ce);
 		if (ret) {
 			pr_err("Error reverting changeset (%d)\n", ret);
-			list_for_each_entry_continue(ce, &ocs->entries, node)
-				__of_changeset_entry_apply(ce);
+			list_for_each_entry_continue(ce, &ocs->entries, node) {
+				ret_tmp = __of_changeset_entry_apply(ce);
+				if (ret_tmp)
+					*ret_apply = ret_tmp;
+			}
 			return ret;
 		}
 	}
-	pr_debug("changeset: reverted, emitting notifiers.\n");
+
+	return 0;
+}
+
+/*
+ * If multiple changset entry notification errors occur then only the
+ * final notification error is reported.
+ */
+int __of_changeset_revert_notify(struct of_changeset *ocs)
+{
+	struct of_changeset_entry *ce;
+	int ret = 0, ret_tmp;
+
+	pr_debug("changeset: emitting notifiers.\n");
 
 	/* drop the global lock while emitting notifiers */
 	mutex_unlock(&of_mutex);
-	list_for_each_entry_reverse(ce, &ocs->entries, node)
-		__of_changeset_entry_notify(ce, 1);
+	list_for_each_entry_reverse(ce, &ocs->entries, node) {
+		ret_tmp = __of_changeset_entry_notify(ce, 1);
+		if (ret_tmp)
+			ret = ret_tmp;
+	}
 	mutex_lock(&of_mutex);
 	pr_debug("changeset: notifiers sent.\n");
 
-	return 0;
+	return ret;
+}
+
+static int __of_changeset_revert(struct of_changeset *ocs)
+{
+	int ret, ret_reply;
+
+	ret_reply = 0;
+	ret = __of_changeset_revert_entries(ocs, &ret_reply);
+
+	if (!ret)
+		ret = __of_changeset_revert_notify(ocs);
+
+	return ret;
 }
 
 /**
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 43df14f0cbce..36357f571df2 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -39,8 +39,12 @@ struct alias_prop {
 extern int of_property_notify(int action, struct device_node *np,
 			      struct property *prop, struct property *old_prop);
 extern void of_node_release(struct kobject *kobj);
-extern int __of_changeset_apply(struct of_changeset *ocs);
-extern int __of_changeset_revert(struct of_changeset *ocs);
+extern int __of_changeset_apply_entries(struct of_changeset *ocs,
+					int *ret_revert);
+extern int __of_changeset_apply_notify(struct of_changeset *ocs);
+extern int __of_changeset_revert_entries(struct of_changeset *ocs,
+					 int *ret_apply);
+extern int __of_changeset_revert_notify(struct of_changeset *ocs);
 #else /* CONFIG_OF_DYNAMIC */
 static inline int of_property_notify(int action, struct device_node *np,
 				     struct property *prop, struct property *old_prop)
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 905916e17eec..78c50fd57750 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -50,6 +50,22 @@ struct overlay_changeset {
 	struct of_changeset cset;
 };
 
+/* flags are sticky - once set, do not reset */
+static int devicetree_state_flags;
+#define DTSF_APPLY_FAIL		0x01
+#define DTSF_REVERT_FAIL	0x02
+
+/*
+ * If a changeset apply or revert encounters an error, an attempt will
+ * be made to undo partial changes, but may fail.  If the undo fails
+ * we do not know the state of the devicetree.
+ */
+static int devicetree_corrupt(void)
+{
+	return devicetree_state_flags &
+		(DTSF_APPLY_FAIL | DTSF_REVERT_FAIL);
+}
+
 static int build_changeset_next_level(struct overlay_changeset *ovcs,
 		struct device_node *target_node,
 		const struct device_node *overlay_node,
@@ -72,6 +88,13 @@ int of_overlay_notifier_unregister(struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(of_overlay_notifier_unregister);
 
+static char *of_overlay_action_name[] = {
+	"pre-apply",
+	"post-apply",
+	"pre-remove",
+	"post-remove",
+};
+
 static int overlay_notify(struct overlay_changeset *ovcs,
 		enum of_overlay_notify_action action)
 {
@@ -86,8 +109,14 @@ static int overlay_notify(struct overlay_changeset *ovcs,
 
 		ret = blocking_notifier_call_chain(&overlay_notify_chain,
 						   action, &nd);
-		if (ret)
-			return notifier_to_errno(ret);
+		if (ret == NOTIFY_STOP)
+			return 0;
+		if (ret) {
+			ret = notifier_to_errno(ret);
+			pr_err("overlay changeset %s notifier error %d, target: %pOF\n",
+			       of_overlay_action_name[action], ret, nd.target);
+			return ret;
+		}
 	}
 
 	return 0;
@@ -240,6 +269,14 @@ static int add_changeset_property(struct overlay_changeset *ovcs,
  * build_changeset_next_level().
  *
  * NOTE: Multiple mods of created nodes not supported.
+ *       If more than one fragment contains a node that does not already exist
+ *       in the live tree, then for each fragment of_changeset_attach_node()
+ *       will add a changeset entry to add the node.  When the changeset is
+ *       applied, __of_attach_node() will attach the node twice (once for
+ *       each fragment).  At this point the device tree will be corrupted.
+ *
+ *       TODO: add integrity check to ensure that multiple fragments do not
+ *             create the same node.
  *
  * Returns 0 on success, -ENOMEM if memory allocation failure, or -EINVAL if
  * invalid @overlay.
@@ -312,8 +349,8 @@ static int build_changeset_next_level(struct overlay_changeset *ovcs,
 		ret = add_changeset_property(ovcs, target_node, prop,
 					     is_symbols_node);
 		if (ret) {
-			pr_err("Failed to apply prop @%pOF/%s\n",
-			       target_node, prop->name);
+			pr_debug("Failed to apply prop @%pOF/%s, err=%d\n",
+				 target_node, prop->name, ret);
 			return ret;
 		}
 	}
@@ -324,8 +361,8 @@ static int build_changeset_next_level(struct overlay_changeset *ovcs,
 	for_each_child_of_node(overlay_node, child) {
 		ret = add_changeset_node(ovcs, target_node, child);
 		if (ret) {
-			pr_err("Failed to apply node @%pOF/%s\n",
-			       target_node, child->name);
+			pr_debug("Failed to apply node @%pOF/%s, err=%d\n",
+				 target_node, child->name, ret);
 			of_node_put(child);
 			return ret;
 		}
@@ -357,7 +394,7 @@ static int build_changeset(struct overlay_changeset *ovcs)
 					       fragment->overlay,
 					       fragment->is_symbols_node);
 		if (ret) {
-			pr_err("apply failed '%pOF'\n", fragment->target);
+			pr_debug("apply failed '%pOF'\n", fragment->target);
 			return ret;
 		}
 	}
@@ -412,6 +449,19 @@ static int init_overlay_changeset(struct overlay_changeset *ovcs,
 	struct fragment *fragments;
 	int cnt, ret;
 
+	/*
+	 * Warn for some issues.  Can not return -EINVAL for these until
+	 * of_unittest_apply_overlay() is fixed to pass these checks.
+	 */
+	if (!of_node_check_flag(tree, OF_DYNAMIC))
+		pr_debug("%s() tree is not dynamic\n", __func__);
+
+	if (!of_node_check_flag(tree, OF_DETACHED))
+		pr_debug("%s() tree is not detached\n", __func__);
+
+	if (!of_node_is_root(tree))
+		pr_debug("%s() tree is not root\n", __func__);
+
 	INIT_LIST_HEAD(&ovcs->ovcs_list);
 
 	of_changeset_init(&ovcs->cset);
@@ -485,12 +535,13 @@ static int init_overlay_changeset(struct overlay_changeset *ovcs,
 
 	return 0;
 
-
 err_free_fragments:
 	kfree(fragments);
 err_free_idr:
 	idr_remove(&ovcs_idr, ovcs->id);
 
+	pr_err("%s() failed, ret = %d\n", __func__, ret);
+
 	return ret;
 }
 
@@ -517,33 +568,71 @@ static void free_overlay_changeset(struct overlay_changeset *ovcs)
 /**
  * of_overlay_apply() - Create and apply an overlay changeset
  * @tree:	Expanded overlay device tree
+ * @ovcs_id:	Pointer to overlay changeset id
+ *
+ * Creates and applies an overlay changeset.
  *
- * Creates and applies an overlay changeset.  If successful, the overlay
- * changeset is added to the overlay changeset list.
+ * If an error occurs in a pre-apply notifier, then no changes are made
+ * to the device tree.
  *
- * Returns the id of the created overlay changeset, or a negative error number
+
+ * A non-zero return value will not have created the changeset if error is from:
+ *   - parameter checks
+ *   - building the changeset
+ *   - overlay changset pre-apply notifier
+ *
+ * If an error is returned by an overlay changeset pre-apply notifier
+ * then no further overlay changeset pre-apply notifier will be called.
+ *
+ * A non-zero return value will have created the changeset if error is from:
+ *   - overlay changeset entry notifier
+ *   - overlay changset post-apply notifier
+ *
+ * If an error is returned by an overlay changeset post-apply notifier
+ * then no further overlay changeset post-apply notifier will be called.
+ *
+ * If more than one notifier returns an error, then the last notifier
+ * error to occur is returned.
+ *
+ * If an error occurred while applying the overlay changeset, then an
+ * attempt is made to revert any changes that were made to the
+ * device tree.  If there were any errors during the revert attempt
+ * then the state of the device tree can not be determined, and any
+ * following attempt to apply or remove an overlay changeset will be
+ * refused.
+ *
+ * Returns 0 on success, or a negative error number.  Overlay changeset
+ * id is returned to *ovcs_id.
  */
-int of_overlay_apply(struct device_node *tree)
+
+int of_overlay_apply(struct device_node *tree, int *ovcs_id)
 {
 	struct overlay_changeset *ovcs;
-	int ret;
+	int ret = 0, ret_revert, ret_tmp;
+
+	*ovcs_id = 0;
+
+	if (devicetree_corrupt()) {
+		pr_err("devicetree state suspect, refuse to apply overlay\n");
+		ret = -EBUSY;
+		goto out;
+	}
 
 	ovcs = kzalloc(sizeof(*ovcs), GFP_KERNEL);
-	if (!ovcs)
-		return -ENOMEM;
+	if (!ovcs) {
+		ret = -ENOMEM;
+		goto out;
+	}
 
 	mutex_lock(&of_mutex);
 
 	ret = init_overlay_changeset(ovcs, tree);
-	if (ret) {
-		pr_err("init_overlay_changeset() failed, ret = %d\n", ret);
+	if (ret)
 		goto err_free_overlay_changeset;
-	}
 
 	ret = overlay_notify(ovcs, OF_OVERLAY_PRE_APPLY);
-	if (ret < 0) {
-		pr_err("%s: Pre-apply notifier failed (ret=%d)\n",
-		       __func__, ret);
+	if (ret) {
+		pr_err("overlay changeset pre-apply notify error %d\n", ret);
 		goto err_free_overlay_changeset;
 	}
 
@@ -551,23 +640,46 @@ int of_overlay_apply(struct device_node *tree)
 	if (ret)
 		goto err_free_overlay_changeset;
 
-	ret = __of_changeset_apply(&ovcs->cset);
-	if (ret)
+	ret_revert = 0;
+	ret = __of_changeset_apply_entries(&ovcs->cset, &ret_revert);
+	if (ret) {
+		if (ret_revert) {
+			pr_debug("overlay changeset revert error %d\n",
+				 ret_revert);
+			devicetree_state_flags |= DTSF_APPLY_FAIL;
+		}
 		goto err_free_overlay_changeset;
+	} else {
+		ret = __of_changeset_apply_notify(&ovcs->cset);
+		if (ret)
+			pr_err("overlay changeset entry notify error %d\n",
+			       ret);
+		/* fall through */
+	}
 
 	list_add_tail(&ovcs->ovcs_list, &ovcs_list);
-
-	overlay_notify(ovcs, OF_OVERLAY_POST_APPLY);
+	*ovcs_id = ovcs->id;
+
+	ret_tmp = overlay_notify(ovcs, OF_OVERLAY_POST_APPLY);
+	if (ret_tmp) {
+		pr_err("overlay changeset post-apply notify error %d\n",
+		       ret_tmp);
+		if (!ret)
+			ret = ret_tmp;
+	}
 
 	mutex_unlock(&of_mutex);
 
-	return ovcs->id;
+	goto out;
 
 err_free_overlay_changeset:
 	free_overlay_changeset(ovcs);
 
 	mutex_unlock(&of_mutex);
 
+out:
+	pr_debug("%s() err=%d\n", __func__, ret);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(of_overlay_apply);
@@ -649,45 +761,106 @@ static int overlay_removal_is_ok(struct overlay_changeset *remove_ovcs)
 
 /**
  * of_overlay_remove() - Revert and free an overlay changeset
- * @ovcs_id:	Overlay changeset id number
+ * @ovcs_id:	Pointer to overlay changeset id
  *
- * Removes an overlay if it is permissible.  ovcs_id was previously returned
+ * Removes an overlay if it is permissible.  @ovcs_id was previously returned
  * by of_overlay_apply().
  *
- * Returns 0 on success, or a negative error number
+ * If an error occurred while attempting to revert the overlay changeset,
+ * then an attempt is made to re-apply any changeset entry that was
+ * reverted.  If an error occurs on re-apply then the state of the device
+ * tree can not be determined, and any following attempt to apply or remove
+ * an overlay changeset will be refused.
+ *
+ * A non-zero return value will not revert the changeset if error is from:
+ *   - parameter checks
+ *   - overlay changset pre-remove notifier
+ *   - overlay changeset entry revert
+ *
+ * If an error is returned by an overlay changeset pre-remove notifier
+ * then no further overlay changeset pre-remove notifier will be called.
+ *
+ * If more than one notifier returns an error, then the last notifier
+ * error to occur is returned.
+ *
+ * A non-zero return value will revert the changeset if error is from:
+ *   - overlay changeset entry notifier
+ *   - overlay changset post-remove notifier
+ *
+ * If an error is returned by an overlay changeset post-remove notifier
+ * then no further overlay changeset post-remove notifier will be called.
+ *
+ * Returns 0 on success, or a negative error number.  *ovcs_id is set to
+ * zero after reverting the changeset, even if a subsequent error occurs.
  */
-int of_overlay_remove(int ovcs_id)
+int of_overlay_remove(int *ovcs_id)
 {
 	struct overlay_changeset *ovcs;
-	int ret = 0;
+	int ret, ret_apply, ret_tmp;
+
+	ret = 0;
+
+	if (devicetree_corrupt()) {
+		pr_err("suspect devicetree state, refuse to remove overlay\n");
+		ret = -EBUSY;
+		goto out;
+	}
 
 	mutex_lock(&of_mutex);
 
-	ovcs = idr_find(&ovcs_idr, ovcs_id);
+	ovcs = idr_find(&ovcs_idr, *ovcs_id);
 	if (!ovcs) {
 		ret = -ENODEV;
-		pr_err("remove: Could not find overlay #%d\n", ovcs_id);
-		goto out;
+		pr_err("remove: Could not find overlay #%d\n", *ovcs_id);
+		goto out_unlock;
 	}
 
 	if (!overlay_removal_is_ok(ovcs)) {
 		ret = -EBUSY;
-		goto out;
+		goto out_unlock;
 	}
 
-	overlay_notify(ovcs, OF_OVERLAY_PRE_REMOVE);
+	ret = overlay_notify(ovcs, OF_OVERLAY_PRE_REMOVE);
+	if (ret) {
+		pr_err("overlay changeset pre-remove notify error %d\n", ret);
+		goto out_unlock;
+	}
 
 	list_del(&ovcs->ovcs_list);
 
-	__of_changeset_revert(&ovcs->cset);
+	ret_apply = 0;
+	ret = __of_changeset_revert_entries(&ovcs->cset, &ret_apply);
+	if (ret) {
+		if (ret_apply)
+			devicetree_state_flags |= DTSF_REVERT_FAIL;
+		goto out_unlock;
+	} else {
+		ret = __of_changeset_revert_notify(&ovcs->cset);
+		if (ret) {
+			pr_err("overlay changeset entry notify error %d\n",
+			       ret);
+			/* fall through - changeset was reverted */
+		}
+	}
 
-	overlay_notify(ovcs, OF_OVERLAY_POST_REMOVE);
+	*ovcs_id = 0;
+
+	ret_tmp = overlay_notify(ovcs, OF_OVERLAY_POST_REMOVE);
+	if (ret_tmp) {
+		pr_err("overlay changeset post-remove notify error %d\n",
+		       ret_tmp);
+		if (!ret)
+			ret = ret_tmp;
+	}
 
 	free_overlay_changeset(ovcs);
 
-out:
+out_unlock:
 	mutex_unlock(&of_mutex);
 
+out:
+	pr_debug("%s() err=%d\n", __func__, ret);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(of_overlay_remove);
@@ -706,7 +879,7 @@ int of_overlay_remove_all(void)
 
 	/* the tail of list is guaranteed to be safe to remove */
 	list_for_each_entry_safe_reverse(ovcs, ovcs_n, &ovcs_list, ovcs_list) {
-		ret = of_overlay_remove(ovcs->id);
+		ret = of_overlay_remove(&ovcs->id);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index bbdaf5606820..3640dae4b9b2 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1217,7 +1217,7 @@ static void of_unittest_untrack_overlay(int id)
 
 static void of_unittest_destroy_tracked_overlays(void)
 {
-	int id, ret, defers;
+	int id, ret, defers, ovcs_id;
 
 	if (overlay_first_id < 0)
 		return;
@@ -1230,7 +1230,8 @@ static void of_unittest_destroy_tracked_overlays(void)
 			if (!(overlay_id_bits[BIT_WORD(id)] & BIT_MASK(id)))
 				continue;
 
-			ret = of_overlay_remove(id + overlay_first_id);
+			ovcs_id = id + overlay_first_id;
+			ret = of_overlay_remove(&ovcs_id);
 			if (ret == -ENODEV) {
 				pr_warn("%s: no overlay to destroy for #%d\n",
 					__func__, id + overlay_first_id);
@@ -1252,7 +1253,7 @@ static int of_unittest_apply_overlay(int overlay_nr, int unittest_nr,
 		int *overlay_id)
 {
 	struct device_node *np = NULL;
-	int ret, id = -1;
+	int ret;
 
 	np = of_find_node_by_path(overlay_path(overlay_nr));
 	if (np == NULL) {
@@ -1262,23 +1263,20 @@ static int of_unittest_apply_overlay(int overlay_nr, int unittest_nr,
 		goto out;
 	}
 
-	ret = of_overlay_apply(np);
+	*overlay_id = 0;
+	ret = of_overlay_apply(np, overlay_id);
 	if (ret < 0) {
 		unittest(0, "could not create overlay from \"%s\"\n",
 				overlay_path(overlay_nr));
 		goto out;
 	}
-	id = ret;
-	of_unittest_track_overlay(id);
+	of_unittest_track_overlay(*overlay_id);
 
 	ret = 0;
 
 out:
 	of_node_put(np);
 
-	if (overlay_id)
-		*overlay_id = id;
-
 	return ret;
 }
 
@@ -1286,7 +1284,7 @@ static int of_unittest_apply_overlay(int overlay_nr, int unittest_nr,
 static int of_unittest_apply_overlay_check(int overlay_nr, int unittest_nr,
 		int before, int after, enum overlay_type ovtype)
 {
-	int ret;
+	int ret, ovcs_id;
 
 	/* unittest device must not be in before state */
 	if (of_unittest_device_exists(unittest_nr, ovtype) != before) {
@@ -1297,7 +1295,8 @@ static int of_unittest_apply_overlay_check(int overlay_nr, int unittest_nr,
 		return -EINVAL;
 	}
 
-	ret = of_unittest_apply_overlay(overlay_nr, unittest_nr, NULL);
+	ovcs_id = 0;
+	ret = of_unittest_apply_overlay(overlay_nr, unittest_nr, &ovcs_id);
 	if (ret != 0) {
 		/* of_unittest_apply_overlay already called unittest() */
 		return ret;
@@ -1320,7 +1319,7 @@ static int of_unittest_apply_revert_overlay_check(int overlay_nr,
 		int unittest_nr, int before, int after,
 		enum overlay_type ovtype)
 {
-	int ret, ov_id;
+	int ret, ovcs_id;
 
 	/* unittest device must be in before state */
 	if (of_unittest_device_exists(unittest_nr, ovtype) != before) {
@@ -1332,7 +1331,8 @@ static int of_unittest_apply_revert_overlay_check(int overlay_nr,
 	}
 
 	/* apply the overlay */
-	ret = of_unittest_apply_overlay(overlay_nr, unittest_nr, &ov_id);
+	ovcs_id = 0;
+	ret = of_unittest_apply_overlay(overlay_nr, unittest_nr, &ovcs_id);
 	if (ret != 0) {
 		/* of_unittest_apply_overlay already called unittest() */
 		return ret;
@@ -1347,7 +1347,7 @@ static int of_unittest_apply_revert_overlay_check(int overlay_nr,
 		return -EINVAL;
 	}
 
-	ret = of_overlay_remove(ov_id);
+	ret = of_overlay_remove(&ovcs_id);
 	if (ret != 0) {
 		unittest(0, "overlay @\"%s\" failed to be destroyed @\"%s\"\n",
 				overlay_path(overlay_nr),
@@ -1449,7 +1449,7 @@ static void of_unittest_overlay_5(void)
 static void of_unittest_overlay_6(void)
 {
 	struct device_node *np;
-	int ret, i, ov_id[2];
+	int ret, i, ov_id[2], ovcs_id;
 	int overlay_nr = 6, unittest_nr = 6;
 	int before = 0, after = 1;
 
@@ -1476,13 +1476,14 @@ static void of_unittest_overlay_6(void)
 			return;
 		}
 
-		ret = of_overlay_apply(np);
+		ovcs_id = 0;
+		ret = of_overlay_apply(np, &ovcs_id);
 		if (ret < 0)  {
 			unittest(0, "could not create overlay from \"%s\"\n",
 					overlay_path(overlay_nr + i));
 			return;
 		}
-		ov_id[i] = ret;
+		ov_id[i] = ovcs_id;
 		of_unittest_track_overlay(ov_id[i]);
 	}
 
@@ -1500,7 +1501,8 @@ static void of_unittest_overlay_6(void)
 	}
 
 	for (i = 1; i >= 0; i--) {
-		ret = of_overlay_remove(ov_id[i]);
+		ovcs_id = ov_id[i];
+		ret = of_overlay_remove(&ovcs_id);
 		if (ret != 0) {
 			unittest(0, "overlay @\"%s\" failed destroy @\"%s\"\n",
 					overlay_path(overlay_nr + i),
@@ -1531,7 +1533,7 @@ static void of_unittest_overlay_6(void)
 static void of_unittest_overlay_8(void)
 {
 	struct device_node *np;
-	int ret, i, ov_id[2];
+	int ret, i, ov_id[2], ovcs_id;
 	int overlay_nr = 8, unittest_nr = 8;
 
 	/* we don't care about device state in this test */
@@ -1546,18 +1548,20 @@ static void of_unittest_overlay_8(void)
 			return;
 		}
 
-		ret = of_overlay_apply(np);
+		ovcs_id = 0;
+		ret = of_overlay_apply(np, &ovcs_id);
 		if (ret < 0)  {
 			unittest(0, "could not create overlay from \"%s\"\n",
 					overlay_path(overlay_nr + i));
 			return;
 		}
-		ov_id[i] = ret;
+		ov_id[i] = ovcs_id;
 		of_unittest_track_overlay(ov_id[i]);
 	}
 
 	/* now try to remove first overlay (it should fail) */
-	ret = of_overlay_remove(ov_id[0]);
+	ovcs_id = ov_id[0];
+	ret = of_overlay_remove(&ovcs_id);
 	if (ret == 0) {
 		unittest(0, "overlay @\"%s\" was destroyed @\"%s\"\n",
 				overlay_path(overlay_nr + 0),
@@ -1568,7 +1572,8 @@ static void of_unittest_overlay_8(void)
 
 	/* removing them in order should work */
 	for (i = 1; i >= 0; i--) {
-		ret = of_overlay_remove(ov_id[i]);
+		ovcs_id = ov_id[i];
+		ret = of_overlay_remove(&ovcs_id);
 		if (ret != 0) {
 			unittest(0, "overlay @\"%s\" not destroyed @\"%s\"\n",
 					overlay_path(overlay_nr + i),
@@ -2149,13 +2154,11 @@ static int __init overlay_data_add(int onum)
 		goto out_free_np_overlay;
 	}
 
-	ret = of_overlay_apply(info->np_overlay);
+	info->overlay_id = 0;
+	ret = of_overlay_apply(info->np_overlay, &info->overlay_id);
 	if (ret < 0) {
 		pr_err("of_overlay_apply() (ret=%d), %d\n", ret, onum);
 		goto out_free_np_overlay;
-	} else {
-		info->overlay_id = ret;
-		ret = 0;
 	}
 
 	pr_debug("__dtb_overlay_begin applied, overlay id %d\n", ret);
diff --git a/include/linux/of.h b/include/linux/of.h
index 7569e9cc45de..96edda95c6b0 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1298,7 +1298,7 @@ static inline bool of_device_is_system_power_controller(const struct device_node
  */
 
 enum of_overlay_notify_action {
-	OF_OVERLAY_PRE_APPLY,
+	OF_OVERLAY_PRE_APPLY = 0,
 	OF_OVERLAY_POST_APPLY,
 	OF_OVERLAY_PRE_REMOVE,
 	OF_OVERLAY_POST_REMOVE,
@@ -1312,8 +1312,8 @@ struct of_overlay_notify_data {
 #ifdef CONFIG_OF_OVERLAY
 
 /* ID based overlays; the API for external users */
-int of_overlay_apply(struct device_node *tree);
-int of_overlay_remove(int id);
+int of_overlay_apply(struct device_node *tree, int *ovcs_id);
+int of_overlay_remove(int *ovcs_id);
 int of_overlay_remove_all(void);
 
 int of_overlay_notifier_register(struct notifier_block *nb);
@@ -1321,12 +1321,12 @@ struct of_overlay_notify_data {
 
 #else
 
-static inline int of_overlay_apply(struct device_node *tree)
+static inline int of_overlay_apply(struct device_node *tree, int *ovcs_id)
 {
 	return -ENOTSUPP;
 }
 
-static inline int of_overlay_remove(int id)
+static inline int of_overlay_remove(int *ovcs_id)
 {
 	return -ENOTSUPP;
 }
-- 
Frank Rowand <frank.rowand@sony.com>
