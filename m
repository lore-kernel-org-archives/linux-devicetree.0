Return-Path: <grant.likely@secretlab.ca>
Return-Path: <grant.likely@secretlab.ca>
Sender: Grant Likely <glikely@secretlab.ca>
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 5/5] of: Transactional DT support.
In-Reply-To: 
 <1404493129-8914-6-git-send-email-pantelis.antoniou@konsulko.com>
References: 
	<1404493129-8914-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1404493129-8914-6-git-send-email-pantelis.antoniou@konsulko.com>
Date: Fri, 11 Jul 2014 06:24:37 +0100
Message-Id: <20140711052437.2232BC40B84@trevor.secretlab.ca>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

On Fri,  4 Jul 2014 19:58:49 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> Introducing DT transactional support.
> 
> A DT transaction is a method which allows one to apply changes
> in the live tree, in such a way that either the full set of changes
> take effect, or the state of the tree can be rolled-back to the
> state it was before it was attempted. An applied transaction
> can be rolled-back at any time.
> 
> If any transaction results in the change of a state of a device
> node, a notifier for that node will be fired which allows a bus
> to create/destroy devices as directed.
> 
> Documentation is in
> 	Documentation/devicetree/transactions.txt

Hi Pantelis,

I've got a lot of comments below, but you don't need to respin the
series immediately. I've got a tree that I'm working with to sort out
what I can queue up for the next kernel. Give me a few days and I'll
send you what I've gotten to.

> 
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> ---
>  Documentation/devicetree/transactions.txt |  41 ++

I've been thinking about this for a while, 'transaction' doesn't strike me as the correct term. We aren't allowing the callers to see any intermediate state, and so there isn't really a concept of committing or reverting. As far as the caller is concerned, it provides a set of modifications, and they either get completely applied, or not at all.

Changeset is a better term.

>  drivers/of/Makefile                       |   2 +-
>  drivers/of/base.c                         |  34 +-
>  drivers/of/of_private.h                   |  19 +
>  drivers/of/transaction.c                  | 699 ++++++++++++++++++++++++++++++

drivers/of/dynamic.c. This is really important code. This code shouldn't
merely be one way to modify the device tree. Ultimately it should be the
*only* way to modify the tree. Once it is merged I want to convert the
powerpc users over to use the new interface.

>  include/linux/of.h                        |  82 ++++
>  6 files changed, 864 insertions(+), 13 deletions(-)
>  create mode 100644 Documentation/devicetree/transactions.txt
>  create mode 100644 drivers/of/transaction.c
> 
> diff --git a/Documentation/devicetree/transactions.txt b/Documentation/devicetree/transactions.txt
> new file mode 100644
> index 0000000..59ff5b7
> --- /dev/null
> +++ b/Documentation/devicetree/transactions.txt
> @@ -0,0 +1,41 @@
> +A DT transaction is a method which allows one to apply changes
> +in the live tree, in such a way that either the full set of changes
> +take effect, or the state of the tree can be rolled-back to the
> +state it was before it was attempted. An applied transaction
> +can be rolled-back at any time.
> +
> +If any transaction results in the change of a state of a device
> +node, a notifier for that node will be fired which allows a bus
> +to create/destroy devices as directed.
> +
> +The sequence of a transaction is as follows.
> +
> +1. of_transaction_init() - initializes a transaction
> +
> +2. of_transaction_start() - starts a transaction; a global
> +transaction lock is taken at this point and disallowes any other
> +dynamic tree changes.

Instead of of_transaction_start() the caller should be told to
explicitly take the of_mutex() so that it becomes the only editor.

> +3. A number of DT tree change calls, of_transaction_attach_node(),
> +of_transaction_detach_node(), of_transaction_add_property(),
> +of_transaction_remove_property, of_transaction_update_property()
> +modify the live tree (but without any user-space visible changes).
> +All changes are recorded in the list of of_transaction_entry of
> +the transaction.
> +
> +4.a. No errors occured during application, so a call to
> +of_transaction_commit() is issued. All the changes are made visible
> +to user-space and all device creation/destruction notifiers are
> +fired. The global transaction is released.
> +
> +4.b. An error occured, so a of_transaction_abort() call is issued.
> +All changes to the live tree will be reverted. The global transaction
> +lock will be released.

The above isn't accurate anymore. of_changeset_apply() should either
completely work or completely fail. There should not be an _abort()
call at all.

I would make it the responsibility of the caller to release the of_mutex
lock for consistency. of_changeset_apply() should require the of_mutex
to be held and it should drop/reaquire the lock for just the period when
it sends notifiers.

> +
> +5.a If the transaction needs not be reverted, a call to
> +of_transaction_destroy will release the resources of the transaction.

of_changeset_free() would probably be a better name.

