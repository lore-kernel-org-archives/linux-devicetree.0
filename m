From: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Disabling OF functions that use sysfs if CONFIG_SYSFS disabled
Date: Fri,  5 Sep 2014 02:06:36 -0700
Message-ID: <1409907996-3849-1-git-send-email-gaurav.minocha.os@gmail.com>
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
---
 drivers/of/base.c    |   29 +++++++++++++++++++++++++++++
 drivers/of/dynamic.c |    7 +++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d8574ad..1d4d74e 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -131,6 +131,7 @@ static const char *safe_name(struct kobject *kobj, const char *orig_name)
 	return name;
 }
 
+#if defined(CONFIG_SYSFS)
 int __of_add_property_sysfs(struct device_node *np, struct property *pp)
 {
 	int rc;
@@ -151,7 +152,14 @@ int __of_add_property_sysfs(struct device_node *np, struct property *pp)
 	WARN(rc, "error adding attribute %s to node %s\n", pp->name, np->full_name);
 	return rc;
 }
+#else
+int __of_add_property_sysfs(struct device_node *np, struct property *pp)
+{
+	return 0;
+}
+#endif
 
+#if defined(CONFIG_SYSFS)
 int __of_attach_node_sysfs(struct device_node *np)
 {
 	const char *name;
@@ -181,6 +189,12 @@ int __of_attach_node_sysfs(struct device_node *np)
 
 	return 0;
 }
+#else
+int __of_attach_node_sysfs(struct device_node *np)
+{
+	return 0;
+}
+#endif
 
 static int __init of_init(void)
 {
@@ -1711,12 +1725,19 @@ int __of_remove_property(struct device_node *np, struct property *prop)
 	return 0;
 }
 
+#if defined(CONFIG_SYSFS)
 void __of_remove_property_sysfs(struct device_node *np, struct property *prop)
 {
 	/* at early boot, bail here and defer setup to of_init() */
 	if (of_kset && of_node_is_attached(np))
 		sysfs_remove_bin_file(&np->kobj, &prop->attr);
 }
+#else
+void __of_remove_property_sysfs(struct device_node *np, struct property *prop)
+{
+
+}
+#endif
 
 /**
  * of_remove_property - Remove a property from a node.
@@ -1774,6 +1795,7 @@ int __of_update_property(struct device_node *np, struct property *newprop,
 	return 0;
 }
 
+#if defined(CONFIG_SYSFS)
 void __of_update_property_sysfs(struct device_node *np, struct property *newprop,
 		struct property *oldprop)
 {
@@ -1785,6 +1807,13 @@ void __of_update_property_sysfs(struct device_node *np, struct property *newprop
 		sysfs_remove_bin_file(&np->kobj, &oldprop->attr);
 	__of_add_property_sysfs(np, newprop);
 }
+#else
+void __of_update_property_sysfs(struct device_node *np, struct property *newprop,
+		struct property *oldprop)
+{
+
+}
+#endif
 
 /*
  * of_update_property - Update a property in a node, if the property does
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 54fecc4..c3d9eae 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -41,6 +41,7 @@ void of_node_put(struct device_node *node)
 }
 EXPORT_SYMBOL(of_node_put);
 
+#if defined(CONFIG_SYSFS)
 void __of_detach_node_sysfs(struct device_node *np)
 {
 	struct property *pp;
@@ -59,6 +60,12 @@ void __of_detach_node_sysfs(struct device_node *np)
 	/* finally remove the kobj_init ref */
 	of_node_put(np);
 }
+#else
+void __of_detach_node_sysfs(struct device_node *np)
+{
+
+}
+#endif
 
 static BLOCKING_NOTIFIER_HEAD(of_reconfig_chain);
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
