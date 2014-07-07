Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 2/5] OF: Export a number of __of_* methods
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
In-Reply-To: <20140707131134.825FBC409D5@trevor.secretlab.ca>
Date: Mon, 7 Jul 2014 16:17:58 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <243A6BBE-DD88-4651-80B2-5686BF6794BD@konsulko.com>
References: <1404493129-8914-1-git-send-email-pantelis.antoniou@konsulko.com> <1404493129-8914-3-git-send-email-pantelis.antoniou@konsulko.com> <20140707131134.825FBC409D5@trevor.secretlab.ca>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi Grant,

On Jul 7, 2014, at 4:11 PM, Grant Likely wrote:

> On Fri,  4 Jul 2014 19:58:46 +0300, Pantelis Antoniou =
<pantelis.antoniou@konsulko.com> wrote:
>> As part of moving to transactional DT, a number of methods are
>> reworked and exported.
>>=20
>> The methods exported are:
>> __of_add_property, __of_remove_property, __of_update_property, =
__of_attach_node,
>> __of_detach_node
>=20
>=20
> ??? The description doesn't match the patch. Nothing is getting
> exported, and the commit message should really say why and how the
> methods are being reworked.
>=20

Err, are they not exported out of their file scope?

static int foo -> int foo?

The _post methods are 'exported' in the same manner.

The explanation is included in the next patch in the series, copying =
verbatim:

> As part of transactional DT support there needs to be a clearer
> definition of how each dynamic tree change method works.
>=20
> Let's take for example the of_add_property method. There are
> discrete steps taken in sequence.
>=20
> 1. The OF_RECONFIG_ADD_PROPERTY notifier will be fired.
> 2. The devtree lock will be taken.
> 3. Insertion of the property in the live tree.
> 4. The devtree lock will be released.
> 5. The property will be inserted in the sysfs tree.
>=20
> For each of the of_attach_node, of_detach_node, of_add_property,
> of_remove_property and of_update_property methods we export (and
> introduce if not available), their counterparts of
> __of_attach_node, __of_attach_node_post, __of_detach_node,
> __of_detach_node_post, __of_add_property, __of_add_property_post,
> __of_remove_property, __of_remove_property_post, __of_update_property
> and __of_update_property post.
>=20
> So each of the tree modification methods is following the same
> pattern, i.e. for method foo we have:
>=20
> Firing of the notifer, lock, __foo, unlock, __foo_post
>=20
> This breakdown is required when we introduce transaction.

Regards

-- Pantelis

