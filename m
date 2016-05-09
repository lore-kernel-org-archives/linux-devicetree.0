From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] of: rename *_node_sysfs to _node_post
Date: Mon, 9 May 2016 16:49:05 -0500
Message-ID: <CAL_JsqLZuQhDouK_Qd3WWuDHik2iYogeSyAY5+Bn8VDGdWiX4w@mail.gmail.com>
References: <1462817488-8370-1-git-send-email-pantelis.antoniou@konsulko.com> <1462817488-8370-2-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462817488-8370-2-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 9, 2016 at 1:11 PM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:

The "why" goes here.

> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/of/base.c       |  4 ++--
>  drivers/of/dynamic.c    | 10 +++++-----
>  drivers/of/of_private.h |  4 ++--
>  drivers/of/unittest.c   |  4 ++--
>  4 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 9bbca56..20bbc2f 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -156,7 +156,7 @@ int __of_add_property_sysfs(struct device_node *np, struct property *pp)
>         return rc;
>  }
>
> -int __of_attach_node_sysfs(struct device_node *np)
> +int __of_attach_node_post(struct device_node *np)
>  {
>         const char *name;
>         struct property *pp;
> @@ -203,7 +203,7 @@ void __init of_core_init(void)
>                 return;
>         }
>         for_each_of_allnodes(np)
> -               __of_attach_node_sysfs(np);
> +               __of_attach_node_post(np);
>         mutex_unlock(&of_mutex);
>
>         /* Symlink in /proc as required by userspace ABI */
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index 350b1cf..eb31a55 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -41,7 +41,7 @@ void of_node_put(struct device_node *node)
>  }
>  EXPORT_SYMBOL(of_node_put);
>
> -void __of_detach_node_sysfs(struct device_node *np)
> +void __of_detach_node_post(struct device_node *np)
>  {
>         struct property *pp;
>
> @@ -251,7 +251,7 @@ int of_attach_node(struct device_node *np)
>         __of_attach_node(np);
>         raw_spin_unlock_irqrestore(&devtree_lock, flags);
>
> -       __of_attach_node_sysfs(np);
> +       __of_attach_node_post(np);
>         mutex_unlock(&of_mutex);
>
>         of_reconfig_notify(OF_RECONFIG_ATTACH_NODE, &rd);
> @@ -304,7 +304,7 @@ int of_detach_node(struct device_node *np)
>         __of_detach_node(np);
>         raw_spin_unlock_irqrestore(&devtree_lock, flags);
>
> -       __of_detach_node_sysfs(np);
> +       __of_detach_node_post(np);
>         mutex_unlock(&of_mutex);
>
>         of_reconfig_notify(OF_RECONFIG_DETACH_NODE, &rd);
> @@ -628,10 +628,10 @@ static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
>
>         switch (ce->action) {
>         case OF_RECONFIG_ATTACH_NODE:
> -               __of_attach_node_sysfs(ce->np);
> +               __of_attach_node_post(ce->np);
>                 break;
>         case OF_RECONFIG_DETACH_NODE:
> -               __of_detach_node_sysfs(ce->np);
> +               __of_detach_node_post(ce->np);
>                 break;
>         case OF_RECONFIG_ADD_PROPERTY:
>                 /* ignore duplicate names */
> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> index 092cba7..10b0342 100644
> --- a/drivers/of/of_private.h
> +++ b/drivers/of/of_private.h
> @@ -79,9 +79,9 @@ extern void __of_update_property_sysfs(struct device_node *np,
>                 struct property *newprop, struct property *oldprop);
>
>  extern void __of_attach_node(struct device_node *np);
> -extern int __of_attach_node_sysfs(struct device_node *np);
> +extern int __of_attach_node_post(struct device_node *np);
>  extern void __of_detach_node(struct device_node *np);
> -extern void __of_detach_node_sysfs(struct device_node *np);
> +extern void __of_detach_node_post(struct device_node *np);
>
>  /* iterators for transactions, used for overlays */
>  /* forward iterator */
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index e5a5ec0..7ea3689 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -931,7 +931,7 @@ static int attach_node_and_children(struct device_node *np)
>         of_node_clear_flag(np, OF_DETACHED);
>         raw_spin_unlock_irqrestore(&devtree_lock, flags);
>
> -       __of_attach_node_sysfs(np);
> +       __of_attach_node_post(np);
>         mutex_unlock(&of_mutex);
>
>         while (child) {
> @@ -989,7 +989,7 @@ static int __init unittest_data_add(void)
>         if (!of_root) {
>                 of_root = unittest_data_node;
>                 for_each_of_allnodes(np)
> -                       __of_attach_node_sysfs(np);
> +                       __of_attach_node_post(np);
>                 of_aliases = of_find_node_by_path("/aliases");
>                 of_chosen = of_find_node_by_path("/chosen");
>                 return 0;
> --
> 1.7.12
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
