From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/5] of: Support hashtable lookups for phandles
Date: Mon, 16 May 2016 14:37:20 -0500
Message-ID: <CAL_Jsq+J4QF5jvUOF_J71W0YWswTBSu=RZkwy+=gR2F-dwq7XA@mail.gmail.com>
References: <1463417556-23087-1-git-send-email-pantelis.antoniou@konsulko.com> <1463417556-23087-3-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463417556-23087-3-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 16, 2016 at 11:52 AM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> When a device tree contains a lot of phandles, resolving one
> takes time because the original method uses a search against
> all nodes (not just the ones with phandles).
>
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/of/base.c       | 41 ++++++++++++++++++++++++++++++++++++++---
>  drivers/of/dynamic.c    |  8 ++++++++
>  drivers/of/of_private.h | 33 +++++++++++++++++++++++++++++++++
>  include/linux/of.h      |  2 ++
>  4 files changed, 81 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 20bbc2f..436a088 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -27,6 +27,7 @@
>  #include <linux/slab.h>
>  #include <linux/string.h>
>  #include <linux/proc_fs.h>
> +#include <linux/rhashtable.h>
>
>  #include "of_private.h"
>
> @@ -41,6 +42,18 @@ static const char *of_stdout_options;
>
>  struct kset *of_kset;
>
> +const struct rhashtable_params of_phandle_ht_params = {

static

> +       .key_offset = offsetof(struct device_node, phandle), /* base offset */
> +       .key_len = sizeof(phandle),
> +       .head_offset = offsetof(struct device_node, ht_node),
> +       .automatic_shrinking = true,
> +};
> +
> +struct rhashtable *of_phandle_ht;
> +
> +/* default is false */
> +bool of_phandle_ht_is_disabled;

I think this should go. The unittest alone is not enough reason to keep.

> +
>  /*
>   * Used to protect the of_aliases, to hold off addition of nodes to sysfs.
>   * This mutex must be held whenever modifications are being made to the
> @@ -162,6 +175,12 @@ int __of_attach_node_post(struct device_node *np)
>         struct property *pp;
>         int rc;
>
> +       if (of_phandle_ht_available()) {

This can never be false as this function should only get called after init.

> +               rc = of_phandle_ht_insert(np);
> +               WARN(rc, "insert to phandle hash fail @%s\n",
> +                               of_node_full_name(np));
> +       }
> +
>         if (!IS_ENABLED(CONFIG_SYSFS))
>                 return 0;
>
> @@ -194,6 +213,17 @@ void __init of_core_init(void)
>         struct device_node *np;
>         int ret;
>
> +       of_phandle_ht = kzalloc(sizeof(*of_phandle_ht), GFP_KERNEL);
> +       if (!of_phandle_ht) {
> +               pr_warn("devicetree: Failed to allocate hashtable\n");
> +               return;
> +       }
> +       ret = rhashtable_init(of_phandle_ht, &of_phandle_ht_params);
> +       if (ret) {
> +               pr_warn("devicetree: Failed to initialize hashtable\n");
> +               return;
> +       }
> +
>         /* Create the kset, and register existing nodes */
>         mutex_lock(&of_mutex);
>         of_kset = kset_create_and_add("devicetree", NULL, firmware_kobj);
> @@ -1073,9 +1103,14 @@ struct device_node *of_find_node_by_phandle(phandle handle)
>                 return NULL;
>
>         raw_spin_lock_irqsave(&devtree_lock, flags);
> -       for_each_of_allnodes(np)
> -               if (np->phandle == handle)
> -                       break;
> +       /* when we're ready use the hash table (and not disabled) */
> +       if (of_phandle_ht_available() && !of_phandle_ht_is_disabled)

Just "if (of_phandle_ht)"

> +               np = of_phandle_ht_lookup(handle);
> +       else { /* fallback */
> +               for_each_of_allnodes(np)
> +                       if (np->phandle == handle)
> +                               break;
> +       }
>         of_node_get(np);
>         raw_spin_unlock_irqrestore(&devtree_lock, flags);
>         return np;
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index 34ca783..931b905 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -11,6 +11,7 @@
>  #include <linux/slab.h>
>  #include <linux/string.h>
>  #include <linux/proc_fs.h>
> +#include <linux/rhashtable.h>
>
>  #include "of_private.h"
>
> @@ -44,6 +45,13 @@ EXPORT_SYMBOL(of_node_put);
>  void __of_detach_node_post(struct device_node *np)
>  {
>         struct property *pp;
> +       int rc;
> +
> +       if (of_phandle_ht_available()) {

Likewise, this can't be false either.

> +               rc = of_phandle_ht_remove(np);
> +               WARN(rc, "remove from phandle hash fail @%s\n",
> +                               of_node_full_name(np));
> +       }
>
>         if (!IS_ENABLED(CONFIG_SYSFS))
>                 return;
> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> index 10b0342..386ae71 100644
> --- a/drivers/of/of_private.h
> +++ b/drivers/of/of_private.h
> @@ -101,4 +101,37 @@ static inline int of_overlay_init(void)
>  }
>  #endif
>
> +extern const struct rhashtable_params of_phandle_ht_params;
> +extern struct rhashtable *of_phandle_ht;
> +
> +/* for unittest use */
> +extern bool of_phandle_ht_is_disabled;
> +
> +static inline bool of_phandle_ht_available(void)
> +{
> +       return of_phandle_ht != NULL;
> +}
> +
> +static inline int of_phandle_ht_insert(struct device_node *np)
> +{
> +       if (!np || !np->phandle)
> +               return 0;
> +       return rhashtable_insert_fast(of_phandle_ht,
> +               &np->ht_node, of_phandle_ht_params);
> +}
> +
> +static inline int of_phandle_ht_remove(struct device_node *np)
> +{
> +       if (!np || !np->phandle)
> +               return 0;
> +       return rhashtable_remove_fast(of_phandle_ht,
> +               &np->ht_node, of_phandle_ht_params);
> +}
> +
> +static inline struct device_node *of_phandle_ht_lookup(phandle handle)
> +{
> +       return rhashtable_lookup_fast(of_phandle_ht,
> +                       &handle, of_phandle_ht_params);
> +}
> +
>  #endif /* _LINUX_OF_PRIVATE_H */
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 18a8e59..9de9a3f 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -25,6 +25,7 @@
>  #include <linux/notifier.h>
>  #include <linux/property.h>
>  #include <linux/list.h>
> +#include <linux/rhashtable.h>
>
>  #include <asm/byteorder.h>
>  #include <asm/errno.h>
> @@ -52,6 +53,7 @@ struct device_node {
>         phandle phandle;
>         const char *full_name;
>         struct fwnode_handle fwnode;
> +       struct rhash_head ht_node;

Place next to .phandle as both will be accessed at the same time.

>
>         struct  property *properties;
>         struct  property *deadprops;    /* removed properties */
> --
> 1.7.12
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