> g.
>=20
>>=20
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>> ---
>> drivers/of/base.c       | 97 =
+++++++++++++++++++++++++++++--------------------
>> drivers/of/dynamic.c    | 71 +++++++++++++++++++-----------------
>> drivers/of/of_private.h |  8 ++++
>> 3 files changed, 102 insertions(+), 74 deletions(-)
>>=20
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index be0ec37..0d50318 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -1659,7 +1659,7 @@ EXPORT_SYMBOL(of_count_phandle_with_args);
>> /**
>>  * __of_add_property - Add a property to a node without lock =
operations
>>  */
>> -static int __of_add_property(struct device_node *np, struct property =
*prop)
>> +int __of_add_property(struct device_node *np, struct property *prop)
>> {
>> 	struct property **next;
>>=20
>> @@ -1701,6 +1701,25 @@ int of_add_property(struct device_node *np, =
struct property *prop)
>> 	return rc;
>> }
>>=20
>> +int __of_remove_property(struct device_node *np, struct property =
*prop)
>> +{
>> +	struct property **next;
>> +
>> +	for (next =3D &np->properties; *next; next =3D &(*next)->next) {
>> +		if (*next =3D=3D prop)
>> +			break;
>> +	}
>> +	if (*next =3D=3D NULL)
>> +		return -ENODEV;
>> +
>> +	/* found the node */
>> +	*next =3D prop->next;
>> +	prop->next =3D np->deadprops;
>> +	np->deadprops =3D prop;
>> +
>> +	return 0;
>> +}
>> +
>> /**
>>  * of_remove_property - Remove a property from a node.
>>  *
>> @@ -1711,9 +1730,7 @@ int of_add_property(struct device_node *np, =
struct property *prop)
>>  */
>> int of_remove_property(struct device_node *np, struct property *prop)
>> {
>> -	struct property **next;
>> 	unsigned long flags;
>> -	int found =3D 0;
>> 	int rc;
>>=20
>> 	rc =3D of_property_notify(OF_RECONFIG_REMOVE_PROPERTY, np, =
prop);
>> @@ -1721,22 +1738,11 @@ int of_remove_property(struct device_node =
*np, struct property *prop)
>> 		return rc;
>>=20
>> 	raw_spin_lock_irqsave(&devtree_lock, flags);
>> -	next =3D &np->properties;
>> -	while (*next) {
>> -		if (*next =3D=3D prop) {
>> -			/* found the node */
>> -			*next =3D prop->next;
>> -			prop->next =3D np->deadprops;
>> -			np->deadprops =3D prop;
>> -			found =3D 1;
>> -			break;
>> -		}
>> -		next =3D &(*next)->next;
>> -	}
>> +	rc =3D __of_remove_property(np, prop);
>> 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>>=20
>> -	if (!found)
>> -		return -ENODEV;
>> +	if (rc)
>> +		return rc;
>>=20
>> 	/* at early boot, bail hear and defer setup to of_init() */
>> 	if (!of_kset)
>> @@ -1747,6 +1753,32 @@ int of_remove_property(struct device_node *np, =
struct property *prop)
>> 	return 0;
>> }
>>=20
>> +int __of_update_property(struct device_node *np, struct property =
*newprop,
>> +		struct property **oldpropp)
>> +{
>> +	struct property **next, *oldprop;
>> +
>> +	for (next =3D &np->properties; *next; next =3D &(*next)->next) {
>> +		if (of_prop_cmp((*next)->name, newprop->name) =3D=3D 0)
>> +			break;
>> +	}
>> +	*oldpropp =3D oldprop =3D *next;
>> +
>> +	if (oldprop) {
>> +		/* replace the node */
>> +		newprop->next =3D oldprop->next;
>> +		*next =3D newprop;
>> +		oldprop->next =3D np->deadprops;
>> +		np->deadprops =3D oldprop;
>> +	} else {
>> +		/* new node */
>> +		newprop->next =3D NULL;
>> +		*next =3D newprop;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> /*
>>  * of_update_property - Update a property in a node, if the property =
does
>>  * not exist, add it.
>> @@ -1756,36 +1788,21 @@ int of_remove_property(struct device_node =
*np, struct property *prop)
>>  * Instead we just move the property to the "dead properties" list,
>>  * and add the new property to the property list
>>  */
>> -int of_update_property(struct device_node *np, struct property =
*newprop)
>> +int of_update_property(struct device_node *np, struct property =
*prop)
>> {
>> -	struct property **next, *oldprop;
>> +	struct property *oldprop;
>> 	unsigned long flags;
>> 	int rc;
>>=20
>> -	rc =3D of_property_notify(OF_RECONFIG_UPDATE_PROPERTY, np, =
newprop);
>> +	if (!prop->name)
>> +		return -EINVAL;
>> +
>> +	rc =3D of_property_notify(OF_RECONFIG_UPDATE_PROPERTY, np, =
prop);
>> 	if (rc)
>> 		return rc;
>>=20
>> -	if (!newprop->name)
>> -		return -EINVAL;
>> -
>> 	raw_spin_lock_irqsave(&devtree_lock, flags);
>> -	next =3D &np->properties;
>> -	oldprop =3D __of_find_property(np, newprop->name, NULL);
>> -	if (!oldprop) {
>> -		/* add the new node */
>> -		rc =3D __of_add_property(np, newprop);
>> -	} else while (*next) {
>> -		/* replace the node */
>> -		if (*next =3D=3D oldprop) {
>> -			newprop->next =3D oldprop->next;
>> -			*next =3D newprop;
>> -			oldprop->next =3D np->deadprops;
>> -			np->deadprops =3D oldprop;
>> -			break;
>> -		}
>> -		next =3D &(*next)->next;
>> -	}
>> +	rc =3D __of_update_property(np, prop, &oldprop);
>> 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>> 	if (rc)
>> 		return rc;
>> @@ -1797,7 +1814,7 @@ int of_update_property(struct device_node *np, =
struct property *newprop)
>> 	/* Update the sysfs attribute */
>> 	if (oldprop)
>> 		sysfs_remove_bin_file(&np->kobj, &oldprop->attr);
>> -	__of_add_property_sysfs(np, newprop);
>> +	__of_add_property_sysfs(np, prop);
>>=20
>> 	return 0;
>> }
>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>> index 0e8457c..eb1126f 100644
>> --- a/drivers/of/dynamic.c
>> +++ b/drivers/of/dynamic.c
>> @@ -95,8 +95,17 @@ int of_property_notify(int action, struct =
device_node *np,
>> 	return of_reconfig_notify(action, &pr);
>> }
>>=20
>> +void __of_attach_node(struct device_node *np)
>> +{
>> +	np->sibling =3D np->parent->child;
>> +	np->allnext =3D np->parent->allnext;
>> +	np->parent->allnext =3D np;
>> +	np->parent->child =3D np;
>> +	of_node_clear_flag(np, OF_DETACHED);
>> +}
>> +
>> /**
>> - * of_attach_node() - Plug a device node into the tree and global =
list.
>> + * of_attach_node - Plug a device node into the tree and global =
list.
>>  */
>> int of_attach_node(struct device_node *np)
>> {
>> @@ -108,52 +117,29 @@ int of_attach_node(struct device_node *np)
>> 		return rc;
>>=20
>> 	raw_spin_lock_irqsave(&devtree_lock, flags);
>> -	np->sibling =3D np->parent->child;
>> -	np->allnext =3D of_allnodes;
>> -	np->parent->child =3D np;
>> -	of_allnodes =3D np;
>> -	of_node_clear_flag(np, OF_DETACHED);
>> +	__of_attach_node(np);
>> 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>>=20
>> 	of_node_add(np);
>> 	return 0;
>> }
>>=20
>> -/**
>> - * of_detach_node() - "Unplug" a node from the device tree.
>> - *
>> - * The caller must hold a reference to the node.  The memory =
associated with
>> - * the node is not freed until its refcount goes to zero.
>> - */
>> -int of_detach_node(struct device_node *np)
>> +void __of_detach_node(struct device_node *np)
>> {
>> 	struct device_node *parent;
>> -	unsigned long flags;
>> -	int rc =3D 0;
>> -
>> -	rc =3D of_reconfig_notify(OF_RECONFIG_DETACH_NODE, np);
>> -	if (rc)
>> -		return rc;
>> +	struct device_node *prev;
>> +	struct device_node *prevsib;
>>=20
>> -	raw_spin_lock_irqsave(&devtree_lock, flags);
>> -
>> -	if (of_node_check_flag(np, OF_DETACHED)) {
>> -		/* someone already detached it */
>> -		raw_spin_unlock_irqrestore(&devtree_lock, flags);
>> -		return rc;
>> -	}
>> +	if (WARN_ON(of_node_check_flag(np, OF_DETACHED)))
>> +		return;
>>=20
>> 	parent =3D np->parent;
>> -	if (!parent) {
>> -		raw_spin_unlock_irqrestore(&devtree_lock, flags);
>> -		return rc;
>> -	}
>> +	if (WARN_ON(!parent))
>> +		return;
>>=20
>> 	if (of_allnodes =3D=3D np)
>> 		of_allnodes =3D np->allnext;
>> 	else {
>> -		struct device_node *prev;
>> -
>> 		for (prev =3D of_allnodes;
>> 		     prev->allnext !=3D np;
>> 		     prev =3D prev->allnext)
>> @@ -164,8 +150,6 @@ int of_detach_node(struct device_node *np)
>> 	if (parent->child =3D=3D np)
>> 		parent->child =3D np->sibling;
>> 	else {
>> -		struct device_node *prevsib;
>> -
>> 		for (prevsib =3D np->parent->child;
>> 		     prevsib->sibling !=3D np;
>> 		     prevsib =3D prevsib->sibling)
>> @@ -174,6 +158,25 @@ int of_detach_node(struct device_node *np)
>> 	}
>>=20
>> 	of_node_set_flag(np, OF_DETACHED);
>> +}
>> +
>> +/**
>> + * of_detach_node - "Unplug" a node from the device tree.
>> + *
>> + * The caller must hold a reference to the node.  The memory =
associated with
>> + * the node is not freed until its refcount goes to zero.
>> + */
>> +int of_detach_node(struct device_node *np)
>> +{
>> +	unsigned long flags;
>> +	int rc =3D 0;
>> +
>> +	rc =3D of_reconfig_notify(OF_RECONFIG_DETACH_NODE, np);
>> +	if (rc)
>> +		return rc;
>> +
>> +	raw_spin_lock_irqsave(&devtree_lock, flags);
>> +	__of_detach_node(np);
>> 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>>=20
>> 	of_node_remove(np);
>> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
>> index a541b81..b2c25b5 100644
>> --- a/drivers/of/of_private.h
>> +++ b/drivers/of/of_private.h
>> @@ -59,4 +59,12 @@ static inline int of_reconfig_notify(unsigned long =
action, void *p)
>> }
>> #endif /* CONFIG_OF_DYNAMIC */
>>=20
>> +extern int __of_add_property(struct device_node *np, struct property =
*prop);
>> +extern int __of_remove_property(struct device_node *np, struct =
property *prop);
>> +extern int __of_update_property(struct device_node *np,
>> +		struct property *newprop, struct property **oldprop);
>> +
>> +extern void __of_attach_node(struct device_node *np);
>> +extern void __of_detach_node(struct device_node *np);
>> +
>> #endif /* _LINUX_OF_PRIVATE_H */
>> --=20
>> 1.7.12
>>=20
>=20
