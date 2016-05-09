From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] of: Support hashtable lookups for phandles
Date: Mon, 9 May 2016 16:21:57 -0500
Message-ID: <CAL_JsqLyKs02A0dhJAKZ2H38biJ4ufYg3-KyA2r1u=C+2ZowFA@mail.gmail.com>
References: <1462817488-8370-1-git-send-email-pantelis.antoniou@konsulko.com> <1462817488-8370-3-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462817488-8370-3-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 9, 2016 at 1:11 PM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:

Why this is needed goes here.

Any data on how much time the current code takes?

> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/of/base.c       | 35 ++++++++++++++++++++++++++++++++---
>  drivers/of/dynamic.c    |  8 ++++++++
>  drivers/of/of_private.h | 31 +++++++++++++++++++++++++++++++
>  include/linux/of.h      |  2 ++
>  4 files changed, 73 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 20bbc2f..770cb95 100644
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
> @@ -41,6 +42,16 @@ static const char *of_stdout_options;
>
>  struct kset *of_kset;
>
> +const struct rhashtable_params of_phandle_ht_params = {
> +       .key_offset = offsetof(struct device_node, phandle), /* base offset */
> +       .key_len = sizeof(phandle),
> +       .head_offset = offsetof(struct device_node, ht_node),
> +       .automatic_shrinking = true,
> +};
> +
> +struct rhashtable of_phandle_ht;
> +bool of_phandle_ht_initialized;

Get rid of this and of_phandle_ht_available. It should always be initialized.

> +
>  /*
>   * Used to protect the of_aliases, to hold off addition of nodes to sysfs.
>   * This mutex must be held whenever modifications are being made to the
> @@ -162,6 +173,12 @@ int __of_attach_node_post(struct device_node *np)
>         struct property *pp;
>         int rc;
>
> +       if (of_phandle_ht_available()) {
> +               rc = of_phandle_ht_insert(np);
> +               WARN(rc, "insert to phandle hash fail @%s\n",
> +                               of_node_full_name(np));
> +       }
> +
>         if (!IS_ENABLED(CONFIG_SYSFS))
>                 return 0;
>
> @@ -194,6 +211,13 @@ void __init of_core_init(void)
>         struct device_node *np;
>         int ret;
>
> +       ret = rhashtable_init(&of_phandle_ht, &of_phandle_ht_params);
> +       if (ret) {
> +               pr_warn("devicetree: Failed to initialize hashtable\n");
> +               return;
> +       }
> +       of_phandle_ht_initialized = 1;
> +
>         /* Create the kset, and register existing nodes */
>         mutex_lock(&of_mutex);
>         of_kset = kset_create_and_add("devicetree", NULL, firmware_kobj);
> @@ -1073,9 +1097,14 @@ struct device_node *of_find_node_by_phandle(phandle handle)
>                 return NULL;
>
>         raw_spin_lock_irqsave(&devtree_lock, flags);
> -       for_each_of_allnodes(np)
> -               if (np->phandle == handle)
> -                       break;
> +       /* when we're ready use the hash table */
> +       if (of_phandle_ht_available() && !in_interrupt())
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
> index eb31a55..bdebdf5 100644
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
> +               rc = of_phandle_ht_remove(np);
> +               WARN(rc, "remove from phandle hash fail @%s\n",
> +                               of_node_full_name(np));

Can this really fail?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
