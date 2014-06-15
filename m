From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH] OF: fix of_find_node_by_path() assumption that of_allnodes
 is root
Date: Sat, 14 Jun 2014 20:42:06 -0700
Message-ID: <539D160E.5080208@gmail.com>
References: <539A91E2.7000606@gmail.com> <CAL_JsqJ+f0CjwGnqTzXjMOAvbDOf0O3BZgcQwrzaWBy9Gwiw8A@mail.gmail.com> <CACxGe6sG+h7j9Npd-xR4-E13i=_p8OtbisgJv1PUzf981nGHUw@mail.gmail.com> <CACxGe6tv8H8yUYCs9N959T3KKDUDiDqJQ1LRfO5RJE3bxw5r5A@mail.gmail.com> <539D14CA.1060105@gmail.com> <539D1559.8080603@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <539D1559.8080603-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 6/14/2014 8:39 PM, Frank Rowand wrote:
> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> 
> of_find_node_by_path() is borked because of_allnodes is not guaranteed to
> contain the root of the tree after using any of the dynamic update functions
> because some other nodes ends up as of_allnodes.
> 
> Fixes: c22e650e66b8 of: Make of_find_node_by_path() handle /aliases
> Reported-by: pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org
> Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> ---
> 
> v2:
>   Remove change to function header, no longer needed.
>   Remove BUG_ON(), no longer needed.
>   Add np as np->parent->allnext instead of np->parent->allnext, as suggested

Aaaargh, cut and paste error, that should be:

    Add np as np->parent->allnext instead of of_allnodes->allnext, as suggested

>     by Grant Likely.
> 
> 
>  drivers/of/base.c |    4 	2 +	2 -	0 !
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Index: b/drivers/of/base.c
> ===================================================================
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1960,9 +1960,9 @@ int of_attach_node(struct device_node *n
>  
>  	raw_spin_lock_irqsave(&devtree_lock, flags);
>  	np->sibling = np->parent->child;
> -	np->allnext = of_allnodes;
> +	np->allnext = np->parent->allnext;
> +	np->parent->allnext = np;
>  	np->parent->child = np;
> -	of_allnodes = np;
>  	of_node_clear_flag(np, OF_DETACHED);
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
