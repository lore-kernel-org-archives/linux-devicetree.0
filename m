From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] of: cache phandle nodes to reduce cost of
 of_find_node_by_phandle()
Date: Sun, 11 Feb 2018 22:58:57 -0800
Message-ID: <dc3c66d5-b848-d1cc-48f4-cabeccc2e383@gmail.com>
References: <1518416868-8804-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518416868-8804-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cpandya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/11/18 22:27, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
> 
> Create a cache of the nodes that contain a phandle property.  Use this
> cache to find the node for a given phandle value instead of scanning
> the devicetree to find the node.  If the phandle value is not found
> in the cache, of_find_node_by_phandle() will fall back to the tree
> scan algorithm.
> 
> The cache is initialized in of_core_init().
> 
> The cache is freed via a late_initcall_sync() if modules are not
> enabled.
> 
> Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
> ---
> 
> Changes since v1:
>   - change short description from
>     of: cache phandle nodes to reduce cost of of_find_node_by_phandle()
>   - rebase on v4.16-rc1
>   - reorder new functions in base.c to avoid forward declaration
>   - add locking around kfree(phandle_cache) for memory ordering
>   - add explicit check for non-null of phandle_cache in
>     of_find_node_by_phandle().  There is already a check for !handle,
>     which prevents accessing a null phandle_cache, but that dependency
>     is not obvious, so this check makes it more apparent.
>   - do not free phandle_cache if modules are enabled, so that
>     cached phandles will be available when modules are loaded
> 
>  drivers/of/base.c       | 93 ++++++++++++++++++++++++++++++++++++++++++++++---
>  drivers/of/of_private.h |  5 +++
>  drivers/of/resolver.c   | 21 -----------
>  3 files changed, 94 insertions(+), 25 deletions(-)
> 

< snip >

Hi Chintan,

Just as in the previous version, this part of the patch will not apply
on older kernel versions, and can just be deleted:

> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
> index 740d19bde601..a7580c24737a 100644
> --- a/drivers/of/resolver.c
> +++ b/drivers/of/resolver.c
> @@ -19,27 +19,6 @@
>  
>  #include "of_private.h"
>  
> -/* illegal phandle value (set when unresolved) */
> -#define OF_PHANDLE_ILLEGAL	0xdeadbeef
> -
> -static phandle live_tree_max_phandle(void)
> -{
> -	struct device_node *node;
> -	phandle phandle;
> -	unsigned long flags;
> -
> -	raw_spin_lock_irqsave(&devtree_lock, flags);
> -	phandle = 0;
> -	for_each_of_allnodes(node) {
> -		if (node->phandle != OF_PHANDLE_ILLEGAL &&
> -				node->phandle > phandle)
> -			phandle = node->phandle;
> -	}
> -	raw_spin_unlock_irqrestore(&devtree_lock, flags);
> -
> -	return phandle;
> -}
> -
>  static void adjust_overlay_phandles(struct device_node *overlay,
>  		int phandle_delta)
>  {
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
