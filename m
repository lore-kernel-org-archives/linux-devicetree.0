From: Marcin Nowakowski <marcin.nowakowski-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 15/17] MIPS: JZ4770: Workaround for corrupted DMA
 transfers
Date: Thu, 22 Jun 2017 09:21:02 +0200
Message-ID: <ca37b50d-951c-2264-fa37-cca7149ed4ba@imgtec.com>
References: <20170607200439.24450-2-paul@crapouillou.net>
 <20170620151855.19399-1-paul@crapouillou.net>
 <20170620151855.19399-15-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170620151855.19399-15-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Paul, Maarten,

On 20.06.2017 17:18, Paul Cercueil wrote:
> From: Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>
> 
> We have seen MMC DMA transfers read corrupted data from SDRAM when
> a burst interval ends at physical address 0x10000000. To avoid this
> problem, we remove the final page of low memory from the memory map.
> 
> Signed-off-by: Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>
> ---
>   arch/mips/jz4740/setup.c | 24 ++++++++++++++++++++++++
>   arch/mips/kernel/setup.c |  8 ++++++++
>   2 files changed, 32 insertions(+)
> 
>   v2: No change
> 
> diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
> index afd84ee966e8..6948b133a15d 100644
> --- a/arch/mips/jz4740/setup.c
> +++ b/arch/mips/jz4740/setup.c
> @@ -23,6 +23,7 @@
>   
>   #include <asm/bootinfo.h>
>   #include <asm/mips_machine.h>
> +#include <asm/page.h>
>   #include <asm/prom.h>
>   
>   #include <asm/mach-jz4740/base.h>
> @@ -102,6 +103,29 @@ void __init arch_init_irq(void)
>   	irqchip_init();
>   }
>   
> +/*
> + * We have seen MMC DMA transfers read corrupted data from SDRAM when a burst
> + * interval ends at physical address 0x10000000. To avoid this problem, we
> + * remove the final page of low memory from the memory map.
> + */
> +void __init jz4770_reserve_unsafe_for_dma(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < boot_mem_map.nr_map; i++) {
> +		struct boot_mem_map_entry *entry = boot_mem_map.map + i;
> +
> +		if (entry->type != BOOT_MEM_RAM)
> +			continue;
> +
> +		if (entry->addr + entry->size != 0x10000000)
> +			continue;
> +
> +		entry->size -= PAGE_SIZE;
> +		break;
> +	}
> +}
> +
>   static int __init jz4740_machine_setup(void)
>   {
>   	mips_machine_setup();
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 89785600fde4..cccfd7ba89fe 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -838,6 +838,14 @@ static void __init arch_mem_init(char **cmdline_p)
>   
>   	parse_early_param();
>   
> +#ifdef CONFIG_MACH_JZ4770
> +	if (current_cpu_type() == CPU_JZRISC &&
> +				mips_machtype == MACH_INGENIC_JZ4770) {
> +		extern void __init jz4770_reserve_unsafe_for_dma(void);
> +		jz4770_reserve_unsafe_for_dma();
> +	}
> +#endif
> +

This part doesn't look good in the platform-agnostic code ... is there a 
reason why you wouldn't do that from within plat_mem_setup()?


>   	if (usermem) {
>   		pr_info("User-defined physical RAM map:\n");
>   		print_memory_map();
> 


Marcin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
