From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] of: changesets: Introduce changeset helper methods
Date: Mon, 9 May 2016 09:27:39 -0500
Message-ID: <CAL_JsqJY7BcKV2djvSGq8KoQKPyFdFvs395w4L2o5+Lbc3ng4Q@mail.gmail.com>
References: <1462800045-10943-1-git-send-email-pantelis.antoniou@konsulko.com> <1462800045-10943-4-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462800045-10943-4-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 9, 2016 at 8:20 AM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Changesets are very powerful, but the lack of a helper API
> makes using them cumbersome. Introduce a simple copy based
> API that makes things considerably easier.
>
> To wit, adding a property using the raw API.
>
>         struct property *prop;
>         prop = kzalloc(sizeof(*prop)), GFP_KERNEL);
>         prop->name = kstrdup("compatible");
>         prop->value = kstrdup("foo,bar");
>         prop->length = strlen(prop->value) + 1;
>         of_changeset_add_property(ocs, np, prop);
>
> while using the helper API
>
>         of_changeset_add_property_string(ocs, np, "compatible",
>                         "foo,bar");

Seems useful. Do we not have any users that can be converted?

[...]

> +static int __of_changeset_add_update_property_copy(struct of_changeset *ocs,
> +               struct device_node *np, const char *name, const void *value,
> +               int length, bool update)
> +{
> +       struct property *prop;
> +       char *new_name;
> +       void *new_value;
> +       int ret = -ENOMEM;
> +
> +       prop = kzalloc(sizeof(*prop), GFP_KERNEL);
> +       if (!prop)
> +               goto out_no_prop;

Just return here.

> +
> +       new_name = kstrdup(name, GFP_KERNEL);
> +       if (!new_name)
> +               goto out_no_name;
> +
> +       /*
> +        * NOTE: There is no check for zero length value.
> +        * In case of a boolean property, this will allocate a value
> +        * of zero bytes. We do this to work around the use
> +        * of of_get_property() calls on boolean values.
> +        */
> +       new_value = kmemdup(value, length, GFP_KERNEL);
> +       if (!new_value)
> +               goto out_no_value;
> +
> +       of_property_set_flag(prop, OF_DYNAMIC);
> +
> +       prop->name = new_name;
> +       prop->value = new_value;
> +       prop->length = length;
> +
> +       if (!update)
> +               ret = of_changeset_add_property(ocs, np, prop);
> +       else
> +               ret = of_changeset_update_property(ocs, np, prop);
> +
> +       if (ret != 0)

if (!ret)
  return 0;


> +               goto out_no_add;
> +
> +       return 0;
> +
> +out_no_add:

... and remove all this.

> +       kfree(prop->value);
> +out_no_value:
> +       kfree(prop->name);
> +out_no_name:
> +       kfree(prop);
> +out_no_prop:
> +       return ret;
> +}
> +
> +static int __of_changeset_add_update_property_string(struct of_changeset *ocs,
> +               struct device_node *np, const char *name, const char *str,
> +               bool update)
> +{
> +       return __of_changeset_add_update_property_copy(ocs, np, name, str,
> +                       strlen(str) + 1, update);
> +}
> +
> +static int __of_changeset_add_update_property_stringv(struct of_changeset *ocs,
> +               struct device_node *np, const char *name,
> +               const char *fmt, va_list vargs, bool update)
> +{
> +       char *str;
> +       int ret;
> +
> +       str = kvasprintf(GFP_KERNEL, fmt, vargs);
> +       if (!str)
> +               return -ENOMEM;
> +
> +       ret = __of_changeset_add_update_property_string(ocs, np, name, str, update);
> +
> +       kfree(str);
> +
> +       return ret;
> +}
> +
> +static int __of_changeset_add_update_property_string_list(
> +               struct of_changeset *ocs, struct device_node *np, const char *name,
> +               const char **strs, int count, bool update)
> +{
> +       int total = 0, i, ret;
> +       char *value, *s;
> +
> +       for (i = 0; i < count; i++) {
> +               /* check if  it's NULL */
> +               if (!strs[i])
> +                       return -EINVAL;
> +               total += strlen(strs[i]) + 1;
> +       }
> +
> +       value = kmalloc(total, GFP_KERNEL);
> +       if (!value)
> +               return -ENOMEM;
> +
> +       for (i = 0, s = value; i < count; i++) {
> +               /* no need to check for NULL, check above */
> +               strcpy(s, strs[i]);
> +               s += strlen(strs[i]) + 1;
> +       }
> +
> +       ret = __of_changeset_add_update_property_copy(ocs, np, name, value,
> +                       total, update);
> +
> +       kfree(value);
> +
> +       return ret;
> +}
> +
> +static int __of_changeset_add_update_property_u32(struct of_changeset *ocs,
> +               struct device_node *np, const char *name, u32 val, bool update)
> +{
> +       /* in place */
> +       val = cpu_to_be32(val);

Kill this function and move this to the 2 callers.

> +       return __of_changeset_add_update_property_copy(ocs, np, name, &val,
> +                       sizeof(val), update);
> +}
> +
> +static int __of_changeset_add_update_property_bool(struct of_changeset *ocs,
> +               struct device_node *np, const char *name, bool update)
> +{

I think this intermediate function could be killed off too.

> +       return __of_changeset_add_update_property_copy(ocs, np, name, "", 0,
> +                       update);
> +}

