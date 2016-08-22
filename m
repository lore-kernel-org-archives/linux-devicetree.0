From: "Leizhen (ThunderTown)" <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 00/14] fix some type infos and bugs for arm64/of numa
Date: Mon, 22 Aug 2016 15:47:39 +0800
Message-ID: <57BAAE1B.2070808@huawei.com>
References: <1470908028-8596-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470908028-8596-1-git-send-email-thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Zefan Li <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Xinwei Hu <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Tianhong Ding <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi everybody:
   Is this patch series can be accepted or still need to be improved? It seems
to have been a long time.

Thanks,
   Zhen Lei


On 2016/8/11 17:33, Zhen Lei wrote:
> v5 -> v6:
> Move memblk nid check from arch/arm64/mm/numa.c into drivers/of/of_numa.c,
> because this check is arch independent.
> 
> This modification only related to patch 3, but impacted the contents of patch 7 and 8,
> other patches have no change.
> 
> v4 -> v5:
> This version has no code changes, just add "Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>"
> into patches 1, 2, 4, 6, 7, 13, 14. Because these patches rely on some acpi numa
> patches, and the latter had not been upstreamed in 4.7, but upstreamed in 4.8-rc1,
> so I resend my patches again.
> 
> v3 -> v4:
> 1. Packed three patches of Kefeng Wang, patch6-8.
> 2. Add 6 new patches(9-15) to enhance the numa on arm64.
> 
> v2 -> v3:
> 1. Adjust patch2 and patch5 according to Matthias Brugger's advice, to make the
>    patches looks more well. The final code have no change. 
> 
> v1 -> v2:
> 1. Base on https://lkml.org/lkml/2016/5/24/679
> 2. Rewrote of_numa_parse_memory_nodes according to Rob Herring's advice. So that it looks more clear.
> 3. Rewrote patch 5 because some scenes were not considered before.
> 
> Kefeng Wang (3):
>   of_numa: Use of_get_next_parent to simplify code
>   of_numa: Use pr_fmt()
>   arm64: numa: Use pr_fmt()
> 
> Zhen Lei (11):
>   of/numa: remove a duplicated pr_debug information
>   of/numa: fix a memory@ node can only contains one memory block
>   arm64/numa: add nid check for memory block
>   of/numa: remove a duplicated warning
>   arm64/numa: avoid inconsistent information to be printed
>   arm64/numa: support HAVE_SETUP_PER_CPU_AREA
>   arm64/numa: define numa_distance as array to simplify code
>   arm64/numa: support HAVE_MEMORYLESS_NODES
>   arm64/numa: remove some useless code
>   of/numa: remove the constraint on the distances of node pairs
>   Documentation: remove the constraint on the distances of node pairs
> 
>  Documentation/devicetree/bindings/numa.txt |   1 -
>  arch/arm64/Kconfig                         |  12 ++
>  arch/arm64/include/asm/numa.h              |   1 -
>  arch/arm64/kernel/smp.c                    |   1 +
>  arch/arm64/mm/numa.c                       | 223 ++++++++++++++++-------------
>  drivers/of/of_numa.c                       |  88 ++++++------
>  6 files changed, 178 insertions(+), 148 deletions(-)
> 
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
