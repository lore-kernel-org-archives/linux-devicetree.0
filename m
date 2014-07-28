Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 2/4] of: Add old prop argument on OF_RECONFIG_UPDATE_PROPERTY
Date: Mon, 28 Jul 2014 23:06:47 +0300
Message-Id: <1406578009-30154-3-git-send-email-pantelis.antoniou@konsulko.com>
In-Reply-To: <1406578009-30154-1-git-send-email-pantelis.antoniou@konsulko.com>
References: <1406578009-30154-1-git-send-email-pantelis.antoniou@konsulko.com>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

The notifier now includes the old_prop argument when updating
properties, propagate this API to changeset internals while
also retaining the old behaviour of retrieving the old_property
when NULL is passed.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 drivers/of/dynamic.c  | 18 ++++++++++++++----
 drivers/of/selftest.c |  2 +-
 include/linux/of.h    | 20 +++++++++++++-------
 3 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index b82b375..73c1c4a 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -624,6 +624,7 @@ int of_changeset_revert(struct of_changeset *ocs)
  * @action:	action to perform
  * @np:		Pointer to device node
  * @prop:	Pointer to property
+ * @old_prop:	Pointer to old property (if updating)
  *
  * On action being one of:
  * + OF_RECONFIG_ATTACH_NODE
@@ -634,10 +635,21 @@ int of_changeset_revert(struct of_changeset *ocs)
  * Returns 0 on success, a negative error value in case of an error.
  */
 int of_changeset_action(struct of_changeset *ocs, unsigned long action,
-		struct device_node *np, struct property *prop)
+		struct device_node *np, struct property *prop,
+		struct property *oldprop)
 {
 	struct of_changeset_entry *ce;
 
+	/* in case someone passed NULL as old_prop, find it */
+	if (action == OF_RECONFIG_UPDATE_PROPERTY && prop && !oldprop) {
+		oldprop = of_find_property(np, prop->name, NULL);
+		if (!oldprop) {
+			pr_err("%s: Failed to find old_prop for \"%s/%s\"\n",
+					__func__, np->full_name, prop->name);
+			return -EINVAL;
+		}
+	}
+
 	ce = kzalloc(sizeof(*ce), GFP_KERNEL);
 	if (!ce) {
 		pr_err("%s: Failed to allocate\n", __func__);
@@ -647,9 +659,7 @@ int of_changeset_action(struct of_changeset *ocs, unsigned long action,
 	ce->action = action;
 	ce->np = of_node_get(np);
 	ce->prop = prop;
-
-	if (action == OF_RECONFIG_UPDATE_PROPERTY && prop)
-		ce->old_prop = of_find_property(np, prop->name, NULL);
+	ce->old_prop = oldprop;
 
 	/* add it to the list */
 	list_add_tail(&ce->node, &ocs->entries);
diff --git a/drivers/of/selftest.c b/drivers/of/selftest.c
index d410026..f122e1b 100644
--- a/drivers/of/selftest.c
+++ b/drivers/of/selftest.c
@@ -334,7 +334,7 @@ static void __init of_selftest_changeset(void)
 	selftest(!of_changeset_detach_node(&chgset, nremove), "fail remove node\n");
 	selftest(!of_changeset_attach_node(&chgset, n21), "fail attach n21\n");
 	selftest(!of_changeset_add_property(&chgset, parent, ppadd), "fail add prop\n");
-	selftest(!of_changeset_update_property(&chgset, parent, ppupdate), "fail update prop\n");
+	selftest(!of_changeset_update_property(&chgset, parent, ppupdate, NULL), "fail update prop\n");
 	selftest(!of_changeset_remove_property(&chgset, parent, ppremove), "fail remove prop\n");
 	mutex_lock(&of_mutex);
 	selftest(!of_changeset_apply(&chgset), "apply failed\n");
diff --git a/include/linux/of.h b/include/linux/of.h
index bc91fbb..bf38c2f 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -829,36 +829,42 @@ extern int of_changeset_apply(struct of_changeset *ocs);
 extern int of_changeset_revert(struct of_changeset *ocs);
 extern int of_changeset_action(struct of_changeset *ocs,
 		unsigned long action, struct device_node *np,
-		struct property *prop);
+		struct property *prop, struct property *old_prop);
 
 static inline int of_changeset_attach_node(struct of_changeset *ocs,
 		struct device_node *np)
 {
-	return of_changeset_action(ocs, OF_RECONFIG_ATTACH_NODE, np, NULL);
+	return of_changeset_action(ocs, OF_RECONFIG_ATTACH_NODE, np, NULL,
+			NULL);
 }
 
 static inline int of_changeset_detach_node(struct of_changeset *ocs,
 		struct device_node *np)
 {
-	return of_changeset_action(ocs, OF_RECONFIG_DETACH_NODE, np, NULL);
+	return of_changeset_action(ocs, OF_RECONFIG_DETACH_NODE, np, NULL,
+			NULL);
 }
 
 static inline int of_changeset_add_property(struct of_changeset *ocs,
 		struct device_node *np, struct property *prop)
 {
-	return of_changeset_action(ocs, OF_RECONFIG_ADD_PROPERTY, np, prop);
+	return of_changeset_action(ocs, OF_RECONFIG_ADD_PROPERTY, np, prop,
+			NULL);
 }
 
 static inline int of_changeset_remove_property(struct of_changeset *ocs,
 		struct device_node *np, struct property *prop)
 {
-	return of_changeset_action(ocs, OF_RECONFIG_REMOVE_PROPERTY, np, prop);
+	return of_changeset_action(ocs, OF_RECONFIG_REMOVE_PROPERTY, np, prop,
+			NULL);
 }
 
 static inline int of_changeset_update_property(struct of_changeset *ocs,
-		struct device_node *np, struct property *prop)
+		struct device_node *np, struct property *prop,
+		struct property *old_prop)
 {
-	return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
+	return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop,
+			old_prop);
 }
 #endif
 
-- 
1.7.12
