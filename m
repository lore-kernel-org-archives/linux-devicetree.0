From: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] Disabling OF functions that use sysfs if CONFIG_SYSFS disabled
Date: Fri,  5 Sep 2014 09:56:13 -0700
Message-ID: <1409936173-6263-1-git-send-email-gaurav.minocha.os@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch is to the fix the recent runtime bug in kernel
reported by <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

Mail Subject: [OF test] BUG: unable to handle kernel NULL
 pointer dereference at 00000038

Tested on x86 and arm architecture

Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/base.c    |   12 ++++++++++++
 drivers/of/dynamic.c |    3 +++
 2 files changed, 15 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d8574ad..acadc72 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -138,6 +138,9 @@ int __of_add_property_sysfs(struct device_node *np, struct property *pp)
 	/* Important: Don't leak passwords */
 	bool secure = strncmp(pp->name, "security-", 9) == 0;
 
+	if (!IS_ENABLED(CONFIG_SYSFS))
+		return 0;
+
 	if (!of_kset || !of_node_is_attached(np))
 		return 0;
 
@@ -158,6 +161,9 @@ int __of_attach_node_sysfs(struct device_node *np)
 	struct property *pp;
 	int rc;
 
+	if (!IS_ENABLED(CONFIG_SYSFS))
+		return 0;
+
 	if (!of_kset)
 		return 0;
 
@@ -1713,6 +1719,9 @@ int __of_remove_property(struct device_node *np, struct property *prop)
 
 void __of_remove_property_sysfs(struct device_node *np, struct property *prop)
 {
+	if (!IS_ENABLED(CONFIG_SYSFS))
+		return;
+
 	/* at early boot, bail here and defer setup to of_init() */
 	if (of_kset && of_node_is_attached(np))
 		sysfs_remove_bin_file(&np->kobj, &prop->attr);
@@ -1777,6 +1786,9 @@ int __of_update_property(struct device_node *np, struct property *newprop,
 void __of_update_property_sysfs(struct device_node *np, struct property *newprop,
 		struct property *oldprop)
 {
+	if (!IS_ENABLED(CONFIG_SYSFS))
+		return;
+
 	/* At early boot, bail out and defer setup to of_init() */
 	if (!of_kset)
 		return;
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 54fecc4..f297891 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -45,6 +45,9 @@ void __of_detach_node_sysfs(struct device_node *np)
 {
 	struct property *pp;
 
+	if (!IS_ENABLED(CONFIG_SYSFS))
+		return;
+
 	BUG_ON(!of_node_is_initialized(np));
 	if (!of_kset)
 		return;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