[...]

> +static struct device_node *
> +__of_changeset_node_move_one(struct of_changeset *ocs,
> +               struct device_node *np, struct device_node *new_parent)
> +{
> +       struct device_node *np2;
> +       const char *unitname;
> +       int err;
> +
> +       err = of_changeset_detach_node(ocs, np);
> +       if (err)
> +               return ERR_PTR(err);
> +
> +       unitname = strrchr(np->full_name, '/');
> +       if (!unitname)
> +               unitname = np->full_name;
> +
> +       np2 = __of_node_dup(np, "%s/%s",
> +                       new_parent->full_name, unitname);
> +       if (!np2)
> +               return ERR_PTR(-ENOMEM);
> +       np2->parent = new_parent;
> +
> +       err = of_changeset_attach_node(ocs, np2);
> +       if (err)
> +               return ERR_PTR(err);
> +
> +       return np2;
> +}
> +
> +/**
> + * of_changeset_node_move_to - Moves a subtree to a new place in
> + *                             the tree
> + *
> + * @ocs:       changeset pointer
> + * @np:                device node pointer to be moved
> + * @to:                device node of the new parent
> + *
> + * Moves a subtree to a new place in the tree.
> + * Note that a move is a safe operation because the phandles
> + * remain valid.

I'm having a hard time imagining a usecase for this one. I would drop
until we have a user in tree.

> + *
> + * Returns zero on success, a negative error value otherwise.
> + */
> +int of_changeset_node_move(struct of_changeset *ocs,
> +               struct device_node *np, struct device_node *new_parent)
> +{
> +       struct device_node *npc, *nppc;
> +
> +       /* move the root first */
> +       nppc = __of_changeset_node_move_one(ocs, np, new_parent);
> +       if (IS_ERR(nppc))
> +               return PTR_ERR(nppc);
> +
> +       /* move the subtrees next */
> +       for_each_child_of_node(np, npc) {
> +               nppc = __of_changeset_node_move_one(ocs, npc, nppc);
> +               if (IS_ERR(nppc)) {
> +                       of_node_put(npc);
> +                       return PTR_ERR(nppc);
> +               }
> +       }
> +
> +       return 0;
> +}
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 3175803..f015911 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -1037,6 +1037,42 @@ static inline int of_changeset_update_property(struct of_changeset *ocs,
>  {
>         return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
>  }
> +
> +struct device_node *of_changeset_create_device_nodev(
> +       struct of_changeset *ocs, struct device_node *parent,
> +       const char *fmt, va_list vargs);
> +__printf(3, 4) struct device_node *of_changeset_create_device_node(
> +       struct of_changeset *ocs, struct device_node *parent,
> +       const char *fmt, ...);
> +int of_changeset_add_property_copy(struct of_changeset *ocs,
> +       struct device_node *np, const char *name,
> +       const void *value, int length);
> +int of_changeset_add_property_string(struct of_changeset *ocs,
> +       struct device_node *np, const char *name, const char *str);
> +__printf(4, 5) int of_changeset_add_property_stringf(struct of_changeset *ocs,
> +               struct device_node *np, const char *name, const char *fmt, ...);
> +int of_changeset_add_property_string_list(struct of_changeset *ocs,
> +       struct device_node *np, const char *name, const char **strs, int count);
> +int of_changeset_add_property_u32(struct of_changeset *ocs,
> +       struct device_node *np, const char *name, u32 val);
> +int of_changeset_add_property_bool(struct of_changeset *ocs,
> +       struct device_node *np, const char *name);
> +int of_changeset_update_property_copy(struct of_changeset *ocs,
> +       struct device_node *np, const char *name,
> +       const void *value, int length);
> +int of_changeset_update_property_string(struct of_changeset *ocs,
> +       struct device_node *np, const char *name, const char *str);
> +__printf(4, 5) int of_changeset_update_property_stringf(struct of_changeset *ocs,
> +               struct device_node *np, const char *name, const char *fmt, ...);
> +int of_changeset_update_property_string_list(struct of_changeset *ocs,
> +       struct device_node *np, const char *name, const char **strs, int count);
> +int of_changeset_update_property_u32(struct of_changeset *ocs,
> +       struct device_node *np, const char *name, u32 val);
> +int of_changeset_update_property_bool(struct of_changeset *ocs,
> +       struct device_node *np, const char *name);
> +int of_changeset_node_move(struct of_changeset *ocs,
> +       struct device_node *np, struct device_node *new_parent);

A bunch of these can be static inline wrappers.

You need EXPORT_SYMBOL_GPL on these as well.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
