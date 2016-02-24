From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH] of: add pre-operation notifications
Date: Wed, 24 Feb 2016 16:28:57 -0600
Message-ID: <1456352937-28311-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add pre-apply and pre-remove notifications.

For pre-apply notifications that result from creating an overlay,
include a device node to the overlay fragment in of_reconfig_data.

If a pre-apply notifier return error, reject the changeset.

Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
 drivers/of/base.c    |   20 +++++++++++++
 drivers/of/dynamic.c |   79 +++++++++++++++++++++++++++++++++++++++++++++-----
 drivers/of/overlay.c |   46 +++++++++++++++++++++++++----
 include/linux/of.h   |    7 +++++
 4 files changed, 138 insertions(+), 14 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 017dd94..6d170e0 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1719,6 +1719,12 @@ int of_add_property(struct device_node *np, struct property *prop)
 
 	mutex_lock(&of_mutex);
 
+	rc = of_property_notify(OF_RECONFIG_PRE_ADD_PROPERTY, np, prop, NULL);
+	if (rc) {
+		mutex_unlock(&of_mutex);
+		return rc;
+	}
+
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	rc = __of_add_property(np, prop);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
@@ -1778,6 +1784,13 @@ int of_remove_property(struct device_node *np, struct property *prop)
 
 	mutex_lock(&of_mutex);
 
+	rc = of_property_notify(OF_RECONFIG_PRE_REMOVE_PROPERTY, np, prop,
+				NULL);
+	if (rc) {
+		mutex_unlock(&of_mutex);
+		return rc;
+	}
+
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	rc = __of_remove_property(np, prop);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
@@ -1854,6 +1867,13 @@ int of_update_property(struct device_node *np, struct property *newprop)
 
 	mutex_lock(&of_mutex);
 
+	rc = of_property_notify(OF_RECONFIG_PRE_UPDATE_PROPERTY, np, newprop,
+				oldprop);
+	if (rc) {
+		mutex_unlock(&of_mutex);
+		return rc;
+	}
+
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	rc = __of_update_property(np, newprop, &oldprop);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index f0bf021..1ac9f49 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -85,6 +85,12 @@ const char *action_names[] = {
 	[OF_RECONFIG_ADD_PROPERTY] = "ADD_PROPERTY",
 	[OF_RECONFIG_REMOVE_PROPERTY] = "REMOVE_PROPERTY",
 	[OF_RECONFIG_UPDATE_PROPERTY] = "UPDATE_PROPERTY",
+
+	[OF_RECONFIG_PRE_ATTACH_NODE] = "PRE_ATTACH_NODE",
+	[OF_RECONFIG_PRE_DETACH_NODE] = "PRE_DETACH_NODE",
+	[OF_RECONFIG_PRE_ADD_PROPERTY] = "PRE_ADD_PROPERTY",
+	[OF_RECONFIG_PRE_REMOVE_PROPERTY] = "PRE_REMOVE_PROPERTY",
+	[OF_RECONFIG_PRE_UPDATE_PROPERTY] = "PRE_UPDATE_PROPERTY",
 };
 #endif
 
@@ -97,12 +103,17 @@ int of_reconfig_notify(unsigned long action, struct of_reconfig_data *p)
 	switch (action) {
 	case OF_RECONFIG_ATTACH_NODE:
 	case OF_RECONFIG_DETACH_NODE:
+	case OF_RECONFIG_PRE_ATTACH_NODE:
+	case OF_RECONFIG_PRE_DETACH_NODE:
 		pr_debug("of/notify %-15s %s\n", action_names[action],
 			pr->dn->full_name);
 		break;
 	case OF_RECONFIG_ADD_PROPERTY:
 	case OF_RECONFIG_REMOVE_PROPERTY:
 	case OF_RECONFIG_UPDATE_PROPERTY:
+	case OF_RECONFIG_PRE_ADD_PROPERTY:
+	case OF_RECONFIG_PRE_REMOVE_PROPERTY:
+	case OF_RECONFIG_PRE_UPDATE_PROPERTY:
 		pr_debug("of/notify %-15s %s:%s\n", action_names[action],
 			pr->dn->full_name, pr->prop->name);
 		break;
@@ -141,6 +152,13 @@ int of_reconfig_get_state_change(unsigned long action, struct of_reconfig_data *
 		prop = pr->prop;
 		old_prop = pr->old_prop;
 		break;
+	/* no state change during pre-apply notifications */
+	case OF_RECONFIG_PRE_ATTACH_NODE:
+	case OF_RECONFIG_PRE_DETACH_NODE:
+	case OF_RECONFIG_PRE_ADD_PROPERTY:
+	case OF_RECONFIG_PRE_REMOVE_PROPERTY:
+	case OF_RECONFIG_PRE_UPDATE_PROPERTY:
+		return OF_RECONFIG_NO_CHANGE;
 	default:
 		return OF_RECONFIG_NO_CHANGE;
 	}
@@ -502,10 +520,31 @@ static void __of_changeset_entry_invert(struct of_changeset_entry *ce,
 	}
 }
 
