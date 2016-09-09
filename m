From: "Leizhen (ThunderTown)" <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v8 10/16] mm/memblock: add a new function
 memblock_alloc_near_nid
Date: Fri, 9 Sep 2016 11:49:43 +0800
Message-ID: <57D23157.7000203@huawei.com>
References: <1472712907-12700-1-git-send-email-thunder.leizhen@huawei.com>
 <1472712907-12700-11-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472712907-12700-11-git-send-email-thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-mm <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>
Cc: Zefan Li <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Xinwei Hu <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Tianhong Ding <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi, linux-mm folks:
    Can somebody help me to review this patch?
    I ran scripts/get_maintainer.pl -f mm/memblock.c and scripts/get_maintainer.pl -f mm/, but
the results showed me that there is no maintainer.
    To understand this patch should also read patch 11.

On 2016/9/1 14:55, Zhen Lei wrote:
> If HAVE_MEMORYLESS_NODES is selected, and some memoryless numa nodes are
> actually exist. The percpu variable areas and numa control blocks of that
> memoryless numa nodes must be allocated from the nearest available node
> to improve performance.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>  include/linux/memblock.h |  1 +
>  mm/memblock.c            | 28 ++++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index 2925da2..8e866e0 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -290,6 +290,7 @@ static inline int memblock_get_region_node(const struct memblock_region *r)
> 
>  phys_addr_t memblock_alloc_nid(phys_addr_t size, phys_addr_t align, int nid);
>  phys_addr_t memblock_alloc_try_nid(phys_addr_t size, phys_addr_t align, int nid);
> +phys_addr_t memblock_alloc_near_nid(phys_addr_t size, phys_addr_t align, int nid);
> 
>  phys_addr_t memblock_alloc(phys_addr_t size, phys_addr_t align);
> 
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 483197e..6578fff 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -1189,6 +1189,34 @@ again:
>  	return ret;
>  }
> 
> +phys_addr_t __init memblock_alloc_near_nid(phys_addr_t size, phys_addr_t align, int nid)
> +{
> +	int i, best_nid, distance;
> +	u64 pa;
> +	DECLARE_BITMAP(nodes_map, MAX_NUMNODES);
> +
> +	bitmap_zero(nodes_map, MAX_NUMNODES);
> +
> +find_nearest_node:
> +	best_nid = NUMA_NO_NODE;
> +	distance = INT_MAX;
> +
> +	for_each_clear_bit(i, nodes_map, MAX_NUMNODES)
> +		if (node_distance(nid, i) < distance) {
> +			best_nid = i;
> +			distance = node_distance(nid, i);
> +		}
> +
> +	pa = memblock_alloc_nid(size, align, best_nid);
> +	if (!pa) {
> +		BUG_ON(best_nid == NUMA_NO_NODE);
> +		bitmap_set(nodes_map, best_nid, 1);
> +		goto find_nearest_node;
> +	}
> +
> +	return pa;
> +}
> +
>  phys_addr_t __init __memblock_alloc_base(phys_addr_t size, phys_addr_t align, phys_addr_t max_addr)
>  {
>  	return memblock_alloc_base_nid(size, align, max_addr, NUMA_NO_NODE,
> --
> 2.5.0
> 
> 
> 
> .
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