> +
> +5.b If the transaction is to be reverted, a call to
> +of_transaction_revert will do so. All device notifiers will be
> +fired, and the state of the tree will be the same as before
> +the call to of_start_transaction().
> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
> index 08e6c0f..9a68cc9 100644
> --- a/drivers/of/Makefile
> +++ b/drivers/of/Makefile
> @@ -1,5 +1,5 @@
>  obj-y = base.o device.o platform.o
> -obj-$(CONFIG_OF_DYNAMIC) += dynamic.o
> +obj-$(CONFIG_OF_DYNAMIC) += dynamic.o transaction.o
>  obj-$(CONFIG_OF_FLATTREE) += fdt.o
>  obj-$(CONFIG_OF_EARLY_FLATTREE) += fdt_address.o
>  obj-$(CONFIG_OF_PROMTREE) += pdt.o
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index b52fd6b..206af65 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -40,7 +40,9 @@ static struct device_node *of_stdout;
>  static struct kset *of_kset;
>  
>  /*
> - * Used to protect the of_aliases, to hold off addition of nodes to sysfs
> + * Used to protect the of_aliases, to hold off addition of
> + * nodes to sysfs and in the case of a transaction is in
> + * progress.
>   */
>  DEFINE_MUTEX(of_mutex);
>  
> @@ -1707,13 +1709,16 @@ int of_add_property(struct device_node *np, struct property *prop)
>  	if (rc)
>  		return rc;
>  
> +	mutex_lock(&of_mutex);
> +

These mutex hunks I've moved to the earlier patch that makes the _sysfs
variants consistent in the version I've got in my tree.

