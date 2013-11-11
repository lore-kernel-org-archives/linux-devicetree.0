From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 4/5] OF: Export all DT proc update functions
Date: Mon, 11 Nov 2013 16:09:09 +0000
Message-ID: <20131111160909.840EAC42311@trevor.secretlab.ca>
References: <1383673816-29293-1-git-send-email-panto@antoniou-consulting.com> <1383673816-29293-5-git-send-email-panto@antoniou-consulting.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383673816-29293-5-git-send-email-panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue,  5 Nov 2013 19:50:15 +0200, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
> There are other users for the proc DT functions.
> Export them.
> 
> Signed-off-by: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>

These are all very much internal DT APIs. There is no way that anything
outside of drivers/of should ever be calling them. (In fact, I want to
be rid of the /proc/devicetree implementation entirely and put it into
sysfs, but that is a separate patch set). If they need to be broken out
into a header file, can they be put into something like
drivers/of/of_private.h?

g.

> ---
>  drivers/of/base.c  | 70 ++++++++++++++++++++++++++++++------------------------
>  include/linux/of.h | 29 ++++++++++++++++++++++
>  2 files changed, 68 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 0ffc5a9..c3c5391 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1435,6 +1435,40 @@ int of_property_notify(int action, struct device_node *np,
>  }
>  #endif
>  
> +#ifdef CONFIG_PROC_DEVICETREE
> +
> +void of_add_proc_dt_entry(struct device_node *dn)
> +{
> +	struct proc_dir_entry *ent;
> +
> +	ent = proc_mkdir(strrchr(dn->full_name, '/') + 1, dn->parent->pde);
> +	if (ent)
> +		proc_device_tree_add_node(dn, ent);
> +}
> +
> +void of_add_proc_dt_prop_entry(struct device_node *np,
> +		struct property *prop)
> +{
> +	if (np && prop && np->pde)
> +		proc_device_tree_add_prop(np->pde, prop);
> +}
> +
> +void of_remove_proc_dt_prop_entry(struct device_node *np,
> +		struct property *prop)
> +{
> +	if (np && prop && np->pde)
> +		proc_device_tree_remove_prop(np->pde, prop);
> +}
> +
> +void of_update_proc_dt_prop_entry(struct device_node *np,
> +		struct property *newprop, struct property *oldprop)
> +{
> +	if (np && newprop && oldprop && np->pde)
> +		proc_device_tree_update_prop(np->pde, newprop, oldprop);
> +}
> +
> +#endif /* CONFIG_PROC_DEVICETREE */
> +
>  /**
>   * of_add_property - Add a property to a node
>   */
> @@ -1462,11 +1496,8 @@ int of_add_property(struct device_node *np, struct property *prop)
>  	*next = prop;
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  
> -#ifdef CONFIG_PROC_DEVICETREE
>  	/* try to add to proc as well if it was initialized */
> -	if (np->pde)
> -		proc_device_tree_add_prop(np->pde, prop);
> -#endif /* CONFIG_PROC_DEVICETREE */
> +	of_add_proc_dt_prop_entry(np, prop);
>  
>  	return 0;
>  }
> @@ -1508,11 +1539,7 @@ int of_remove_property(struct device_node *np, struct property *prop)
>  	if (!found)
>  		return -ENODEV;
>  
> -#ifdef CONFIG_PROC_DEVICETREE
> -	/* try to remove the proc node as well */
> -	if (np->pde)
> -		proc_device_tree_remove_prop(np->pde, prop);
> -#endif /* CONFIG_PROC_DEVICETREE */
> +	of_remove_proc_dt_prop_entry(np, prop);
>  
>  	return 0;
>  }
> @@ -1562,11 +1589,8 @@ int of_update_property(struct device_node *np, struct property *newprop)
>  	if (!found)
>  		return -ENODEV;
>  
> -#ifdef CONFIG_PROC_DEVICETREE
>  	/* try to add to proc as well if it was initialized */
> -	if (np->pde)
> -		proc_device_tree_update_prop(np->pde, newprop, oldprop);
> -#endif /* CONFIG_PROC_DEVICETREE */
> +	of_update_proc_dt_prop_entry(np, newprop, oldprop);
>  
>  	return 0;
>  }
> @@ -1602,22 +1626,6 @@ int of_reconfig_notify(unsigned long action, void *p)
>  	return notifier_to_errno(rc);
>  }
>  
> -#ifdef CONFIG_PROC_DEVICETREE
> -static void of_add_proc_dt_entry(struct device_node *dn)
> -{
> -	struct proc_dir_entry *ent;
> -
> -	ent = proc_mkdir(strrchr(dn->full_name, '/') + 1, dn->parent->pde);
> -	if (ent)
> -		proc_device_tree_add_node(dn, ent);
> -}
> -#else
> -static void of_add_proc_dt_entry(struct device_node *dn)
> -{
> -	return;
> -}
> -#endif
> -
>  /**
>   * of_attach_node - Plug a device node into the tree and global list.
>   */
> @@ -1643,12 +1651,12 @@ int of_attach_node(struct device_node *np)
>  }
>  
>  #ifdef CONFIG_PROC_DEVICETREE
> -static void of_remove_proc_dt_entry(struct device_node *dn)
> +void of_remove_proc_dt_entry(struct device_node *dn)
>  {
>  	proc_remove(dn->pde);
>  }
>  #else
> -static void of_remove_proc_dt_entry(struct device_node *dn)
> +void of_remove_proc_dt_entry(struct device_node *dn)
>  {
>  	return;
>  }
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 6fec255..a56c450 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -318,6 +318,35 @@ static inline int of_property_notify(int action, struct device_node *np,
>  }
>  #endif
>  
> +#ifdef CONFIG_PROC_DEVICETREE
> +
> +extern void of_add_proc_dt_entry(struct device_node *dn);
> +extern void of_remove_proc_dt_entry(struct device_node *dn);
> +
> +extern void of_add_proc_dt_prop_entry(struct device_node *np,
> +		struct property *prop);
> +
> +extern void of_remove_proc_dt_prop_entry(struct device_node *np,
> +		struct property *prop);
> +
> +extern void of_update_proc_dt_prop_entry(struct device_node *np,
> +		struct property *newprop, struct property *oldprop);
> +#else
> +
> +static inline void of_add_proc_dt_entry(struct device_node *dn) { }
> +static inline void of_remove_proc_dt_entry(struct device_node *dn) { }
> +
> +static inline void of_add_proc_dt_prop_entry(struct device_node *np,
> +		struct property *prop) { }
> +
> +static inline void of_remove_proc_dt_prop_entry(struct device_node *np,
> +		struct property *prop) { }
> +
> +static inline void of_update_proc_dt_prop_entry(struct device_node *np,
> +		struct property *newprop, struct property *oldprop) { }
> +
> +#endif
> +
>  extern void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align));
>  extern int of_alias_get_id(struct device_node *np, const char *stem);
>  
> -- 
> 1.7.12
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
