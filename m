Return-Path: <grant.likely@secretlab.ca>
Return-Path: <grant.likely@secretlab.ca>
Sender: Grant Likely <glikely@secretlab.ca>
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 4/5] of: Introduce tree change __foo_post methods.
In-Reply-To: 
 <1404493129-8914-5-git-send-email-pantelis.antoniou@konsulko.com>
References: 
	<1404493129-8914-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1404493129-8914-5-git-send-email-pantelis.antoniou@konsulko.com>
Date: Thu, 10 Jul 2014 01:55:52 +0100
Message-Id: <20140710005552.E74F0C41B68@trevor.secretlab.ca>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

On Fri,  4 Jul 2014 19:58:48 +0300, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> As part of transactional DT support there needs to be a clearer
> definition of how each dynamic tree change method works.
> 
> Let's take for example the of_add_property method. There are
> discrete steps taken in sequence.
> 
> 1. The OF_RECONFIG_ADD_PROPERTY notifier will be fired.
> 2. The devtree lock will be taken.
> 3. Insertion of the property in the live tree.
> 4. The devtree lock will be released.
> 5. The property will be inserted in the sysfs tree.
> 
> For each of the of_attach_node, of_detach_node, of_add_property,
> of_remove_property and of_update_property methods we export (and
> introduce if not available), their counterparts of
> __of_attach_node, __of_attach_node_post, __of_detach_node,
> __of_detach_node_post, __of_add_property, __of_add_property_post,
> __of_remove_property, __of_remove_property_post, __of_update_property
> and __of_update_property post.

We actually already have some code in this direction, but it uses _sysfs
as the suffix instead of _post. I've got a modified version of this
patch in my tree now that eliminates some of the duplication in this
patch and uses the _sysfs name. I'm going to play around with it a bit
before sending it to you.

The locking is also a mess. of_mutex needs to be held I think whenever
changes are being made. In the version I have, I've pulled in the
of_mutex cleanups from patch 5 and also put in a few of my own.

Comments below...

> 
> So each of the tree modification methods is following the same
> pattern, i.e. for method foo we have:
> 
> Firing of the notifer, lock, __foo, unlock, __foo_post
> 
> This breakdown is required when we introduce transaction.
> 
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> ---
>  drivers/of/base.c       | 60 +++++++++++++++++++++++++++++++++++--------------
>  drivers/of/dynamic.c    | 14 ++++++++++--
>  drivers/of/of_private.h |  8 +++++++
>  3 files changed, 63 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 0d50318..b52fd6b 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -127,13 +127,24 @@ static const char *safe_name(struct kobject *kobj, const char *orig_name)
>  	return name;
>  }
>  
> -static int __of_add_property_sysfs(struct device_node *np, struct property *pp)
> +static int __of_add_property_sysfs(struct device_node *np, struct property *pp,
> +		int ignore_dup_name)
>  {
>  	int rc;
>  
>  	/* Important: Don't leak passwords */
>  	bool secure = strncmp(pp->name, "security-", 9) == 0;
>  
> +	/* ignore duplicate name (transaction case) */
> +	if (ignore_dup_name) {
> +		struct kernfs_node *kn = sysfs_get_dirent(np->kobj.sd,
> +				pp->name);
> +		if (kn) {
> +			sysfs_put(kn);
> +			return 0;
> +		}
> +	}
> +

What is this? There is no mention of it in the commit text, and the comment
is far from sufficient. Under what conditions would this be valid? I'm
particularly concerned because this changes behaviour and the new
behaviour is used in the next hunk, so clearly it's not
transaction-only?

I've dropped this hunk from the version I have in my tree.

>  	sysfs_bin_attr_init(&pp->attr);
>  	pp->attr.attr.name = safe_name(&np->kobj, pp->name);
>  	pp->attr.attr.mode = secure ? S_IRUSR : S_IRUGO;
> @@ -167,7 +178,7 @@ static int __of_node_add(struct device_node *np)
>  		return rc;
>  
>  	for_each_property_of_node(np, pp)
> -		__of_add_property_sysfs(np, pp);
> +		__of_add_property_sysfs(np, pp, 1);
>  
>  	return 0;
>  }
> @@ -1677,6 +1688,13 @@ int __of_add_property(struct device_node *np, struct property *prop)
>  	return 0;
>  }
>  
> +void __of_add_property_post(struct device_node *np, struct property *prop,
> +		int ignore_dup_name)
> +{
> +	if (of_node_is_attached(np))
> +		__of_add_property_sysfs(np, prop, ignore_dup_name);
> +}
> +

of_node_is_attached() call could just be rolled into
__of_add_property_sysfs(). There aren't any other users, and the test is
alwasy valid for these functions.

