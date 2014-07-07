Return-Path: <grant.likely@secretlab.ca>
Return-Path: <grant.likely@secretlab.ca>
Sender: Grant Likely <glikely@secretlab.ca>
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 2/5] OF: Export a number of __of_* methods
In-Reply-To: 
 <1404493129-8914-3-git-send-email-pantelis.antoniou@konsulko.com>
References: 
	<1404493129-8914-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1404493129-8914-3-git-send-email-pantelis.antoniou@konsulko.com>
Date: Mon, 07 Jul 2014 14:11:34 +0100
Message-Id: <20140707131134.825FBC409D5@trevor.secretlab.ca>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

On Fri,  4 Jul 2014 19:58:46 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> As part of moving to transactional DT, a number of methods are
> reworked and exported.
> 
> The methods exported are:
> __of_add_property, __of_remove_property, __of_update_property, __of_attach_node,
> __of_detach_node


??? The description doesn't match the patch. Nothing is getting
exported, and the commit message should really say why and how the
methods are being reworked.

g.

> 
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> ---
>  drivers/of/base.c       | 97 +++++++++++++++++++++++++++++--------------------
>  drivers/of/dynamic.c    | 71 +++++++++++++++++++-----------------
>  drivers/of/of_private.h |  8 ++++
>  3 files changed, 102 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index be0ec37..0d50318 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1659,7 +1659,7 @@ EXPORT_SYMBOL(of_count_phandle_with_args);
>  /**
>   * __of_add_property - Add a property to a node without lock operations
>   */
> -static int __of_add_property(struct device_node *np, struct property *prop)
> +int __of_add_property(struct device_node *np, struct property *prop)
>  {
>  	struct property **next;
>  
> @@ -1701,6 +1701,25 @@ int of_add_property(struct device_node *np, struct property *prop)
>  	return rc;
>  }
>  
> +int __of_remove_property(struct device_node *np, struct property *prop)
> +{
> +	struct property **next;
> +
> +	for (next = &np->properties; *next; next = &(*next)->next) {
> +		if (*next == prop)
> +			break;
> +	}
> +	if (*next == NULL)
> +		return -ENODEV;
> +
> +	/* found the node */
> +	*next = prop->next;
> +	prop->next = np->deadprops;
> +	np->deadprops = prop;
> +
> +	return 0;
> +}
> +
>  /**
>   * of_remove_property - Remove a property from a node.
>   *
> @@ -1711,9 +1730,7 @@ int of_add_property(struct device_node *np, struct property *prop)
>   */
>  int of_remove_property(struct device_node *np, struct property *prop)
>  {
> -	struct property **next;
>  	unsigned long flags;
> -	int found = 0;
>  	int rc;
>  
>  	rc = of_property_notify(OF_RECONFIG_REMOVE_PROPERTY, np, prop);
> @@ -1721,22 +1738,11 @@ int of_remove_property(struct device_node *np, struct property *prop)
>  		return rc;
>  
>  	raw_spin_lock_irqsave(&devtree_lock, flags);
> -	next = &np->properties;
> -	while (*next) {
> -		if (*next == prop) {
> -			/* found the node */
> -			*next = prop->next;
> -			prop->next = np->deadprops;
> -			np->deadprops = prop;
> -			found = 1;
> -			break;
> -		}
> -		next = &(*next)->next;
> -	}
> +	rc = __of_remove_property(np, prop);
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  
> -	if (!found)
> -		return -ENODEV;
> +	if (rc)
> +		return rc;
>  
>  	/* at early boot, bail hear and defer setup to of_init() */
>  	if (!of_kset)
> @@ -1747,6 +1753,32 @@ int of_remove_property(struct device_node *np, struct property *prop)
>  	return 0;
>  }
>  
> +int __of_update_property(struct device_node *np, struct property *newprop,
> +		struct property **oldpropp)
> +{
> +	struct property **next, *oldprop;
> +
> +	for (next = &np->properties; *next; next = &(*next)->next) {
> +		if (of_prop_cmp((*next)->name, newprop->name) == 0)
> +			break;
> +	}
> +	*oldpropp = oldprop = *next;
> +
> +	if (oldprop) {
> +		/* replace the node */
> +		newprop->next = oldprop->next;
> +		*next = newprop;
> +		oldprop->next = np->deadprops;
> +		np->deadprops = oldprop;
> +	} else {
> +		/* new node */
> +		newprop->next = NULL;
> +		*next = newprop;
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * of_update_property - Update a property in a node, if the property does
>   * not exist, add it.
> @@ -1756,36 +1788,21 @@ int of_remove_property(struct device_node *np, struct property *prop)
>   * Instead we just move the property to the "dead properties" list,
>   * and add the new property to the property list
>   */
> -int of_update_property(struct device_node *np, struct property *newprop)
> +int of_update_property(struct device_node *np, struct property *prop)
>  {
> -	struct property **next, *oldprop;
> +	struct property *oldprop;
>  	unsigned long flags;
>  	int rc;
>  
> -	rc = of_property_notify(OF_RECONFIG_UPDATE_PROPERTY, np, newprop);
> +	if (!prop->name)
> +		return -EINVAL;
> +
> +	rc = of_property_notify(OF_RECONFIG_UPDATE_PROPERTY, np, prop);
>  	if (rc)
>  		return rc;
>  
> -	if (!newprop->name)
> -		return -EINVAL;
> -
>  	raw_spin_lock_irqsave(&devtree_lock, flags);
> -	next = &np->properties;
> -	oldprop = __of_find_property(np, newprop->name, NULL);
> -	if (!oldprop) {
> -		/* add the new node */
> -		rc = __of_add_property(np, newprop);
> -	} else while (*next) {
> -		/* replace the node */
> -		if (*next == oldprop) {
> -			newprop->next = oldprop->next;
> -			*next = newprop;
> -			oldprop->next = np->deadprops;
> -			np->deadprops = oldprop;
> -			break;
> -		}
> -		next = &(*next)->next;
> -	}
> +	rc = __of_update_property(np, prop, &oldprop);
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  	if (rc)
>  		return rc;
> @@ -1797,7 +1814,7 @@ int of_update_property(struct device_node *np, struct property *newprop)
>  	/* Update the sysfs attribute */
>  	if (oldprop)
>  		sysfs_remove_bin_file(&np->kobj, &oldprop->attr);
> -	__of_add_property_sysfs(np, newprop);
> +	__of_add_property_sysfs(np, prop);
>  
>  	return 0;
>  }
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index 0e8457c..eb1126f 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -95,8 +95,17 @@ int of_property_notify(int action, struct device_node *np,
>  	return of_reconfig_notify(action, &pr);
>  }
>  
> +void __of_attach_node(struct device_node *np)
> +{
> +	np->sibling = np->parent->child;
> +	np->allnext = np->parent->allnext;
> +	np->parent->allnext = np;
> +	np->parent->child = np;
> +	of_node_clear_flag(np, OF_DETACHED);
> +}
> +
>  /**
> - * of_attach_node() - Plug a device node into the tree and global list.
> + * of_attach_node - Plug a device node into the tree and global list.
>   */
>  int of_attach_node(struct device_node *np)
>  {
> @@ -108,52 +117,29 @@ int of_attach_node(struct device_node *np)
>  		return rc;
>  
>  	raw_spin_lock_irqsave(&devtree_lock, flags);
> -	np->sibling = np->parent->child;
> -	np->allnext = of_allnodes;
> -	np->parent->child = np;
> -	of_allnodes = np;
> -	of_node_clear_flag(np, OF_DETACHED);
> +	__of_attach_node(np);
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  
>  	of_node_add(np);
>  	return 0;
>  }
>  
> -/**
> - * of_detach_node() - "Unplug" a node from the device tree.
> - *
> - * The caller must hold a reference to the node.  The memory associated with
> - * the node is not freed until its refcount goes to zero.
> - */
> -int of_detach_node(struct device_node *np)
> +void __of_detach_node(struct device_node *np)
>  {
>  	struct device_node *parent;
> -	unsigned long flags;
> -	int rc = 0;
> -
> -	rc = of_reconfig_notify(OF_RECONFIG_DETACH_NODE, np);
> -	if (rc)
> -		return rc;
> +	struct device_node *prev;
> +	struct device_node *prevsib;
>  
> -	raw_spin_lock_irqsave(&devtree_lock, flags);
> -
> -	if (of_node_check_flag(np, OF_DETACHED)) {
> -		/* someone already detached it */
> -		raw_spin_unlock_irqrestore(&devtree_lock, flags);
> -		return rc;
> -	}
> +	if (WARN_ON(of_node_check_flag(np, OF_DETACHED)))
> +		return;
>  
>  	parent = np->parent;
> -	if (!parent) {
> -		raw_spin_unlock_irqrestore(&devtree_lock, flags);
> -		return rc;
> -	}
> +	if (WARN_ON(!parent))
> +		return;
>  
>  	if (of_allnodes == np)
>  		of_allnodes = np->allnext;
>  	else {
> -		struct device_node *prev;
> -
>  		for (prev = of_allnodes;
>  		     prev->allnext != np;
>  		     prev = prev->allnext)
> @@ -164,8 +150,6 @@ int of_detach_node(struct device_node *np)
>  	if (parent->child == np)
>  		parent->child = np->sibling;
>  	else {
> -		struct device_node *prevsib;
> -
>  		for (prevsib = np->parent->child;
>  		     prevsib->sibling != np;
>  		     prevsib = prevsib->sibling)
> @@ -174,6 +158,25 @@ int of_detach_node(struct device_node *np)
>  	}
>  
>  	of_node_set_flag(np, OF_DETACHED);
> +}
> +
> +/**
> + * of_detach_node - "Unplug" a node from the device tree.
> + *
> + * The caller must hold a reference to the node.  The memory associated with
> + * the node is not freed until its refcount goes to zero.
> + */
> +int of_detach_node(struct device_node *np)
> +{
> +	unsigned long flags;
> +	int rc = 0;
> +
> +	rc = of_reconfig_notify(OF_RECONFIG_DETACH_NODE, np);
> +	if (rc)
> +		return rc;
> +
> +	raw_spin_lock_irqsave(&devtree_lock, flags);
> +	__of_detach_node(np);
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  
>  	of_node_remove(np);
> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> index a541b81..b2c25b5 100644
> --- a/drivers/of/of_private.h
> +++ b/drivers/of/of_private.h
> @@ -59,4 +59,12 @@ static inline int of_reconfig_notify(unsigned long action, void *p)
>  }
>  #endif /* CONFIG_OF_DYNAMIC */
>  
> +extern int __of_add_property(struct device_node *np, struct property *prop);
> +extern int __of_remove_property(struct device_node *np, struct property *prop);
> +extern int __of_update_property(struct device_node *np,
> +		struct property *newprop, struct property **oldprop);
> +
> +extern void __of_attach_node(struct device_node *np);
> +extern void __of_detach_node(struct device_node *np);
> +
>  #endif /* _LINUX_OF_PRIVATE_H */
> -- 
> 1.7.12
> 
