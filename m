From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] of: changesets: Introduce changeset helper methods
Date: Thu, 17 Sep 2015 09:13:54 -0500
Message-ID: <55FACAA2.4010403@kernel.org>
References: <1442419866-4982-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1442419866-4982-3-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442419866-4982-3-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/16/2015 11:11 AM, Pantelis Antoniou wrote:
> Changesets are very powerful, but the lack of a helper API
> makes using them cumbersome. Introduce a simple copy based
> API that makes things considerably easier.
> 
> To wit, adding a property using the raw API.
> 
> 	struct property *prop;
> 	prop = kzalloc(sizeof(*prop)), GFP_KERNEL);
> 	prop->name = kstrdup("compatible");
> 	prop->value = kstrdup("foo,bar");
> 	prop->length = strlen(prop->value) + 1;
> 	of_changeset_add_property(ocs, np, prop);
> 
> while using the helper API
> 
> 	of_changeset_add_property_string(ocs, np, "compatible",
> 			"foo,bar");

How about updating the unittest to use this.

> 
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/of/dynamic.c | 251 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of.h   |  74 +++++++++++++++
>  2 files changed, 325 insertions(+)
> 
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index e452171..afa8e31 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -796,3 +796,254 @@ int of_changeset_action(struct of_changeset *ocs, unsigned long action,
>  	list_add_tail(&ce->node, &ocs->entries);
>  	return 0;
>  }
> +
> +/* changeset helpers */
> +
> +/**
> + * of_changeset_create_device_node - Create an empty device node
> + *
> + * @ocs:	changeset pointer
> + * @parent:	parent device node
> + * @fmt:	format string for the node's full_name
> + * @args:	argument list for the format string
> + *
> + * Create an empty device node, marking it as detached and allocated.
> + *
> + * Returns a device node on success, an error encoded pointer otherwise
> + */
> +struct device_node *of_changeset_create_device_nodev(
> +	struct of_changeset *ocs, struct device_node *parent,
> +	const char *fmt, va_list vargs)
> +{
> +	struct device_node *node;
> +
> +	node = __of_node_dupv(NULL, fmt, vargs);
> +	if (!node)
> +		return ERR_PTR(-ENOMEM);
> +
> +	node->parent = parent;
> +	return node;
> +}

EXPORT_SYMBOL_GPL here and on others?

