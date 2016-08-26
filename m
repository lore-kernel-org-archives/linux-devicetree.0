From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v7 09/14] arm64/numa: support HAVE_SETUP_PER_CPU_AREA
Date: Fri, 26 Aug 2016 14:28:38 +0100
Message-ID: <20160826132838.GE30302@arm.com>
References: <1472024693-12912-1-git-send-email-thunder.leizhen@huawei.com>
 <1472024693-12912-10-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472024693-12912-10-git-send-email-thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Zefan Li <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Xinwei Hu <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Tianhong Ding <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 24, 2016 at 03:44:48PM +0800, Zhen Lei wrote:
> To make each percpu area allocated from its local numa node. Without this
> patch, all percpu areas will be allocated from the node which cpu0 belongs
> to.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/Kconfig   |  8 ++++++++
>  arch/arm64/mm/numa.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index bc3f00f..2815af6 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -603,6 +603,14 @@ config USE_PERCPU_NUMA_NODE_ID
>  	def_bool y
>  	depends on NUMA
> 
> +config HAVE_SETUP_PER_CPU_AREA
> +	def_bool y
> +	depends on NUMA
> +
> +config NEED_PER_CPU_EMBED_FIRST_CHUNK
> +	def_bool y
> +	depends on NUMA

Why do we need this? Is it purely about using block mappings for the
pcpu area?

>  source kernel/Kconfig.preempt
>  source kernel/Kconfig.hz
> 
> diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
> index 7b73808..5e44ad1 100644
> --- a/arch/arm64/mm/numa.c
> +++ b/arch/arm64/mm/numa.c
> @@ -26,6 +26,7 @@
>  #include <linux/of.h>
> 
>  #include <asm/acpi.h>
> +#include <asm/sections.h>
> 
>  struct pglist_data *node_data[MAX_NUMNODES] __read_mostly;
>  EXPORT_SYMBOL(node_data);
> @@ -131,6 +132,60 @@ void __init early_map_cpu_to_node(unsigned int cpu, int nid)
>  	cpu_to_node_map[cpu] = nid;
>  }
> 
> +#ifdef CONFIG_HAVE_SETUP_PER_CPU_AREA
> +unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
> +EXPORT_SYMBOL(__per_cpu_offset);
> +
> +static int __init early_cpu_to_node(int cpu)
> +{
> +	return cpu_to_node_map[cpu];
> +}
> +
> +static int __init pcpu_cpu_distance(unsigned int from, unsigned int to)
> +{
> +	if (early_cpu_to_node(from) == early_cpu_to_node(to))
> +		return LOCAL_DISTANCE;
> +	else
> +		return REMOTE_DISTANCE;
> +}

Is it too early to use __node_distance here?

> +static void * __init pcpu_fc_alloc(unsigned int cpu, size_t size,
> +				       size_t align)
> +{
> +	int nid = early_cpu_to_node(cpu);
> +
> +	return  memblock_virt_alloc_try_nid(size, align,
> +			__pa(MAX_DMA_ADDRESS), MEMBLOCK_ALLOC_ACCESSIBLE, nid);
> +}
> +
> +static void __init pcpu_fc_free(void *ptr, size_t size)
> +{
> +	memblock_free_early(__pa(ptr), size);
> +}
> +
> +void __init setup_per_cpu_areas(void)
> +{
> +	unsigned long delta;
> +	unsigned int cpu;
> +	int rc;
> +
> +	/*
> +	 * Always reserve area for module percpu variables.  That's
> +	 * what the legacy allocator did.
> +	 */
> +	rc = pcpu_embed_first_chunk(PERCPU_MODULE_RESERVE,
> +				    PERCPU_DYNAMIC_RESERVE, PAGE_SIZE,
> +				    pcpu_cpu_distance,
> +				    pcpu_fc_alloc, pcpu_fc_free);
> +	if (rc < 0)
> +		panic("Failed to initialize percpu areas.");
> +
> +	delta = (unsigned long)pcpu_base_addr - (unsigned long)__per_cpu_start;
> +	for_each_possible_cpu(cpu)
> +		__per_cpu_offset[cpu] = delta + pcpu_unit_offsets[cpu];
> +}
> +#endif

It's a pity that this is practically identical to PowerPC. Ideally, there
would be definitions of this initialisation gunk in the core code that
could be reused across architectures.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
