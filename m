From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] of: overlay: Pick up label symbols from overlays.
Date: Mon, 9 May 2016 16:47:34 -0500
Message-ID: <CAL_JsqLVnQ12AS-2CNfsf5PsyGvELrMjDDGfRcv7opijgJkGdw@mail.gmail.com>
References: <1462817488-8370-1-git-send-email-pantelis.antoniou@konsulko.com> <1462817488-8370-4-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462817488-8370-4-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 9, 2016 at 1:11 PM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Insert overlay symbols to the base tree when applied.
> This makes it possible to apply an overlay that references a label
> that a previously inserted overlay had.
>
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Tested-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>
> ---
>  drivers/of/overlay.c | 102 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
>
> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index a274d65..a7956a2 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -514,6 +514,101 @@ static int of_free_overlay_info(struct of_overlay *ov)
>         return 0;
>  }
>
> +static int of_overlay_add_symbols(
> +               struct device_node *tree,
> +               struct of_overlay *ov)
> +{
> +       struct of_overlay_info *ovinfo;
> +       struct device_node *root_sym = NULL;
> +       struct device_node *child = NULL;
> +       struct property *prop;
> +       const char *path, *s;
> +       char *new_path;
> +       int i, len, err;
> +
> +       /* this may fail (if no fixups are required) */
> +       root_sym = of_find_node_by_path("/__symbols__");
> +
> +       /* do nothing if no root symbols */
> +       if (!root_sym)
> +               return 0;
> +
> +       /* locate the symbols & fixups nodes on resolve */
> +       for_each_child_of_node(tree, child) {
> +               if (of_node_cmp(child->name, "__symbols__") == 0)
> +                       goto found;

Doesn't of_get_child_by_name work here?

> +       }
> +       /* no symbols, no problem */
> +       of_node_put(root_sym);
> +       return 0;
> +
> +found:

As Marek said, get rid of the goto.

> +       err = -EINVAL;
> +       for_each_property_of_node(child, prop) {
> +
> +               /* skip properties added automatically */
> +               if (of_prop_cmp(prop->name, "name") == 0)
> +                       continue;
> +
> +               err = of_property_read_string(child,
> +                               prop->name, &path);
> +               if (err != 0) {
> +                       pr_err("%s: Could not find symbol '%s'\n",
> +                                       __func__, prop->name);

Can you introduce and use a common pr_fmt prefix here and elsewhere
(just what you are adding).

> +                       continue;
> +               }
> +
> +

Extra blank line.

> +               /* now find fragment index */
> +               s = path;
> +
> +               /* compare paths to find fragment index */
> +               ovinfo = NULL;
> +               len = -1;

Move these into the for init.

> +               for (i = 0; i < ov->count; i++) {
> +                       ovinfo = &ov->ovinfo_tab[i];
> +
> +                       pr_debug("%s: #%d: overlay->name=%s target->name=%s\n",
> +                                       __func__, i, ovinfo->overlay->full_name,
> +                                       ovinfo->target->full_name);
> +
> +                       len = strlen(ovinfo->overlay->full_name);
> +                       if (strncasecmp(path, ovinfo->overlay->full_name,
> +                                               len) == 0 && path[len] == '/')
> +                               break;
> +               }
> +
> +               if (i >= ov->count)
> +                       continue;
> +
> +               pr_debug("%s: found target at #%d\n", __func__, i);
> +               new_path = kasprintf(GFP_KERNEL, "%s%s",
> +                               ovinfo->target->full_name,
> +                               path + len);
> +               if (!new_path) {
> +                       pr_err("%s: Failed to allocate propname for \"%s\"\n",
> +                                       __func__, prop->name);
> +                       continue;

If this fails, is there much point in continuing?

> +               }
> +
> +               err = of_changeset_add_property_string(&ov->cset, root_sym,
> +                               prop->name, new_path);
> +
> +               /* free always */
> +               kfree(new_path);
> +
> +               if (err) {

No need for brackets.

> +                       pr_err("%s: Failed to add property for \"%s\"\n",
> +                                       __func__, prop->name);
> +               }
> +       }
> +
> +       of_node_put(child);
> +       of_node_put(root_sym);
> +
> +       return 0;
> +}
> +
>  static LIST_HEAD(ov_list);
>  static DEFINE_IDR(ov_idr);
>
> @@ -642,6 +737,13 @@ static int __of_overlay_create(struct device_node *tree,
>                 goto err_abort_trans;
>         }
>
> +       err = of_overlay_add_symbols(tree, ov);
> +       if (err) {
> +               pr_err("%s: of_overlay_add_symbols() failed for tree@%s\n",
> +                               __func__, tree->full_name);
> +               goto err_abort_trans;
> +       }
> +
>         /* apply the changeset */
>         err = __of_changeset_apply(&ov->cset);
>         if (err) {
> --
> 1.7.12
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
