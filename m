From: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 3/4] drivers: dma-coherent: add initialization from
 device tree
Date: Fri, 08 Aug 2014 17:25:11 -0700
Message-ID: <53E56A67.7040303@codeaurora.org>
References: <1405321966-28184-1-git-send-email-m.szyprowski@samsung.com> <1405321966-28184-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405321966-28184-4-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nishanth Peethambaran <nishanth.p-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joonsoo Kim <iamjoonsoo.kim-Hm3cg6mZ9cc@public.gmane.org>, "Aneesh Kumar K.V." <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 7/14/2014 12:12 AM, Marek Szyprowski wrote:
> Add support for handling 'shared-dma-pool' reserved-memory device tree
> nodes.
> 
> Based on previous code provided by Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/base/dma-coherent.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/base/dma-coherent.c b/drivers/base/dma-coherent.c
> index 7d6e84a51424..b20cbe095d86 100644
> --- a/drivers/base/dma-coherent.c
> +++ b/drivers/base/dma-coherent.c
> @@ -218,3 +218,43 @@ int dma_mmap_from_coherent(struct device *dev, struct vm_area_struct *vma,
>  	return 0;
>  }
>  EXPORT_SYMBOL(dma_mmap_from_coherent);
> +
> +/*
> + * Support for reserved memory regions defined in device tree
> + */
> +#ifdef CONFIG_OF_RESERVED_MEM
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <linux/of_reserved_mem.h>
> +
> +static void rmem_dma_device_init(struct reserved_mem *rmem, struct device *dev)
> +{
> +	dma_declare_coherent_memory(dev, rmem->base, rmem->base,
> +		rmem->size, DMA_MEMORY_MAP | DMA_MEMORY_EXCLUSIVE);
> +}
> +
> +static void rmem_dma_device_release(struct reserved_mem *rmem,
> +				    struct device *dev)
> +{
> +	dma_release_declared_memory(dev);
> +}
> +
> +static const struct reserved_mem_ops rmem_dma_ops = {
> +	.device_init	= rmem_dma_device_init,
> +	.device_release	= rmem_dma_device_release,
> +};
> +
> +static int __init rmem_dma_setup(struct reserved_mem *rmem)
> +{
> +	unsigned long node = rmem->fdt_node;
> +
> +	if (of_get_flat_dt_prop(node, "reusable", NULL))
> +		return -EINVAL;
> +

Can we add a check for 'no-map' property here? At least on ARM, the
lack of the no-map property causes the ioremap to fail.

Thanks,
Laura

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
