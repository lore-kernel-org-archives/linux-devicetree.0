From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] OF: Add [__]of_find_node_by_full_name
Date: Fri, 21 Mar 2014 12:00:20 +0000
Message-ID: <20140321120020.7D4FBC4052A@trevor.secretlab.ca>
References: <1395179560-31384-1-git-send-email-pantelis.antoniou@konsulko. com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395179560-31384-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pete Popov <pete.popov-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Dan Malek <dan.malek-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Georgi Vlaev <georgi.vlaev-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 18 Mar 2014 23:52:40 +0200, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> __of_find_node_by_full_name recursively searches for a matching node
> with the given full name without taking any locks.
> 
> of_find_node_by_full_name takes locks and takes a reference on the
> matching node.
> 
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

You should be able to use the of_find_node_by_path() patch as a base for
this one. You should be able to split of_find_node_by_path() so that the
core search going into this new function.

g.

> ---
>  drivers/of/base.c  | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of.h |  4 ++++
>  2 files changed, 62 insertions(+)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 19bcdb4..08156e6 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1142,6 +1142,64 @@ static void *of_find_property_value_of_size(const struct device_node *np,
>  }
>  
>  /**
> + * __of_find_node_by_full_name - Find a node with the full name recursively
> + * @node:	Root of the tree to perform the search
> + * @full_name:	Full name of the node to find.
> + *
> + * Find a node with the give full name by recursively following any of
> + * the child node links.
> + * Returns the matching node, or NULL if not found.
> + * Note that the devtree lock is not taken, so this function is only
> + * safe to call on either detached trees, or when devtree lock is already
> + * taken.
> + */
> +struct device_node *__of_find_node_by_full_name(struct device_node *node,
> +		const char *full_name)
> +{
> +	struct device_node *child, *found;
> +
> +	if (node == NULL)
> +		return NULL;
> +
> +	/* check */
> +	if (of_node_cmp(node->full_name, full_name) == 0)
> +		return node;
> +
> +	__for_each_child_of_node(node, child) {
> +		found = __of_find_node_by_full_name(child, full_name);
> +		if (found != NULL)
> +			return found;
> +	}
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL(__of_find_node_by_full_name);
> +
> +/**
> + * of_find_node_by_full_name - Find a node with the full name recursively
> + * @node:	Root of the tree to perform the search
> + * @full_name:	Full name of the node to find.
> + *
> + * Find a node with the give full name by recursively following any of
> + * the child node links.
> + * Returns the matching node (with a ref taken), or NULL if not found.
> + */
> +struct device_node *of_find_node_by_full_name(struct device_node *node,
> +		const char *full_name)
> +{
> +	unsigned long flags;
> +	struct device_node *np;
> +
> +	raw_spin_lock_irqsave(&devtree_lock, flags);
> +	np = of_find_node_by_full_name(node, full_name);
> +	of_node_get(np);
> +	raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +
> +	return np;
> +}
> +EXPORT_SYMBOL(of_find_node_by_full_name);
> +
> +/**
>   * of_property_read_u32_index - Find and read a u32 from a multi-value property.
>   *
>   * @np:		device node from which the property value is to be read.
> diff --git a/include/linux/of.h b/include/linux/of.h
> index a8b9dad..bef3d5b 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -223,6 +223,10 @@ extern struct device_node *of_find_matching_node_and_match(
>  
>  extern struct device_node *of_find_node_by_path(const char *path);
>  extern struct device_node *of_find_node_by_phandle(phandle handle);
> +struct device_node *__of_find_node_by_full_name(struct device_node *node,
> +						const char *full_name);
> +struct device_node *of_find_node_by_full_name(struct device_node *node,
> +						const char *full_name);
>  extern struct device_node *of_get_parent(const struct device_node *node);
>  extern struct device_node *of_get_next_parent(struct device_node *node);
>  extern struct device_node *of_get_next_child(const struct device_node *node,
> -- 
> 1.7.12
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
