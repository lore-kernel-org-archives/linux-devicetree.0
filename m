Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH] of: Transactional DT support.
Date: Sun, 22 Jun 2014 12:41:33 +0300
Message-Id: <1403430093-15132-1-git-send-email-pantelis.antoniou@konsulko.com>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

Introducing DT transactional support.

A DT transaction is a method which allows one to apply changes
in the live tree, in such a way that either the full set of changes
take effect, or the state of the tree can be rolled-back to the
state it was before it was attempted. An applied transaction
can be rolled-back at any time.

If any transaction results in the change of a state of a device
node, a notifier for that node will be fired which allows a bus
to create/destroy devices as directed.

Documentation is in
	Documentation/devicetree/transactions.txt

Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 Documentation/devicetree/transactions.txt |  41 +++
 drivers/of/Makefile                       |   2 +-
 drivers/of/base.c                         |  42 ++-
 drivers/of/transaction.c                  | 529 ++++++++++++++++++++++++++++++
 include/linux/of.h                        | 237 +++++++++++++
 5 files changed, 839 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/transactions.txt
 create mode 100644 drivers/of/transaction.c

diff --git a/Documentation/devicetree/transactions.txt b/Documentation/devicetree/transactions.txt
new file mode 100644
index 0000000..59ff5b7
--- /dev/null
+++ b/Documentation/devicetree/transactions.txt
@@ -0,0 +1,41 @@
+A DT transaction is a method which allows one to apply changes
+in the live tree, in such a way that either the full set of changes
+take effect, or the state of the tree can be rolled-back to the
+state it was before it was attempted. An applied transaction
+can be rolled-back at any time.
+
+If any transaction results in the change of a state of a device
+node, a notifier for that node will be fired which allows a bus
+to create/destroy devices as directed.
+
+The sequence of a transaction is as follows.
+
+1. of_transaction_init() - initializes a transaction
+
+2. of_transaction_start() - starts a transaction; a global
+transaction lock is taken at this point and disallowes any other
+dynamic tree changes.
+
+3. A number of DT tree change calls, of_transaction_attach_node(),
+of_transaction_detach_node(), of_transaction_add_property(),
+of_transaction_remove_property, of_transaction_update_property()
+modify the live tree (but without any user-space visible changes).
+All changes are recorded in the list of of_transaction_entry of
+the transaction.
+
+4.a. No errors occured during application, so a call to
+of_transaction_commit() is issued. All the changes are made visible
+to user-space and all device creation/destruction notifiers are
+fired. The global transaction is released.
+
+4.b. An error occured, so a of_transaction_abort() call is issued.
+All changes to the live tree will be reverted. The global transaction
+lock will be released.
+
+5.a If the transaction needs not be reverted, a call to
+of_transaction_destroy will release the resources of the transaction.
+
+5.b If the transaction is to be reverted, a call to
+of_transaction_revert will do so. All device notifiers will be
+fired, and the state of the tree will be the same as before
+the call to of_start_transaction().
diff --git a/drivers/of/Makefile b/drivers/of/Makefile
index 734d3e2..ae07348 100644
--- a/drivers/of/Makefile
+++ b/drivers/of/Makefile
@@ -1,4 +1,4 @@
-obj-y = base.o device.o platform.o util.o
+obj-y = base.o device.o platform.o util.o transaction.o
 obj-$(CONFIG_OF_FLATTREE) += fdt.o
 obj-$(CONFIG_OF_EARLY_FLATTREE) += fdt_address.o
 obj-$(CONFIG_OF_PROMTREE) += pdt.o
diff --git a/drivers/of/base.c b/drivers/of/base.c
index b5d854d..6dc6d63 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -50,6 +50,8 @@ DEFINE_MUTEX(of_aliases_mutex);
  */
 DEFINE_RAW_SPINLOCK(devtree_lock);
 
