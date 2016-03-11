From: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Subject: [RFC 3/8] drivers/of: export of_attach_node_sysfs
Date: Fri, 11 Mar 2016 16:56:10 +0100
Message-ID: <1457711775-6326-4-git-send-email-franck.jullien@odyssee-systemes.fr>
References: <1457711775-6326-1-git-send-email-franck.jullien@odyssee-systemes.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457711775-6326-1-git-send-email-franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
---
 drivers/of/base.c       |    5 +++--
 drivers/of/dynamic.c    |    4 ++--
 drivers/of/of_private.h |    1 -
 drivers/of/unittest.c   |    4 ++--
 include/linux/of.h      |    2 ++
 5 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index a7ff11f..faa108a 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -156,7 +156,7 @@ int __of_add_property_sysfs(struct device_node *np, struct property *pp)
 	return rc;
 }
 
-int __of_attach_node_sysfs(struct device_node *np)
+int of_attach_node_sysfs(struct device_node *np)
 {
 	const char *name;
 	struct property *pp;
@@ -188,6 +188,7 @@ int __of_attach_node_sysfs(struct device_node *np)
 
 	return 0;
 }
+EXPORT_SYMBOL(of_attach_node_sysfs);
 
 void __init of_core_init(void)
 {
@@ -202,7 +203,7 @@ void __init of_core_init(void)
 		return;
 	}
 	for_each_of_allnodes(np)
-		__of_attach_node_sysfs(np);
+		of_attach_node_sysfs(np);
 	mutex_unlock(&of_mutex);
 
 	/* Symlink in /proc as required by userspace ABI */
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index c647bd1..ff03c85 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -251,7 +251,7 @@ int of_attach_node(struct device_node *np)
 	__of_attach_node(np);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
-	__of_attach_node_sysfs(np);
+	of_attach_node_sysfs(np);
 	mutex_unlock(&of_mutex);
 
 	of_reconfig_notify(OF_RECONFIG_ATTACH_NODE, &rd);
@@ -606,7 +606,7 @@ static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
 
 	switch (ce->action) {
 	case OF_RECONFIG_ATTACH_NODE:
-		__of_attach_node_sysfs(ce->np);
+		of_attach_node_sysfs(ce->np);
 		break;
 	case OF_RECONFIG_DETACH_NODE:
 		__of_detach_node_sysfs(ce->np);
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 829469f..1bf7deb 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -79,7 +79,6 @@ extern void __of_update_property_sysfs(struct device_node *np,
 		struct property *newprop, struct property *oldprop);
 
 extern void __of_attach_node(struct device_node *np);
-extern int __of_attach_node_sysfs(struct device_node *np);
 extern void __of_detach_node(struct device_node *np);
 extern void __of_detach_node_sysfs(struct device_node *np);
 
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 979b6e4..5986b05 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -878,7 +878,7 @@ static int attach_node_and_children(struct device_node *np)
 	of_node_clear_flag(np, OF_DETACHED);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
-	__of_attach_node_sysfs(np);
+	of_attach_node_sysfs(np);
 	mutex_unlock(&of_mutex);
 
 	while (child) {
@@ -936,7 +936,7 @@ static int __init unittest_data_add(void)
 	if (!of_root) {
 		of_root = unittest_data_node;
 		for_each_of_allnodes(np)
-			__of_attach_node_sysfs(np);
+			of_attach_node_sysfs(np);
 		of_aliases = of_find_node_by_path("/aliases");
 		of_chosen = of_find_node_by_path("/chosen");
 		return 0;
diff --git a/include/linux/of.h b/include/linux/of.h
index dc6e396..d6c31fd 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -344,6 +344,8 @@ extern int of_add_property(struct device_node *np, struct property *prop);
 extern int of_remove_property(struct device_node *np, struct property *prop);
 extern int of_update_property(struct device_node *np, struct property *newprop);
 
+extern int of_attach_node_sysfs(struct device_node *np);
+
 /* For updating the device tree at runtime */
 #define OF_RECONFIG_ATTACH_NODE		0x0001
 #define OF_RECONFIG_DETACH_NODE		0x0002
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
