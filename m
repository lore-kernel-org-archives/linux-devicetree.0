From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Subject: Re: [RFC v1 PATCH 1/2] of/pci: add of_pci_dma_configure() update
 dma configuration
Date: Tue, 23 Dec 2014 17:55:22 -0500
Message-ID: <5499F2DA.2090407@ti.com>
References: <1418940425-2017-1-git-send-email-m-karicheri2@ti.com> <5090769.jqAkiDgYu7@wuerfel> <5499A96D.4010704@ti.com> <4513569.xuD4xkPOuC@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4513569.xuD4xkPOuC@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/23/2014 05:42 PM, Arnd Bergmann wrote:
> On Tuesday 23 December 2014 12:42:05 Murali Karicheri wrote:
>>> here.
>>
>> Arnd,
>>
>> I guess so. Besides we need to keep the default coherent dma mask to
>> 32bit 0xffffffffull as well to work on Keystone and also in sync with
>> current defaults used in pci_device_add() so that we don't break this
>> behavior.
>>
>> Here is the summary of changes need to make on top of my existing patch.
>>
>> 1. of_dma_configure() - change size = dev->coherent_dma_mask to size =
>> dev->coherent_dma_mask + 1. This is a new patch to fix existing code.
>
> ok
>
>> 2. Do the above change to of_pci_dma_configure() as well.
>
> ok
>
>> 3. in arch_setup_dma_ops() update the DMA mask to min((*dev->dma_mask),
>> dma_base + size - 1) as
>>
>>
>> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
>> index c17f6a9..88b4769 100644
>> --- a/arch/arm/mm/dma-mapping.c
>> +++ b/arch/arm/mm/dma-mapping.c
>> @@ -2053,8 +2053,13 @@ void arch_setup_dma_ops(struct device *dev, u64
>> dma_base, u64 size,
>>    {
>>           struct dma_map_ops *dma_ops;
>>
>> +
>> +       *dev->dma_mask = min((*dev->dma_mask), (dma_base + size - 1));
>>
>> I have tested this on keystone and it works fine with rootfs on PCI SATA
>> harddisk. I will be doing more tests with this change. If you are in
>> agreement with the above changes, I will re-spin the patch to accomodate
>> them and send v1 of the same.
>
> Ok, sounds good. I noticed that you did not put Russell into the Cc list
> for the emails. Please do so when you send it again, as he may have some
> additional comments.
Ok. Will do.

Murali
>
> 	Arnd


-- 
Murali Karicheri
Linux Kernel, Texas Instruments
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
