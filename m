From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: [PATCH 3/3] OF: kobj ops should only happen on attached nodes
Date: Tue, 10 Dec 2013 16:13:53 +0200
Message-ID: <1386684833-24112-4-git-send-email-panto@antoniou-consulting.com>
References: <1386684833-24112-1-git-send-email-panto@antoniou-consulting.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386684833-24112-1-git-send-email-panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

kobject operation should only take place on already attached (live)
device nodes. The same restriction applies to the invocation of
device tree notifiers.

Introduce a simple of_node_is_attached() test which tests whether
the given node is attached via means of the allnodes member.

Signed-off-by: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
---
 drivers/of/base.c | 87 ++++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 64 insertions(+), 23 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index db0de86..c6299bd 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -89,6 +89,13 @@ int __weak of_node_to_nid(struct device_node *np)
 #endif
 
 #if defined(CONFIG_OF_DYNAMIC)
+
+/* simple test for figuring out if node is attached */
+static inline int of_node_is_attached(struct device_node *np)
+{
+	return np && np->allnodes == &of_allnodes;
+}
+
 /**
  *	of_node_get - Increment refcount of a node
  *	@node:	Node to inc refcount, NULL is supported to
@@ -98,7 +105,7 @@ int __weak of_node_to_nid(struct device_node *np)
  */
 struct device_node *of_node_get(struct device_node *node)
 {
-	if (node && of_kset)
+	if (node && of_kset && of_node_is_attached(node))
 		kobject_get(&node->kobj);
 	return node;
 }
@@ -156,7 +163,7 @@ static void of_node_release(struct kobject *kobj)
  */
 void of_node_put(struct device_node *node)
 {
-	if (node && of_kset)
+	if (node && of_kset && of_node_is_attached(node))
 		kobject_put(&node->kobj);
 }
 EXPORT_SYMBOL(of_node_put);
@@ -210,6 +217,10 @@ static int __of_add_property(struct device_node *np, struct property *pp)
 	if (!of_kset)
 		return 0;
 
+	/* don't do anything with a detached node */
+	if (!of_node_is_attached(np))
+		return 0;
+
 	/* Important: Don't leak passwords */
 	secure = strncmp(pp->name, "security-", 9) == 0;
 
@@ -235,6 +246,9 @@ static int __of_node_add(struct device_node *np)
 	if (!of_kset)
 		return 0;
 
+	if (!of_node_is_attached(np))
+		return 0;
+
 	np->kobj.kset = of_kset;
 	if (!np->parent) {
 		/* Nodes without parents are new top level trees */
@@ -259,6 +273,9 @@ int of_node_add(struct device_node *np)
 {
 	int rc = 0;
 
+	if (!of_node_is_attached(np))
+		return 0;
+
 	/* fake the return while of_init is not yet called */
 	mutex_lock(&of_aliases_mutex);
 	kobject_init(&np->kobj, &of_node_ktype);
@@ -274,10 +291,16 @@ static void of_node_remove(struct device_node *np)
 {
 	struct property *pp;
 
+	/* don't do anything with a detached node */
+	if (!of_node_is_attached(np))
+		return;
+
 	for_each_property_of_node(np, pp)
 		sysfs_remove_bin_file(&np->kobj, &pp->attr);
 
 	kobject_del(&np->kobj);
+
+	of_node_put(np);
 }
 #endif
 
@@ -1626,9 +1649,11 @@ int of_add_property(struct device_node *np, struct property *prop)
 	unsigned long flags;
 	int rc;
 
-	rc = of_property_notify(OF_RECONFIG_ADD_PROPERTY, np, prop);
-	if (rc)
-		return rc;
+	if (of_node_is_attached(np)) {
+		rc = of_property_notify(OF_RECONFIG_ADD_PROPERTY, np, prop);
+		if (rc)
+			return rc;
+	}
 
 	prop->next = NULL;
 	raw_spin_lock_irqsave(&devtree_lock, flags);
@@ -1664,9 +1689,11 @@ int of_remove_property(struct device_node *np, struct property *prop)
 	int found = 0;
 	int rc;
 
-	rc = of_property_notify(OF_RECONFIG_REMOVE_PROPERTY, np, prop);
-	if (rc)
-		return rc;
+	if (of_node_is_attached(np)) {
+		rc = of_property_notify(OF_RECONFIG_REMOVE_PROPERTY, np, prop);
+		if (rc)
+			return rc;
+	}
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	next = &np->properties;
@@ -1686,7 +1713,8 @@ int of_remove_property(struct device_node *np, struct property *prop)
 	if (!found)
 		return -ENODEV;
 
-	sysfs_remove_bin_file(&np->kobj, &prop->attr);
+	if (of_node_is_attached(np))
+		sysfs_remove_bin_file(&np->kobj, &prop->attr);
 
 	return 0;
 }
@@ -1706,9 +1734,11 @@ int of_update_property(struct device_node *np, struct property *newprop)
 	unsigned long flags;
 	int rc, found = 0;
 
-	rc = of_property_notify(OF_RECONFIG_UPDATE_PROPERTY, np, newprop);
-	if (rc)
-		return rc;
+	if (of_node_is_attached(np)) {
+		rc = of_property_notify(OF_RECONFIG_UPDATE_PROPERTY, np, newprop);
+		if (rc)
+			return rc;
+	}
 
 	if (!newprop->name)
 		return -EINVAL;
@@ -1736,9 +1766,11 @@ int of_update_property(struct device_node *np, struct property *newprop)
 	if (!found)
 		return -ENODEV;
 
-	/* Update the sysfs attribute */
-	sysfs_remove_bin_file(&np->kobj, &oldprop->attr);
-	__of_add_property(np, newprop);
+	if (of_node_is_attached(np)) {
+		/* Update the sysfs attribute */
+		sysfs_remove_bin_file(&np->kobj, &oldprop->attr);
+		__of_add_property(np, newprop);
+	}
 
 	return 0;
 }
@@ -1782,10 +1814,6 @@ int of_attach_node(struct device_node *np)
 	unsigned long flags;
 	int rc;
 
-	rc = of_reconfig_notify(OF_RECONFIG_ATTACH_NODE, np);
-	if (rc)
-		return rc;
-
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	np->sibling = np->parent->child;
 	np->allnext = of_allnodes;
@@ -1794,7 +1822,18 @@ int of_attach_node(struct device_node *np)
 	np->allnodes = &of_allnodes;
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
-	of_node_add(np);
+	rc = of_node_add(np);
+	if (rc != 0)
+		goto err_detach;
+
+	rc = of_reconfig_notify(OF_RECONFIG_ATTACH_NODE, np);
+	if (rc)
+		goto err_detach;
+
+	return 0;
+
+err_detach:
+	of_node_remove(np);
 	return 0;
 }
 
@@ -1810,9 +1849,11 @@ int of_detach_node(struct device_node *np)
 	unsigned long flags;
 	int rc = 0;
 
-	rc = of_reconfig_notify(OF_RECONFIG_DETACH_NODE, np);
-	if (rc)
-		return rc;
+	if (of_node_is_attached(np)) {
+		rc = of_reconfig_notify(OF_RECONFIG_DETACH_NODE, np);
+		if (rc)
+			return rc;
+	}
 
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 
-- 
1.7.12

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
