From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: Re: [PATCH 19/21] MIPS memblock: Add print out method of kernel
 virtual memory layout
Date: Mon, 19 Dec 2016 12:04:54 +0000
Message-ID: <db27f41e-4121-bb83-6533-6727c26b9c5b@imgtec.com>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
 <1482113266-13207-20-git-send-email-fancer.lancer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1482113266-13207-20-git-send-email-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Serge Semin <fancer.lancer@gmail.com>, ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, james.hogan@imgtec.com, alexander.sverdlin@nokia.com, robh+dt@kernel.org, frowand.list@gmail.com
Cc: Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Serge,


On 19/12/16 02:07, Serge Semin wrote:
> It's useful to have some printed map of the kernel virtual memory,
> at least for debugging purpose.
>
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>   arch/mips/mm/init.c | 47 +++++++++++++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
>
> diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
> index 13a032f..35e7ba8 100644
> --- a/arch/mips/mm/init.c
> +++ b/arch/mips/mm/init.c
> @@ -32,6 +32,7 @@
>   #include <linux/hardirq.h>
>   #include <linux/gfp.h>
>   #include <linux/kcore.h>
> +#include <linux/sizes.h>
>   
>   #include <asm/asm-offsets.h>
>   #include <asm/bootinfo.h>
> @@ -106,6 +107,49 @@ static void __init zone_sizes_init(void)
>   }
>   
>   /*
> + * Print out kernel memory layout
> + */
> +#define MLK(b, t) b, t, ((t) - (b)) >> 10
> +#define MLM(b, t) b, t, ((t) - (b)) >> 20
> +#define MLK_ROUNDUP(b, t) b, t, DIV_ROUND_UP(((t) - (b)), SZ_1K)
> +static void __init mem_print_kmap_info(void)
> +{
> +	pr_notice("Virtual kernel memory layout:\n"
> +		  "    lowmem  : 0x%08lx - 0x%08lx   (%4ld MB)\n"
> +		  "    vmalloc : 0x%08lx - 0x%08lx   (%4ld MB)\n"
> +#ifdef CONFIG_HIGHMEM
> +		  "    pkmap   : 0x%08lx - 0x%08lx   (%4ld MB)\n"
> +#endif
> +		  "    fixmap  : 0x%08lx - 0x%08lx   (%4ld kB)\n"
> +		  "      .text : 0x%p" " - 0x%p" "   (%4td kB)\n"
> +		  "      .data : 0x%p" " - 0x%p" "   (%4td kB)\n"
> +		  "      .init : 0x%p" " - 0x%p" "   (%4td kB)\n",
> +		MLM(PAGE_OFFSET, (unsigned long)high_memory),
> +		MLM(VMALLOC_START, VMALLOC_END),
> +#ifdef CONFIG_HIGHMEM
> +		MLM(PKMAP_BASE, (PKMAP_BASE) + (LAST_PKMAP)*(PAGE_SIZE)),
> +#endif
> +		MLK(FIXADDR_START, FIXADDR_TOP),
> +		MLK_ROUNDUP(_text, _etext),
> +		MLK_ROUNDUP(_sdata, _edata),
> +		MLK_ROUNDUP(__init_begin, __init_end));

Please drop printing the kernel addresses, or at least only do it if 
KASLR is not turned on, otherwise you're removing the advantage of 
KASLR, that critical kernel addresses cannot be determined easily from 
userspace.

It may be better to merge the functionality of show_kernel_relocation
http://lxr.free-electrons.com/source/arch/mips/kernel/relocate.c#L354
into this function, but only print it under the same conditions as 
currently, i.e.
#if defined(CONFIG_DEBUG_KERNEL) && defined(CONFIG_DEBUG_INFO)
http://lxr.free-electrons.com/source/arch/mips/kernel/setup.c#L530

Thanks,
Matt

> +
> +	/* Check some fundamental inconsistencies. May add something else? */
> +#ifdef CONFIG_HIGHMEM
> +	BUILD_BUG_ON(VMALLOC_END < PAGE_OFFSET);
> +	BUG_ON(VMALLOC_END < (unsigned long)high_memory);
> +#endif
> +	BUILD_BUG_ON((PKMAP_BASE) + (LAST_PKMAP)*(PAGE_SIZE) < PAGE_OFFSET);
> +	BUG_ON((PKMAP_BASE) + (LAST_PKMAP)*(PAGE_SIZE) <
> +					(unsigned long)high_memory);
> +	BUILD_BUG_ON(FIXADDR_TOP < PAGE_OFFSET);
> +	BUG_ON(FIXADDR_TOP < (unsigned long)high_memory);
> +}
> +#undef MLK
> +#undef MLM
> +#undef MLK_ROUNDUP
> +
> +/*
>    * Not static inline because used by IP27 special magic initialization code
>    */
>   void setup_zero_pages(void)
> @@ -492,6 +536,9 @@ void __init mem_init(void)
>   	/* Free highmemory registered in memblocks */
>   	mem_init_free_highmem();
>   
> +	/* Print out kernel memory layout */
> +	mem_print_kmap_info();
> +
>   	/* Print out memory areas statistics */
>   	mem_init_print_info(NULL);
>   
