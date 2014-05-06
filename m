From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 4/7] of: configure the platform device dma parameters
Date: Tue, 6 May 2014 16:44:40 -0400
Message-ID: <536949B8.3030106@ti.com>
References: <1398353407-2345-1-git-send-email-santosh.shilimkar@ti.com> <CAL_Jsq+nh26NZXx-9Y5FTxWZdVrG7aLTOBhC4j9P8mPPvUu2ag@mail.gmail.com> <536806F4.1090904@ti.com> <7182186.5Q53eQg77F@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7182186.5Q53eQg77F@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Strashko, Grygorii" <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 06 May 2014 05:40 AM, Arnd Bergmann wrote:
> On Monday 05 May 2014 17:47:32 Santosh Shilimkar wrote:
> 
>> +       dev->coherent_dma_mask = DMA_BIT_MASK(32);
>> +       if (!dev->dma_mask)
>> +               dev->dma_mask = &dev->coherent_dma_mask;
>> +
>> +       /*
>> +        * if dma-ranges property doesn't exist - just return else
>> +        * setup the dma offset
>> +        */
>> +       ret = of_dma_get_range(dev->of_node, &dma_addr, &paddr, &size);
>> +       if (ret < 0) {
>> +               dev_dbg(dev, "no dma range information to setup\n");
>> +               return;
>> +       }
>> +
>> +       /* DMA ranges found. Calculate and set dma_pfn_offset */
>> +       dev->dma_pfn_offset = PFN_DOWN(paddr - dma_addr);
>> +       dev_dbg(dev, "dma_pfn_offset(%#08lx)\n", dev->dma_pfn_offset);
>> +}
> 
> I think there should at least be a comment about why we are computing
> the correct DMA mask here and then ignore that and just use DMA_BIT_MASK(32)
> instead. I understand that Russell and Rob prefer it that way and I'm not
> going to argue, but I find it counterintuitive and I think it deserves
> an explanation in the source code for anybody who is trying to figure
> out how things fit together.
> 
In this patch, the dma_mask related code is just moved. We are not calculating
dma_mask either. I was looking for the history of how DMA_BIT_MASK(32)
landed up but couldn't trace it down apart from the fact that the code was
carried from powerPC. May be Rob knows.

How about below comment ? I didn't delibratly added point about bus
intercepting drivers dma_set_*mask() call etc.

/*
 * Set default dma-mask to 32 bit. Drivers are expected to setup
 * the correct supported dma_mask.
 */  
+       dev->coherent_dma_mask = DMA_BIT_MASK(32);
+       if (!dev->dma_mask)
+               dev->dma_mask = &dev->coherent_dma_mask;

Regards,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
