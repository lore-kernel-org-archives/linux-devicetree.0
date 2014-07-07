Return-Path: <grant.likely@secretlab.ca>
Return-Path: <grant.likely@secretlab.ca>
Sender: Grant Likely <glikely@secretlab.ca>
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 3/5] OF: Utility helper functions for dynamic nodes
In-Reply-To: 
 <1404493129-8914-4-git-send-email-pantelis.antoniou@konsulko.com>
References: 
	<1404493129-8914-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1404493129-8914-4-git-send-email-pantelis.antoniou@konsulko.com>
Date: Mon, 07 Jul 2014 14:13:12 +0100
Message-Id: <20140707131312.81D4CC409D5@trevor.secretlab.ca>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

On Fri,  4 Jul 2014 19:58:47 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> Introduce helper functions for working with the live DT tree,
> all of them related to dynamically adding/removing nodes and
> properties.
> 
> __of_copy_property() copies a property dynamically
> __of_create_empty_node() creates an empty node
> 
> Bug fix about prop->len == 0 by Ionut Nicu <ioan.nicu.ext@nsn.com>
> 
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> ---
>  drivers/of/dynamic.c    | 124 ++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/of/of_private.h |  14 ++++++
>  include/linux/of.h      |   9 ++++
>  3 files changed, 147 insertions(+)
> 
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index eb1126f..90c09b6 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -266,3 +266,127 @@ void of_node_release(struct kobject *kobj)
>  
>  	raw_spin_unlock_irqrestore(&deadtree_lock, flags);
>  }
> +
> +/**
> + * __of_copy_property - Copy a property dynamically.
> + * @prop:	Property to copy
> + * @allocflags:	Allocation flags (typically pass GFP_KERNEL)
> + * @propflags:	Property flags
> + *
> + * Copy a property by dynamically allocating the memory of both the
> + * property stucture and the property name & contents. The property's
> + * flags have the OF_DYNAMIC bit set so that we can differentiate between
> + * dynamically allocated properties and not.
> + * Returns the newly allocated property or NULL on out of memory error.
> + */
> +struct property *__of_copy_property(const struct property *prop,
> +		gfp_t allocflags, unsigned long propflags)
> +{
> +	struct property *propn;
> +
> +	propn = kzalloc(sizeof(*prop), allocflags);
> +	if (propn == NULL)
> +		return NULL;
> +
> +	propn->_flags = propflags;
> +
> +	if (of_property_check_flag(propn, OF_ALLOCNAME)) {
> +		propn->name = kstrdup(prop->name, allocflags);
> +		if (propn->name == NULL)
> +			goto err_fail_name;
> +	} else
> +		propn->name = prop->name;
> +
> +	/*
> +	 * NOTE: There is no check for zero length value.
> +	 * In case of a boolean property This will allocate a value
> +	 * of zero bytes. We do this to work around the use
> +	 * of of_get_property() calls on boolean values.
> +	 */
> +	if (of_property_check_flag(propn, OF_ALLOCVALUE)) {
> +		propn->value = kmalloc(prop->length, allocflags);
> +		if (propn->value == NULL)
> +			goto err_fail_value;
> +		memcpy(propn->value, prop->value, prop->length);
> +	} else
> +		propn->value = prop->value;
> +
> +	propn->length = prop->length;
> +
> +	/* mark the property as dynamic */
> +	of_property_set_flag(propn, OF_DYNAMIC);
> +
> +	return propn;
> +
> +err_fail_value:
> +	if (of_property_check_flag(propn, OF_ALLOCNAME))
> +		kfree(propn->name);
> +err_fail_name:
> +	kfree(propn);
> +	return NULL;
> +}
> +
> +/**
> + * __of_create_empty_node - Create an empty device node dynamically.
> + * @name:	Name of the new device node
> + * @type:	Type of the new device node
> + * @full_name:	Full name of the new device node
> + * @phandle:	Phandle of the new device node
> + * @allocflags:	Allocation flags (typically pass GFP_KERNEL)
> + * @nodeflags:	Node flags
> + *
> + * Create an empty device tree node, suitable for further modification.
> + * The node data are dynamically allocated and all the node flags
> + * have the OF_DYNAMIC & OF_DETACHED bits set.
> + * Returns the newly allocated node or NULL on out of memory error.
> + */
> +struct device_node *__of_create_empty_node(
> +		const char *name, const char *type, const char *full_name,
> +		phandle phandle, gfp_t allocflags, unsigned long nodeflags)
> +{
> +	struct device_node *node;
> +
> +	node = kzalloc(sizeof(*node), allocflags);
> +	if (node == NULL)
> +		return NULL;
> +
> +	node->_flags = nodeflags;
> +
> +	if (of_node_check_flag(node, OF_ALLOCNAME)) {
> +		node->name = kstrdup(name, allocflags);
> +		if (node->name == NULL)
> +			goto err_free_node;
> +	} else
> +		node->name = name;
> +
> +	if (of_node_check_flag(node, OF_ALLOCTYPE)) {
> +		node->type = kstrdup(type, allocflags);
> +		if (node->type == NULL)
> +			goto err_free_name;
> +	} else
> +		node->type = type;
> +
> +	if (of_node_check_flag(node, OF_ALLOCFULL)) {
> +		node->full_name = kstrdup(full_name, allocflags);
> +		if (node->full_name == NULL)
> +			goto err_free_type;
> +	} else
> +		node->full_name = full_name;
> +
> +	node->phandle = phandle;
> +	of_node_set_flag(node, OF_DYNAMIC);
> +	of_node_set_flag(node, OF_DETACHED);
> +
> +	of_node_init(node);
> +
> +	return node;
> +err_free_type:
> +	if (of_node_check_flag(node, OF_ALLOCTYPE))
> +		kfree(node->type);
> +err_free_name:
> +	if (of_node_check_flag(node, OF_ALLOCNAME))
> +		kfree(node->name);
> +err_free_node:
> +	kfree(node);
> +	return NULL;
> +}
> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> index b2c25b5..e544247 100644
> --- a/drivers/of/of_private.h
> +++ b/drivers/of/of_private.h
> @@ -67,4 +67,18 @@ extern int __of_update_property(struct device_node *np,
>  extern void __of_attach_node(struct device_node *np);
>  extern void __of_detach_node(struct device_node *np);
>  
> +/**
> + * General utilities for working with live trees.
> + *
> + * All functions with two leading underscores operate
> + * without taking node references, so you either have to
> + * own the devtree lock or work on detached trees only.
> + */
> +
> +struct property *__of_copy_property(const struct property *prop,
> +		gfp_t allocflags, unsigned long propflags);
> +struct device_node *__of_create_empty_node(const char *name,
> +		const char *type, const char *full_name,
> +		phandle phandle, gfp_t allocflags, unsigned long nodeflags);
> +
>  #endif /* _LINUX_OF_PRIVATE_H */
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 8e4fb82..b7c322c 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -206,6 +206,15 @@ static inline unsigned long of_read_ulong(const __be32 *cell, int size)
>  #define OF_POPULATED	3 /* device already created for the node */
>  #define OF_POPULATED_BUS	4 /* of_platform_populate recursed
>  				   * to children of this node */
> +#define OF_ALLOCNAME	5 /* name was kmalloc-ed */
> +#define OF_ALLOCTYPE	6 /* type was kmalloc-ed */
> +#define OF_ALLOCFULL	7 /* full_name was kmalloc-ed */
> +#define OF_ALLOCVALUE	8 /* value was kmalloc-ed */
> +

We talked about this. Drop all the fine grained alloc tracking.

g.

> +#define OF_NODE_ALLOCALL \
> +	((1 << OF_ALLOCNAME) | (1 << OF_ALLOCTYPE) | (1 << OF_ALLOCFULL))
> +#define OF_PROP_ALLOCALL \
> +	((1 << OF_ALLOCNAME) | (1 << OF_ALLOCVALUE))
>  
>  #define OF_IS_DYNAMIC(x) test_bit(OF_DYNAMIC, &x->_flags)
>  #define OF_MARK_DYNAMIC(x) set_bit(OF_DYNAMIC, &x->_flags)
> -- 
> 1.7.12
> 
