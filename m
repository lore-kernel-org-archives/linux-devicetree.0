Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 4/6] OF: Export a number of __of_* methods
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
In-Reply-To: <20140624192711.00190C40B7F@trevor.secretlab.ca>
Date: Tue, 24 Jun 2014 22:38:25 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <423B32AE-166F-49EE-BCE8-029116F098FA@konsulko.com>
References: <1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com> <1403430039-15085-5-git-send-email-pantelis.antoniou@konsulko.com> <20140624192711.00190C40B7F@trevor.secretlab.ca>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi Grant,

On Jun 24, 2014, at 10:27 PM, Grant Likely wrote:

> On Sun, 22 Jun 2014 12:40:37 +0300, Pantelis Antoniou =
<pantelis.antoniou@konsulko.com> wrote:
>> As part of moving to transactional DT, a number of methods are
>> reworked and exported.
>>=20
>> The methods exported are:
>=20
> The above is misleasing. The functions aren't exported, but the
> prototypes are put into a header file.
>=20
>> __of_get_next_child, __for_each_child_of_node, __of_add_property,
>> __of_remove_property, __of_update_property, __of_attach_node,
>> __of_detach_node, __of_device_is_compatible, =
__of_device_is_available,
>> __of_get_property.
>>=20
>> __of_update_property has been reworked to be more efficient
>> (double walk of the property list eliminated)
>> of_get_property was reworked to use __of_get_property internally.
>>=20
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>=20
> For the next posting, please include this patch in the same series as
> the patch that uses it. It isn't a bug fix, but rather a reorg =
required
> by the transational patch.
>=20

OK

>> ---
>> drivers/of/base.c  | 192 =
+++++++++++++++++++++++++++++------------------------
>> include/linux/of.h |  34 ++++++++++
>=20
> Please put the prototypes in drivers/of/of_private.h. I don't want any
> code outside drivers/of using these functions.
>=20

OK

