From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: use hash based search in of_find_node_by_phandle
Date: Thu, 25 Jan 2018 08:50:18 -0600
Message-ID: <CAL_JsqLSGS+XDzhWFNaBGHtzsrEQm+SA8TkmdUKXc-16EyG_6g@mail.gmail.com>
References: <1516875247-19599-1-git-send-email-cpandya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516875247-19599-1-git-send-email-cpandya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chintan Pandya <cpandya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 25, 2018 at 4:14 AM, Chintan Pandya <cpandya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> of_find_node_by_phandle() takes a lot of time finding

Got some numbers for what is "a lot of time"?

> right node when your intended device is too right-side
> in the fdt. Reason is, we search each device serially
> from the fdt, starting from left-most to right-most.

By right side, you mean a deep path?

>
> Implement, device-phandle relation in hash-table so
> that look up can be faster.
>
> Change-Id: I4a2bc7eff6de142e4f91a7bf474893a45e61c128

Run checkpatch.pl

> Signed-off-by: Chintan Pandya <cpandya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  drivers/of/base.c  |  9 +++++++--
>  drivers/of/fdt.c   | 18 ++++++++++++++++++
>  include/linux/of.h |  6 ++++++
>  3 files changed, 31 insertions(+), 2 deletions(-)

[...]

> diff --git a/include/linux/of.h b/include/linux/of.h
> index 299aeb1..5b3f4f1 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -25,6 +25,7 @@
>  #include <linux/notifier.h>
>  #include <linux/property.h>
>  #include <linux/list.h>
> +#include <linux/hashtable.h>
>
>  #include <asm/byteorder.h>
>  #include <asm/errno.h>
> @@ -61,6 +62,7 @@ struct device_node {
>         struct  kobject kobj;
>         unsigned long _flags;
>         void    *data;
> +       struct hlist_node hash;

Always base your patches on the latest -rc at least. This won't apply.

This grows struct device_node for every single node which we recently
worked on to shrink (which is why this won't apply). So I'm now
sensitive to anything that grows it. I'd really prefer something out
of band.

I'd guess that there's really only a few phandle lookups that occur
over and over. The clock controller, interrupt controller, etc. What
if you just had a simple array of previously found nodes for a cache
and of_find_node_by_phandle can check that array first. Probably 8-16
entries would be enough. If that still has too much trashing, you
could also have a lookup count for each entry and expel the least used
first. Or maybe the list_lru would work here.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
