From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: Re: [PATCH 3/3] of: overlay: Pick up label symbols from overlays.
Date: Tue, 10 May 2016 16:56:43 +0300
Message-ID: <2B34FBA8-A9DB-4DB5-BF95-4FE752EAF128@antoniou-consulting.com>
References: <1462817488-8370-1-git-send-email-pantelis.antoniou@konsulko.com> <1462817488-8370-4-git-send-email-pantelis.antoniou@konsulko.com> <CAL_JsqLVnQ12AS-2CNfsf5PsyGvELrMjDDGfRcv7opijgJkGdw@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLVnQ12AS-2CNfsf5PsyGvELrMjDDGfRcv7opijgJkGdw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On May 10, 2016, at 00:47 , Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
>=20
> On Mon, May 9, 2016 at 1:11 PM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> Insert overlay symbols to the base tree when applied.
>> This makes it possible to apply an overlay that references a label
>> that a previously inserted overlay had.
>>=20
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>> Tested-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>>=20
>> ---
>> drivers/of/overlay.c | 102 +++++++++++++++++++++++++++++++++++++++++=
++++++++++
>> 1 file changed, 102 insertions(+)
>>=20
>> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
>> index a274d65..a7956a2 100644
>> --- a/drivers/of/overlay.c
>> +++ b/drivers/of/overlay.c
>> @@ -514,6 +514,101 @@ static int of_free_overlay_info(struct of_over=
lay *ov)
>>        return 0;
>> }
>>=20
>> +static int of_overlay_add_symbols(
>> +               struct device_node *tree,
>> +               struct of_overlay *ov)
>> +{
>> +       struct of_overlay_info *ovinfo;
>> +       struct device_node *root_sym =3D NULL;
>> +       struct device_node *child =3D NULL;
>> +       struct property *prop;
>> +       const char *path, *s;
>> +       char *new_path;
>> +       int i, len, err;
>> +
>> +       /* this may fail (if no fixups are required) */
>> +       root_sym =3D of_find_node_by_path("/__symbols__");
>> +
>> +       /* do nothing if no root symbols */
>> +       if (!root_sym)
>> +               return 0;
>> +
>> +       /* locate the symbols & fixups nodes on resolve */
>> +       for_each_child_of_node(tree, child) {
>> +               if (of_node_cmp(child->name, "__symbols__") =3D=3D 0=
)
>> +                       goto found;
>=20
> Doesn't of_get_child_by_name work here?
>=20

No, we=E2=80=99re holding of_mutex.

>> +       }
>> +       /* no symbols, no problem */
>> +       of_node_put(root_sym);
>> +       return 0;
>> +
>> +found:
>=20
> As Marek said, get rid of the goto.
>=20
>> +       err =3D -EINVAL;
>> +       for_each_property_of_node(child, prop) {
>> +
>> +               /* skip properties added automatically */
>> +               if (of_prop_cmp(prop->name, "name") =3D=3D 0)
>> +                       continue;
>> +
>> +               err =3D of_property_read_string(child,
>> +                               prop->name, &path);
>> +               if (err !=3D 0) {
>> +                       pr_err("%s: Could not find symbol '%s'\n",
>> +                                       __func__, prop->name);
>=20
> Can you introduce and use a common pr_fmt prefix here and elsewhere
> (just what you are adding).

OK

>=20
>> +                       continue;
>> +               }
>> +
>> +
>=20
> Extra blank line.
>=20
>> +               /* now find fragment index */
>> +               s =3D path;
>> +
>> +               /* compare paths to find fragment index */
>> +               ovinfo =3D NULL;
>> +               len =3D -1;
>=20
> Move these into the for init.
>=20
>> +               for (i =3D 0; i < ov->count; i++) {
>> +                       ovinfo =3D &ov->ovinfo_tab[i];
>> +
>> +                       pr_debug("%s: #%d: overlay->name=3D%s target=
->name=3D%s\n",
>> +                                       __func__, i, ovinfo->overlay=
->full_name,
>> +                                       ovinfo->target->full_name);
>> +
>> +                       len =3D strlen(ovinfo->overlay->full_name);
>> +                       if (strncasecmp(path, ovinfo->overlay->full_=
name,
>> +                                               len) =3D=3D 0 && pat=
h[len] =3D=3D '/')
>> +                               break;
>> +               }
>> +
>> +               if (i >=3D ov->count)
>> +                       continue;
>> +
>> +               pr_debug("%s: found target at #%d\n", __func__, i);
>> +               new_path =3D kasprintf(GFP_KERNEL, "%s%s",
>> +                               ovinfo->target->full_name,
>> +                               path + len);
>> +               if (!new_path) {
>> +                       pr_err("%s: Failed to allocate propname for =
\"%s\"\n",
>> +                                       __func__, prop->name);
>> +                       continue;
>=20
> If this fails, is there much point in continuing?
>=20

No

>> +               }
>> +
>> +               err =3D of_changeset_add_property_string(&ov->cset, =
root_sym,
>> +                               prop->name, new_path);
>> +
>> +               /* free always */
>> +               kfree(new_path);
>> +
>> +               if (err) {
>=20
> No need for brackets.
>=20
>> +                       pr_err("%s: Failed to add property for \"%s\=
"\n",
>> +                                       __func__, prop->name);
>> +               }
>> +       }
>> +
>> +       of_node_put(child);
>> +       of_node_put(root_sym);
>> +
>> +       return 0;
>> +}
>> +
>> static LIST_HEAD(ov_list);
>> static DEFINE_IDR(ov_idr);
>>=20
>> @@ -642,6 +737,13 @@ static int __of_overlay_create(struct device_no=
de *tree,
>>                goto err_abort_trans;
>>        }
>>=20
>> +       err =3D of_overlay_add_symbols(tree, ov);
>> +       if (err) {
>> +               pr_err("%s: of_overlay_add_symbols() failed for tree=
@%s\n",
>> +                               __func__, tree->full_name);
>> +               goto err_abort_trans;
>> +       }
>> +
>>        /* apply the changeset */
>>        err =3D __of_changeset_apply(&ov->cset);
>>        if (err) {
>> --
>> 1.7.12
>>=20

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
