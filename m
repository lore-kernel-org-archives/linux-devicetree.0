From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 5/7] ARM: dma: Use dma_pfn_offset for dma address translation
Date: Mon, 21 Apr 2014 09:38:01 -0400
Message-ID: <53551F39.90908@ti.com>
References: <1397917972-6293-1-git-send-email-santosh.shilimkar@ti.com> <1397917972-6293-6-git-send-email-santosh.shilimkar@ti.com> <20140419194334.GL24070@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140419194334.GL24070-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Saturday 19 April 2014 03:43 PM, Russell King - ARM Linux wrote:
> On Sat, Apr 19, 2014 at 10:32:50AM -0400, Santosh Shilimkar wrote:
>> From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
>>
>> In most of cases DMA addresses can be performed using offset value of
>>  Bus address space relatively to physical address space as following:
>>
>> PFN->DMA:
>>  __pfn_to_phys(pfn + [-]dma_pfn_offset)
>>
>> DMA->PFN:
>>  __phys_to_pfn(dma_addr) + [-]dma_pfn_offset
>>
>> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
>> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
>> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>> Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
>> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
>> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
>> Signed-off-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
>> ---
>>  arch/arm/include/asm/dma-mapping.h |   17 +++++++++++++----
>>  1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm/include/asm/dma-mapping.h b/arch/arm/include/asm/dma-mapping.h
>> index e701a4d..8c12149 100644
>> --- a/arch/arm/include/asm/dma-mapping.h
>> +++ b/arch/arm/include/asm/dma-mapping.h
>> @@ -58,22 +58,31 @@ static inline int dma_set_mask(struct device *dev, u64 mask)
>>  #ifndef __arch_pfn_to_dma
>>  static inline dma_addr_t pfn_to_dma(struct device *dev, unsigned long pfn)
>>  {
>> -	return (dma_addr_t)__pfn_to_bus(pfn);
>> +	if (!dev)
>> +		return DMA_ERROR_CODE;
>> +	return (dma_addr_t)__pfn_to_bus(pfn - dev->dma_pfn_offset);
> 
> How do ISA devices (iow, those which pass a NULL device) work with this?
> This looks to me like it ends up breaking some drivers.
> 
> I've also seen some drivers (such as the Freescale FEC driver) which
> perform DMA coherent allocations with a NULL device - technically, that's
> a bug in the driver, but the above change will cause them to regress.
> 
Good point. We can keep the NULL case working as well...

static inline dma_addr_t pfn_to_dma(struct device *dev, unsigned long pfn)
{

	if (!dev)
		return (dma_addr_t)__pfn_to_bus(pfn);
	else
		return (dma_addr_t)__pfn_to_bus(pfn - dev->dma_pfn_offset);
}

I will update the patch accordingly.

Regards,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
