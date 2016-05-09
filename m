From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/4] of: changesets: Introduce changeset helper methods
Date: Mon, 9 May 2016 17:34:19 +0300
Message-ID: <F8E336E9-E400-4918-8E65-B3EFFC943D20@konsulko.com>
References: <1462800045-10943-1-git-send-email-pantelis.antoniou@konsulko.com> <1462800045-10943-4-git-send-email-pantelis.antoniou@konsulko.com> <CAL_JsqJY7BcKV2djvSGq8KoQKPyFdFvs395w4L2o5+Lbc3ng4Q@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJY7BcKV2djvSGq8KoQKPyFdFvs395w4L2o5+Lbc3ng4Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On May 9, 2016, at 17:27 , Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>=20
> On Mon, May 9, 2016 at 8:20 AM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> Changesets are very powerful, but the lack of a helper API
>> makes using them cumbersome. Introduce a simple copy based
>> API that makes things considerably easier.
>>=20
>> To wit, adding a property using the raw API.
>>=20
>>        struct property *prop;
>>        prop =3D kzalloc(sizeof(*prop)), GFP_KERNEL);
>>        prop->name =3D kstrdup("compatible");
>>        prop->value =3D kstrdup("foo,bar");
>>        prop->length =3D strlen(prop->value) + 1;
>>        of_changeset_add_property(ocs, np, prop);
>>=20
>> while using the helper API
>>=20
>>        of_changeset_add_property_string(ocs, np, "compatible",
>>                        "foo,bar");
>=20
> Seems useful. Do we not have any users that can be converted?
>=20

There is a user for this, which will be shortly posted.


