From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: dynamic: fix memory leak related to properties of __of_node_dup
Date: Fri, 13 Oct 2017 15:47:09 -0500
Message-ID: <CAL_JsqK0pc6sL+YR2U-J44fvwKivmxiULD5uc7bzTMEOZ_LKXg@mail.gmail.com>
References: <1507858967-40416-1-git-send-email-alan.1.wang@nokia-sbell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507858967-40416-1-git-send-email-alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alawang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 12, 2017 at 8:42 PM, alawang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org> wrote:
> It is possible a node was dynamically allocated but without any
> property. The properies will be got from devices and added to the
> node when devices got connected.
> When release this node, all properties of which had been moved to
> deadprops.
> In this case, the properties in the deadprops list are never
> deallocated.

This is not new, right? Do you actually hit this case? If so, how?

>
> Signed-off-by: alawang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
> ---
>  drivers/of/dynamic.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index 301b6db..465d43b 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -335,6 +335,10 @@ void of_node_release(struct kobject *kobj)
>         if (!of_node_check_flag(node, OF_DYNAMIC))
>                 return;
>
> +       if (!prop) {
> +               prop = node->deadprops;
> +               node->deadprops = NULL;
> +       }
>         while (prop) {
>                 struct property *next = prop->next;
>                 kfree(prop->name);
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
