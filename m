From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 8/8] of: Add debug output for OF_RECONFIG notifiers
Date: Fri, 21 Nov 2014 01:35:15 +0000
Message-ID: <1416533715-9758-9-git-send-email-grant.likely@linaro.org>
References: <1416533715-9758-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416533715-9758-1-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add some additional debug output to cover OF_RECONFIG notifier activity.
At the same time, refactor the changeset debug output to use the same
strings as the notifier debug output.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/dynamic.c | 48 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 7634c2f69d4a..de20ae46b370 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -77,10 +77,38 @@ int of_reconfig_notifier_unregister(struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(of_reconfig_notifier_unregister);
 
+#ifdef DEBUG
+const char *action_names[] = {
+	[OF_RECONFIG_ATTACH_NODE] = "ATTACH_NODE",
+	[OF_RECONFIG_DETACH_NODE] = "DETACH_NODE",
+	[OF_RECONFIG_ADD_PROPERTY] = "ADD_PROPERTY",
+	[OF_RECONFIG_REMOVE_PROPERTY] = "REMOVE_PROPERTY",
+	[OF_RECONFIG_UPDATE_PROPERTY] = "UPDATE_PROPERTY",
+};
+#endif
+
 int of_reconfig_notify(unsigned long action, void *p)
 {
 	int rc;
+#ifdef DEBUG
+	struct device_node *dn = p;
+	struct of_prop_reconfig *pr = p;
+
+	switch (action) {
+	case OF_RECONFIG_ATTACH_NODE:
+	case OF_RECONFIG_DETACH_NODE:
+		pr_debug("of/notify %-15s %s\n", action_names[action],
+			dn->full_name);
+		break;
+	case OF_RECONFIG_ADD_PROPERTY:
+	case OF_RECONFIG_REMOVE_PROPERTY:
+	case OF_RECONFIG_UPDATE_PROPERTY:
+		pr_debug("of/notify %-15s %s:%s\n", action_names[action],
+			pr->dn->full_name, pr->prop->name);
+		break;
 
+	}
+#endif
 	rc = blocking_notifier_call_chain(&of_reconfig_chain, action, p);
 	return notifier_to_errno(rc);
 }
@@ -431,27 +459,15 @@ static void __of_changeset_entry_dump(struct of_changeset_entry *ce)
 {
 	switch (ce->action) {
 	case OF_RECONFIG_ADD_PROPERTY:
-		pr_debug("%p: %s %s/%s\n",
-			ce, "ADD_PROPERTY   ", ce->np->full_name,
-			ce->prop->name);
-		break;
 	case OF_RECONFIG_REMOVE_PROPERTY:
-		pr_debug("%p: %s %s/%s\n",
-			ce, "REMOVE_PROPERTY", ce->np->full_name,
-			ce->prop->name);
-		break;
 	case OF_RECONFIG_UPDATE_PROPERTY:
-		pr_debug("%p: %s %s/%s\n",
-			ce, "UPDATE_PROPERTY", ce->np->full_name,
-			ce->prop->name);
+		pr_debug("of/cset<%p> %-15s %s/%s\n", ce, action_names[ce->action],
+			ce->np->full_name, ce->prop->name);
 		break;
 	case OF_RECONFIG_ATTACH_NODE:
-		pr_debug("%p: %s %s\n",
-			ce, "ATTACH_NODE    ", ce->np->full_name);
-		break;
 	case OF_RECONFIG_DETACH_NODE:
-		pr_debug("%p: %s %s\n",
-			ce, "DETACH_NODE    ", ce->np->full_name);
+		pr_debug("of/cset<%p> %-15s %s\n", ce, action_names[ce->action],
+			ce->np->full_name);
 		break;
 	}
 }
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