> [...]
>=20
>> +static int __of_changeset_add_update_property_copy(struct of_change=
set *ocs,
>> +               struct device_node *np, const char *name, const void=
 *value,
>> +               int length, bool update)
>> +{
>> +       struct property *prop;
>> +       char *new_name;
>> +       void *new_value;
>> +       int ret =3D -ENOMEM;
>> +
>> +       prop =3D kzalloc(sizeof(*prop), GFP_KERNEL);
>> +       if (!prop)
>> +               goto out_no_prop;
>=20
> Just return here.
>=20

OK

>> +
>> +       new_name =3D kstrdup(name, GFP_KERNEL);
>> +       if (!new_name)
>> +               goto out_no_name;
>> +
>> +       /*
>> +        * NOTE: There is no check for zero length value.
>> +        * In case of a boolean property, this will allocate a value
>> +        * of zero bytes. We do this to work around the use
>> +        * of of_get_property() calls on boolean values.
>> +        */
>> +       new_value =3D kmemdup(value, length, GFP_KERNEL);
>> +       if (!new_value)
>> +               goto out_no_value;
>> +
>> +       of_property_set_flag(prop, OF_DYNAMIC);
>> +
>> +       prop->name =3D new_name;
>> +       prop->value =3D new_value;
>> +       prop->length =3D length;
>> +
>> +       if (!update)
>> +               ret =3D of_changeset_add_property(ocs, np, prop);
>> +       else
>> +               ret =3D of_changeset_update_property(ocs, np, prop);
>> +
>> +       if (ret !=3D 0)
>=20
> if (!ret)
>  return 0;
>=20
>=20

>> +               goto out_no_add;
>> +
>> +       return 0;
>> +
>> +out_no_add:
>=20
> ... and remove all this.
>=20

Err, there=E2=80=99s an exit path here from kmemdup (goto err_no_value)=
=2E
We=E2=80=99ll be leaking memory on error.

>> +       kfree(prop->value);
>> +out_no_value:
>> +       kfree(prop->name);
>> +out_no_name:
>> +       kfree(prop);
>> +out_no_prop:
>> +       return ret;
>> +}
>> +
>> +static int __of_changeset_add_update_property_string(struct of_chan=
geset *ocs,
>> +               struct device_node *np, const char *name, const char=
 *str,
>> +               bool update)
>> +{
>> +       return __of_changeset_add_update_property_copy(ocs, np, name=
, str,
>> +                       strlen(str) + 1, update);
>> +}
>> +
>> +static int __of_changeset_add_update_property_stringv(struct of_cha=
ngeset *ocs,
>> +               struct device_node *np, const char *name,
>> +               const char *fmt, va_list vargs, bool update)
>> +{
>> +       char *str;
>> +       int ret;
>> +
>> +       str =3D kvasprintf(GFP_KERNEL, fmt, vargs);
>> +       if (!str)
>> +               return -ENOMEM;
>> +
>> +       ret =3D __of_changeset_add_update_property_string(ocs, np, n=
ame, str, update);
>> +
>> +       kfree(str);
>> +
>> +       return ret;
>> +}
>> +
>> +static int __of_changeset_add_update_property_string_list(
>> +               struct of_changeset *ocs, struct device_node *np, co=
nst char *name,
>> +               const char **strs, int count, bool update)
>> +{
>> +       int total =3D 0, i, ret;
>> +       char *value, *s;
>> +
>> +       for (i =3D 0; i < count; i++) {
>> +               /* check if  it's NULL */
>> +               if (!strs[i])
>> +                       return -EINVAL;
>> +               total +=3D strlen(strs[i]) + 1;
>> +       }
>> +
>> +       value =3D kmalloc(total, GFP_KERNEL);
>> +       if (!value)
>> +               return -ENOMEM;
>> +
>> +       for (i =3D 0, s =3D value; i < count; i++) {
>> +               /* no need to check for NULL, check above */
>> +               strcpy(s, strs[i]);
>> +               s +=3D strlen(strs[i]) + 1;
>> +       }
>> +
>> +       ret =3D __of_changeset_add_update_property_copy(ocs, np, nam=
e, value,
>> +                       total, update);
>> +
>> +       kfree(value);
>> +
>> +       return ret;
>> +}
>> +
>> +static int __of_changeset_add_update_property_u32(struct of_changes=
et *ocs,
>> +               struct device_node *np, const char *name, u32 val, b=
ool update)
>> +{
>> +       /* in place */
>> +       val =3D cpu_to_be32(val);
>=20
> Kill this function and move this to the 2 callers.
>=20
>> +       return __of_changeset_add_update_property_copy(ocs, np, name=
, &val,
>> +                       sizeof(val), update);
>> +}
>> +
>> +static int __of_changeset_add_update_property_bool(struct of_change=
set *ocs,
>> +               struct device_node *np, const char *name, bool updat=
e)
>> +{
>=20
> I think this intermediate function could be killed off too.
>=20
>> +       return __of_changeset_add_update_property_copy(ocs, np, name=
, "", 0,
>> +                       update);
>> +}
>=20
> [...]
>=20
>> +static struct device_node *
>> +__of_changeset_node_move_one(struct of_changeset *ocs,
>> +               struct device_node *np, struct device_node *new_pare=
nt)
>> +{
>> +       struct device_node *np2;
>> +       const char *unitname;
>> +       int err;
>> +
>> +       err =3D of_changeset_detach_node(ocs, np);
>> +       if (err)
>> +               return ERR_PTR(err);
>> +
>> +       unitname =3D strrchr(np->full_name, '/');
>> +       if (!unitname)
>> +               unitname =3D np->full_name;
>> +
>> +       np2 =3D __of_node_dup(np, "%s/%s",
>> +                       new_parent->full_name, unitname);
>> +       if (!np2)
>> +               return ERR_PTR(-ENOMEM);
>> +       np2->parent =3D new_parent;
>> +
>> +       err =3D of_changeset_attach_node(ocs, np2);
>> +       if (err)
>> +               return ERR_PTR(err);
>> +
>> +       return np2;
>> +}
>> +
>> +/**
>> + * of_changeset_node_move_to - Moves a subtree to a new place in
>> + *                             the tree
>> + *
>> + * @ocs:       changeset pointer
>> + * @np:                device node pointer to be moved
>> + * @to:                device node of the new parent
>> + *
>> + * Moves a subtree to a new place in the tree.
>> + * Note that a move is a safe operation because the phandles
>> + * remain valid.
>=20
> I'm having a hard time imagining a usecase for this one. I would drop
> until we have a user in tree.
>=20

There=E2=80=99s a use case - it will be apparent with the next patches.
=20
>> + *
>> + * Returns zero on success, a negative error value otherwise.
>> + */
>> +int of_changeset_node_move(struct of_changeset *ocs,
>> +               struct device_node *np, struct device_node *new_pare=
nt)
>> +{
>> +       struct device_node *npc, *nppc;
>> +
>> +       /* move the root first */
>> +       nppc =3D __of_changeset_node_move_one(ocs, np, new_parent);
>> +       if (IS_ERR(nppc))
>> +               return PTR_ERR(nppc);
>> +
>> +       /* move the subtrees next */
>> +       for_each_child_of_node(np, npc) {
>> +               nppc =3D __of_changeset_node_move_one(ocs, npc, nppc=
);
>> +               if (IS_ERR(nppc)) {
>> +                       of_node_put(npc);
>> +                       return PTR_ERR(nppc);
>> +               }
>> +       }
>> +
>> +       return 0;
>> +}
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index 3175803..f015911 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -1037,6 +1037,42 @@ static inline int of_changeset_update_propert=
y(struct of_changeset *ocs,
>> {
>>        return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, =
np, prop);
>> }
>> +
>> +struct device_node *of_changeset_create_device_nodev(
>> +       struct of_changeset *ocs, struct device_node *parent,
>> +       const char *fmt, va_list vargs);
>> +__printf(3, 4) struct device_node *of_changeset_create_device_node(
>> +       struct of_changeset *ocs, struct device_node *parent,
>> +       const char *fmt, ...);
>> +int of_changeset_add_property_copy(struct of_changeset *ocs,
>> +       struct device_node *np, const char *name,
>> +       const void *value, int length);
>> +int of_changeset_add_property_string(struct of_changeset *ocs,
>> +       struct device_node *np, const char *name, const char *str);
>> +__printf(4, 5) int of_changeset_add_property_stringf(struct of_chan=
geset *ocs,
>> +               struct device_node *np, const char *name, const char=
 *fmt, ...);