>  /**
>   * of_add_property - Add a property to a node
>   */
> @@ -1695,8 +1713,7 @@ int of_add_property(struct device_node *np, struct property *prop)
>  	if (rc)
>  		return rc;
>  
> -	if (of_node_is_attached(np))
> -		__of_add_property_sysfs(np, prop);
> +	__of_add_property_post(np, prop, 0);
>  
>  	return rc;
>  }
> @@ -1720,6 +1737,13 @@ int __of_remove_property(struct device_node *np, struct property *prop)
>  	return 0;
>  }
>  
> +void __of_remove_property_post(struct device_node *np, struct property *prop)
> +{
> +	/* at early boot, bail here and defer setup to of_init() */
> +	if (of_kset)
> +		sysfs_remove_bin_file(&np->kobj, &prop->attr);
> +}
> +
>  /**
>   * of_remove_property - Remove a property from a node.
>   *
> @@ -1744,11 +1768,7 @@ int of_remove_property(struct device_node *np, struct property *prop)
>  	if (rc)
>  		return rc;
>  
> -	/* at early boot, bail hear and defer setup to of_init() */
> -	if (!of_kset)
> -		return 0;
> -
> -	sysfs_remove_bin_file(&np->kobj, &prop->attr);
> +	__of_remove_property_post(np, prop);
>  
>  	return 0;
>  }
> @@ -1779,6 +1799,19 @@ int __of_update_property(struct device_node *np, struct property *newprop,
>  	return 0;
>  }
>  
> +void __of_update_property_post(struct device_node *np, struct property *newprop,
> +		struct property *oldprop)
> +{
> +	/* At early boot, bail out and defer setup to of_init() */
> +	if (!of_kset)
> +		return;
> +
> +	/* Update the sysfs attribute */
> +	if (oldprop)
> +		sysfs_remove_bin_file(&np->kobj, &oldprop->attr);
> +	__of_add_property_sysfs(np, newprop, 0);
> +}
> +
>  /*
>   * of_update_property - Update a property in a node, if the property does
>   * not exist, add it.
> @@ -1807,14 +1840,7 @@ int of_update_property(struct device_node *np, struct property *prop)
>  	if (rc)
>  		return rc;
>  
> -	/* At early boot, bail out and defer setup to of_init() */
> -	if (!of_kset)
> -		return 0;
> -
> -	/* Update the sysfs attribute */
> -	if (oldprop)
> -		sysfs_remove_bin_file(&np->kobj, &oldprop->attr);
> -	__of_add_property_sysfs(np, prop);
> +	__of_update_property_post(np, prop, oldprop);
>  
>  	return 0;
>  }
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index 90c09b6..a995de3 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -104,6 +104,11 @@ void __of_attach_node(struct device_node *np)
>  	of_node_clear_flag(np, OF_DETACHED);
>  }
>  
> +void __of_attach_node_post(struct device_node *np)
> +{
> +	of_node_add(np);
> +}

There is only one user of of_node_add(), so this is kind of silly. I've
actually removed of_node_add() entirely now and have renamed
__of_node_add to __of_attach_node_sysfs()

> +
>  /**
>   * of_attach_node - Plug a device node into the tree and global list.
>   */
> @@ -120,7 +125,7 @@ int of_attach_node(struct device_node *np)
>  	__of_attach_node(np);
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  
> -	of_node_add(np);
> +	__of_attach_node_post(np);
>  	return 0;
>  }
>  
> @@ -160,6 +165,11 @@ void __of_detach_node(struct device_node *np)
>  	of_node_set_flag(np, OF_DETACHED);
>  }
>  
> +void __of_detach_node_post(struct device_node *np)
> +{
> +	of_node_remove(np);
> +}

Also silly.

> +
>  /**
>   * of_detach_node - "Unplug" a node from the device tree.
>   *
> @@ -179,7 +189,7 @@ int of_detach_node(struct device_node *np)
>  	__of_detach_node(np);
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  
> -	of_node_remove(np);
> +	__of_detach_node_post(np);
>  	return rc;
>  }
>  
> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> index e544247..ca95100 100644
> --- a/drivers/of/of_private.h
> +++ b/drivers/of/of_private.h
> @@ -60,12 +60,20 @@ static inline int of_reconfig_notify(unsigned long action, void *p)
>  #endif /* CONFIG_OF_DYNAMIC */
>  
>  extern int __of_add_property(struct device_node *np, struct property *prop);
> +extern void __of_add_property_post(struct device_node *np,
> +		struct property *prop, int ignore_dup_name);
>  extern int __of_remove_property(struct device_node *np, struct property *prop);
> +extern void __of_remove_property_post(struct device_node *np,
> +		struct property *prop);
>  extern int __of_update_property(struct device_node *np,
>  		struct property *newprop, struct property **oldprop);
> +extern void __of_update_property_post(struct device_node *np,
> +		struct property *newprop, struct property *oldprop);
>  
>  extern void __of_attach_node(struct device_node *np);
> +extern void __of_attach_node_post(struct device_node *np);
>  extern void __of_detach_node(struct device_node *np);
> +extern void __of_detach_node_post(struct device_node *np);
>  
>  /**
>   * General utilities for working with live trees.
> -- 
> 1.7.12
> 
