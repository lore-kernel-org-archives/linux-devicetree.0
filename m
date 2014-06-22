Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 6/6] of: Introduce tree change __foo_post methods.
Date: Sun, 22 Jun 2014 12:40:39 +0300
Message-Id: <1403430039-15085-7-git-send-email-pantelis.antoniou@konsulko.com>
In-Reply-To: <1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com>
References: <1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

As part of transactional DT support there needs to be a clearer
definition of how each dynamic tree change method works.

Let's take for example the of_add_property method. There are
discrete steps taken in sequence.

1. The OF_RECONFIG_ADD_PROPERTY notifier will be fired.
2. The devtree lock will be taken.
3. Insertion of the property in the live tree.
4. The devtree lock will be released.
5. The property will be inserted in the sysfs tree.

For each of the of_attach_node, of_detach_node, of_add_property,
of_remove_property and of_update_property methods we export (and
introduce if not available), their counterparts of
__of_attach_node, __of_attach_node_post, __of_detach_node,
__of_detach_node_post, __of_add_property, __of_add_property_post,
__of_remove_property, __of_remove_property_post, __of_update_property
and __of_update_property post.

So each of the tree modification methods is following the same
pattern, i.e. for method foo we have:

Firing of the notifer, lock, __foo, unlock, __foo_post

This breakdown is required when we introduce transaction.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 drivers/of/base.c  | 74 ++++++++++++++++++++++++++++++++++++++++--------------
 include/linux/of.h |  7 ++++++
 2 files changed, 62 insertions(+), 19 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 42c735d..b5d854d 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -213,13 +213,24 @@ static const char *safe_name(struct kobject *kobj, const char *orig_name)
 	return name;
 }
 
-static int __of_add_property_sysfs(struct device_node *np, struct property *pp)
+static int __of_add_property_sysfs(struct device_node *np, struct property *pp,
+		int ignore_dup_name)
 {
 	int rc;
 
 	/* Important: Don't leak passwords */
 	bool secure = strncmp(pp->name, "security-", 9) == 0;
 
+	/* ignore duplicate name (transaction case) */
+	if (ignore_dup_name) {
+		struct kernfs_node *kn = sysfs_get_dirent(np->kobj.sd,
+				pp->name);
+		if (kn) {
+			sysfs_put(kn);
+			return 0;
+		}
+	}
+
 	sysfs_bin_attr_init(&pp->attr);
 	pp->attr.attr.name = safe_name(&np->kobj, pp->name);
 	pp->attr.attr.mode = secure ? S_IRUSR : S_IRUGO;
@@ -253,7 +264,7 @@ static int __of_node_add(struct device_node *np)
 		return rc;
 
 	for_each_property_of_node(np, pp)
-		__of_add_property_sysfs(np, pp);
+		__of_add_property_sysfs(np, pp, 1);
 
 	return 0;
 }
@@ -1858,6 +1869,13 @@ int __of_add_property(struct device_node *np, struct property *prop)
 	return 0;
 }
 
+void __of_add_property_post(struct device_node *np, struct property *prop,
+		int ignore_dup_name)
+{
+	if (of_node_is_attached(np))
+		__of_add_property_sysfs(np, prop, ignore_dup_name);
+}
+
 /**
  * of_add_property - Add a property to a node
  */
@@ -1876,8 +1894,7 @@ int of_add_property(struct device_node *np, struct property *prop)
 	if (rc)
 		return rc;
 
-	if (of_node_is_attached(np))
-		__of_add_property_sysfs(np, prop);
+	__of_add_property_post(np, prop, 0);
 
 	return rc;
 }
@@ -1901,6 +1918,13 @@ int __of_remove_property(struct device_node *np, struct property *prop)
 	return 0;
 }
 
+void __of_remove_property_post(struct device_node *np, struct property *prop)
+{
+	/* at early boot, bail here and defer setup to of_init() */
+	if (of_kset)
+		sysfs_remove_bin_file(&np->kobj, &prop->attr);
+}
+
 /**
  * of_remove_property - Remove a property from a node.
  *
@@ -1925,11 +1949,7 @@ int of_remove_property(struct device_node *np, struct property *prop)
 	if (rc)
 		return rc;
 
-	/* at early boot, bail hear and defer setup to of_init() */
-	if (!of_kset)
-		return 0;
-
-	sysfs_remove_bin_file(&np->kobj, &prop->attr);
+	__of_remove_property_post(np, prop);
 
 	return 0;
 }
