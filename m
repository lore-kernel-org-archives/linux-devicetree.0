From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH v2 2/2] of: changesets: Introduce changeset helper methods
Date: Fri, 18 Sep 2015 12:15:05 +0300
Message-ID: <181E6FCF-F1D6-42BC-B0B0-6ADB993A5A83@konsulko.com>
References: <1442419866-4982-1-git-send-email-pantelis.antoniou@konsulko.com> <1442419866-4982-3-git-send-email-pantelis.antoniou@konsulko.com> <55FACAA2.4010403@kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55FACAA2.4010403@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On Sep 17, 2015, at 17:13 , Rob Herring <robh@kernel.org> wrote:
>=20
> On 09/16/2015 11:11 AM, Pantelis Antoniou wrote:
>> Changesets are very powerful, but the lack of a helper API
>> makes using them cumbersome. Introduce a simple copy based
>> API that makes things considerably easier.
>>=20
>> To wit, adding a property using the raw API.
>>=20
>> 	struct property *prop;
>> 	prop =3D kzalloc(sizeof(*prop)), GFP_KERNEL);
>> 	prop->name =3D kstrdup("compatible");
>> 	prop->value =3D kstrdup("foo,bar");
>> 	prop->length =3D strlen(prop->value) + 1;
>> 	of_changeset_add_property(ocs, np, prop);
>>=20
>> while using the helper API
>>=20
>> 	of_changeset_add_property_string(ocs, np, "compatible",
>> 			"foo,bar");
>=20
> How about updating the unittest to use this.
>=20

OK.

>>=20
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>> ---
>> drivers/of/dynamic.c | 251 +++++++++++++++++++++++++++++++++++++++++=
++++++++++
>> include/linux/of.h   |  74 +++++++++++++++
>> 2 files changed, 325 insertions(+)
>>=20
>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>> index e452171..afa8e31 100644
>> --- a/drivers/of/dynamic.c
>> +++ b/drivers/of/dynamic.c
>> @@ -796,3 +796,254 @@ int of_changeset_action(struct of_changeset *o=
cs, unsigned long action,
>> 	list_add_tail(&ce->node, &ocs->entries);
>> 	return 0;
>> }
>> +
>> +/* changeset helpers */
>> +
>> +/**
>> + * of_changeset_create_device_node - Create an empty device node
>> + *
>> + * @ocs:	changeset pointer
>> + * @parent:	parent device node
>> + * @fmt:	format string for the node's full_name
>> + * @args:	argument list for the format string
>> + *
>> + * Create an empty device node, marking it as detached and allocate=
d.
>> + *
>> + * Returns a device node on success, an error encoded pointer other=
wise
>> + */
>> +struct device_node *of_changeset_create_device_nodev(
>> +	struct of_changeset *ocs, struct device_node *parent,
>> +	const char *fmt, va_list vargs)
>> +{
>> +	struct device_node *node;
>> +
>> +	node =3D __of_node_dupv(NULL, fmt, vargs);
>> +	if (!node)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	node->parent =3D parent;
>> +	return node;
>> +}
>=20
> EXPORT_SYMBOL_GPL here and on others?
>=20

Err, none of the others of_changeset* methods are exported right now.
Up to now it was all internal API; should I go ahead and put EXPORT_SYM=
BOL_GPL
to all the others as well?

