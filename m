From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/overlay: add of overlay notifications
Date: Tue, 1 Mar 2016 20:27:14 -0600
Message-ID: <CAL_Jsq+kkBBV=pYxn54ZRTCnj=cNDKw4o6qJ+z_Ze3JGLRq+aA@mail.gmail.com>
References: <1456523056-15352-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456523056-15352-1-git-send-email-atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 26, 2016 at 3:44 PM, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
> This patch add of overlay notifications.
>
> When DT overlays are being added, some drivers/subsystems
> need to see device tree overlays before the changes go into
> the live tree.
>
> This is distinct from reconfig notifiers that are
> post-apply or post-remove and which issue very granular
> notifications without providing access to the context
> of a whole overlay.
>
> The following 4 notificatons are issued:
>   OF_OVERLAY_PRE_APPLY
>   OF_OVERLAY_POST_APPLY
>   OF_OVERLAY_PRE_REMOVE
>   OF_OVERLAY_POST_REMOVE
>
> In the case of pre-apply notification, if the notifier
> returns error, the overlay will be rejected.
>
> This patch exports two functions for registering/unregistering
> notifications:
>   of_overlay_notifier_register(struct notifier_block *nb)
>   of_overlay_notifier_unregister(struct notifier_block *nb)
>
> The notification data includes pointers to the overlay
> target and the overlay:
>
> struct of_overlay_notify_data {
>        struct device_node *overlay;
>        struct device_node *target;
> };
>
> Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---
> v2: add missing 'static inline' in of.h
> ---
>  drivers/of/overlay.c |   47 ++++++++++++++++++++++++++++++++++++++++++++++-
>  include/linux/of.h   |   25 +++++++++++++++++++++++++
>  2 files changed, 71 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 8225081..a26f0ed 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -56,6 +56,41 @@ struct of_overlay {
>  static int of_overlay_apply_one(struct of_overlay *ov,
>                 struct device_node *target, const struct device_node *overlay);
>
> +static BLOCKING_NOTIFIER_HEAD(of_overlay_chain);
> +
> +int of_overlay_notifier_register(struct notifier_block *nb)
> +{
> +       return blocking_notifier_chain_register(&of_overlay_chain, nb);
> +}
> +EXPORT_SYMBOL_GPL(of_overlay_notifier_register);
> +
> +int of_overlay_notifier_unregister(struct notifier_block *nb)
> +{
> +       return blocking_notifier_chain_unregister(&of_overlay_chain, nb);
> +}
> +EXPORT_SYMBOL_GPL(of_overlay_notifier_unregister);
> +
> +static int of_overlay_notify(struct of_overlay *ov,
> +                            enum of_overlay_notify_action action)
> +{
> +       struct of_overlay_notify_data nd;
> +       int i, ret;
> +
> +       for (i = 0; i < ov->count; i++) {
> +               struct of_overlay_info *ovinfo = &ov->ovinfo_tab[i];
> +
> +               nd.target = ovinfo->target;
> +               nd.overlay = ovinfo->overlay;
> +
> +               ret = blocking_notifier_call_chain(&of_overlay_chain,
> +                                                  action, &nd);
> +               if (ret)
> +                       return notifier_to_errno(ret);
> +       }
> +
> +       return 0;
> +}
> +
>  static int of_overlay_apply_single_property(struct of_overlay *ov,
>                 struct device_node *target, struct property *prop)
>  {
> @@ -370,6 +405,13 @@ int of_overlay_create(struct device_node *tree)
>                 goto err_free_idr;
>         }
>
> +       err = of_overlay_notify(ov, OF_OVERLAY_PRE_APPLY);
> +       if (err < 0) {
> +               pr_err("%s: Pre-apply notifier failed (err=%d)\n",
> +                      __func__, err);
> +               goto err_free_idr;
> +       }
> +
>         /* apply the overlay */
>         err = of_overlay_apply(ov);
>         if (err) {
> @@ -389,6 +431,8 @@ int of_overlay_create(struct device_node *tree)
>         /* add to the tail of the overlay list */
>         list_add_tail(&ov->node, &ov_list);
>
> +       of_overlay_notify(ov, OF_OVERLAY_POST_APPLY);
> +
>         mutex_unlock(&of_mutex);

This means that any post-apply handlers can't make any calls that take
the mutex. Maybe that is fine? On the flip side, maybe we want to
prevent any changes while the notifiers are called.

The other calls could have similar issues. We should make sure we are
consistent.

>
>         return id;
> @@ -509,9 +553,10 @@ int of_overlay_destroy(int id)
>                 goto out;
>         }
>
> -
> +       of_overlay_notify(ov, OF_OVERLAY_PRE_REMOVE);
>         list_del(&ov->node);
>         __of_changeset_revert(&ov->cset);
> +       of_overlay_notify(ov, OF_OVERLAY_POST_REMOVE);
>         of_free_overlay_info(ov);
>         idr_remove(&ov_idr, id);
>         of_changeset_destroy(&ov->cset);
> diff --git a/include/linux/of.h b/include/linux/of.h
> index dc6e396..b79e1c5 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -1083,6 +1083,21 @@ int of_overlay_create(struct device_node *tree);
>  int of_overlay_destroy(int id);
>  int of_overlay_destroy_all(void);
>
> +enum of_overlay_notify_action {
> +       OF_OVERLAY_PRE_APPLY,
> +       OF_OVERLAY_POST_APPLY,
> +       OF_OVERLAY_PRE_REMOVE,
> +       OF_OVERLAY_POST_REMOVE,
> +};
> +
> +struct of_overlay_notify_data {
> +       struct device_node *overlay;
> +       struct device_node *target;
> +};

Both of these should be outside the ifdef. Otherwise, the !OF_OVERLAY
case will not compile.

> +
> +int of_overlay_notifier_register(struct notifier_block *nb);
> +int of_overlay_notifier_unregister(struct notifier_block *nb);
> +
>  #else
>
>  static inline int of_overlay_create(struct device_node *tree)
> @@ -1100,6 +1115,16 @@ static inline int of_overlay_destroy_all(void)
>         return -ENOTSUPP;
>  }
>
> +static inline int of_overlay_notifier_register(struct notifier_block *nb)
> +{
> +       return 0;
> +}
> +
> +static inline int of_overlay_notifier_unregister(struct notifier_block *nb)
> +{
> +       return 0;
> +}
> +
>  #endif
>
>  #endif /* _LINUX_OF_H */
> --
> 1.7.9.5
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