>> +int of_changeset_add_property_string_list(struct of_changeset *ocs,
>> +       struct device_node *np, const char *name, const char **strs,=
 int count);
>> +int of_changeset_add_property_u32(struct of_changeset *ocs,
>> +       struct device_node *np, const char *name, u32 val);
>> +int of_changeset_add_property_bool(struct of_changeset *ocs,
>> +       struct device_node *np, const char *name);
>> +int of_changeset_update_property_copy(struct of_changeset *ocs,
>> +       struct device_node *np, const char *name,
>> +       const void *value, int length);
>> +int of_changeset_update_property_string(struct of_changeset *ocs,
>> +       struct device_node *np, const char *name, const char *str);
>> +__printf(4, 5) int of_changeset_update_property_stringf(struct of_c=
hangeset *ocs,
>> +               struct device_node *np, const char *name, const char=
 *fmt, ...);
>> +int of_changeset_update_property_string_list(struct of_changeset *o=
cs,
>> +       struct device_node *np, const char *name, const char **strs,=
 int count);
>> +int of_changeset_update_property_u32(struct of_changeset *ocs,
>> +       struct device_node *np, const char *name, u32 val);
>> +int of_changeset_update_property_bool(struct of_changeset *ocs,
>> +       struct device_node *np, const char *name);
>> +int of_changeset_node_move(struct of_changeset *ocs,
>> +       struct device_node *np, struct device_node *new_parent);
>=20
> A bunch of these can be static inline wrappers.
>=20
> You need EXPORT_SYMBOL_GPL on these as well.
>=20

I will add the exports.

> Rob

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