> +
> +/**
> + * of_changeset_create_device_node - Create an empty device node
> + *
> + * @ocs:	changeset pointer
> + * @parent:	parent device node
> + * @fmt:	Format string for the node's full_name
> + * ...		Arguments
> + *
> + * Create an empty device node, marking it as detached and allocated.
> + *
> + * Returns a device node on success, an error encoded pointer otherwise
> + */
> +struct device_node *of_changeset_create_device_node(
> +	struct of_changeset *ocs, struct device_node *parent,
> +	const char *fmt, ...)
> +{
> +	va_list vargs;
> +	struct device_node *node;
> +
> +	va_start(vargs, fmt);
> +	node = of_changeset_create_device_nodev(ocs, parent, fmt, vargs);
> +	va_end(vargs);
> +	return node;
> +}
> +
> +/**
> + * of_changeset_add_property_copy - Create a new property copying name & value
> + *
> + * @ocs:	changeset pointer
> + * @np:		device node pointer
> + * @name:	name of the property
> + * @value:	pointer to the value data
> + * @length:	length of the value in bytes
> + *
> + * Adds a property to the changeset by making copies of the name & value
> + * entries.
> + *
> + * Returns zero on success, a negative error value otherwise.
> + */
> +int of_changeset_add_property_copy(struct of_changeset *ocs,
> +		struct device_node *np, const char *name, const void *value,
> +		int length)
> +{
> +	struct property *prop;
> +	char *new_name;
> +	void *new_value;

> +	int ret;
> +
> +	ret = -ENOMEM;

One line

> +
> +	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
> +	if (!prop)
> +		goto out_no_prop;
> +
> +	new_name = kstrdup(name, GFP_KERNEL);
> +	if (!new_name)
> +		goto out_no_name;
> +
> +	/*
> +	 * NOTE: There is no check for zero length value.
> +	 * In case of a boolean property, this will allocate a value
> +	 * of zero bytes. We do this to work around the use
> +	 * of of_get_property() calls on boolean values.
> +	 */
> +	new_value = kmemdup(value, length, GFP_KERNEL);
> +	if (!new_value)
> +		goto out_no_value;
> +
> +	of_property_set_flag(prop, OF_DYNAMIC);
> +
> +	prop->name = new_name;
> +	prop->value = new_value;
> +	prop->length = length;
> +
> +	ret = of_changeset_add_property(ocs, np, prop);
> +	if (ret != 0)
> +		goto out_no_add;
> +
> +	return 0;
> +
> +out_no_add:
> +	kfree(prop->value);
> +out_no_value:
> +	kfree(prop->name);
> +out_no_name:
> +	kfree(prop);
> +out_no_prop:
> +	return ret;
> +}
> +
> +/**
> + * of_changeset_add_property_string - Create a new string property
> + *
> + * @ocs:	changeset pointer
> + * @np:		device node pointer
> + * @name:	name of the property
> + * @str:	string property
> + *
> + * Adds a string property to the changeset by making copies of the name
> + * and the string value.
> + *
> + * Returns zero on success, a negative error value otherwise.
> + */
> +int of_changeset_add_property_string(struct of_changeset *ocs,
> +		struct device_node *np, const char *name, const char *str)
> +{
> +	return of_changeset_add_property_copy(ocs, np, name, str,
> +			strlen(str) + 1);
> +}
> +
> +/**
> + * of_changeset_add_property_stringf - Create a new formatted string property
> + *
> + * @ocs:	changeset pointer
> + * @np:		device node pointer
> + * @name:	name of the property
> + * @fmt:	format of string property
> + * ...		arguments of the format string
> + *
> + * Adds a string property to the changeset by making copies of the name
> + * and the formatted value.
> + *
> + * Returns zero on success, a negative error value otherwise.
> + */
> +int of_changeset_add_property_stringf(struct of_changeset *ocs,
> +		struct device_node *np, const char *name, const char *fmt, ...)
> +{
> +	va_list vargs;
> +	char *str;
> +	int ret;
> +
> +	va_start(vargs, fmt);
> +	str = kvasprintf(GFP_KERNEL, fmt, vargs);
> +	va_end(vargs);
> +
> +	ret = of_changeset_add_property_string(ocs, np, name, str);
> +
> +	kfree(str);
> +	return ret;
> +}
> +
> +/**
> + * of_changeset_add_property_string_list - Create a new string list property
> + *
> + * @ocs:	changeset pointer
> + * @np:		device node pointer
> + * @name:	name of the property
> + * @strs:	pointer to the string list
> + * @count:	string count
> + *
> + * Adds a string list property to the changeset.
> + *
> + * Returns zero on success, a negative error value otherwise.
> + */
> +int of_changeset_add_property_string_list(struct of_changeset *ocs,
> +		struct device_node *np, const char *name, const char **strs,
> +		int count)
> +{
> +	int total, length, i, ret;
> +	char *value, *s;
> +
> +	total = 0;

initialize in declaration.

> +	for (i = 0; i < count; i++) {
> +		length = strlen(strs[i]);
> +		total += length + 1;

total += strlen(strs[i]) + 1;

What if strings are NULL? Error or skip? I vote for error.

> +	}
> +
> +	value = kmalloc(total, GFP_KERNEL);
> +	if (!value)
> +		return -ENOMEM;
> +
> +	for (i = 0, s = value; i < count; i++) {
> +		length = strlen(strs[i]);
> +		memcpy(s, strs[i], length + 1);

strcpy perhaps?

> +		s += length + 1;
> +	}
> +
> +	ret = of_changeset_add_property_copy(ocs, np, name, value, total);
> +
> +	kfree(value);
> +
> +	return ret;
> +}
> +
> +/**
> + * of_changeset_add_property_u32 - Create a new u32 property
> + *
> + * @ocs:	changeset pointer
> + * @np:		device node pointer
> + * @name:	name of the property
> + * @val:	value in host endian format
> + *
> + * Adds a u32 property to the changeset.
> + *
> + * Returns zero on success, a negative error value otherwise.
> + */
> +int of_changeset_add_property_u32(struct of_changeset *ocs,
> +		struct device_node *np, const char *name, u32 val)
> +{
> +	/* in place */
> +	val = cpu_to_be32(val);
> +	return of_changeset_add_property_copy(ocs, np, name, &val, sizeof(val));
> +}
> +
> +/**
> + * of_changeset_add_property_bool - Create a new u32 property
> + *
> + * @ocs:	changeset pointer
> + * @np:		device node pointer
> + * @name:	name of the property
> + *
> + * Adds a bool property to the changeset. Note that there is
> + * no option to set the value to false, since the property
> + * existing sets it to true.
> + *
> + * Returns zero on success, a negative error value otherwise.
> + */
> +int of_changeset_add_property_bool(struct of_changeset *ocs,
> +		struct device_node *np, const char *name)
> +{
> +	return of_changeset_add_property_copy(ocs, np, name, "", 0);
> +}
> diff --git a/include/linux/of.h b/include/linux/of.h
> index b0856ed..1e6019a 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -1037,6 +1037,27 @@ static inline int of_changeset_update_property(struct of_changeset *ocs,
>  {
>  	return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
>  }
> +
> +struct device_node *of_changeset_create_device_nodev(
> +	struct of_changeset *ocs, struct device_node *parent,
> +	const char *fmt, va_list vargs);
> +__printf(3, 4) struct device_node *of_changeset_create_device_node(
> +	struct of_changeset *ocs, struct device_node *parent,
> +	const char *fmt, ...);
> +int of_changeset_add_property_copy(struct of_changeset *ocs,
> +	struct device_node *np, const char *name,
> +	const void *value, int length);
> +int of_changeset_add_property_string(struct of_changeset *ocs,
> +	struct device_node *np, const char *name, const char *str);
> +__printf(4, 5) int of_changeset_add_property_stringf(struct of_changeset *ocs,
> +		struct device_node *np, const char *name, const char *fmt, ...);
> +int of_changeset_add_property_string_list(struct of_changeset *ocs,
> +	struct device_node *np, const char *name, const char **strs, int count);
> +int of_changeset_add_property_u32(struct of_changeset *ocs,
> +	struct device_node *np, const char *name, u32 val);
> +int of_changeset_add_property_bool(struct of_changeset *ocs,
> +	struct device_node *np, const char *name);
> +
>  #else /* CONFIG_OF_DYNAMIC */
>  static inline int of_reconfig_notifier_register(struct notifier_block *nb)
>  {
> @@ -1056,6 +1077,59 @@ static inline int of_reconfig_get_state_change(unsigned long action,
>  {
>  	return -EINVAL;
>  }
> +
> +static inline int of_changeset_create_device_node(struct of_changeset *ocs,
> +	struct device_node *parent, const char *fmt, ...)
> +{
> +	return -EINVAL;
> +}
> +
> +int of_changeset_add_property_copy(struct of_changeset *ocs,
> +	struct device_node *np, const char *name,
> +	const void *value, int length)
> +{
> +	return -EINVAL;
> +}
> +
> +int of_changeset_add_property_string(struct of_changeset *ocs,
> +	struct device_node *np, const char *name, const char *str)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline struct device_node *of_changeset_create_device_nodev(
> +	struct of_changeset *ocs, struct device_node *parent,
> +	const char *fmt, va_list vargs)
> +{
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static inline __printf(4, 5) struct device_node *
> +	of_changeset_add_property_stringf(
> +		struct of_changeset *ocs, struct device_node *np,
> +		const char *name, const char *fmt, ...)
> +{
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static inline int of_changeset_add_property_string_list(
> +	struct of_changeset *ocs, struct device_node *np, const char *name,
> +	const char **strs, int count)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline int of_changeset_add_property_u32(struct of_changeset *ocs,
> +	struct device_node *np, const char *name, u32 val)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline int of_changeset_add_property_bool(struct of_changeset *ocs,
> +	struct device_node *np, const char *name)
> +{
> +	return -EINVAL;
> +}
>  #endif /* CONFIG_OF_DYNAMIC */
>  
>  /* CONFIG_OF_RESOLVE api */
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