>  	raw_spin_lock_irqsave(&devtree_lock, flags);
>  	rc = __of_add_property(np, prop);
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
> -	if (rc)
> -		return rc;
>  
> -	__of_add_property_post(np, prop, 0);
> +	if (rc == 0)
> +		__of_add_property_post(np, prop, 0);
> +
> +	mutex_unlock(&of_mutex);
>  
>  	return rc;
>  }
> @@ -1761,16 +1766,18 @@ int of_remove_property(struct device_node *np, struct property *prop)
>  	if (rc)
>  		return rc;
>  
> +	mutex_lock(&of_mutex);
> +
>  	raw_spin_lock_irqsave(&devtree_lock, flags);
>  	rc = __of_remove_property(np, prop);
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  
> -	if (rc)
> -		return rc;
> +	if (rc == 0)
> +		__of_remove_property_post(np, prop);
>  
> -	__of_remove_property_post(np, prop);
> +	mutex_unlock(&of_mutex);
>  
> -	return 0;
> +	return rc;
>  }
>  
>  int __of_update_property(struct device_node *np, struct property *newprop,
> @@ -1834,15 +1841,18 @@ int of_update_property(struct device_node *np, struct property *prop)
>  	if (rc)
>  		return rc;
>  
> +	mutex_lock(&of_mutex);
> +
>  	raw_spin_lock_irqsave(&devtree_lock, flags);
>  	rc = __of_update_property(np, prop, &oldprop);
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
> -	if (rc)
> -		return rc;
>  
> -	__of_update_property_post(np, prop, oldprop);
> +	if (rc == 0)
> +		__of_update_property_post(np, prop, oldprop);
>  
> -	return 0;
> +	mutex_unlock(&of_mutex);
> +
> +	return rc;
>  }
>  
>  static void of_alias_add(struct alias_prop *ap, struct device_node *np,
> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> index ca95100..00c119a 100644
> --- a/drivers/of/of_private.h
> +++ b/drivers/of/of_private.h
> @@ -89,4 +89,23 @@ struct device_node *__of_create_empty_node(const char *name,
>  		const char *type, const char *full_name,
>  		phandle phandle, gfp_t allocflags, unsigned long nodeflags);
>  
> +/* iterators for transactions, used for overlays */
> +/* forward iterator */
> +#define for_each_transaction_entry(_oft, _te) \
> +	list_for_each_entry(_te, &(_oft)->te_list, node)
> +
> +/* reverse iterator */
> +#define for_each_transaction_entry_reverse(_oft, _te) \
> +	list_for_each_entry_reverse(_te, &(_oft)->te_list, node)
> +
> +/* special find property method for use by transaction users */
> +extern struct property *of_transaction_find_property(
> +		struct of_transaction *oft,
> +		const struct device_node *np, const char *name, int *lenp);
> +extern int of_transaction_device_is_available(struct of_transaction *oft,
> +		const struct device_node *np);
> +extern struct device_node *of_transaction_get_child_by_name(
> +		struct of_transaction *oft, struct device_node *node,
> +		const char *name);
> +
>  #endif /* _LINUX_OF_PRIVATE_H */
> diff --git a/drivers/of/transaction.c b/drivers/of/transaction.c
> new file mode 100644
> index 0000000..1094395
> --- /dev/null
> +++ b/drivers/of/transaction.c
> @@ -0,0 +1,699 @@
> +/*
> + * Functions for DT transactions
> + *
> + * Copyright (C) 2014 Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * version 2 as published by the Free Software Foundation.
> + */
> +#undef DEBUG
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/string.h>
> +#include <linux/ctype.h>
> +#include <linux/errno.h>
> +#include <linux/string.h>
> +#include <linux/slab.h>
> +#include <linux/err.h>
> +
> +#include "of_private.h"
> +
> +static struct of_transaction_entry *__of_transaction_entry_create(
> +		struct of_transaction *oft, unsigned long action,
> +		struct device_node *dn, struct property *prop)
> +{
> +	struct of_transaction_entry *te;
> +
> +	te = kzalloc(sizeof(*te), GFP_KERNEL);
> +	if (te == NULL) {
> +		pr_err("%s: Failed to allocate\n", __func__);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +	/* get a reference to the node */
> +	te->action = action;
> +	te->np = of_node_get(dn);
> +	te->prop = prop;
> +
> +	if (action == OF_RECONFIG_UPDATE_PROPERTY && prop)
> +		te->old_prop = of_transaction_find_property(oft, dn,
> +				prop->name, NULL);
> +
> +	return te;
> +}

There is only one user of this function: of_transaction_action(). Roll
it all into one function.

> +
> +static void __of_transaction_entry_destroy(struct of_transaction_entry *te)
> +{
> +	of_node_put(te->np);
> +	list_del(&te->node);
> +	kfree(te);
> +}
> +
> +#ifdef DEBUG
> +static void __of_transaction_entry_dump(struct of_transaction_entry *te)
> +{
> +	switch (te->action) {
> +	case OF_RECONFIG_ADD_PROPERTY:
> +		pr_debug("%p: %s %s/%s\n",
> +			te, "ADD_PROPERTY   ", te->np->full_name,
> +			te->prop->name);
> +		break;
> +	case OF_RECONFIG_REMOVE_PROPERTY:
> +		pr_debug("%p: %s %s/%s\n",
> +			te, "REMOVE_PROPERTY", te->np->full_name,
> +			te->prop->name);
> +		break;
> +	case OF_RECONFIG_UPDATE_PROPERTY:
> +		pr_debug("%p: %s %s/%s\n",
> +			te, "UPDATE_PROPERTY", te->np->full_name,
> +			te->prop->name);
> +		break;
> +	case OF_RECONFIG_ATTACH_NODE:
> +		pr_debug("%p: %s %s\n",
> +			te, "ATTACH_NODE    ", te->np->full_name);
> +		break;
> +	case OF_RECONFIG_DETACH_NODE:
> +		pr_debug("%p: %s %s\n",
> +			te, "DETACH_NODE    ", te->np->full_name);
> +		break;
> +	}
> +}
> +#else
> +static inline void __of_transaction_entry_dump(struct of_transaction_entry *te)
> +{
> +	/* empty */
> +}
> +#endif
> +
> +static int __of_transaction_entry_device_state(struct of_transaction *oft,
> +		struct of_transaction_entry *te, int revert)
> +{
> +	int curr, target;
> +	unsigned long action;
> +	struct property *prop;
> +
> +	/* filter */
> +	if (te->action != OF_RECONFIG_ADD_PROPERTY &&
> +	    te->action != OF_RECONFIG_REMOVE_PROPERTY &&
> +	    te->action != OF_RECONFIG_UPDATE_PROPERTY &&
> +	    te->action != OF_RECONFIG_ATTACH_NODE &&
> +	    te->action != OF_RECONFIG_ATTACH_NODE)
> +		return -1;
> +
> +	action = te->action;
> +	prop = te->prop;
> +
> +	/* on revert convert to the opposite */
> +	if (revert) {
> +		if (action == OF_RECONFIG_ADD_PROPERTY)
> +			action = OF_RECONFIG_REMOVE_PROPERTY;
> +		else if (action == OF_RECONFIG_REMOVE_PROPERTY)
> +			action = OF_RECONFIG_ADD_PROPERTY;
> +		else if (action == OF_RECONFIG_UPDATE_PROPERTY)
> +			prop = te->old_prop;
> +		else if (action == OF_RECONFIG_ATTACH_NODE)
> +			action = OF_RECONFIG_DETACH_NODE;
> +		else
> +			action = OF_RECONFIG_ATTACH_NODE;
> +	}
> +
> +	/* we only support state changes on "status" property change */
> +	if ((te->action == OF_RECONFIG_ADD_PROPERTY ||
> +	    te->action == OF_RECONFIG_REMOVE_PROPERTY ||
> +	    te->action == OF_RECONFIG_UPDATE_PROPERTY) &&
> +		of_prop_cmp(prop->name, "status"))
> +		return -1;
> +
> +	/* note that we don't use of_transaction_find_property() */
> +
> +	/* current device state */
> +	curr = of_device_is_available(te->np) &&
> +		of_find_property(te->np, "compatible", NULL) &&
> +		of_find_property(te->np, "status", NULL);
> +
> +	switch (action) {
> +	case OF_RECONFIG_ADD_PROPERTY:
> +	case OF_RECONFIG_REMOVE_PROPERTY:
> +	case OF_RECONFIG_UPDATE_PROPERTY:
> +
> +		/* target device state */
> +		if (action == OF_RECONFIG_ADD_PROPERTY ||
> +		    action == OF_RECONFIG_UPDATE_PROPERTY)
> +			target = !strcmp(prop->value, "okay") ||
> +				!strcmp(prop->value, "ok");
> +		else
> +			target = 0;	/* NOTE: status removal -> disabled */
> +
> +		break;
> +	case OF_RECONFIG_ATTACH_NODE:
> +		target = curr;
> +		curr = 0;
> +		break;
> +	case OF_RECONFIG_DETACH_NODE:
> +		target = 0;
> +		break;
> +	}
> +
> +	return curr != target ? target : -1;
> +}

I've completely dropped the above function from the version I've got in
my tree. Adding changesets is not dependent on device state notifiers.
It really must be in a separate patch.

This patch should only add the functionality of changesets within the
context of the way tree changes currently work. Adding a new notifier is
a separate feature. Besides, if you're adding a new notifier, then you
need to make sure the old functions also emit the new notifier under
similar conditions. It's just best to keep that as a separate change.

(And I'm yet to be convinced that device_state notifiers are needed)

> +
> +static int __of_transaction_entry_apply(struct of_transaction *oft,
> +		struct of_transaction_entry *te)
> +{
> +	struct property *old_prop;
> +	unsigned long flags;
> +	int ret, state;
> +
> +	ret = 0;
> +
> +	state = __of_transaction_entry_device_state(oft, te, 0);
> +
> +	switch (te->action) {
> +	case OF_RECONFIG_ATTACH_NODE:
> +	case OF_RECONFIG_DETACH_NODE:
> +		ret = of_reconfig_notify(te->action, te->np);
> +		break;
> +	case OF_RECONFIG_ADD_PROPERTY:
> +	case OF_RECONFIG_REMOVE_PROPERTY:
> +	case OF_RECONFIG_UPDATE_PROPERTY:
> +		ret = of_property_notify(te->action, te->np, te->prop);
> +		break;
> +	}

The way I read this, the notifier is sent as each entry is applied. So
the sequence would be:
	entry 1 notify
	entry 1 apply
	entry 2 notify
	entry 2 apply
	etc.
Correct?

For this patch, that is probably exactly what should happen because it
matches the existing behaviour. However, it isn't what we want. We need
a seperate patch to reorganize the notifiers to be emitted after the
change takes place as we discussed on IRC, and powerpc needs to be moved
to the new model. At the same time, all of the notifiers need to be
emitted together instead of interleaved with the individual entries so
that the order looks like this:
	entry 1 apply
	entry 2 apply
	etc.
	entry 1 notify
	entry 2 notify
	etc.

> +
> +	if (ret) {
> +		pr_err("%s: notifier error @%s\n", __func__,
> +				te->np->full_name);
> +		return ret;
> +	}
> +
> +	mutex_lock(&of_mutex);

This doesn't look right. The mutex need to be held over the entire time
of applying changes. It cannot be dropped between entries of the
changeset. ie:

	mutex_lock()
	entry 1 apply
	entry 2 apply
	etc.
	mutex_unlock()
	entry 1 notify
	entry 2 notify
	etc.

If the mutex gets obtained and droped for each entry, then there is no
protection against another thread making a modification in the middle.

> +	raw_spin_lock_irqsave(&devtree_lock, flags);
> +	switch (te->action) {
> +	case OF_RECONFIG_ATTACH_NODE:
> +		__of_attach_node(te->np);
> +		break;
> +	case OF_RECONFIG_DETACH_NODE:
> +		__of_detach_node(te->np);
> +		break;
> +	case OF_RECONFIG_ADD_PROPERTY:
> +		ret = __of_add_property(te->np, te->prop);
> +		if (ret) {
> +			pr_err("%s: add_property failed @%s/%s\n",
> +				__func__, te->np->full_name,
> +				te->prop->name);
> +			break;
> +		}
> +		break;
> +	case OF_RECONFIG_REMOVE_PROPERTY:
> +		ret = __of_remove_property(te->np, te->prop);
> +		if (ret) {
> +			pr_err("%s: remove_property failed @%s/%s\n",
> +				__func__, te->np->full_name,
> +				te->prop->name);
> +			break;
> +		}
> +		break;
> +	case OF_RECONFIG_UPDATE_PROPERTY:
> +		ret = __of_update_property(te->np, te->prop, &old_prop);
> +		if (ret) {
> +			pr_err("%s: update_property failed @%s/%s\n",
> +				__func__, te->np->full_name,
> +				te->prop->name);
> +			break;
> +		}
> +		break;
> +	}
> +	raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +
> +	mutex_unlock(&of_mutex);
> +
> +	if (ret) {
> +		/* we can't rollback the notifier */
> +		return ret;
> +	}
> +
> +	switch (te->action) {
> +	case OF_RECONFIG_ATTACH_NODE:
> +		__of_attach_node_post(te->np);
> +		break;
> +	case OF_RECONFIG_DETACH_NODE:
> +		__of_detach_node_post(te->np);
> +		break;
> +	case OF_RECONFIG_ADD_PROPERTY:
> +		/* ignore duplicate names */
> +		__of_add_property_post(te->np, te->prop, 1);
> +		break;
> +	case OF_RECONFIG_REMOVE_PROPERTY:
> +		__of_remove_property_post(te->np, te->prop);
> +		break;
> +	case OF_RECONFIG_UPDATE_PROPERTY:
> +		__of_update_property_post(te->np, te->prop, te->old_prop);
> +		break;
> +	}
> +
> +	if (state != -1) {
> +		pr_debug("of_transaction: %s device for node '%s'\n",
> +				state ? "create" : "remove",
> +				te->np->full_name);
> +
> +		ret = of_reconfig_notify(state ?
> +				OF_RECONFIG_DYNAMIC_CREATE_DEV :
> +				OF_RECONFIG_DYNAMIC_DESTROY_DEV,
> +				te->np);
> +		if (ret != 0) {
> +			pr_err("of_transaction: failed %s device @%s (%d)\n",
> +					state ? "create" : "remove",
> +					te->np->full_name, ret);
> +			/* drop the error; devices probe fails; that's OK */
> +			ret = 0;
> +		}
> +
> +	}
> +
> +	return 0;
> +}
> +
> +static int __of_transaction_entry_revert(struct of_transaction *oft,
> +		struct of_transaction_entry *te)
> +{
> +	struct property *prop, *old_prop, **propp;
> +	unsigned long action, flags;
> +	struct device_node *np;
> +	int ret, state;
> +
> +	state = __of_transaction_entry_device_state(oft, te, 1);
> +
> +	if (state != -1) {
> +		pr_debug("of_transaction: %s device for node '%s'\n",
> +				state  ? "create" : "remove",
> +				te->np->full_name);
> +
> +		ret = of_reconfig_notify(state ?
> +				OF_RECONFIG_DYNAMIC_CREATE_DEV :
> +				OF_RECONFIG_DYNAMIC_DESTROY_DEV,
> +				te->np);
> +		if (ret != 0) {
> +			pr_err("of_transaction: failed %s device @%s (%d)\n",
> +					state ? "create" : "remove",
> +					te->np->full_name, ret);
> +			/* drop the error; devices probe fails; that's OK */
> +			ret = 0;
> +		}
> +	}
> +
> +	/* get node and immediately put */
> +	action = te->action;
> +	np = te->np;
> +	prop = te->prop;
> +	old_prop = te->old_prop;
> +
> +	switch (action) {
> +	case OF_RECONFIG_ATTACH_NODE:
> +		ret = of_reconfig_notify(OF_RECONFIG_DETACH_NODE, np);
> +		break;
> +	case OF_RECONFIG_DETACH_NODE:
> +		ret = of_reconfig_notify(OF_RECONFIG_ATTACH_NODE, np);
> +		break;
> +	case OF_RECONFIG_ADD_PROPERTY:
> +		ret = of_property_notify(OF_RECONFIG_REMOVE_PROPERTY,
> +				np, prop);
> +		break;
> +	case OF_RECONFIG_REMOVE_PROPERTY:
> +		ret = of_property_notify(OF_RECONFIG_ADD_PROPERTY,
> +				np, prop);
> +		break;
> +	case OF_RECONFIG_UPDATE_PROPERTY:
> +		ret = of_property_notify(OF_RECONFIG_UPDATE_PROPERTY,
> +				np, old_prop);
> +		break;
> +	}
> +
> +	if (ret) {
> +		pr_err("%s: notifier error @%s\n", __func__,
> +				te->np->full_name);
> +		goto out_revert;
> +	}
> +
> +	mutex_lock(&of_mutex);
> +
> +	raw_spin_lock_irqsave(&devtree_lock, flags);
> +	switch (action) {
> +	case OF_RECONFIG_ATTACH_NODE:
> +		__of_detach_node(np);
> +		break;
> +	case OF_RECONFIG_DETACH_NODE:
> +		__of_attach_node(np);
> +		break;
> +	case OF_RECONFIG_ADD_PROPERTY:
> +		ret = __of_remove_property(np, prop);
> +		if (ret) {
> +			pr_err("%s: remove_property failed @%s/%s\n",
> +				__func__, np->full_name, prop->name);
> +			break;
> +		}
> +		break;
> +	case OF_RECONFIG_REMOVE_PROPERTY:
> +	case OF_RECONFIG_UPDATE_PROPERTY:
> +		/* property is *always* on deadprops */
> +		if (action == OF_RECONFIG_UPDATE_PROPERTY)
> +			prop = old_prop;
> +		propp = &np->deadprops;
> +		while (*propp != NULL) {
> +			if (*propp == prop)
> +				break;
> +			propp = &(*propp)->next;
> +		}
> +
> +		/* we should find it in deadprops */
> +		WARN_ON(*propp == NULL);
> +
> +		/* remove it from deadprops */
> +		if (*propp != NULL)
> +			*propp = prop->next;
> +
> +		if (action == OF_RECONFIG_REMOVE_PROPERTY) {
> +			ret = __of_add_property(np, prop);
> +			if (ret) {
> +				pr_err("%s: add_property failed @%s/%s\n",
> +					__func__, np->full_name,
> +					prop->name);
> +				break;
> +			}
> +		} else {
> +			ret = __of_update_property(np, prop, &old_prop);
> +			if (ret) {
> +				pr_err("%s: update_property failed @%s/%s\n",
> +					__func__, np->full_name,
> +					prop->name);
> +				break;
> +			}
> +		}
> +		break;
> +	}
> +	raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +
> +	if (ret)
> +		goto out_unlock;
> +
> +	switch (action) {
> +	case OF_RECONFIG_ATTACH_NODE:
> +		__of_detach_node_post(np);
> +		break;
> +	case OF_RECONFIG_DETACH_NODE:
> +		__of_attach_node_post(np);
> +		break;
> +	case OF_RECONFIG_ADD_PROPERTY:
> +		__of_remove_property_post(np, prop);
> +		break;
> +	case OF_RECONFIG_REMOVE_PROPERTY:
> +		__of_add_property_post(np, prop, 0);
> +		break;
> +	case OF_RECONFIG_UPDATE_PROPERTY:
> +		__of_update_property_post(np, prop, old_prop);
> +		break;
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&of_mutex);
> +
> +out_revert:
> +	/* revert creation of device */
> +	if (ret && state != -1)
> +		of_reconfig_notify(!state ?
> +			OF_RECONFIG_DYNAMIC_CREATE_DEV :
> +			OF_RECONFIG_DYNAMIC_DESTROY_DEV,
> +			te->np);
> +
> +	return ret;
> +}
> +
> +/**
> + * of_transaction_init - Initialize a transaction for use
> + *
> + * @oft:	transaction pointer
> + *
> + * Initialize a transaction structure
> + */
> +void of_transaction_init(struct of_transaction *oft)
> +{
> +	memset(oft, 0, sizeof(*oft));
> +	INIT_LIST_HEAD(&oft->te_list);
> +}
> +
> +/**
> + * of_transaction_destroy - Destroy a transaction
> + *
> + * @oft:	transaction pointer
> + *
> + * Destroys a transaction. Note that if a transaction is applied,
> + * its changes to the tree cannot be reverted.
> + */
> +void of_transaction_destroy(struct of_transaction *oft)
> +{
> +	struct of_transaction_entry *te, *ten;
> +
> +	list_for_each_entry_safe_reverse(te, ten, &oft->te_list, node)
> +		__of_transaction_entry_destroy(te);
> +}
> +
> +/**
> + * of_transaction_start - Start a transaction
> + *
> + * @oft:	transaction pointer
> + *
> + * Starts a transaction, by simply grabbing hold of the of_mutex.
> + * This prevents any modification of the live tree while the
> + * transaction is in process.
> + */
> +void of_transaction_start(struct of_transaction *oft)
> +{
> +	/* take the global of transaction mutex */
> +	mutex_lock(&of_mutex);
> +}
> +
> +/**
> + * of_transaction_abort - Aborts a transaction in progress
> + *
> + * @oft:	transaction pointer
> + *
> + * Aborts a transaction, this simply releases the of_mutex
> + * and destroys all the pending transaction entries.
> + */
> +void of_transaction_abort(struct of_transaction *oft)
> +{
> +	struct of_transaction_entry *te, *ten;
> +
> +	mutex_unlock(&of_mutex);
> +
> +	list_for_each_entry_safe_reverse(te, ten, &oft->te_list, node)
> +		__of_transaction_entry_destroy(te);
> +}

This function shouldn't be needed anymore.

> +
> +/**
> + * of_transaction_apply - Applies a transaction
> + *
> + * @oft:	transaction pointer
> + * @force:	continue even in case of an error
> + *
> + * Applies a transaction to the live tree.
> + * Any side-effects of live tree state changes are applied here on
> + * sucess, like creation/destruction of devices and side-effects
> + * like creation of sysfs properties and directories.
> + * Returns 0 on success, a negative error value in case of an error.
> + * On error the partially applied effects are reverted if the @force
> + * parameter is not set.
> + */
> +int of_transaction_apply(struct of_transaction *oft, int force)

Is there a user of the force flag? I'd rather it not be there at all.

> +{
> +	struct of_transaction_entry *te;
> +	int ret;
> +
> +	/* drop the global lock here (notifiers and devices need it) */
> +	mutex_unlock(&of_mutex);
> +
> +	ret = 0;
> +
> +	/* perform the rest of the work */
> +	pr_debug("of_transaction: applying...\n");
> +	list_for_each_entry(te, &oft->te_list, node) {
> +		__of_transaction_entry_dump(te);
> +		ret = __of_transaction_entry_apply(oft, te);
> +		if (ret) {
> +			pr_err("%s: Error applying transaction (%d)\n",
> +					__func__, ret);
> +			if (!force) {
> +				list_for_each_entry_continue_reverse(te,
> +						&oft->te_list, node) {
> +					__of_transaction_entry_dump(te);
> +					__of_transaction_entry_revert(oft, te);
> +				}
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	pr_debug("of_transaction: applied.\n");
> +
> +	return 0;
> +}
> +
> +/**
> + * of_transaction_revert - Reverts an applied transaction
> + *
> + * @oft:	transaction pointer
> + * @force:	continue even in case of an error
> + *
> + * Reverts a transaction returning the state of the tree to what it
> + * was before the application.
> + * Any side-effects like creation/destruction of devices and
> + * removal of sysfs properties and directories are applied.
> + * Returns 0 on success, a negative error value in case of an error.
> + */
> +int of_transaction_revert(struct of_transaction *oft, int force)
> +{
> +	struct of_transaction_entry *te, *ten;
> +	int ret;
> +
> +	pr_debug("of_transaction: reverting...\n");
> +	list_for_each_entry_reverse(te, &oft->te_list, node) {
> +		__of_transaction_entry_dump(te);
> +		ret = __of_transaction_entry_revert(oft, te);
> +		if (ret) {
> +			pr_err("%s: Error reverting transaction (%d)\n",
> +					__func__, ret);
> +			if (!force) {
> +				list_for_each_entry_continue(te,
> +						&oft->te_list, node) {
> +					__of_transaction_entry_dump(te);
> +					__of_transaction_entry_apply(oft, te);
> +				}
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	/* destroy everything */
> +	list_for_each_entry_safe_reverse(te, ten, &oft->te_list, node)
> +		__of_transaction_entry_destroy(te);
> +	pr_debug("of_transaction: reverted.\n");
> +
> +	return 0;
> +}
> +
> +/**
> + * of_transaction_action - Perform a transaction action
> + *
> + * @oft:	transaction pointer
> + * @action:	action to perform
> + * @np:		Pointer to device node
> + * @prop:	Pointer to property
> + *
> + * On action being one of:
> + * + OF_RECONFIG_ATTACH_NODE
> + * + OF_RECONFIG_DETACH_NODE,
> + * + OF_RECONFIG_ADD_PROPERTY
> + * + OF_RECONFIG_REMOVE_PROPERTY,
> + * + OF_RECONFIG_UPDATE_PROPERTY
> + * Returns 0 on success, a negative error value in case of an error.
> + */
> +int of_transaction_action(struct of_transaction *oft, unsigned long action,
> +		struct device_node *np, struct property *prop)
> +{
> +	struct of_transaction_entry *te;
> +
> +	/* create the transaction entry */
> +	te = __of_transaction_entry_create(oft, action, np, prop);
> +	if (IS_ERR(te)) {
> +		pr_err("%s: failed to create entry for @%s\n",
> +				__func__, np->full_name);
> +		return PTR_ERR(te);
> +	}
> +
> +	/* add it to the list */
> +	list_add_tail(&te->node, &oft->te_list);
> +	return 0;
> +}
> +
> +/* utility functions for advanced transaction users */
> +
> +/* find a property in the transaction list while not applied */
> +struct property *of_transaction_find_property(struct of_transaction *oft,
> +		const struct device_node *np, const char *name, int *lenp)
> +{
> +	struct of_transaction_entry *te;
> +
> +	/* possibly exists in the transaction list as
> +	 * part of an attachment action
> +	 */
> +	list_for_each_entry_reverse(te, &oft->te_list, node) {
> +
> +		if (te->action != OF_RECONFIG_ADD_PROPERTY &&
> +		    te->action != OF_RECONFIG_REMOVE_PROPERTY &&
> +		    te->action != OF_RECONFIG_UPDATE_PROPERTY)
> +			continue;
> +
> +		/* match of node and name? */
> +		if (te->np != np || strcmp(te->prop->name, name))
> +			continue;
> +
> +		pr_debug("%s: found property \"%s\" in transaction list @%s\n",
> +			__func__, name, te->np->full_name);
> +
> +		if (te->action == OF_RECONFIG_ADD_PROPERTY ||
> +		    te->action == OF_RECONFIG_UPDATE_PROPERTY)
> +			return te->prop;
> +		else
> +			return NULL;
> +	}
> +
> +	/* now fallback to live tree */
> +	return of_find_property(np, name, lenp);
> +}

What's the use case for modifying a property in a node that was added in
the same changeset? If the node isn't attached yet, then shouldn't the
property just be added to the node immediately instead of adding it as a
changeset entry?

> +
> +/* special find property method for use by transaction users */
> +int of_transaction_device_is_available(struct of_transaction *oft,
> +		const struct device_node *np)
> +{
> +	struct property *prop;
> +
> +	if (!np)
> +		return 0;
> +
> +	prop = of_transaction_find_property(oft, np, "status", NULL);
> +	if (prop == NULL)
> +		return 1;
> +
> +	return prop->length > 0 &&
> +		(!strcmp(prop->value, "okay") || !strcmp(prop->value, "ok"));
> +}
> +struct device_node *of_transaction_get_child_by_name(
> +		struct of_transaction *oft, struct device_node *node,
> +		const char *name)
> +{
> +	struct of_transaction_entry *te;
> +
> +	/* possibly exists in the transaction list as
> +	 * part of an attachment action
> +	 */
> +	list_for_each_entry_reverse(te, &oft->te_list, node) {
> +
> +		if (te->action != OF_RECONFIG_ATTACH_NODE &&
> +		    te->action != OF_RECONFIG_DETACH_NODE)
> +			continue;
> +
> +		/* look at the parent and if node matches return */
> +		if (te->np->parent != node || strcmp(te->np->name, "name"))
> +			continue;
> +
> +		pr_debug("%s: found child \"%s\" in transaction list @%s\n",
> +			__func__, name, te->np->full_name);
> +		return te->action == OF_RECONFIG_ATTACH_NODE ? te->np : NULL;
> +	}
> +
> +	/* not found in the transaction list? try normal */
> +	return of_get_child_by_name(node, name);
> +}
> diff --git a/include/linux/of.h b/include/linux/of.h
> index b7c322c..fa81b42 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -821,4 +821,86 @@ typedef void (*of_init_fn_1)(struct device_node *);
>  #define OF_DECLARE_2(table, name, compat, fn) \
>  		_OF_DECLARE(table, name, compat, fn, of_init_fn_2)
>  
> +/**
> + * struct of_transaction_entry	- Holds a transaction entry
> + *
> + * @node:	list_head for the log list
> + * @action:	notifier action
> + * @np:		pointer to the device node affected
> + * @prop:	pointer to the property affected
> + * @old_prop:	hold a pointer to the original property
> + *
> + * Every modification of the device tree during a transaction
> + * is held in a list of of_transaction_entry structures.
> + * That way we can recover from a partial application, or we can
> + * revert the transaction
> + */
> +struct of_transaction_entry {
> +	struct list_head node;
> +	unsigned long action;
> +	struct device_node *np;
> +	struct property *prop;
> +	struct property *old_prop;
> +};
> +
> +/**
> + * struct of_transaction - transaction tracker structure
> + *
> + * @te_list:	list_head for the transaction entries
> + *
> + * Transactions are a convenient way to apply bulk changes to the
> + * live tree. In case of an error, changes are rolled-back.
> + * Transactions live on after initial application, and if not
> + * destroyed after use, they can be reverted in one single call.
> + */
> +struct of_transaction {
> +	struct list_head te_list;
> +};
> +
> +#ifdef CONFIG_OF_DYNAMIC
> +extern void of_transaction_init(struct of_transaction *oft);
> +extern void of_transaction_destroy(struct of_transaction *oft);
> +extern void of_transaction_start(struct of_transaction *oft);
> +extern void of_transaction_abort(struct of_transaction *oft);
> +extern int of_transaction_apply(struct of_transaction *oft, int force);
> +extern int of_transaction_revert(struct of_transaction *oft, int force);
> +extern int of_transaction_action(struct of_transaction *oft,
> +		unsigned long action, struct device_node *np,
> +		struct property *prop);
> +
> +static inline int of_transaction_attach_node(struct of_transaction *oft,
> +		struct device_node *np)
> +{
> +	return of_transaction_action(oft, OF_RECONFIG_ATTACH_NODE, np, NULL);
> +}
> +
> +static inline int of_transaction_detach_node(struct of_transaction *oft,
> +		struct device_node *np)
> +{
> +	return of_transaction_action(oft,
> +			OF_RECONFIG_DETACH_NODE, np, NULL);
> +}
> +
> +static inline int of_transaction_add_property(struct of_transaction *oft,
> +		struct device_node *np, struct property *prop)
> +{
> +	return of_transaction_action(oft,
> +			OF_RECONFIG_ADD_PROPERTY, np, prop);
> +}
> +
> +static inline int of_transaction_remove_property(struct of_transaction *oft,
> +		struct device_node *np, struct property *prop)
> +{
> +	return of_transaction_action(oft,
> +			OF_RECONFIG_REMOVE_PROPERTY, np, prop);
> +}
> +
> +static inline int of_transaction_update_property(struct of_transaction *oft,
> +		struct device_node *np, struct property *prop)
> +{
> +	return of_transaction_action(oft,
> +			OF_RECONFIG_UPDATE_PROPERTY, np, prop);
> +}
> +#endif
> +
>  #endif /* _LINUX_OF_H */
> -- 
> 1.7.12
> 