@@ -1960,6 +1980,19 @@ int __of_update_property(struct device_node *np, struct property *newprop,
 	return 0;
 }
 
+void __of_update_property_post(struct device_node *np, struct property *newprop,
+		struct property *oldprop)
+{
+	/* At early boot, bail out and defer setup to of_init() */
+	if (!of_kset)
+		return;
+
+	/* Update the sysfs attribute */
+	if (oldprop)
+		sysfs_remove_bin_file(&np->kobj, &oldprop->attr);
+	__of_add_property_sysfs(np, newprop, 0);
+}
+
 /*
  * of_update_property - Update a property in a node, if the property does
  * not exist, add it.
@@ -1988,14 +2021,7 @@ int of_update_property(struct device_node *np, struct property *prop)
 	if (rc)
 		return rc;
 
-	/* At early boot, bail out and defer setup to of_init() */
-	if (!of_kset)
-		return 0;
-
-	/* Update the sysfs attribute */
-	if (oldprop)
-		sysfs_remove_bin_file(&np->kobj, &oldprop->attr);
-	__of_add_property_sysfs(np, prop);
+	__of_update_property_post(np, prop, oldprop);
 
 	return 0;
 }
@@ -2040,6 +2066,11 @@ void __of_attach_node(struct device_node *np)
 	of_node_clear_flag(np, OF_DETACHED);
 }
 
+void __of_attach_node_post(struct device_node *np)
+{
+	of_node_add(np);
+}
+
 /**
  * of_attach_node - Plug a device node into the tree and global list.
  */
@@ -2056,7 +2087,7 @@ int of_attach_node(struct device_node *np)
 	__of_attach_node(np);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
-	of_node_add(np);
+	__of_attach_node_post(np);
 	return 0;
 }
 
@@ -2096,6 +2127,11 @@ void __of_detach_node(struct device_node *np)
 	of_node_set_flag(np, OF_DETACHED);
 }
 
+void __of_detach_node_post(struct device_node *np)
+{
+	of_node_remove(np);
+}
+
 /**
  * of_detach_node - "Unplug" a node from the device tree.
  *
@@ -2115,7 +2151,7 @@ int of_detach_node(struct device_node *np)
 	__of_detach_node(np);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
-	of_node_remove(np);
+	__of_detach_node_post(np);
 	return rc;
 }
 #endif /* defined(CONFIG_OF_DYNAMIC) */
diff --git a/include/linux/of.h b/include/linux/of.h
index d381eb5..60e9f3b 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -339,9 +339,14 @@ extern int of_alias_get_id(struct device_node *np, const char *stem);
 extern int of_machine_is_compatible(const char *compat);
 
 int __of_add_property(struct device_node *np, struct property *prop);
+void __of_add_property_post(struct device_node *np, struct property *prop,
+		int ignore_dup_name);
 int __of_remove_property(struct device_node *np, struct property *prop);
+void __of_remove_property_post(struct device_node *np, struct property *prop);
 int __of_update_property(struct device_node *np, struct property *newprop,
 		struct property **oldprop);
+void __of_update_property_post(struct device_node *np, struct property *newprop,
+		struct property *oldprop);
 
 extern int of_add_property(struct device_node *np, struct property *prop);
 extern int of_remove_property(struct device_node *np, struct property *prop);
@@ -364,7 +369,9 @@ extern int of_reconfig_notifier_unregister(struct notifier_block *);
 extern int of_reconfig_notify(unsigned long, void *);
 
 void __of_attach_node(struct device_node *np);
+void __of_attach_node_post(struct device_node *np);
 void __of_detach_node(struct device_node *np);
+void __of_detach_node_post(struct device_node *np);
 
 extern int of_attach_node(struct device_node *);
 extern int of_detach_node(struct device_node *);
-- 
1.7.12