+DEFINE_MUTEX(of_transaction_mutex);
+
 int of_n_addr_cells(struct device_node *np)
 {
 	const __be32 *ip;
@@ -1888,13 +1890,16 @@ int of_add_property(struct device_node *np, struct property *prop)
 	if (rc)
 		return rc;
 
+	mutex_lock(&of_transaction_mutex);
+
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	rc = __of_add_property(np, prop);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
-	if (rc)
-		return rc;
 
-	__of_add_property_post(np, prop, 0);
+	if (rc == 0)
+		__of_add_property_post(np, prop, 0);
+
+	mutex_unlock(&of_transaction_mutex);
 
 	return rc;
 }
@@ -1942,16 +1947,18 @@ int of_remove_property(struct device_node *np, struct property *prop)
 	if (rc)
 		return rc;
 
+	mutex_lock(&of_transaction_mutex);
+
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	rc = __of_remove_property(np, prop);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
-	if (rc)
-		return rc;
+	if (rc == 0)
+		__of_remove_property_post(np, prop);
 
-	__of_remove_property_post(np, prop);
+	mutex_unlock(&of_transaction_mutex);
 
-	return 0;
+	return rc;
 }
 
 int __of_update_property(struct device_node *np, struct property *newprop,
@@ -2015,15 +2022,18 @@ int of_update_property(struct device_node *np, struct property *prop)
 	if (rc)
 		return rc;
 
+	mutex_lock(&of_transaction_mutex);
+
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	rc = __of_update_property(np, prop, &oldprop);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
-	if (rc)
-		return rc;
 
-	__of_update_property_post(np, prop, oldprop);
+	if (rc == 0)
+		__of_update_property_post(np, prop, oldprop);
 
-	return 0;
+	mutex_unlock(&of_transaction_mutex);
+
+	return rc;
 }
 
 #if defined(CONFIG_OF_DYNAMIC)
@@ -2083,11 +2093,16 @@ int of_attach_node(struct device_node *np)
 	if (rc)
 		return rc;
 
+	mutex_lock(&of_transaction_mutex);
+
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	__of_attach_node(np);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
 	__of_attach_node_post(np);
+
+	mutex_unlock(&of_transaction_mutex);
+
 	return 0;
 }
 
@@ -2147,11 +2162,16 @@ int of_detach_node(struct device_node *np)
 	if (rc)
 		return rc;
 
+	mutex_lock(&of_transaction_mutex);
+
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	__of_detach_node(np);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
 	__of_detach_node_post(np);
+
+	mutex_unlock(&of_transaction_mutex);
+
 	return rc;
 }
 #endif /* defined(CONFIG_OF_DYNAMIC) */
