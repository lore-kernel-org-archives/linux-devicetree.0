From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: fix reference counting in of_graph_get_endpoint_by_regs
Date: Wed, 22 Jun 2016 16:01:02 -0500
Message-ID: <CAL_JsqK7W6N7rbhkH-EF=-R5HtWqifS5VNaj0dYAeJo-DV=zWg@mail.gmail.com>
References: <1466157929-22594-1-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466157929-22594-1-git-send-email-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 17, 2016 at 5:05 AM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> The called of_graph_get_next_endpoint() already decrements the refcount
> of the prev node, so it is wrong to do it again in the calling function.
>
> Fixes: 8ccd0d0ca041
> (of: add helper for getting endpoint node of specific identifiers)
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Reported-by: David Jander <david-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
> Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  drivers/of/base.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index ebf84e3b56d5..6d8514c431f5 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -2310,7 +2310,6 @@ struct device_node *of_graph_get_endpoint_by_regs(
>
>         while (1) {
>                 node = of_graph_get_next_endpoint(parent, prev_node);
> -               of_node_put(prev_node);
>                 if (!node)
>                         break;

Can you convert this to use for_each_endpoint_of_node instead?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
