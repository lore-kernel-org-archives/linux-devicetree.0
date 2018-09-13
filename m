Return-Path: <SRS0=FqlS=L3=gmail.com=frowand.list@kernel.org>
Subject: Re: [RFC PATCH] of: allocate / free phandle cache outside of the
 devtree_lock
References: <20180910154227.xsbbqvw3cayro4gg@linutronix.de>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <bf025894-beab-1cae-f87b-105fa341c0e0@gmail.com>
Date: Wed, 12 Sep 2018 18:01:49 -0700
MIME-Version: 1.0
In-Reply-To: <20180910154227.xsbbqvw3cayro4gg@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi Sebastion,

On 09/10/18 08:42, Sebastian Andrzej Siewior wrote:
> The phandle cache code allocates memory while holding devtree_lock which
> is a raw_spinlock_t. Memory allocation (and free()) is not possible on
> RT while a raw_spinlock_t is held.

I am assuming that by "RT" you mean "PREEMPT_RT".  Can you point me to the
current documentation about memory allocation and freeing with PREEMPT_RT
enabled so that I can update my understanding?  Especially why GFP_ATOMIC
is not sufficient for allocation.


> Invoke the kfree() and kcalloc() while the lock is dropped.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> 
> The devtree_lock lock is raw_spin_lock_t and as of today there are a few
> users which invoke a DT call via a smp_function_call and need it that
> way.

Can you please point me to these smp_call_function instances?


> If this is not acceptable, is there a reason not to use RCU lookups?
> Since every lookup requires to hold devtree_lock it makes parallel
> lookups not possible (not sure if it needed / happens, maybe only during
> boot).

Using locks on phandle lookup should not be a performance issue.  If someone
finds it to be an issue they should report it.

-Frank


> While looking through the code when the lock is held, I noticed that
> of_find_last_cache_level() is using a node after dropping a reference to
> it. With RCU, some modifications of the node would require making a copy
> of the node and then replacing the node.
> 
>  drivers/of/base.c |   22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -108,43 +108,49 @@ void of_populate_phandle_cache(void)
>  	u32 cache_entries;
>  	struct device_node *np;
>  	u32 phandles = 0;
> +	struct device_node **shadow;
>  
>  	raw_spin_lock_irqsave(&devtree_lock, flags);
> -
> -	kfree(phandle_cache);
> +	shadow = phandle_cache;
>  	phandle_cache = NULL;
>  
>  	for_each_of_allnodes(np)
>  		if (np->phandle && np->phandle != OF_PHANDLE_ILLEGAL)
>  			phandles++;
>  
> +	raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +
>  	cache_entries = roundup_pow_of_two(phandles);
>  	phandle_cache_mask = cache_entries - 1;
>  
> -	phandle_cache = kcalloc(cache_entries, sizeof(*phandle_cache),
> -				GFP_ATOMIC);
> -	if (!phandle_cache)
> -		goto out;
> +	kfree(shadow);
> +	shadow = kcalloc(cache_entries, sizeof(*phandle_cache), GFP_KERNEL);
> +
> +	if (!shadow)
> +		return;
> +	raw_spin_lock_irqsave(&devtree_lock, flags);
> +	phandle_cache = shadow;
>  
>  	for_each_of_allnodes(np)
>  		if (np->phandle && np->phandle != OF_PHANDLE_ILLEGAL)
>  			phandle_cache[np->phandle & phandle_cache_mask] = np;
>  
> -out:
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  }
>  
>  int of_free_phandle_cache(void)
>  {
>  	unsigned long flags;
> +	struct device_node **shadow;
>  
>  	raw_spin_lock_irqsave(&devtree_lock, flags);
>  
> -	kfree(phandle_cache);
> +	shadow = phandle_cache;
>  	phandle_cache = NULL;
>  
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  
> +	kfree(shadow);
>  	return 0;
>  }
>  #if !defined(CONFIG_MODULES)
> 
