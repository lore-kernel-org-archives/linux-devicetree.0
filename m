From: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 0/4] CMA & device tree, once again
Date: Fri, 08 Aug 2014 17:28:06 -0700
Message-ID: <53E56B16.5030402@codeaurora.org>
References: <1405321966-28184-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405321966-28184-1-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nishanth Peethambaran <nishanth.p-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joonsoo Kim <iamjoonsoo.kim-Hm3cg6mZ9cc@public.gmane.org>, "Aneesh Kumar K.V." <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 7/14/2014 12:12 AM, Marek Szyprowski wrote:
> Hello,
> 
> This is one more respin of the patches which add support for creating
> reserved memory regions defined in device tree. The last attempt
> (http://lists.linaro.org/pipermail/linaro-mm-sig/2014-February/003738.html)
> ended in merging only half of the code, so right now we have complete
> documentation merged and only basic code, which implements a half of it
> is written in the documentation. Although the merged patches allow to
> reserve memory, there is no way of using it for devices and drivers.
> 
> This situation makes CMA rather useless, as the main architecture (ARM),
> which used it, has been converted from board-file based system
> initialization to device tree. Thus there is no place to use direct
> calls to dma_declare_contiguous() and some new solution, which bases on
> device tree, is urgently needed.
> 
> This patch series fixes this issue. It provides two, already widely
> discussed and already present in the kernel, drivers for reserved
> memory: first based on DMA-coherent allocator, second using Contiguous
> Memory Allocator. The first one nicely implements typical 'carved out'
> reserved memory way of allocating contiguous buffers in a kernel-style
> way. The memory is used exclusively by devices assigned to the given
> memory region. The second one allows to reuse reserved memory for
> movable kernel pages (like disk buffers, anonymous memory) and migrates
> it out when device to allocates contiguous memory buffer. Both driver
> provides memory buffers via standard dma-mapping API.
> 
> The patches have been rebased on top of latest CMA and mm changes merged
> to akmp kernel tree.
> 
> To define a 64MiB CMA region following node is needed:
> 
> multimedia_reserved: multimedia_mem_region {
> 	compatible = "shared-dma-pool";
> 	reusable;
> 	size = <0x4000000>;
> 	alignment = <0x400000>;
> };
> 
> Similarly, one can define 64MiB region with DMA coherent memory:
> 
> multimedia_reserved: multimedia_mem_region {
> 	compatible = "shared-dma-pool";
> 	no-map;
> 	size = <0x4000000>;
> 	alignment = <0x400000>;
> };
> 

Longer term, I think it would be good if we didn't have to use no-map with
the coherent memory. With no-map and dma-coherent.c right now, not only
do you lose out on the physical memory space, you also have to give up
the same amount of vmalloc space for mapping. On arm32, if you have the default
240MB vmalloc space, 64M is ~25% of the vmalloc space. At least on arm you can
make this up by remapping the memory as coherent.

I haven't seen this picked up anywhere yet so you are welcome to add

Tested-by: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Thanks,
Laura

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
