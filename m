From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] devicetree: of_node_put() does not require holding
 devtree_lock
Date: Sun, 26 Feb 2017 13:08:22 -0800
Message-ID: <58B343C6.9060604@gmail.com>
References: <1487755758-6066-1-git-send-email-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487755758-6066-1-git-send-email-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adding Rob.

On 02/22/17 01:29, Sakari Ailus wrote:
> While holding a reference to a device_node it is allowed to put that node
> without holding devtree_lock spinlock. Move of_node_put() after releasing
> the spinlock.

Please explain why the change fixes or improves the code.  In other words,
what is the point of the change?

Please use getmaintainer to find who to send the patch to.

-Frank


> 
> Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  drivers/of/base.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index d4bea3c..a8d7fed 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -286,8 +286,8 @@ struct device_node *of_find_all_nodes(struct device_node *prev)
>  	raw_spin_lock_irqsave(&devtree_lock, flags);
>  	np = __of_find_all_nodes(prev);
>  	of_node_get(np);
> -	of_node_put(prev);
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +	of_node_put(prev);
>  	return np;
>  }
>  EXPORT_SYMBOL(of_find_all_nodes);

< snip >

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