diff --git a/drivers/of/transaction.c b/drivers/of/transaction.c
new file mode 100644
index 0000000..1055b6e
--- /dev/null
+++ b/drivers/of/transaction.c
@@ -0,0 +1,529 @@
+/*
+ * Functions for DT transactions
+ *
+ * Copyright (C) 2014 Pantelis Antoniou <pantelis.antoniou@konsulko.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ */
+#undef DEBUG
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/string.h>
+#include <linux/ctype.h>
+#include <linux/errno.h>
+#include <linux/string.h>
+#include <linux/slab.h>
+#include <linux/err.h>
+
+#define __OFT_REVERT_PRE	(1 << 0)
+#define __OFT_REVERT_POST	(1 << 1)
+#define __OFT_APPLY_PRE		(1 << 2)
+#define __OFT_APPLY_POST	(1 << 3)
+#define __OFT_FREE		(1 << 4)
+#define __OFT_DEV_CHANGE	(1 << 5)
+#define __OFT_FIRE_NOTIFIERS	(1 << 6)
+
+static struct of_transaction_entry *__of_transaction_entry_create(
+		unsigned long action, struct device_node *dn,
+		struct property *prop)
+{
+	struct of_transaction_entry *te;
+	int prop_avail, prev_avail;
+
+	te = kzalloc(sizeof(*te), GFP_KERNEL);
+	if (te == NULL) {
+		pr_err("%s: Failed to allocate\n", __func__);
+		return ERR_PTR(-ENOMEM);
+	}
+	te->device_state_change = -1;
+
+	/* get a reference to the node */
+	te->action = action;
+	te->np = of_node_get(dn);
+	te->prop = prop;
+
+	if (action == OF_RECONFIG_UPDATE_PROPERTY && prop)
+		te->old_prop = of_find_property(dn, prop->name, NULL);
+
+	if (action == OF_RECONFIG_ADD_PROPERTY ||
+			action == OF_RECONFIG_REMOVE_PROPERTY ||
+			action == OF_RECONFIG_UPDATE_PROPERTY) {
+
+		/* te->prop & te->old_prop in the update case are not NULL */
+
+		prop_avail = -1;
+		if (of_prop_cmp(prop->name, "status") == 0)
+			prop_avail = (strcmp(prop->value, "okay") == 0 ||
+					strcmp(prop->value, "ok") == 0);
+		else if (of_prop_cmp(prop->name, "-status") == 0)
+			prop_avail = 1;
+
+		if (prop_avail != -1) {
+			/* state, but change? */
+			prev_avail = of_device_is_available(te->np) &&
+				of_find_property(te->np, "compatible", NULL) &&
+				of_find_property(te->np, "status", NULL);
+
+			if (prop_avail != prev_avail)
+				te->device_state_change = prop_avail;
+		}
+	}
+	return te;
+}
+
+static void __of_transaction_entry_destroy(struct of_transaction_entry *te)
+{
+	of_node_put(te->np);
+	list_del(&te->node);
+	kfree(te);
+}
+
+static int __of_transaction_entry_apply_op(
+		struct of_transaction_entry *te, unsigned int op)
+{
+	struct property *old_prop;
+	unsigned long flags;
+	int ret;
+
+	ret = 0;
+
+	if (op & __OFT_FIRE_NOTIFIERS) {
+		switch (te->action) {
+		case OF_RECONFIG_ATTACH_NODE:
+		case OF_RECONFIG_DETACH_NODE:
+			ret = of_reconfig_notify(te->action, te->np);
+			break;
+		case OF_RECONFIG_ADD_PROPERTY:
+		case OF_RECONFIG_REMOVE_PROPERTY:
+		case OF_RECONFIG_UPDATE_PROPERTY:
+			ret = of_property_notify(te->action, te->np, te->prop);
+			break;
+		}
+	}
+
+	if (ret == 0 && (op & __OFT_APPLY_PRE)) {
+		raw_spin_lock_irqsave(&devtree_lock, flags);
+		switch (te->action) {
+		case OF_RECONFIG_ATTACH_NODE:
+			__of_attach_node(te->np);
+			break;
+		case OF_RECONFIG_DETACH_NODE:
+			__of_detach_node(te->np);
+			break;
+		case OF_RECONFIG_ADD_PROPERTY:
+			ret = __of_add_property(te->np, te->prop);
+			if (ret != 0) {
+				pr_err("%s: __of_add_property failed @%s/%s\n",
+					__func__, te->np->full_name,
+					te->prop->name);
+				break;
+			}
+			break;
+		case OF_RECONFIG_REMOVE_PROPERTY:
+			ret = __of_remove_property(te->np, te->prop);
+			if (ret != 0) {
+				pr_err("%s: __of_remove_property failed @%s/%s\n",
+					__func__, te->np->full_name,
+					te->np->name);
+				break;
+			}
+			break;
+		case OF_RECONFIG_UPDATE_PROPERTY:
+			ret = __of_update_property(te->np, te->prop, &old_prop);
+			if (ret != 0) {
+				pr_err("%s: __of_update_property failed @%s/%s\n",
+					__func__, te->np->full_name,
+					te->np->name);
+				break;
+			}
+			break;
+		}
+		raw_spin_unlock_irqrestore(&devtree_lock, flags);
+	}
+
+	if (ret == 0 && (op & __OFT_APPLY_POST)) {
+		switch (te->action) {
+		case OF_RECONFIG_ATTACH_NODE:
+			__of_attach_node_post(te->np);
+			break;
+		case OF_RECONFIG_DETACH_NODE:
+			__of_detach_node(te->np);
+			break;
+		case OF_RECONFIG_ADD_PROPERTY:
+			/* ignore duplicate names */
+			__of_add_property_post(te->np, te->prop, 1);
+			break;
+		case OF_RECONFIG_REMOVE_PROPERTY:
+			__of_remove_property_post(te->np, te->prop);
+			break;
+		case OF_RECONFIG_UPDATE_PROPERTY:
+			__of_update_property_post(te->np, te->prop,
+					te->old_prop);
+			break;
+		}
+	}
+
+	if (ret == 0 && (op & __OFT_DEV_CHANGE) &&
+			te->device_state_change != -1) {
+
+		pr_debug("%s: %s device for node '%s'\n", __func__,
+				te->device_state_change ? "create" : "remove",
+				te->np->full_name);
+
+		of_reconfig_notify(te->device_state_change ?
+				OF_RECONFIG_DYNAMIC_CREATE_DEV :
+				OF_RECONFIG_DYNAMIC_DESTROY_DEV,
+				te->np);
+	}
+
+	return ret;
+}
+
+static int __of_transaction_entry_revert_op(
+		struct of_transaction_entry *te, unsigned int op)
+{
+	struct property *prop, *old_prop, **propp;
+	unsigned long action, flags;
+	struct device_node *np;
+	int ret, device_state_change;
+
+	/* get node and immediately put */
+	action = te->action;
+	np = te->np;
+	prop = te->prop;
+	old_prop = te->old_prop;
+	device_state_change = te->device_state_change;
+
+	/* if free, do it upfront */
+	if (op & __OFT_FREE) {
+		__of_transaction_entry_destroy(te);
+		te = NULL;
+	}
+
+	if (op & __OFT_FIRE_NOTIFIERS) {
+		switch (action) {
+		case OF_RECONFIG_ATTACH_NODE:
+			ret = of_reconfig_notify(OF_RECONFIG_DETACH_NODE, np);
+			break;
+		case OF_RECONFIG_DETACH_NODE:
+			ret = of_reconfig_notify(OF_RECONFIG_ATTACH_NODE, np);
+			break;
+		case OF_RECONFIG_ADD_PROPERTY:
+			ret = of_property_notify(OF_RECONFIG_REMOVE_PROPERTY,
+					np, prop);
+			break;
+		case OF_RECONFIG_REMOVE_PROPERTY:
+			ret = of_property_notify(OF_RECONFIG_ADD_PROPERTY,
+					np, prop);
+			break;
+		case OF_RECONFIG_UPDATE_PROPERTY:
+			ret = of_property_notify(OF_RECONFIG_UPDATE_PROPERTY,
+					np, old_prop);
+			break;
+		}
+	}
+
+	if (ret == 0 && (op & __OFT_DEV_CHANGE) && device_state_change != -1) {
+
+		pr_debug("%s: %s device for node '%s'\n", __func__,
+				!device_state_change ? "create" : "remove",
+				np->full_name);
+
+		of_reconfig_notify(!device_state_change ?
+				OF_RECONFIG_DYNAMIC_CREATE_DEV :
+				OF_RECONFIG_DYNAMIC_DESTROY_DEV,
+				np);
+	}
+
+	ret = 0;
+	if (op & __OFT_REVERT_PRE) {
+		raw_spin_lock_irqsave(&devtree_lock, flags);
+		switch (action) {
+		case OF_RECONFIG_ATTACH_NODE:
+			__of_detach_node(np);
+			break;
+		case OF_RECONFIG_DETACH_NODE:
+			__of_attach_node(np);
+			break;
+		case OF_RECONFIG_ADD_PROPERTY:
+			ret = __of_remove_property(np, prop);
+			break;
+		case OF_RECONFIG_REMOVE_PROPERTY:
+		case OF_RECONFIG_UPDATE_PROPERTY:
+			/* property is *always* on deadprops */
+			if (action == OF_RECONFIG_UPDATE_PROPERTY)
+				prop = old_prop;
+			propp = &np->deadprops;
+			while (*propp != NULL) {
+				if (*propp == prop)
+					break;
+				propp = &(*propp)->next;
+			}
+
+			/* we should find it in deadprops */
+			WARN_ON(*propp == NULL);
+
+			/* remove it from deadprops */
+			if (*propp != NULL)
+				*propp = prop->next;
+
+			if (action == OF_RECONFIG_REMOVE_PROPERTY)
+				ret = __of_add_property(np, prop);
+			else
+				ret = __of_update_property(np, prop, &old_prop);
+			break;
+		}
+		raw_spin_unlock_irqrestore(&devtree_lock, flags);
+	}
+
+	if (ret == 0 && (op & __OFT_REVERT_POST)) {
+		switch (action) {
+		case OF_RECONFIG_ATTACH_NODE:
+			__of_detach_node_post(np);
+			break;
+		case OF_RECONFIG_DETACH_NODE:
+			__of_attach_node_post(np);
+			break;
+		case OF_RECONFIG_ADD_PROPERTY:
+			__of_remove_property_post(np, prop);
+			break;
+		case OF_RECONFIG_REMOVE_PROPERTY:
+			__of_add_property_post(np, prop, 0);
+			break;
+		case OF_RECONFIG_UPDATE_PROPERTY:
+			__of_update_property_post(np, prop, old_prop);
+			break;
+		}
+	}
+
+	return ret;
+}
+
+int of_transaction_init(struct of_transaction *oft)
+{
+	memset(oft, 0, sizeof(*oft));
+
+	mutex_init(&oft->lock);
+	INIT_LIST_HEAD(&oft->te_list);
+	oft->state = OFT_READY;
+
+	return 0;
+}
+
+int of_transaction_destroy(struct of_transaction *oft)
+{
+	struct of_transaction_entry *te, *ten;
+	int ret;
+
+	ret = 0;
+	mutex_lock(&oft->lock);
+	if (oft->state != OFT_READY && oft->state != OFT_COMMITTED) {
+		ret = -EBUSY;
+		pr_err("%s: transaction is busy; can't destroy\n", __func__);
+		goto out;
+	}
+
+	/* for a commited transaction, just free the memory */
+	if (oft->state == OFT_COMMITTED) {
+		list_for_each_entry_safe_reverse(te, ten, &oft->te_list, node)
+			__of_transaction_entry_revert_op(te, __OFT_FREE);
+		oft->state = OFT_READY;
+	}
+out:
+	mutex_unlock(&oft->lock);
+
+	return ret;
+}
+
+/* start a transaction */
+int of_transaction_start(struct of_transaction *oft)
+{
+	int ret;
+
+	ret = 0;
+
+	/* take the global of transaction mutex */
+	mutex_lock(&of_transaction_mutex);
+
+	mutex_lock(&oft->lock);
+	if (oft->state != OFT_READY) {
+		ret = -EBUSY;
+		pr_err("%s: transaction is busy; can't start\n", __func__);
+		goto out;
+	}
+	oft->state = OFT_IN_PROGRESS;
+out:
+	mutex_unlock(&oft->lock);
+
+	/* release the global transaction lock in case of an error */
+	if (ret != 0)
+		mutex_unlock(&of_transaction_mutex);
+
+	return ret;
+}
+
+/* abort a transaction in progress */
+int of_transaction_abort(struct of_transaction *oft)
+{
+	int ret, rel_global_lock;
+	struct of_transaction_entry *te, *ten;
+
+	ret = 0;
+	rel_global_lock = 0;
+	mutex_lock(&oft->lock);
+	if (oft->state != OFT_IN_PROGRESS) {
+		ret = -EINVAL;
+		pr_err("%s: transaction invalid state\n", __func__);
+		goto out;
+	}
+	/* release global lock */
+	rel_global_lock = 1;
+
+	list_for_each_entry_safe_reverse(te, ten, &oft->te_list, node)
+		__of_transaction_entry_revert_op(te, __OFT_FIRE_NOTIFIERS |
+				__OFT_REVERT_PRE | __OFT_FREE);
+
+	oft->state = OFT_READY;
+out:
+	mutex_unlock(&oft->lock);
+
+	if (rel_global_lock)
+		mutex_unlock(&of_transaction_mutex);
+
+	return ret;
+}
+
+int of_transaction_commit(struct of_transaction *oft)
+{
+	struct of_transaction_entry *te;
+	int ret;
+
+	ret = 0;
+	mutex_lock(&oft->lock);
+	if (oft->state != OFT_IN_PROGRESS) {
+		ret = -EINVAL;
+		pr_err("%s: transaction invalid state\n", __func__);
+		goto out;
+	}
+	/* change state to committing */
+	oft->state = OFT_COMMITTING;
+	mutex_unlock(&oft->lock);
+
+	/* drop the global lock here (notifiers and devices need it) */
+	mutex_unlock(&of_transaction_mutex);
+
+	/* grab the lock again */
+	mutex_lock(&oft->lock);
+	if (oft->state != OFT_COMMITTING) {
+		ret = -EINVAL;
+		pr_err("%s: transaction not in committing state\n",
+				__func__);
+		goto out;
+	}
+	/* perform the rest of the work */
+	list_for_each_entry(te, &oft->te_list, node)
+		__of_transaction_entry_apply_op(te, __OFT_APPLY_POST |
+				__OFT_DEV_CHANGE);
+	oft->state = OFT_COMMITTED;
+out:
+	mutex_unlock(&oft->lock);
+
+	return ret;
+}
+
+int of_transaction_revert(struct of_transaction *oft)
+{
+	int ret, rel_global_lock;
+	struct of_transaction_entry *te, *ten;
+
+	ret = 0;
+	rel_global_lock = 0;
+
+	mutex_lock(&oft->lock);
+	if (oft->state != OFT_COMMITTED) {
+		ret = -EBUSY;
+		pr_err("%s: transaction is not commited\n", __func__);
+		goto out;
+	}
+	/* change state to reverting */
+	oft->state = OFT_REVERTING;
+
+	/* fire the device change notifiers */
+	list_for_each_entry_reverse(te, &oft->te_list, node)
+		__of_transaction_entry_revert_op(te, __OFT_DEV_CHANGE |
+				__OFT_FIRE_NOTIFIERS);
+
+	mutex_unlock(&oft->lock);
+
+	/* take the global of transaction mutex */
+	mutex_lock(&of_transaction_mutex);
+
+	mutex_lock(&oft->lock);
+	rel_global_lock = 1;
+
+	if (oft->state != OFT_REVERTING) {
+		ret = -EBUSY;
+		pr_err("%s: transaction is not reverting\n", __func__);
+		goto out;
+	}
+
+	list_for_each_entry_safe_reverse(te, ten, &oft->te_list, node)
+		__of_transaction_entry_revert_op(te, __OFT_REVERT_PRE |
+				__OFT_REVERT_POST | __OFT_FREE);
+	/* and we're done */
+	oft->state = OFT_READY;
+out:
+	mutex_unlock(&oft->lock);
+
+	if (rel_global_lock)
+		mutex_unlock(&of_transaction_mutex);
+
+	return ret;
+}
+
+int of_transaction_action(struct of_transaction *oft, unsigned long action,
+		struct device_node *np, struct property *prop)
+{
+	struct of_transaction_entry *te;
+	int ret;
+
+	ret = 0;
+
+	mutex_lock(&oft->lock);
+
+	if (oft->state != OFT_IN_PROGRESS) {
+		ret = -EINVAL;
+		pr_err("%s: transaction invalid state\n", __func__);
+		goto out;
+	}
+
+	/* create the transaction entry */
+	te = __of_transaction_entry_create(action, np, prop);
+	if (IS_ERR(te)) {
+		pr_err("%s: failed to create entry for @%s\n",
+				__func__, np->full_name);
+		ret = PTR_ERR(te);
+		goto out;
+	}
+
+	/* apply it */
+	ret = __of_transaction_entry_apply_op(te, __OFT_FIRE_NOTIFIERS |
+			__OFT_APPLY_PRE);
+	if (ret != 0) {
+		pr_err("%s: failed to apply for @%s\n",
+				__func__, np->full_name);
+		__of_transaction_entry_destroy(te);
+		goto out;
+	}
+
+	/* add it to the list */
+	list_add_tail(&te->node, &oft->te_list);
+out:
+	mutex_unlock(&oft->lock);
+
+	return ret;
+}
diff --git a/include/linux/of.h b/include/linux/of.h
index 60e9f3b..38d4d74 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -121,6 +121,8 @@ extern struct device_node *of_allnodes;
 extern struct device_node *of_chosen;
 extern struct device_node *of_aliases;
 extern raw_spinlock_t devtree_lock;