-static void __of_changeset_entry_notify(struct of_changeset_entry *ce, bool revert)
+static unsigned long __of_changeset_entry_pre_action(unsigned long action)
+{
+	switch (action) {
+	case OF_RECONFIG_ATTACH_NODE:
+		return OF_RECONFIG_PRE_ATTACH_NODE;
+	case OF_RECONFIG_DETACH_NODE:
+		return OF_RECONFIG_PRE_DETACH_NODE;
+	case OF_RECONFIG_ADD_PROPERTY:
+		return OF_RECONFIG_PRE_ADD_PROPERTY;
+	case OF_RECONFIG_REMOVE_PROPERTY:
+		return OF_RECONFIG_PRE_REMOVE_PROPERTY;
+	case OF_RECONFIG_UPDATE_PROPERTY:
+		return OF_RECONFIG_PRE_UPDATE_PROPERTY;
+	}
+
+	/* this should not happen */
+	return action;
+}
+
+static int __of_changeset_entry_notify(struct of_changeset_entry *ce,
+				       bool revert, bool pre)
 {
 	struct of_reconfig_data rd;
 	struct of_changeset_entry ce_inverted;
+	unsigned long action;
 	int ret;
 
 	if (revert) {
@@ -513,26 +552,38 @@ static void __of_changeset_entry_notify(struct of_changeset_entry *ce, bool reve
 		ce = &ce_inverted;
 	}
 
-	switch (ce->action) {
+	action = ce->action;
+	if (pre)
+		action = __of_changeset_entry_pre_action(action);
+
+	switch (action) {
 	case OF_RECONFIG_ATTACH_NODE:
 	case OF_RECONFIG_DETACH_NODE:
+	case OF_RECONFIG_PRE_DETACH_NODE:
+	case OF_RECONFIG_PRE_ATTACH_NODE:
 		memset(&rd, 0, sizeof(rd));
 		rd.dn = ce->np;
-		ret = of_reconfig_notify(ce->action, &rd);
+		ret = of_reconfig_notify(action, &rd);
 		break;
 	case OF_RECONFIG_ADD_PROPERTY:
 	case OF_RECONFIG_REMOVE_PROPERTY:
 	case OF_RECONFIG_UPDATE_PROPERTY:
-		ret = of_property_notify(ce->action, ce->np, ce->prop, ce->old_prop);
+	case OF_RECONFIG_PRE_REMOVE_PROPERTY:
+	case OF_RECONFIG_PRE_ADD_PROPERTY:
+	case OF_RECONFIG_PRE_UPDATE_PROPERTY:
+		ret = of_property_notify(action, ce->np, ce->prop,
+					 ce->old_prop);
 		break;
 	default:
 		pr_err("%s: invalid devicetree changeset action: %i\n", __func__,
-			(int)ce->action);
-		return;
+			(int)action);
+		return -EINVAL;
 	}
 
 	if (ret)
 		pr_err("%s: notifier error @%s\n", __func__, ce->np->full_name);
+
+	return ret;
 }
 
 static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
@@ -687,7 +738,7 @@ int __of_changeset_apply(struct of_changeset *ocs)
 	/* drop the global lock while emitting notifiers */
 	mutex_unlock(&of_mutex);
 	list_for_each_entry(ce, &ocs->entries, node)
-		__of_changeset_entry_notify(ce, 0);
+		__of_changeset_entry_notify(ce, 0, 0);
 	mutex_lock(&of_mutex);
 	pr_debug("of_changeset: notifiers sent.\n");
 
@@ -708,8 +759,16 @@ int __of_changeset_apply(struct of_changeset *ocs)
  */
 int of_changeset_apply(struct of_changeset *ocs)
 {
+	struct of_changeset_entry *ce;
 	int ret;
 
+	pr_debug("of_changeset: pre-apply notifiers.\n");
+	list_for_each_entry(ce, &ocs->entries, node) {
+		ret = __of_changeset_entry_notify(ce, 0, 1);
+		if (ret)
+			return ret;
+	}
+
 	mutex_lock(&of_mutex);
 	ret = __of_changeset_apply(ocs);
 	mutex_unlock(&of_mutex);
@@ -723,6 +782,10 @@ int __of_changeset_revert(struct of_changeset *ocs)
 	struct of_changeset_entry *ce;
 	int ret;
 
+	pr_debug("of_changeset: emitting pre-revert notifiers.\n");
+	list_for_each_entry_reverse(ce, &ocs->entries, node)
+		__of_changeset_entry_notify(ce, 1, 1);
+
 	pr_debug("of_changeset: reverting...\n");
 	list_for_each_entry_reverse(ce, &ocs->entries, node) {
 		ret = __of_changeset_entry_revert(ce);
@@ -738,7 +801,7 @@ int __of_changeset_revert(struct of_changeset *ocs)
 	/* drop the global lock while emitting notifiers */
 	mutex_unlock(&of_mutex);
 	list_for_each_entry_reverse(ce, &ocs->entries, node)
-		__of_changeset_entry_notify(ce, 1);
+		__of_changeset_entry_notify(ce, 1, 0);
 	mutex_lock(&of_mutex);
 	pr_debug("of_changeset: notifiers sent.\n");
 
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 8225081..9d0c0d9 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -53,13 +53,30 @@ struct of_overlay {
 	struct of_changeset cset;
 };
 
+static int of_overlay_notify(unsigned long action, struct device_node *np,
+			     struct property *prop, struct property *old_prop,
+			     struct device_node *overlay)
+{
+	struct of_reconfig_data rd;
+
+	memset(&rd, 0, sizeof(rd));
+	rd.dn = np;
+	rd.prop = prop;
+	rd.old_prop = old_prop;
+	rd.overlay = overlay;
+	return of_reconfig_notify(action, &rd);
+}
+
 static int of_overlay_apply_one(struct of_overlay *ov,
-		struct device_node *target, const struct device_node *overlay);
+		struct device_node *target, struct device_node *overlay);
 
 static int of_overlay_apply_single_property(struct of_overlay *ov,
-		struct device_node *target, struct property *prop)
+		struct device_node *target, struct property *prop,
+		struct device_node *overlay)
 {
 	struct property *propn, *tprop;
+	unsigned long action;
+	int ret;
 
 	/* NOTE: Multiple changes of single properties not supported */
 	tprop = of_find_property(target, prop->name, NULL);
@@ -74,6 +91,15 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
 	if (propn == NULL)
 		return -ENOMEM;
 
+	if (!tprop)
+		action = OF_RECONFIG_PRE_ADD_PROPERTY;
+	else
+		action = OF_RECONFIG_PRE_UPDATE_PROPERTY;
+
+	ret = of_overlay_notify(action, target, propn, tprop, overlay);
+	if (ret)
+		return ret;
+
 	/* not found? add */
 	if (tprop == NULL)
 		return of_changeset_add_property(&ov->cset, target, propn);
@@ -83,7 +109,8 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
 }
 
 static int of_overlay_apply_single_device_node(struct of_overlay *ov,
-		struct device_node *target, struct device_node *child)
+		struct device_node *target, struct device_node *child,
+		struct device_node *overlay)
 {
 	const char *cname;
 	struct device_node *tchild;
@@ -108,6 +135,11 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
 		/* point to parent */
 		tchild->parent = target;
 
+		ret = of_overlay_notify(OF_RECONFIG_PRE_ATTACH_NODE, tchild,
+					NULL, NULL, overlay);
+		if (ret)
+			return ret;
+
 		ret = of_changeset_attach_node(&ov->cset, tchild);
 		if (ret)
 			return ret;
@@ -128,14 +160,15 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
  * by using the changeset.
  */
 static int of_overlay_apply_one(struct of_overlay *ov,
-		struct device_node *target, const struct device_node *overlay)
+		struct device_node *target, struct device_node *overlay)
 {
 	struct device_node *child;
 	struct property *prop;
 	int ret;
 
 	for_each_property_of_node(overlay, prop) {
-		ret = of_overlay_apply_single_property(ov, target, prop);
+		ret = of_overlay_apply_single_property(ov, target, prop,
+						       overlay);
 		if (ret) {
 			pr_err("%s: Failed to apply prop @%s/%s\n",
 				__func__, target->full_name, prop->name);
@@ -144,7 +177,8 @@ static int of_overlay_apply_one(struct of_overlay *ov,
 	}
 
 	for_each_child_of_node(overlay, child) {
-		ret = of_overlay_apply_single_device_node(ov, target, child);
+		ret = of_overlay_apply_single_device_node(ov, target, child,
+							  overlay);
 		if (ret != 0) {
 			pr_err("%s: Failed to apply single node @%s/%s\n",
 					__func__, target->full_name,
diff --git a/include/linux/of.h b/include/linux/of.h
index dd10626..c350a26 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -79,6 +79,7 @@ struct of_reconfig_data {
 	struct device_node	*dn;
 	struct property		*prop;
 	struct property		*old_prop;
+	struct device_node	*overlay; /* only for pre-apply notify */
 };
 
 /* initialize a node */
@@ -350,6 +351,12 @@ extern int of_update_property(struct device_node *np, struct property *newprop);
 #define OF_RECONFIG_ADD_PROPERTY	0x0003
 #define OF_RECONFIG_REMOVE_PROPERTY	0x0004
 #define OF_RECONFIG_UPDATE_PROPERTY	0x0005
+#define OF_RECONFIG_PRE_ATTACH_NODE	0x0006
+#define OF_RECONFIG_PRE_DETACH_NODE	0x0007
+#define OF_RECONFIG_PRE_ADD_PROPERTY	0x0008
+#define OF_RECONFIG_PRE_REMOVE_PROPERTY	0x0009
+#define OF_RECONFIG_PRE_UPDATE_PROPERTY	0x000a
+
 
 extern int of_attach_node(struct device_node *);
 extern int of_detach_node(struct device_node *);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
