From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 4/5] of: Add old prop argument on
 OF_RECONFIG_UPDATE_PROPERTY
Date: Wed, 05 Nov 2014 20:01:29 +0000
Message-ID: <20141105200129.B4438C41C40@trevor.secretlab.ca>
References: <1414528433-9650-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1414528433-9650-5-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414528433-9650-5-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pete Popov <pete.popov-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Dan Malek <dan.malek-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Georgi Vlaev <georgi.vlaev-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis
List-Id: devicetree@vger.kernel.org

On Tue, 28 Oct 2014 22:33:52 +0200
, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
 wrote:
> The notifier now includes the old_prop argument when updating
> properties, propagate this API to changeset internals while
> also retaining the old behaviour of retrieving the old_property
> when NULL is passed.
> 
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

I'm still fuzzy on the need for this patch. Is this just an optimization
so that the property doesn't get looked up twice? Or is there a reason
when the oldprop really needs to be passed in explicitly?

g.

> ---
>  drivers/of/dynamic.c  | 18 ++++++++++++++----
>  drivers/of/selftest.c |  2 +-
>  include/linux/of.h    | 20 +++++++++++++-------
>  3 files changed, 28 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index 8e8b614..9eb8528 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -627,6 +627,7 @@ int of_changeset_revert(struct of_changeset *ocs)
>   * @action:	action to perform
>   * @np:		Pointer to device node
>   * @prop:	Pointer to property
> + * @old_prop:	Pointer to old property (if updating)
>   *
>   * On action being one of:
>   * + OF_RECONFIG_ATTACH_NODE
> @@ -637,10 +638,21 @@ int of_changeset_revert(struct of_changeset *ocs)
>   * Returns 0 on success, a negative error value in case of an error.
>   */
>  int of_changeset_action(struct of_changeset *ocs, unsigned long action,
> -		struct device_node *np, struct property *prop)
> +		struct device_node *np, struct property *prop,
> +		struct property *oldprop)
>  {
>  	struct of_changeset_entry *ce;
>  
> +	/* in case someone passed NULL as old_prop, find it */
> +	if (action == OF_RECONFIG_UPDATE_PROPERTY && prop && !oldprop) {
> +		oldprop = of_find_property(np, prop->name, NULL);
> +		if (!oldprop) {
> +			pr_err("%s: Failed to find old_prop for \"%s/%s\"\n",
> +					__func__, np->full_name, prop->name);
> +			return -EINVAL;
> +		}
> +	}
> +
>  	ce = kzalloc(sizeof(*ce), GFP_KERNEL);
>  	if (!ce) {
>  		pr_err("%s: Failed to allocate\n", __func__);
> @@ -650,9 +662,7 @@ int of_changeset_action(struct of_changeset *ocs, unsigned long action,
>  	ce->action = action;
>  	ce->np = of_node_get(np);
>  	ce->prop = prop;
> -
> -	if (action == OF_RECONFIG_UPDATE_PROPERTY && prop)
> -		ce->old_prop = of_find_property(np, prop->name, NULL);
> +	ce->old_prop = oldprop;
>  
>  	/* add it to the list */
>  	list_add_tail(&ce->node, &ocs->entries);
> diff --git a/drivers/of/selftest.c b/drivers/of/selftest.c
> index 7800127..16102fd 100644
> --- a/drivers/of/selftest.c
> +++ b/drivers/of/selftest.c
> @@ -427,7 +427,7 @@ static void __init of_selftest_changeset(void)
>  	selftest(!of_changeset_detach_node(&chgset, nremove), "fail remove node\n");
>  	selftest(!of_changeset_attach_node(&chgset, n21), "fail attach n21\n");
>  	selftest(!of_changeset_add_property(&chgset, parent, ppadd), "fail add prop\n");
> -	selftest(!of_changeset_update_property(&chgset, parent, ppupdate), "fail update prop\n");
> +	selftest(!of_changeset_update_property(&chgset, parent, ppupdate, NULL), "fail update prop\n");
>  	selftest(!of_changeset_remove_property(&chgset, parent, ppremove), "fail remove prop\n");
>  	mutex_lock(&of_mutex);
>  	selftest(!of_changeset_apply(&chgset), "apply failed\n");
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 6545e7a..71d25aa 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -830,36 +830,42 @@ extern int of_changeset_apply(struct of_changeset *ocs);
>  extern int of_changeset_revert(struct of_changeset *ocs);
>  extern int of_changeset_action(struct of_changeset *ocs,
>  		unsigned long action, struct device_node *np,
> -		struct property *prop);
> +		struct property *prop, struct property *old_prop);
>  
>  static inline int of_changeset_attach_node(struct of_changeset *ocs,
>  		struct device_node *np)
>  {
> -	return of_changeset_action(ocs, OF_RECONFIG_ATTACH_NODE, np, NULL);
> +	return of_changeset_action(ocs, OF_RECONFIG_ATTACH_NODE, np, NULL,
> +			NULL);
>  }
>  
>  static inline int of_changeset_detach_node(struct of_changeset *ocs,
>  		struct device_node *np)
>  {
> -	return of_changeset_action(ocs, OF_RECONFIG_DETACH_NODE, np, NULL);
> +	return of_changeset_action(ocs, OF_RECONFIG_DETACH_NODE, np, NULL,
> +			NULL);
>  }
>  
>  static inline int of_changeset_add_property(struct of_changeset *ocs,
>  		struct device_node *np, struct property *prop)
>  {
> -	return of_changeset_action(ocs, OF_RECONFIG_ADD_PROPERTY, np, prop);
> +	return of_changeset_action(ocs, OF_RECONFIG_ADD_PROPERTY, np, prop,
> +			NULL);
>  }
>  
>  static inline int of_changeset_remove_property(struct of_changeset *ocs,
>  		struct device_node *np, struct property *prop)
>  {
> -	return of_changeset_action(ocs, OF_RECONFIG_REMOVE_PROPERTY, np, prop);
> +	return of_changeset_action(ocs, OF_RECONFIG_REMOVE_PROPERTY, np, prop,
> +			NULL);
>  }
>  
>  static inline int of_changeset_update_property(struct of_changeset *ocs,
> -		struct device_node *np, struct property *prop)
> +		struct device_node *np, struct property *prop,
> +		struct property *old_prop)
>  {
> -	return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
> +	return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop,
> +			old_prop);
>  }
>  #endif
>  
> -- 
> 1.7.12
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
