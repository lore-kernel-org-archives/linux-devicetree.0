From: Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>
Subject: Re: [PATCH 1/3] of: Fix early OF builtup on kobj-ification
Date: Wed, 11 Dec 2013 08:06:42 +0100
Message-ID: <C3A30FEB-11CB-4CEA-8CB3-B1CA53A87C61@dominion.thruhere.net>
References: <1386684833-24112-1-git-send-email-panto@antoniou-consulting.com> <1386684833-24112-2-git-send-email-panto@antoniou-consulting.com>
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386684833-24112-2-git-send-email-panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Device Tree Mailing List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org List" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Op 10 dec. 2013, om 15:13 heeft Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> het volgende geschreven:

> When booting platforms that do very early OF initialization before
> core_initcalls are performed of_init is called too late.
> 
> This results in a hard-hard without getting a chance to output anything.

I think that should be 'hard-hang'.

regards,

Koen

> 
> Fixed by adding a flag that marks when init has been done, and
> performing the per-node init at that time.
> 
> Signed-off-by: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
> ---
> drivers/of/base.c | 28 +++++++++++++++++++++++-----
> 1 file changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 734689b..a4f3dda 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -98,7 +98,7 @@ int __weak of_node_to_nid(struct device_node *np)
>  */
> struct device_node *of_node_get(struct device_node *node)
> {
> -	if (node)
> +	if (node && of_kset)
> 		kobject_get(&node->kobj);
> 	return node;
> }
> @@ -156,7 +156,7 @@ static void of_node_release(struct kobject *kobj)
>  */
> void of_node_put(struct device_node *node)
> {
> -	if (node)
> +	if (node && of_kset)
> 		kobject_put(&node->kobj);
> }
> EXPORT_SYMBOL(of_node_put);
> @@ -202,9 +202,16 @@ static const char *safe_name(struct kobject *kobj, const char *orig_name)
> static int __of_add_property(struct device_node *np, struct property *pp)
> {
> 	int rc;
> +	bool secure;
> +
> +	/* note that we don't take a lock here */
> +
> +	/* fake the return while of_init is not yet called */
> +	if (!of_kset)
> +		return 0;
> 
> 	/* Important: Don't leak passwords */
> -	bool secure = strncmp(pp->name, "security-", 9) == 0;
> +	secure = strncmp(pp->name, "security-", 9) == 0;
> 
> 	pp->attr.attr.name = safe_name(&np->kobj, pp->name);
> 	pp->attr.attr.mode = secure ? S_IRUSR : S_IRUGO;
> @@ -222,6 +229,12 @@ static int __of_node_add(struct device_node *np)
> 	struct property *pp;
> 	int rc;
> 
> +	/* note that we don't take a lock here */
> +
> +	/* fake the return while of_init is not yet called */
> +	if (!of_kset)
> +		return 0;
> +
> 	np->kobj.kset = of_kset;
> 	if (!np->parent) {
> 		/* Nodes without parents are new top level trees */
> @@ -245,11 +258,14 @@ static int __of_node_add(struct device_node *np)
> int of_node_add(struct device_node *np)
> {
> 	int rc = 0;
> -	kobject_init(&np->kobj, &of_node_ktype);
> +
> +	/* fake the return while of_init is not yet called */
> 	mutex_lock(&of_aliases_mutex);
> +	kobject_init(&np->kobj, &of_node_ktype);
> 	if (of_kset)
> 		rc = __of_node_add(np);
> 	mutex_unlock(&of_aliases_mutex);
> +
> 	return rc;
> }
> 
> @@ -275,14 +291,16 @@ static int __init of_init(void)
> 
> 	/* Make sure all nodes added before this time get added to sysfs */
> 	mutex_lock(&of_aliases_mutex);
> +
> 	for_each_of_allnodes(np)
> 		__of_node_add(np);
> -	mutex_unlock(&of_aliases_mutex);
> 
> 	/* Symlink in /proc as required by userspace ABI */
> 	if (of_allnodes)
> 		proc_symlink("device-tree", NULL, "/sys/firmware/devicetree/base");
> 
> +	mutex_unlock(&of_aliases_mutex);
> +
> 	return 0;
> }
> core_initcall(of_init);
> -- 
> 1.7.12
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
