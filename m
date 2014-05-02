From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 5/7] ARM: dma: Use dma_pfn_offset for dma address translation
Date: Fri, 2 May 2014 09:32:56 -0500
Message-ID: <CAL_JsqKapfHRMQLU+4hmRUh7Swf-_YedW=yU=nrqzftoJ09PYQ@mail.gmail.com>
References: <1398353407-2345-1-git-send-email-santosh.shilimkar@ti.com>
	<1398353407-2345-6-git-send-email-santosh.shilimkar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398353407-2345-6-git-send-email-santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 24, 2014 at 10:30 AM, Santosh Shilimkar
<santosh.shilimkar-l0cyMroinI0@public.gmane.org> wrote:
> From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
>
> In most of cases DMA addresses can be performed using offset value of
>  Bus address space relatively to physical address space as following:
>
> PFN->DMA:
>  __pfn_to_phys(pfn + [-]dma_pfn_offset)
>
> DMA->PFN:
>  __phys_to_pfn(dma_addr) + [-]dma_pfn_offset
>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  arch/arm/include/asm/dma-mapping.h |   21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/include/asm/dma-mapping.h b/arch/arm/include/asm/dma-mapping.h
> index e701a4d..424fda9 100644
> --- a/arch/arm/include/asm/dma-mapping.h
> +++ b/arch/arm/include/asm/dma-mapping.h
> @@ -58,22 +58,35 @@ static inline int dma_set_mask(struct device *dev, u64 mask)
>  #ifndef __arch_pfn_to_dma
>  static inline dma_addr_t pfn_to_dma(struct device *dev, unsigned long pfn)
>  {
> -       return (dma_addr_t)__pfn_to_bus(pfn);
> +       if (!dev)
> +               return (dma_addr_t)__pfn_to_bus(pfn);
> +       else
> +               return (dma_addr_t)__pfn_to_bus(pfn - dev->dma_pfn_offset);
>  }
>
>  static inline unsigned long dma_to_pfn(struct device *dev, dma_addr_t addr)
>  {
> -       return __bus_to_pfn(addr);
> +       if (!dev)
> +               return __bus_to_pfn(addr);
> +       else
> +               return __bus_to_pfn(addr) + dev->dma_pfn_offset;
>  }
>
>  static inline void *dma_to_virt(struct device *dev, dma_addr_t addr)
>  {
> -       return (void *)__bus_to_virt((unsigned long)addr);
> +       if (!dev)
> +               return (void *)__bus_to_virt((unsigned long)addr);
> +       else
> +               return (void *)__bus_to_virt(__pfn_to_bus(dma_to_pfn(dev, addr)));
>  }
>
>  static inline dma_addr_t virt_to_dma(struct device *dev, void *addr)
>  {
> -       return (dma_addr_t)__virt_to_bus((unsigned long)(addr));
> +       if (!dev)
> +               return (dma_addr_t)__virt_to_bus((unsigned long)(addr));
> +       else
> +               return pfn_to_dma(dev,
> +                               __bus_to_pfn(__virt_to_bus((unsigned long)(addr))));
>  }
>
>  #else
> --
> 1.7.9.5
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
