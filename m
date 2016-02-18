From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] of/overlay: of overlay callbacks
Date: Wed, 17 Feb 2016 21:13:21 -0800
Message-ID: <CAAtXAHdYhWP==Vtt+i_0xOmSzZNmbJJuY470XLUxBSxmZ12BYw@mail.gmail.com>
References: <1455730885-1514-1-git-send-email-atull@opensource.altera.com>
	<1455730885-1514-2-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455730885-1514-2-git-send-email-atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Alan,

a couple of nits below.

On Wed, Feb 17, 2016 at 9:41 AM, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:

>
> +/*
> + * Send overlay callbacks to handlers that match.  This call is blocking.  In
Can we make this 'Invoke' instead of send?

> @@ -370,6 +448,13 @@ int of_overlay_create(struct device_node *tree)
>                 goto err_free_idr;
>         }
>
> +       err = send_overlay_callbacks(ov, OF_OVERLAY_PRE_APPLY);

Again ... maybe invoke ;-)

> +       if (err < 0) {
> +               pr_err("%s: Pre apply handler failed (err=%d)\n",
> +                      __func__, err);
> +               goto err_free_idr;
> +       }
> +
>         /* apply the overlay */
>         err = of_overlay_apply(ov);
>         if (err) {
> @@ -389,6 +474,8 @@ int of_overlay_create(struct device_node *tree)
>         /* add to the tail of the overlay list */
>         list_add_tail(&ov->node, &ov_list);
>
> +       send_overlay_callbacks(ov, OF_OVERLAY_POST_APPLY);

And again :)

> diff --git a/include/linux/of.h b/include/linux/of.h
> index dc6e396..def9481 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -101,9 +101,33 @@ static inline int of_node_is_attached(struct device_node *node)
>         return node && node->kobj.state_in_sysfs;
>  }
>
> +/* Callback types */
> +#define OF_OVERLAY_PRE_APPLY   (0)
> +#define OF_OVERLAY_POST_APPLY  (1)
> +#define OF_OVERLAY_PRE_REMOVE  (2)
> +#define OF_OVERLAY_POST_REMOVE (3)

Can we make this an enum?

Cheers,

Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
