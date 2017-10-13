From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: overlay: fix memory leak related to duplicated property
Date: Fri, 13 Oct 2017 15:49:20 -0500
Message-ID: <CAL_JsqJK2pEQOY68iin6MxLXiMnVHp6+SW17GNp=bWaoJ2RGbw@mail.gmail.com>
References: <1507859591-2337-1-git-send-email-alan.1.wang@nokia-sbell.com> <1507864056-52089-1-git-send-email-alan.1.wang@nokia-sbell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507864056-52089-1-git-send-email-alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lixin Wang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 12, 2017 at 10:07 PM, Lixin Wang
<alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org> wrote:
> From: alawang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
>
> Hello,
>
> Sorry It was my fault in last email that wrote the wrong subject and sign off name.
> Correct them this time.
> Thanks

This has to go below the '---' or it ends up in the commit message.
Please resend.

>
> Function of_changeset_add_property or of_changeset_update_property may
> fails. In this case the property just allocated is never deallocated.
>
> Signed-off-by: Lixin Wang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
> ---
>  drivers/of/overlay.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 8ecfee3..af3b9a1 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -162,6 +162,7 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
>                 bool is_symbols_node)
>  {
>         struct property *propn = NULL, *tprop;
> +       int ret = 0;
>
>         /* NOTE: Multiple changes of single properties not supported */
>         tprop = of_find_property(target, prop->name, NULL);
> @@ -186,10 +187,16 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
>
>         /* not found? add */
>         if (tprop == NULL)
> -               return of_changeset_add_property(&ov->cset, target, propn);
> -
> -       /* found? update */
> -       return of_changeset_update_property(&ov->cset, target, propn);
> +               ret = of_changeset_add_property(&ov->cset, target, propn);
> +       else /* found? update */
> +               ret = of_changeset_update_property(&ov->cset, target, propn);
> +
> +       if (ret) {
> +               kfree(propn->name);
> +               kfree(propn->value);
> +               kfree(propn);
> +       }
> +       return ret;
>  }
>
>  static int of_overlay_apply_single_device_node(struct of_overlay *ov,
> --
> 2.6.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
