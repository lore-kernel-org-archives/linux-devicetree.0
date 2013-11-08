From: Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>
Subject: Re: [PATCH v3 5/5] OF: Introduce utility helper functions
Date: Fri, 08 Nov 2013 10:08:04 +0100
Message-ID: <527CA9F4.9080003@nsn.com>
References: <1383855454-15191-1-git-send-email-panto@antoniou-consulting.com> <1383855454-15191-6-git-send-email-panto@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383855454-15191-6-git-send-email-panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ext Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Pantelis,

On 07/11/13 21:17, ext Pantelis Antoniou wrote:
> Introduce helper functions for working with the live DT tree.
> 
> __of_free_property() frees a dynamically created property
> __of_free_tree() recursively frees a device node tree
> __of_copy_property() copies a property dynamically
> __of_create_empty_node() creates an empty node
> __of_find_node_by_full_name() finds the node with the full name
> and
> of_multi_prop_cmp() performs a multi property compare but without
> having to take locks.
> 
> Signed-off-by: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
> ---
>  drivers/of/Makefile |   2 +-
>  drivers/of/util.c   | 253 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of.h  |  59 ++++++++++++
>  3 files changed, 313 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/of/util.c
> 

...

> +struct property *__of_copy_property(const struct property *prop, gfp_t flags)
> +{
> +	struct property *propn;
> +
> +	propn = kzalloc(sizeof(*prop), flags);
> +	if (propn == NULL)
> +		return NULL;
> +
> +	propn->name = kstrdup(prop->name, flags);
> +	if (propn->name == NULL)
> +		goto err_fail_name;
> +
> +	if (prop->length > 0) {
        ^^^^^^^^^^^^^^^^^^^^^^^
As Ioan already mentioned, this is really a problem.
There is a bunch of places, where properties without values are used.
Like gpio-controller; ranges; interrupt-controller;
Refer, for example, to of_irq_map_raw() which checks
of_get_property(ipar, "interrupt-controller", NULL) != NULL
and some other occurrences of exactly same construct.
This will simply be broken for merged device-tree parts.

> +		propn->value = kmalloc(prop->length, flags);
> +		if (propn->value == NULL)
> +			goto err_fail_value;
> +		memcpy(propn->value, prop->value, prop->length);
> +		propn->length = prop->length;
> +	}
> +
> +	/* mark the property as dynamic */
> +	of_property_set_flag(propn, OF_DYNAMIC);
> +
> +	return propn;
> +
> +err_fail_value:
> +	kfree(propn->name);
> +err_fail_name:
> +	kfree(propn);
> +	return NULL;
> +}
> +

...

-- 
Best regards,
Alexander Sverdlin.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
