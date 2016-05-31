From: Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>
Subject: Re: [PATCH v2 5/5] arm64/numa: avoid inconsistent information to be
 printed
Date: Tue, 31 May 2016 11:07:06 +0200
Message-ID: <574D543A.2090406@suse.com>
References: <1464427377-12712-1-git-send-email-thunder.leizhen@huawei.com>
 <1464427377-12712-6-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464427377-12712-6-git-send-email-thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Xinwei Hu <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Zefan Li <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Tianhong Ding <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 28/05/16 11:22, Zhen Lei wrote:
> numa_init(of_numa_init) may returned error because of numa configuration
> error. So "No NUMA configuration found" is inaccurate. In fact, specific
> configuration error information should be immediately printed by the
> testing branch.
>
> Signed-off-by: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---

Which kernel version is this patch based on?

Regards,
Matthias

>   arch/arm64/mm/numa.c | 6 +++---
>   drivers/of/of_numa.c | 7 +++----
>   2 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
> index 2601660..1b9622c 100644
> --- a/arch/arm64/mm/numa.c
> +++ b/arch/arm64/mm/numa.c
> @@ -338,8 +338,10 @@ static int __init numa_init(int (*init_func)(void))
>   	if (ret < 0)
>   		return ret;
>
> -	if (nodes_empty(numa_nodes_parsed))
> +	if (nodes_empty(numa_nodes_parsed)) {
> +		pr_info("No NUMA configuration found\n");
>   		return -EINVAL;
> +	}
>
>   	ret = numa_register_nodes();
>   	if (ret < 0)
> @@ -370,8 +372,6 @@ static int __init dummy_numa_init(void)
>
>   	if (numa_off)
>   		pr_info("NUMA disabled\n"); /* Forced off on command line. */
> -	else
> -		pr_info("No NUMA configuration found\n");
>   	pr_info("NUMA: Faking a node at [mem %#018Lx-%#018Lx]\n",
>   	       0LLU, PFN_PHYS(max_pfn) - 1);
>
> diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
> index fb62307..3157130 100644
> --- a/drivers/of/of_numa.c
> +++ b/drivers/of/of_numa.c
> @@ -63,7 +63,7 @@ static int __init of_numa_parse_memory_nodes(void)
>   	struct device_node *np = NULL;
>   	struct resource rsrc;
>   	u32 nid;
> -	int i, r = 0;
> +	int i, r;
>
>   	for_each_node_by_type(np, "memory") {
>   		r = of_property_read_u32(np, "numa-node-id", &nid);
> @@ -81,12 +81,11 @@ static int __init of_numa_parse_memory_nodes(void)
>   		if (!i || r) {
>   			of_node_put(np);
>   			pr_err("NUMA: bad property in memory node\n");
> -			r = r ? : -EINVAL;
> -			break;
> +			return r ? : -EINVAL;
>   		}
>   	}
>
> -	return r;
> +	return 0;
>   }
>

Well this is fixing changes you introduced in this patch-set. Any reason 
this is not part of patch 2?

>   static int __init of_numa_parse_distance_map_v1(struct device_node *map)
> --
> 2.5.0
>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
