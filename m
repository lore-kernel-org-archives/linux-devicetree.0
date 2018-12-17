From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/2] of: of_node_get()/of_node_put() nodes held in phandle cache
Date: Mon, 17 Dec 2018 21:43:19 +1100
Message-ID: <874lbcv3g8.fsf@concordia.ellerman.id.au>
References: <1545033396-24485-1-git-send-email-frowand.list@gmail.com> <1545033396-24485-2-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545033396-24485-2-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com, robh+dt@kernel.org, Michael Bringmann <mwb@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, Thomas Falcon <tlfalcon@linux.vnet.ibm.com>, Juliet Kim <minkim@us.ibm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Frank,

frowand.list@gmail.com writes:
> From: Frank Rowand <frank.rowand@sony.com>
>
> The phandle cache contains struct device_node pointers.  The refcount
> of the pointers was not incremented while in the cache, allowing use
> after free error after kfree() of the node.  Add the proper increment
> and decrement of the use count.
>
> Fixes: 0b3ce78e90fc ("of: cache phandle nodes to reduce cost of of_find_node_by_phandle()")

Can we also add:

Cc: stable@vger.kernel.org # v4.17+


This and the next patch solve WARN_ONs and other problems for us on some
systems so I think they meet the criteria for a stable backport.

Rest of the patch LGTM, I'm not able to test it unfortunately, I have to
defer to mwb for that.

cheers

> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 09692c9b32a7..6c33d63361b8 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -116,9 +116,6 @@ int __weak of_node_to_nid(struct device_node *np)
>  }
>  #endif
>  
> -static struct device_node **phandle_cache;
> -static u32 phandle_cache_mask;
> -
>  /*
>   * Assumptions behind phandle_cache implementation:
>   *   - phandle property values are in a contiguous range of 1..n
> @@ -127,6 +124,44 @@ int __weak of_node_to_nid(struct device_node *np)
>   *   - the phandle lookup overhead reduction provided by the cache
>   *     will likely be less
>   */
> +
> +static struct device_node **phandle_cache;
> +static u32 phandle_cache_mask;
> +
> +/*
> + * Caller must hold devtree_lock.
> + */
> +static void __of_free_phandle_cache(void)
> +{
> +	u32 cache_entries = phandle_cache_mask + 1;
> +	u32 k;
> +
> +	if (!phandle_cache)
> +		return;
> +
> +	for (k = 0; k < cache_entries; k++)
> +		of_node_put(phandle_cache[k]);
> +
> +	kfree(phandle_cache);
> +	phandle_cache = NULL;
> +}
> +
> +int of_free_phandle_cache(void)
> +{
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&devtree_lock, flags);
> +
> +	__of_free_phandle_cache();
> +
> +	raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +
> +	return 0;
> +}
> +#if !defined(CONFIG_MODULES)
> +late_initcall_sync(of_free_phandle_cache);
> +#endif
> +
>  void of_populate_phandle_cache(void)
>  {
>  	unsigned long flags;
> @@ -136,8 +171,7 @@ void of_populate_phandle_cache(void)
>  
>  	raw_spin_lock_irqsave(&devtree_lock, flags);
>  
> -	kfree(phandle_cache);
> -	phandle_cache = NULL;
> +	__of_free_phandle_cache();
>  
>  	for_each_of_allnodes(np)
>  		if (np->phandle && np->phandle != OF_PHANDLE_ILLEGAL)
> @@ -155,30 +189,15 @@ void of_populate_phandle_cache(void)
>  		goto out;
>  
>  	for_each_of_allnodes(np)
> -		if (np->phandle && np->phandle != OF_PHANDLE_ILLEGAL)
> +		if (np->phandle && np->phandle != OF_PHANDLE_ILLEGAL) {
> +			of_node_get(np);
>  			phandle_cache[np->phandle & phandle_cache_mask] = np;
> +		}
>  
>  out:
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  }
>  
> -int of_free_phandle_cache(void)
> -{
> -	unsigned long flags;
> -
> -	raw_spin_lock_irqsave(&devtree_lock, flags);
> -
> -	kfree(phandle_cache);
> -	phandle_cache = NULL;
> -
> -	raw_spin_unlock_irqrestore(&devtree_lock, flags);
> -
> -	return 0;
> -}
> -#if !defined(CONFIG_MODULES)
> -late_initcall_sync(of_free_phandle_cache);
> -#endif
> -
>  void __init of_core_init(void)
>  {
>  	struct device_node *np;
> @@ -1195,8 +1214,11 @@ struct device_node *of_find_node_by_phandle(phandle handle)
>  	if (!np) {
>  		for_each_of_allnodes(np)
>  			if (np->phandle == handle) {
> -				if (phandle_cache)
> +				if (phandle_cache) {
> +					/* will put when removed from cache */
> +					of_node_get(np);
>  					phandle_cache[masked_handle] = np;
> +				}
>  				break;
>  			}
>  	}
> -- 
> Frank Rowand <frank.rowand@sony.com>