>> +
>> +/**
>> + * of_changeset_create_device_node - Create an empty device node
>> + *
>> + * @ocs:	changeset pointer
>> + * @parent:	parent device node
>> + * @fmt:	Format string for the node's full_name
>> + * ...		Arguments
>> + *
>> + * Create an empty device node, marking it as detached and allocate=
d.
>> + *
>> + * Returns a device node on success, an error encoded pointer other=
wise
>> + */
>> +struct device_node *of_changeset_create_device_node(
>> +	struct of_changeset *ocs, struct device_node *parent,
>> +	const char *fmt, ...)
>> +{
>> +	va_list vargs;
>> +	struct device_node *node;
>> +
>> +	va_start(vargs, fmt);
>> +	node =3D of_changeset_create_device_nodev(ocs, parent, fmt, vargs)=
;
>> +	va_end(vargs);
>> +	return node;
>> +}
>> +
>> +/**
>> + * of_changeset_add_property_copy - Create a new property copying n=
ame & value
>> + *
>> + * @ocs:	changeset pointer
>> + * @np:		device node pointer
>> + * @name:	name of the property
>> + * @value:	pointer to the value data
>> + * @length:	length of the value in bytes
>> + *
>> + * Adds a property to the changeset by making copies of the name & =
value
>> + * entries.
>> + *
>> + * Returns zero on success, a negative error value otherwise.
>> + */
>> +int of_changeset_add_property_copy(struct of_changeset *ocs,
>> +		struct device_node *np, const char *name, const void *value,
>> +		int length)
>> +{
>> +	struct property *prop;
>> +	char *new_name;
>> +	void *new_value;
>=20
>> +	int ret;
>> +
>> +	ret =3D -ENOMEM;
>=20
> One line
>=20

OK

>> +
>> +	prop =3D kzalloc(sizeof(*prop), GFP_KERNEL);
>> +	if (!prop)
>> +		goto out_no_prop;
>> +
>> +	new_name =3D kstrdup(name, GFP_KERNEL);
>> +	if (!new_name)
>> +		goto out_no_name;
>> +
>> +	/*
>> +	 * NOTE: There is no check for zero length value.
>> +	 * In case of a boolean property, this will allocate a value
>> +	 * of zero bytes. We do this to work around the use
>> +	 * of of_get_property() calls on boolean values.
>> +	 */
>> +	new_value =3D kmemdup(value, length, GFP_KERNEL);
>> +	if (!new_value)
>> +		goto out_no_value;
>> +
>> +	of_property_set_flag(prop, OF_DYNAMIC);
>> +
>> +	prop->name =3D new_name;
>> +	prop->value =3D new_value;
>> +	prop->length =3D length;
>> +
>> +	ret =3D of_changeset_add_property(ocs, np, prop);
>> +	if (ret !=3D 0)
>> +		goto out_no_add;
>> +
>> +	return 0;
>> +
>> +out_no_add:
>> +	kfree(prop->value);
>> +out_no_value:
>> +	kfree(prop->name);
>> +out_no_name:
>> +	kfree(prop);
>> +out_no_prop:
>> +	return ret;
>> +}
>> +
>> +/**
>> + * of_changeset_add_property_string - Create a new string property
>> + *
>> + * @ocs:	changeset pointer
>> + * @np:		device node pointer
>> + * @name:	name of the property
>> + * @str:	string property
>> + *
>> + * Adds a string property to the changeset by making copies of the =
name
>> + * and the string value.
>> + *
>> + * Returns zero on success, a negative error value otherwise.
>> + */
>> +int of_changeset_add_property_string(struct of_changeset *ocs,
>> +		struct device_node *np, const char *name, const char *str)
>> +{
>> +	return of_changeset_add_property_copy(ocs, np, name, str,
>> +			strlen(str) + 1);
>> +}
>> +
>> +/**
>> + * of_changeset_add_property_stringf - Create a new formatted strin=
g property
>> + *
>> + * @ocs:	changeset pointer
>> + * @np:		device node pointer
>> + * @name:	name of the property
>> + * @fmt:	format of string property
>> + * ...		arguments of the format string
>> + *
>> + * Adds a string property to the changeset by making copies of the =
name
>> + * and the formatted value.
>> + *
>> + * Returns zero on success, a negative error value otherwise.
>> + */
>> +int of_changeset_add_property_stringf(struct of_changeset *ocs,
>> +		struct device_node *np, const char *name, const char *fmt, ...)
>> +{
>> +	va_list vargs;
>> +	char *str;
>> +	int ret;
>> +
>> +	va_start(vargs, fmt);
>> +	str =3D kvasprintf(GFP_KERNEL, fmt, vargs);
>> +	va_end(vargs);
>> +
>> +	ret =3D of_changeset_add_property_string(ocs, np, name, str);
>> +
>> +	kfree(str);
>> +	return ret;
>> +}
>> +
>> +/**
>> + * of_changeset_add_property_string_list - Create a new string list=
 property
>> + *
>> + * @ocs:	changeset pointer
>> + * @np:		device node pointer
>> + * @name:	name of the property
>> + * @strs:	pointer to the string list
>> + * @count:	string count
>> + *
>> + * Adds a string list property to the changeset.
>> + *
>> + * Returns zero on success, a negative error value otherwise.
>> + */
>> +int of_changeset_add_property_string_list(struct of_changeset *ocs,
>> +		struct device_node *np, const char *name, const char **strs,
>> +		int count)
>> +{
>> +	int total, length, i, ret;
>> +	char *value, *s;
>> +
>> +	total =3D 0;
>=20
> initialize in declaration.
>=20
OK

>> +	for (i =3D 0; i < count; i++) {
>> +		length =3D strlen(strs[i]);
>> +		total +=3D length + 1;
>=20
> total +=3D strlen(strs[i]) + 1;
>=20
> What if strings are NULL? Error or skip? I vote for error.
>=20

Yeah.

>> +	}
>> +
>> +	value =3D kmalloc(total, GFP_KERNEL);
>> +	if (!value)
>> +		return -ENOMEM;
>> +
>> +	for (i =3D 0, s =3D value; i < count; i++) {
>> +		length =3D strlen(strs[i]);
>> +		memcpy(s, strs[i], length + 1);
>=20
> strcpy perhaps?
>=20

Yes

>> +		s +=3D length + 1;
>> +	}
>> +
>> +	ret =3D of_changeset_add_property_copy(ocs, np, name, value, total=
);
>> +
>> +	kfree(value);
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * of_changeset_add_property_u32 - Create a new u32 property
>> + *
>> + * @ocs:	changeset pointer
>> + * @np:		device node pointer
>> + * @name:	name of the property
>> + * @val:	value in host endian format
>> + *
>> + * Adds a u32 property to the changeset.
>> + *
>> + * Returns zero on success, a negative error value otherwise.
>> + */
>> +int of_changeset_add_property_u32(struct of_changeset *ocs,
>> +		struct device_node *np, const char *name, u32 val)
>> +{
>> +	/* in place */
>> +	val =3D cpu_to_be32(val);
>> +	return of_changeset_add_property_copy(ocs, np, name, &val, sizeof(=
val));
>> +}
>> +
>> +/**
>> + * of_changeset_add_property_bool - Create a new u32 property
>> + *
>> + * @ocs:	changeset pointer
>> + * @np:		device node pointer
>> + * @name:	name of the property
>> + *
>> + * Adds a bool property to the changeset. Note that there is
>> + * no option to set the value to false, since the property
>> + * existing sets it to true.
>> + *
>> + * Returns zero on success, a negative error value otherwise.
>> + */
>> +int of_changeset_add_property_bool(struct of_changeset *ocs,
>> +		struct device_node *np, const char *name)
>> +{
>> +	return of_changeset_add_property_copy(ocs, np, name, "", 0);
>> +}
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index b0856ed..1e6019a 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -1037,6 +1037,27 @@ static inline int of_changeset_update_propert=
y(struct of_changeset *ocs,
>> {
>> 	return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, pr=
op);
>> }
>> +
>> +struct device_node *of_changeset_create_device_nodev(
>> +	struct of_changeset *ocs, struct device_node *parent,
>> +	const char *fmt, va_list vargs);
>> +__printf(3, 4) struct device_node *of_changeset_create_device_node(
>> +	struct of_changeset *ocs, struct device_node *parent,
>> +	const char *fmt, ...);
>> +int of_changeset_add_property_copy(struct of_changeset *ocs,
>> +	struct device_node *np, const char *name,
>> +	const void *value, int length);
>> +int of_changeset_add_property_string(struct of_changeset *ocs,
>> +	struct device_node *np, const char *name, const char *str);
>> +__printf(4, 5) int of_changeset_add_property_stringf(struct of_chan=
geset *ocs,
>> +		struct device_node *np, const char *name, const char *fmt, ...);
>> +int of_changeset_add_property_string_list(struct of_changeset *ocs,
>> +	struct device_node *np, const char *name, const char **strs, int c=
ount);
>> +int of_changeset_add_property_u32(struct of_changeset *ocs,
>> +	struct device_node *np, const char *name, u32 val);
>> +int of_changeset_add_property_bool(struct of_changeset *ocs,
>> +	struct device_node *np, const char *name);
>> +
>> #else /* CONFIG_OF_DYNAMIC */
>> static inline int of_reconfig_notifier_register(struct notifier_bloc=
k *nb)
>> {
>> @@ -1056,6 +1077,59 @@ static inline int of_reconfig_get_state_chang=
e(unsigned long action,
>> {
>> 	return -EINVAL;
>> }
>> +
>> +static inline int of_changeset_create_device_node(struct of_changes=
et *ocs,
>> +	struct device_node *parent, const char *fmt, ...)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>> +int of_changeset_add_property_copy(struct of_changeset *ocs,
>> +	struct device_node *np, const char *name,
>> +	const void *value, int length)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>> +int of_changeset_add_property_string(struct of_changeset *ocs,
>> +	struct device_node *np, const char *name, const char *str)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>> +static inline struct device_node *of_changeset_create_device_nodev(
>> +	struct of_changeset *ocs, struct device_node *parent,
>> +	const char *fmt, va_list vargs)
>> +{
>> +	return ERR_PTR(-EINVAL);
>> +}
>> +
>> +static inline __printf(4, 5) struct device_node *
>> +	of_changeset_add_property_stringf(
>> +		struct of_changeset *ocs, struct device_node *np,
>> +		const char *name, const char *fmt, ...)
>> +{
>> +	return ERR_PTR(-EINVAL);
>> +}
>> +
>> +static inline int of_changeset_add_property_string_list(
>> +	struct of_changeset *ocs, struct device_node *np, const char *name=
,
>> +	const char **strs, int count)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>> +static inline int of_changeset_add_property_u32(struct of_changeset=
 *ocs,
>> +	struct device_node *np, const char *name, u32 val)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>> +static inline int of_changeset_add_property_bool(struct of_changese=
t *ocs,
>> +	struct device_node *np, const char *name)
>> +{
>> +	return -EINVAL;
>> +}
>> #endif /* CONFIG_OF_DYNAMIC */
>>=20
>> /* CONFIG_OF_RESOLVE api */

OK, updated patchset over the weekend.

Regards

=97 Pantelis