+extern struct mutex of_aliases_mutex;
+extern struct mutex of_transaction_mutex;
 
 static inline bool of_have_populated_dt(void)
 {
@@ -873,4 +875,239 @@ static inline struct device_node *__of_create_empty_node(const char *name,
 
 #endif	/* !CONFIG_OF */
 
+/**
+ * struct of_transaction_entry	- Holds a transaction entry
+ *
+ * @node:	list_head for the log list
+ * @action:	notifier action
+ * @np:		pointer to the device node affected
+ * @prop:	pointer to the property affected
+ * @old_prop:	hold a pointer to the original property
+ *
+ * Every modification of the device tree during a transaction
+ * is held in a list of of_transaction_entry structures.
+ * That way we can recover from a partial application, or we can
+ * revert the transaction
+ */
+struct of_transaction_entry {
+	struct list_head node;
+	unsigned long action;
+	struct device_node *np;
+	struct property *prop;
+	struct property *old_prop;
+
+	/* if property change on status
+	*/
+	int device_state_change;
+};
+
+/* possible states of the transaction */
+enum of_transaction_state {
+	OFT_READY,		/* ready for use (i.e. using start()       */
+	OFT_IN_PROGRESS,	/* application in progress, start() issued */
+	OFT_COMMITTING,		/* committing but not yet completed        */
+	OFT_COMMITTED,		/* has been commited to live tree          */
+	OFT_REVERTING,		/* revert is in progress                   */
+};
+
+/**
+ * struct of_transaction - transaction tracker structure
+ *
+ * @lock:	lock for accessing the te_list and state entries
+ * @te_list:	list_head for the transaction entries
+ * @state:	State of the transaction
+ *
+ * Transactions are a convenient way to apply bulk changes to the
+ * live tree. In case of an error, changes are rolled-back.
+ * Transactions live on after initial application, and if not
+ * destroyed after use, they can be reverted in one single call.
+ */
+struct of_transaction {
+	struct mutex lock;
+	struct list_head te_list;
+	enum of_transaction_state state;
+};
+
+/* forward iterator */
+#define for_each_transaction_entry(_oft, _te) \
+	list_for_each_entry(_te, &(_oft)->te_list, node)
+
+/* reverse iterator */
+#define for_each_transaction_entry_reverse(_oft, _te) \
+	list_for_each_entry_reverse(_te, &(_oft)->te_list, node)
+
+#ifdef CONFIG_OF
+
+/**
+ * of_transaction_init - Initialize a transaction for use
+ *
+ * @oft:	transaction pointer
+ *
+ * Initialize a transaction putting it in READY state.
+ * Returns 0 on success, a negative error value in case of an error.
+ */
+int of_transaction_init(struct of_transaction *oft);
+
+/**
+ * of_transaction_destroy - Destroy a transaction
+ *
+ * @oft:	transaction pointer
+ *
+ * Destroy a transaction, which is in either a COMMITED or READY state.
+ * Returns 0 on success, a negative error value in case of an error.
+ */
+int of_transaction_destroy(struct of_transaction *oft);
+
+/**
+ * of_transaction_start - Start a transaction
+ *
+ * @oft:	transaction pointer
+ *
+ * Starts a transaction, by moving it from READY to IN_PROGRESS state.
+ * The global transaction mutex will be held on sucess, so that no
+ * transactions/live updates can occur until either the transaction
+ * completes (i.e. moves to COMMITTED state), or aborted.
+ * Returns 0 on success, a negative error value in case of an error.
+ */
+int of_transaction_start(struct of_transaction *oft);
+
+/**
+ * of_transaction_abort - Aborts a transaction in progress
+ *
+ * @oft:	transaction pointer
+ *
+ * Aborts a transaction in IN_PROGRESS state, reverting the state
+ * of the live tree to the condition it was before application.
+ * The global transaction mutex is released if successful.
+ * Returns 0 on success, a negative error value in case of an error.
+ */
+int of_transaction_abort(struct of_transaction *oft);
+
+/**
+ * of_transaction_abort - Aborts a transaction in progress
+ *
+ * @oft:	transaction pointer
+ *
+ * Aborts a transaction in IN_PROGRESS state, reverting the state
+ * of the live tree to the condition it was before application.
+ * The global transaction mutex is released if successful, and the
+ * state transitions to COMMITTED.
+ * Any side-effects of live tree state changes are applied here on
+ * sucess, like creation/destruction of devices and side-effects
+ * like creation of sysfs properties and directories.
+ * Returns 0 on success, a negative error value in case of an error.
+ */
+int of_transaction_commit(struct of_transaction *oft);
+
+/**
+ * of_transaction_revert - Reverts an applied transaction
+ *
+ * @oft:	transaction pointer
+ *
+ * Aborts a transaction in COMMITTED state, reverting the state
+ * of the live tree to the condition it was before application.
+ * Any side-effects of live tree state reverting to the original
+ * state, like creation/destruction of devices and side-effects
+ * like removal of sysfs properties and directories are applied.
+ * Returns 0 on success, a negative error value in case of an error.
+ */
+int of_transaction_revert(struct of_transaction *oft);
+
+/**
+ * of_transaction_action - Perform a transaction action
+ *
+ * @oft:	transaction pointer
+ * @action:	action to perform
+ * @np:		Pointer to device node
+ * @prop:	Pointer to property
+ *
+ * On action being one of:
+ * + OF_RECONFIG_ATTACH_NODE
+ * + OF_RECONFIG_DETACH_NODE,
+ * + OF_RECONFIG_ADD_PROPERTY
+ * + OF_RECONFIG_REMOVE_PROPERTY,
+ * + OF_RECONFIG_UPDATE_PROPERTY
+ * performs a update of the live tree, while recording the
+ * act on a transaction entry. The remaining of side-effects are
+ * applied on commit.
+ * Returns 0 on success, a negative error value in case of an error.
+ */
+int of_transaction_action(struct of_transaction *oft, unsigned long action,
+		struct device_node *np, struct property *prop);
+
+#else
+
+static inline int of_transaction_init(struct of_transaction *oft)
+{
+	return -ENOTSUPP;
+}
+
+static inline int of_transaction_destroy(struct of_transaction *oft)
+{
+	return -ENOTSUPP;
+}
+
+static inline int of_transaction_start(struct of_transaction *oft)
+{
+	return -ENOTSUPP;
+}
+
+static inline int of_transaction_abort(struct of_transaction *oft)
+{
+	return -ENOTSUPP;
+}
+
+static inline int of_transaction_commit(struct of_transaction *oft)
+{
+	return -ENOTSUPP;
+}
+
+static inline int of_transaction_revert(struct of_transaction *oft)
+{
+	return -ENOTSUPP;
+}
+
+static inline int of_transaction_action(struct of_transaction *oft,
+		unsigned long action, struct device_node *np,
+		struct property *prop)
+{
+	return -ENOTSUPP;
+}
+
+#endif
+
+static inline int of_transaction_attach_node(struct of_transaction *oft,
+		struct device_node *np)
+{
+	return of_transaction_action(oft, OF_RECONFIG_ATTACH_NODE, np, NULL);
+}
+
+static inline int of_transaction_detach_node(struct of_transaction *oft,
+		struct device_node *np)
+{
+	return of_transaction_action(oft,
+			OF_RECONFIG_DETACH_NODE, np, NULL);
+}
+
+static inline int of_transaction_add_property(struct of_transaction *oft,
+		struct device_node *np, struct property *prop)
+{
+	return of_transaction_action(oft,
+			OF_RECONFIG_ADD_PROPERTY, np, prop);
+}
+
+static inline int of_transaction_remove_property(struct of_transaction *oft,
+		struct device_node *np, struct property *prop)
+{
+	return of_transaction_action(oft,
+			OF_RECONFIG_REMOVE_PROPERTY, np, prop);
+}
+
+static inline int of_transaction_update_property(struct of_transaction *oft,
+		struct device_node *np, struct property *prop)
+{
+	return of_transaction_action(oft,
+			OF_RECONFIG_UPDATE_PROPERTY, np, prop);
+}
+
 #endif /* _LINUX_OF_H */
-- 
1.7.12
