From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: Re: [PATCH v5 1/4] genalloc: add a global pool list, allow to find
 pools by phys address
Date: Fri, 26 Oct 2012 15:46:08 -0400
Message-ID: <CAP=VYLq9E_bacNQpczQVbOZzYq4eznMPdmMaVMu3oV9Z3q_9pw@mail.gmail.com>
References: <1350570453-24546-1-git-send-email-p.zabel@pengutronix.de>
 <1350570453-24546-2-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1350570453-24546-2-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
Cc: Matt Porter <mporter-l0cyMroinI0@public.gmane.org>, Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Huang Shijie <shijie8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 18, 2012 at 10:27 AM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> This patch keeps all created pools in a global list and adds two
> functions that allow to retrieve the gen_pool pointer from a known
> physical address and from a device tree node.

So, I'm not seeing any added users of the of_get_named_gen_pool,
or the other exported "reverse-lookup" function.  Without that, the
anticipated use case is not clear to me.

Is there an example of some pending driver or similar, that has
a phys addr from an unknown source and needs to know what
pool it may or may not be in?  With the use case, someone might
be able to suggest alternative ways to get what you want done.

It might also be worth cross compiling this for powerpc, since the
header files you implicitly get included varies from one arch to
the next, and there might be some compile fails lurking there.

Thanks,
Paul.
--

>
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Reviewed-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  include/linux/genalloc.h |   14 ++++++++++
>  lib/genalloc.c           |   67 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 81 insertions(+)
>
> diff --git a/include/linux/genalloc.h b/include/linux/genalloc.h
> index dd7c569..91d606e 100644
> --- a/include/linux/genalloc.h
> +++ b/include/linux/genalloc.h
> @@ -47,6 +47,7 @@ typedef unsigned long (*genpool_algo_t)(unsigned long *map,
>   *  General purpose special memory pool descriptor.
>   */
>  struct gen_pool {
> +       struct list_head next_pool;     /* pool in global list */
>         spinlock_t lock;
>         struct list_head chunks;        /* list of chunks in this pool */
>         int min_alloc_order;            /* minimum allocation order */
> @@ -105,4 +106,17 @@ extern unsigned long gen_pool_first_fit(unsigned long *map, unsigned long size,
>  extern unsigned long gen_pool_best_fit(unsigned long *map, unsigned long size,
>                 unsigned long start, unsigned int nr, void *data);
>
> +extern struct gen_pool *gen_pool_find_by_phys(phys_addr_t phys);
> +
> +struct device_node;
> +#ifdef CONFIG_OF
> +extern struct gen_pool *of_get_named_gen_pool(struct device_node *np,
> +       const char *propname, int index);
> +#else
> +inline struct gen_pool *of_get_named_gen_pool(struct device_node *np,
> +       const char *propname, int index)
> +{
> +       return NULL;
> +}
> +#endif
>  #endif /* __GENALLOC_H__ */
> diff --git a/lib/genalloc.c b/lib/genalloc.c
> index ca208a9..d77d240 100644
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
> @@ -154,6 +159,9 @@ struct gen_pool *gen_pool_create(int min_alloc_order, int nid)
>                 pool->min_alloc_order = min_alloc_order;
>                 pool->algo = gen_pool_first_fit;
>                 pool->data = NULL;
> +               spin_lock(&list_lock);
> +               list_add_rcu(&pool->next_pool, &pools);
> +               spin_unlock(&list_lock);
>         }
>         return pool;
>  }
> @@ -236,6 +244,9 @@ void gen_pool_destroy(struct gen_pool *pool)
>         int order = pool->min_alloc_order;
>         int bit, end_bit;
>
> +       spin_lock(&list_lock);
> +       list_del_rcu(&pool->next_pool);
> +       spin_unlock(&list_lock);
>         list_for_each_safe(_chunk, _next_chunk, &pool->chunks) {
>                 chunk = list_entry(_chunk, struct gen_pool_chunk, next_chunk);
>                 list_del(&chunk->next_chunk);
> @@ -480,3 +491,59 @@ unsigned long gen_pool_best_fit(unsigned long *map, unsigned long size,
>         return start_bit;
>  }
>  EXPORT_SYMBOL(gen_pool_best_fit);
> +
> +/*
> + * gen_pool_find_by_phys - find a pool by physical start address
> + * @phys: physical address as added with gen_pool_add_virt
> + *
> + * Returns the pool that contains the chunk starting at phys,
> + * or NULL if not found.
> + */
> +struct gen_pool *gen_pool_find_by_phys(phys_addr_t phys)
> +{
> +       struct gen_pool *pool, *found = NULL;
> +       struct gen_pool_chunk *chunk;
> +
> +       rcu_read_lock();
> +       list_for_each_entry_rcu(pool, &pools, next_pool) {
> +               list_for_each_entry_rcu(chunk, &pool->chunks, next_chunk) {
> +                       if (phys == chunk->phys_addr) {
> +                               found = pool;
> +                               break;
> +                       }
> +               }
> +       }
> +       rcu_read_unlock();
> +
> +       return found;
> +}
> +EXPORT_SYMBOL_GPL(gen_pool_find_by_phys);
> +
> +#ifdef CONFIG_OF
> +/**
> + * of_get_named_gen_pool - find a pool by phandle property
> + * @np: device node
> + * @propname: property name containing phandle(s)
> + * @index: index into the phandle array
> + *
> + * Returns the pool that contains the chunk starting at the physical
> + * address of the device tree node pointed at by the phandle property,
> + * or NULL if not found.
> + */
> +struct gen_pool *of_get_named_gen_pool(struct device_node *np,
> +       const char *propname, int index)
> +{
> +       struct device_node *np_pool;
> +       struct resource res;
> +       int ret;
> +
> +       np_pool = of_parse_phandle(np, propname, index);
> +       if (!np_pool)
> +               return NULL;
> +       ret = of_address_to_resource(np_pool, 0, &res);
> +       if (ret < 0)
> +               return NULL;
> +       return gen_pool_find_by_phys((phys_addr_t) res.start);
> +}
> +EXPORT_SYMBOL_GPL(of_get_named_gen_pool);
> +#endif /* CONFIG_OF */
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
