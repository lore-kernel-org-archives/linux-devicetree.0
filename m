From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: handle NULL node in of_get_next_available_child
Date: Tue, 27 May 2014 12:19:30 +0100
Message-ID: <20140527111930.696AAC4156C@trevor.secretlab.ca>
References: <1400874192-29400-1-git-send-email-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400874192-29400-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 23 May 2014 12:43:11 -0700, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Add an early check for the node argument in
> of_get_next_available_child() to avoid dereferencing a NULL node pointer
> a few lines after.
> 
> CC: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Is there a bug that exposed this path? I'd like some more justification
before merging this patch, particularly considering of_get_next_child()
doesn't check for it either, but you're not modifying that function.

g.

> ---
>  drivers/of/base.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index e67b308819c9..9a71bfac78ae 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -746,6 +746,9 @@ struct device_node *of_get_next_available_child(const struct device_node *node,
>  	struct device_node *next;
>  	unsigned long flags;
>  
> +	if (!node)
> +		return NULL;
> +
>  	raw_spin_lock_irqsave(&devtree_lock, flags);
>  	next = prev ? prev->sibling : node->child;
>  	for (; next; next = next->sibling) {
> -- 
> 1.9.1
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
