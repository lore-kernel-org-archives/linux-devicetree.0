From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 4/7] of: configure the platform device dma_mask and dma_pfn_offset
Date: Fri, 7 Mar 2014 12:16:23 +0800
Message-ID: <53194817.70802@ti.com>
References: <1394097598-17622-1-git-send-email-santosh.shilimkar@ti.com>	<1394097598-17622-5-git-send-email-santosh.shilimkar@ti.com> <CAL_Jsq+Y8w0sLLdh5vcWMnW3ohEafAFRWubtCK66P1axsf1wRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+Y8w0sLLdh5vcWMnW3ohEafAFRWubtCK66P1axsf1wRA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 07 March 2014 11:49 AM, Rob Herring wrote:
> On Thu, Mar 6, 2014 at 3:19 AM, Santosh Shilimkar
> <santosh.shilimkar-l0cyMroinI0@public.gmane.org> wrote:
>> From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
>>
>> Retrieve DMA configuration from DT and setup platform device's DMA
>> parameters.
>>
>> The DMA configuration in DT has to be specified using "dma-ranges"
>> property if supported. The DMA configuration applied
>> by dt_dma_configure() as following:
>>  - call of_get_dma_range() and get supported DMA range info
>>    (dma_addr, cpu_addr, dma_size);
>>  - if "not found" then fill dma_mask as DMA_BIT_MASK(32)
>>    (this is default behaviour);
>>  - if "failed" then clean up dma_mask (DMA not supported)
>>  - if ok then update devices DMA configuration:
>>       set dma_mask to (dma_addr + dma_size - 1)
>>       set dma_pfn_offset to PFN_DOWN(cpu_addr - dma_addr)
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
>>  drivers/of/platform.c |   75 +++++++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 72 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
>> index bd080db..53bb12f 100644
>> --- a/drivers/of/platform.c
>> +++ b/drivers/of/platform.c
>> @@ -187,6 +187,77 @@ struct platform_device *of_device_alloc(struct device_node *np,
>>  EXPORT_SYMBOL(of_device_alloc);
>>
>>  /**
>> + * dt_dma_configure - apply default DMA configuration from dt

[..]

>> +
>> +       ret = dma_set_mask(dev, dma_mask);
>> +       if (ret < 0) {
>> +               dev_err(dev, "failed to set DMA mask %pad\n", &dma_mask);
>> +               dev->dma_mask = NULL;
>> +               return;
>> +       }
>> +
>> +       dev_dbg(dev, "dma_pfn_offset(%#08lx) dma_mask(%pad)\n",
>> +               dev->dma_pfn_offset, dev->dma_mask);
>> +
>> +       ret = dma_set_coherent_mask(dev, dma_mask);
> 
> I think these 2 calls belong in the drivers, not here.
> 
I also had same initial thought but Arnd mentioned that its a
shared responsibility between ARCH and drivers. Driver which
could be common between arches not always have the correct
mask information and it can change based on which arch it
is running.

With some discussion back and forth, we thought updating
the dma_mask while the device getting created, would be
better place since we can find the arch capability at
this centralise code and update it.

Ofcourse its bit debatable as the question you asked is
bit obvious as well. I let Arnd give his view here.

Regards,
Santosh


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
