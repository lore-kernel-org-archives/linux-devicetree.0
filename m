From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: Use proper types for checking memory overflow
Date: Tue, 8 Jul 2014 09:24:08 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1407080923001.2561@Yrabib>
References: <1404780343-32188-1-git-send-email-lauraa@codeaurora.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404780343-32188-1-git-send-email-lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 7 Jul 2014, Laura Abbott wrote:

> Commit a67a6ed15513541579d38bcbd127e7be170710e5
> (of: Check for phys_addr_t overflows in early_init_dt_add_memory_arch)
> corrected early_init_dt_add_memory_arch to account for overflows
> but did so in an unclean way using ULONG_MAX. There is no
> guarantee that sizeof(unsigned long) == sizeof(phys_addr_t).
> Check against phys_addr_t instead.
> 
> Signed-off-by: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Acked-by: Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> ---
>  drivers/of/fdt.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index b777d8f..b88a68e 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -875,24 +875,24 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>  }
>  
>  #ifdef CONFIG_HAVE_MEMBLOCK
> +#define MAX_PHYS_ADDR	((phys_addr_t)~0)
> +
>  void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
>  {
>  	const u64 phys_offset = __pa(PAGE_OFFSET);
>  	base &= PAGE_MASK;
>  	size &= PAGE_MASK;
>  
> -	if (sizeof(phys_addr_t) < sizeof(u64)) {
> -		if (base > ULONG_MAX) {
> -			pr_warning("Ignoring memory block 0x%llx - 0x%llx\n",
> -					base, base + size);
> -			return;
> -		}
> +	if (base > MAX_PHYS_ADDR) {
> +		pr_warning("Ignoring memory block 0x%llx - 0x%llx\n",
> +				base, base + size);
> +		return;
> +	}
>  
> -		if (base + size > ULONG_MAX) {
> -			pr_warning("Ignoring memory range 0x%lx - 0x%llx\n",
> -					ULONG_MAX, base + size);
> -			size = ULONG_MAX - base;
> -		}
> +	if (base + size > MAX_PHYS_ADDR) {
> +		pr_warning("Ignoring memory range 0x%lx - 0x%llx\n",
> +				ULONG_MAX, base + size);
> +		size = MAX_PHYS_ADDR - base;
>  	}
>  
>  	if (base + size < phys_offset) {
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> hosted by The Linux Foundation
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
