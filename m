From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/7] ARM: of: introduce common routine for DMA configuration
Date: Fri, 7 Mar 2014 11:15:30 +0800
Message-ID: <CACRpkdZ_V2e-HT0YSaM36qfLUOHpVCA6__6oYPeJTFRxe5kfAA@mail.gmail.com>
References: <1393535872-20915-1-git-send-email-santosh.shilimkar@ti.com>
	<1393535872-20915-6-git-send-email-santosh.shilimkar@ti.com>
	<9618080.kpE3Kl6X8p@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9618080.kpE3Kl6X8p@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 28, 2014 at 6:00 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 27 February 2014 16:17:50 Santosh Shilimkar wrote:
>> diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
>> index f751714..926b5dd 100644
>> --- a/arch/arm/kernel/devtree.c
>> +++ b/arch/arm/kernel/devtree.c
>> @@ -235,3 +238,61 @@ const struct machine_desc * __init setup_machine_fdt(unsigned int dt_phys)
>>
>>       return mdesc;
>>  }
>> +
>> +void arm_dt_dma_configure(struct device *dev)
>> +{
>> +     dma_addr_t dma_addr;
>> +     phys_addr_t paddr, size;
>> +     dma_addr_t dma_mask;
>> +     int ret;
>> +
>> +     /*
>> +      * if dma-ranges property doesn't exist - use 32 bits DMA mask
>> +      * by default and don't set skip archdata.dma_pfn_offset
>> +      */
>> +     ret = of_dma_get_range(dev->of_node, &dma_addr, &paddr, &size);
>> +     if (ret == -ENODEV) {
>> +             dev->coherent_dma_mask = DMA_BIT_MASK(32);
>> +             if (!dev->dma_mask)
>> +                     dev->dma_mask = &dev->coherent_dma_mask;
>> +             return;
>> +     }
>
> I think this is a reasonable default, but I also want Russell's
> opinion on this, since I suspect he will argue that we shouldn't
> default to setting a DMA mask for devices that are not DMA capable.

of_platform_device_create_pdata() in drivers/of/platform.c
does the same assumption since ages.

> Maybe someone has an idea how we can detect all three important cases:
>
> a) A device is marked as DMA capable using a dma-ranges property
> b) A device is known not to be DMA capable
> c) we don't have any dma-ranges properties in an old dtb file
>    but still want 32 bit masks by default.

The exact same solution would apply to the of core right?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