>> 2 files changed, 139 insertions(+), 87 deletions(-)
>>=20
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 80fef33..42c735d 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -382,7 +382,7 @@ EXPORT_SYMBOL(of_find_all_nodes);
>>  * Find a property with a given name for a given node
>>  * and return the value.
>>  */
>> -static const void *__of_get_property(const struct device_node *np,
>> +const void *__of_get_property(const struct device_node *np,
>> 				     const char *name, int *lenp)
>> {
>> 	struct property *pp =3D __of_find_property(np, name, lenp);
>> @@ -397,9 +397,13 @@ static const void *__of_get_property(const =
struct device_node *np,
>> const void *of_get_property(const struct device_node *np, const char =
*name,
>> 			    int *lenp)
>> {
>> -	struct property *pp =3D of_find_property(np, name, lenp);
>> +	unsigned long flags;
>> +	const void *value;
>>=20
>> -	return pp ? pp->value : NULL;
>> +	raw_spin_lock_irqsave(&devtree_lock, flags);
>> +	value =3D __of_get_property(np, name, lenp);
>> +	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>> +	return value;
>=20
> Why is this changed?
>=20

Symmetry. All the others follow the same pattern.
=20

>> }
>> EXPORT_SYMBOL(of_get_property);
>>=20
>> @@ -536,7 +540,7 @@ EXPORT_SYMBOL(of_get_cpu_node);
>>  * 10. type
>>  * 11. name
>>  */
>> -static int __of_device_is_compatible(const struct device_node =
*device,
>> +int __of_device_is_compatible(const struct device_node *device,
>> 				     const char *compat, const char =
*type, const char *name)
>=20
> I can't find the user for this one.
>=20

Right. Internal tree uses it. I will remove.

>> {
>> 	struct property *prop;
>> @@ -619,7 +623,7 @@ EXPORT_SYMBOL(of_machine_is_compatible);
>>  *  Returns 1 if the status property is absent or set to "okay" or =
"ok",
>>  *  0 otherwise
>>  */
>> -static int __of_device_is_available(const struct device_node =
*device)
>> +int __of_device_is_available(const struct device_node *device)
>=20
> I can't find the user for this one.
>=20
Yep.


>> {
>> 	const char *status;
>> 	int statlen;
>> @@ -709,7 +713,7 @@ struct device_node *of_get_next_parent(struct =
device_node *node)
>> }
>> EXPORT_SYMBOL(of_get_next_parent);
>>=20
>> -static struct device_node *__of_get_next_child(const struct =
device_node *node,
>> +struct device_node *__of_get_next_child(const struct device_node =
*node,
>> 						struct device_node =
*prev)
>=20
> Same here.
>=20

>> {
>> 	struct device_node *next;
>> @@ -724,9 +728,7 @@ static struct device_node =
*__of_get_next_child(const struct device_node *node,
>> 	of_node_put(prev);
>> 	return next;
>> }
>> -#define __for_each_child_of_node(parent, child) \
>> -	for (child =3D __of_get_next_child(parent, NULL); child !=3D =
NULL; \
>> -	     child =3D __of_get_next_child(parent, child))
>> +EXPORT_SYMBOL(__of_get_next_child);
>=20
> Again.
>=20

All these are for use by subsequent patches. I will remove.

>>=20
>> /**
>>  *	of_get_next_child - Iterate a node childs
>> @@ -1820,7 +1822,7 @@ int of_count_phandle_with_args(const struct =
device_node *np, const char *list_na
>> EXPORT_SYMBOL(of_count_phandle_with_args);
>>=20
>> #if defined(CONFIG_OF_DYNAMIC)
>> -static int of_property_notify(int action, struct device_node *np,
>> +int of_property_notify(int action, struct device_node *np,
>> 			      struct property *prop)
>> {
>> 	struct of_prop_reconfig pr;
>> @@ -1833,18 +1835,12 @@ static int of_property_notify(int action, =
struct device_node *np,
>> 	pr.prop =3D prop;
>> 	return of_reconfig_notify(action, &pr);
>> }
>> -#else
>> -static int of_property_notify(int action, struct device_node *np,
>> -			      struct property *prop)
>> -{
>> -	return 0;
>> -}
>> #endif
>>=20
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
>> @@ -1886,6 +1882,25 @@ int of_add_property(struct device_node *np, =
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
>> @@ -1896,9 +1911,7 @@ int of_add_property(struct device_node *np, =
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
>> @@ -1906,22 +1919,11 @@ int of_remove_property(struct device_node =
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
>> @@ -1932,6 +1934,32 @@ int of_remove_property(struct device_node *np, =
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
>> @@ -1941,36 +1969,21 @@ int of_remove_property(struct device_node =
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
>> @@ -1982,7 +1995,7 @@ int of_update_property(struct device_node *np, =
struct property *newprop)
>> 	/* Update the sysfs attribute */
>> 	if (oldprop)
>> 		sysfs_remove_bin_file(&np->kobj, &oldprop->attr);
>> -	__of_add_property_sysfs(np, newprop);
>> +	__of_add_property_sysfs(np, prop);
>>=20
>> 	return 0;
>> }
>> @@ -2018,6 +2031,15 @@ int of_reconfig_notify(unsigned long action, =
void *p)
>> 	return notifier_to_errno(rc);
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
>>  * of_attach_node - Plug a device node into the tree and global list.
>>  */
>> @@ -2031,51 +2053,29 @@ int of_attach_node(struct device_node *np)
>> 		return rc;
>>=20
>> 	raw_spin_lock_irqsave(&devtree_lock, flags);
>> -	np->sibling =3D np->parent->child;
>> -	np->allnext =3D np->parent->allnext;
>> -	np->parent->allnext =3D np;
>> -	np->parent->child =3D np;
>> -	of_node_clear_flag(np, OF_DETACHED);
>> +	__of_attach_node(np);
>> 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>>=20
>> 	of_node_add(np);
>> 	return 0;
>> }
>>=20
>> -/**
>> - * of_detach_node - "Unplug" a node from the device tree.
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
>> 		for (prev =3D of_allnodes;
>> 		     prev->allnext !=3D np;
>> 		     prev =3D prev->allnext)
>> @@ -2086,7 +2086,6 @@ int of_detach_node(struct device_node *np)
>> 	if (parent->child =3D=3D np)
>> 		parent->child =3D np->sibling;
>> 	else {
>> -		struct device_node *prevsib;
>> 		for (prevsib =3D np->parent->child;
>> 		     prevsib->sibling !=3D np;
>> 		     prevsib =3D prevsib->sibling)
>> @@ -2095,6 +2094,25 @@ int of_detach_node(struct device_node *np)
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
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index f7392c0..5e4e1b3 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -98,6 +98,8 @@ static inline int of_node_is_attached(struct =
device_node *node)
>> #ifdef CONFIG_OF_DYNAMIC
>> extern struct device_node *of_node_get(struct device_node *node);
>> extern void of_node_put(struct device_node *node);
>> +extern int of_property_notify(int action, struct device_node *np,
>> +			      struct property *prop);
>> #else /* CONFIG_OF_DYNAMIC */
>> /* Dummy ref counting routines - to be implemented later */
>> static inline struct device_node *of_node_get(struct device_node =
*node)
>> @@ -105,6 +107,11 @@ static inline struct device_node =
*of_node_get(struct device_node *node)
>> 	return node;
>> }
>> static inline void of_node_put(struct device_node *node) { }
>> +static inline int of_property_notify(int action, struct device_node =
*np,
>> +			      struct property *prop)
>> +{
>> +	return 0;
>> +}
>> #endif /* !CONFIG_OF_DYNAMIC */
>>=20
>> #ifdef CONFIG_OF
>> @@ -238,6 +245,8 @@ extern struct device_node *of_get_parent(const =
struct device_node *node);
>> extern struct device_node *of_get_next_parent(struct device_node =
*node);
>> extern struct device_node *of_get_next_child(const struct device_node =
*node,
>> 					     struct device_node *prev);
>> +struct device_node *__of_get_next_child(const struct device_node =
*node,
>> +						struct device_node =
*prev);
>> extern struct device_node *of_get_next_available_child(
>> 	const struct device_node *node, struct device_node *prev);
>>=20
>> @@ -279,9 +288,17 @@ extern int of_property_match_string(struct =
device_node *np,
>> 				    const char *string);
>> extern int of_property_count_strings(struct device_node *np,
>> 				     const char *propname);
>> +int __of_device_is_compatible(const struct device_node *device,
>> +				     const char *compat, const char =
*type,
>> +				     const char *name);
>> extern int of_device_is_compatible(const struct device_node *device,
>> 				   const char *);
>> +extern int __of_device_is_available(const struct device_node =
*device);
>> extern int of_device_is_available(const struct device_node *device);
>> +
>> +extern const void *__of_get_property(const struct device_node *node,
>> +				const char *name,
>> +				int *lenp);
>> extern const void *of_get_property(const struct device_node *node,
>> 				const char *name,
>> 				int *lenp);
>> @@ -312,6 +329,11 @@ extern int of_alias_get_id(struct device_node =
*np, const char *stem);
>>=20
>> extern int of_machine_is_compatible(const char *compat);
>>=20
>> +int __of_add_property(struct device_node *np, struct property =
*prop);
>> +int __of_remove_property(struct device_node *np, struct property =
*prop);
>> +int __of_update_property(struct device_node *np, struct property =
*newprop,
>> +		struct property **oldprop);
>> +
>> extern int of_add_property(struct device_node *np, struct property =
*prop);
>> extern int of_remove_property(struct device_node *np, struct property =
*prop);
>> extern int of_update_property(struct device_node *np, struct property =
*newprop);
>> @@ -332,6 +354,9 @@ extern int of_reconfig_notifier_register(struct =
notifier_block *);
>> extern int of_reconfig_notifier_unregister(struct notifier_block *);
>> extern int of_reconfig_notify(unsigned long, void *);
>>=20
>> +void __of_attach_node(struct device_node *np);
>> +void __of_detach_node(struct device_node *np);
>> +
>> extern int of_attach_node(struct device_node *);
>> extern int of_detach_node(struct device_node *);
>>=20
>> @@ -401,6 +426,12 @@ static inline struct device_node =
*of_get_next_child(
>> 	return NULL;
>> }
>>=20
>> +static inline struct device_node *__of_get_next_child(
>> +	const struct device_node *node, struct device_node *prev)
>> +{
>> +	return NULL;
>> +}
>> +
>> static inline struct device_node *of_get_next_available_child(
>> 	const struct device_node *node, struct device_node *prev)
>> {
>> @@ -738,6 +769,9 @@ static inline int of_property_read_u32(const =
struct device_node *np,
>> #define for_each_child_of_node(parent, child) \
>> 	for (child =3D of_get_next_child(parent, NULL); child !=3D NULL; =
\
>> 	     child =3D of_get_next_child(parent, child))
>> +#define __for_each_child_of_node(parent, child) \
>> +	for (child =3D __of_get_next_child(parent, NULL); child !=3D =
NULL; \
>> +	     child =3D __of_get_next_child(parent, child))
>> #define for_each_available_child_of_node(parent, child) \
>> 	for (child =3D of_get_next_available_child(parent, NULL); child =
!=3D NULL; \
>> 	     child =3D of_get_next_available_child(parent, child))
>> --=20
>> 1.7.12
>>=20
>=20
