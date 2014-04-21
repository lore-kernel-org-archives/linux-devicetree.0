From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 7/7] ARM: mm: use phys_addr_t in __dma_page_[cpu_to_dev/dev_to_cpu]
Date: Mon, 21 Apr 2014 09:39:13 -0400
Message-ID: <53551F81.9040209@ti.com>
References: <1397917972-6293-1-git-send-email-santosh.shilimkar@ti.com> <1397917972-6293-8-git-send-email-santosh.shilimkar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397917972-6293-8-git-send-email-santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

(Adding few CC's)

On Saturday 19 April 2014 10:32 AM, Santosh Shilimkar wrote:
> On a 32 bit ARM architecture with LPAE extension physical addresses
> cannot fit into unsigned long variable.
> 
> So fix it by using phys_addr_t instead of unsigned long.
> 
> Signed-off-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
> ---
>  arch/arm/mm/dma-mapping.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index f62aa06..5260f43 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -885,7 +885,7 @@ static void dma_cache_maint_page(struct page *page, unsigned long offset,
>  static void __dma_page_cpu_to_dev(struct page *page, unsigned long off,
>  	size_t size, enum dma_data_direction dir)
>  {
> -	unsigned long paddr;
> +	phys_addr_t paddr;
>  
>  	dma_cache_maint_page(page, off, size, dir, dmac_map_area);
>  
> @@ -901,7 +901,7 @@ static void __dma_page_cpu_to_dev(struct page *page, unsigned long off,
>  static void __dma_page_dev_to_cpu(struct page *page, unsigned long off,
>  	size_t size, enum dma_data_direction dir)
>  {
> -	unsigned long paddr = page_to_phys(page) + off;
> +	phys_addr_t paddr = page_to_phys(page) + off;
>  
>  	/* FIXME: non-speculating: not required */
>  	/* don't bother invalidating if DMA to device */
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
