From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/9] genalloc: add a global pool list, allow to find
 pools by phys address
Date: Mon, 3 Sep 2012 10:09:35 +0800
Message-ID: <20120903020933.GC2362@S2101-09.ap.freescale.net>
References: <1346405224-20399-1-git-send-email-p.zabel@pengutronix.de>
 <1346405224-20399-6-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1346405224-20399-6-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Huang Shijie <shijie8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 31, 2012 at 11:27:00AM +0200, Philipp Zabel wrote:
> This patch keeps all created pools in a global list and adds two
> functions that allow to retrieve the gen_pool pointer from a known
> physical address and from a device tree node.
> 
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  include/linux/genalloc.h |   14 +++++++++
>  lib/genalloc.c           |   77 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 91 insertions(+)
> 
> diff --git a/include/linux/genalloc.h b/include/linux/genalloc.h
> index 5e98eeb..46ff435 100644
> --- a/include/linux/genalloc.h
> +++ b/include/linux/genalloc.h
> @@ -33,6 +33,7 @@
>   *  General purpose special memory pool descriptor.
>   */
>  struct gen_pool {
> +	struct list_head next_pool;	/* pool in global list */
>  	spinlock_t lock;
>  	struct list_head chunks;	/* list of chunks in this pool */
>  	int min_alloc_order;		/* minimum allocation order */
> @@ -78,4 +79,17 @@ extern void gen_pool_for_each_chunk(struct gen_pool *,
>  	void (*)(struct gen_pool *, struct gen_pool_chunk *, void *), void *);
>  extern size_t gen_pool_avail(struct gen_pool *);
>  extern size_t gen_pool_size(struct gen_pool *);
> +extern struct gen_pool *gen_pool_find_by_phys(phys_addr_t phys);
> +
> +#ifdef CONFIG_OF
> +struct device_node;

This should be put above/outside #ifdef, as it's used in #else block
as well?

> +extern struct gen_pool *of_get_named_gen_pool(struct device_node *np,
> +	const char *propname, int index);
> +#else
> +inline struct gen_pool *of_get_named_gen_pool(struct device_node *np,
> +	const char *propname, int index)
> +{
> +	return NULL;
> +}
> +#endif
>  #endif /* __GENALLOC_H__ */
> diff --git a/lib/genalloc.c b/lib/genalloc.c
> index 6bc04aa..df2d8f9 100644
> --- a/lib/genalloc.c
> +++ b/lib/genalloc.c
> @@ -34,6 +34,11 @@
>  #include <linux/rculist.h>
>  #include <linux/interrupt.h>
>  #include <linux/genalloc.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +
> +static LIST_HEAD(pools);
> +static DEFINE_SPINLOCK(list_lock);
>  
>  static int set_bits_ll(unsigned long *addr, unsigned long mask_to_set)
>  {
> @@ -152,6 +157,9 @@ struct gen_pool *gen_pool_create(int min_alloc_order, int nid)
>  		spin_lock_init(&pool->lock);
>  		INIT_LIST_HEAD(&pool->chunks);
>  		pool->min_alloc_order = min_alloc_order;
> +		spin_lock(&list_lock);
> +		list_add_rcu(&pool->next_pool, &pools);
> +		spin_unlock(&list_lock);
>  	}
>  	return pool;
>  }
> @@ -234,6 +242,9 @@ void gen_pool_destroy(struct gen_pool *pool)
>  	int order = pool->min_alloc_order;
>  	int bit, end_bit;
>  
> +	spin_lock(&list_lock);
> +	list_del_rcu(&pool->next_pool);
> +	spin_unlock(&list_lock);
>  	list_for_each_safe(_chunk, _next_chunk, &pool->chunks) {
>  		chunk = list_entry(_chunk, struct gen_pool_chunk, next_chunk);
>  		list_del(&chunk->next_chunk);
> @@ -400,3 +411,69 @@ size_t gen_pool_size(struct gen_pool *pool)
>  	return size;
>  }
>  EXPORT_SYMBOL_GPL(gen_pool_size);
> +
> +/**
> + * gen_pool_find_by_phys - find a pool by physical start address
> + * @phys: physical address as added with gen_pool_add_virt
> + *
> + * Returns the pool that contains the chunk starting at phys,
> + * or NULL if not found.
> + */
> +struct gen_pool *gen_pool_find_by_phys(phys_addr_t phys)
> +{
> +	struct gen_pool *pool, *found = NULL;
> +	struct gen_pool_chunk *chunk;
> +
> +	rcu_read_lock();
> +	list_for_each_entry_rcu(pool, &pools, next_pool) {
> +		list_for_each_entry_rcu(chunk, &pool->chunks, next_chunk) {
> +			if (phys == chunk->phys_addr) {
> +				found = pool;
> +				break;
> +			}
> +		}
> +	}
> +	rcu_read_unlock();
> +
> +	return found;
> +}
> +EXPORT_SYMBOL_GPL(gen_pool_find_by_phys);
> +
> +#ifdef CONFIG_OF
> +/**
> + * of_get_named_gen_pool - find a pool by the physical address in

"in" what?

> + * @np: device node

@propname
@index

> + *
> + * Returns the pool that contains the chunk starting at the physical
> + * address of the np device node, or NULL if not found.
> + */
> +struct gen_pool *of_get_named_gen_pool(struct device_node *np,
> +	const char *propname, int index)
> +{
> +	struct property *prop;
> +	const __be32 *list;
> +	int size;
> +	phandle phandle;
> +	struct device_node *np_pool;
> +	const u32 *reg;
> +	u64 addr;
> +
> +	prop = of_find_property(np, propname, &size);
> +	if (!prop)
> +		return NULL;
> +	list = prop->value;
> +	size /= sizeof(*list);
> +	phandle = be32_to_cpup(list);
> +	np_pool = of_find_node_by_phandle(phandle);
> +	if (!np_pool)
> +		return NULL;

Helper of_parse_phandle() helps here.

> +	reg = of_get_property(np_pool, "reg", NULL);
> +	if (!reg)
> +		return NULL;
> +	addr = of_translate_address(np_pool, reg);
> +	if (addr == OF_BAD_ADDR)
> +		return NULL;

I would suggest use of_address_to_resource instead and then retrieve
the address from resource->start.

> +	return gen_pool_find_by_phys((phys_addr_t) addr);
> +}
> +EXPORT_SYMBOL_GPL(of_get_named_gen_pool);
> +#endif /* CONFIG_OF */
> -- 
> 1.7.10.4
> 

-- 
Regards,
Shawn
