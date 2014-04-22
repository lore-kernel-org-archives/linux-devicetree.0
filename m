From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 4/7] of: configure the platform device dma parameters
Date: Tue, 22 Apr 2014 09:44:08 -0500
Message-ID: <CAL_JsqKe_L00P36UT7hizB=zAxCB0S_1kV3XEVGGbJOi27S84A@mail.gmail.com>
References: <1397917972-6293-1-git-send-email-santosh.shilimkar@ti.com>
	<1397917972-6293-5-git-send-email-santosh.shilimkar@ti.com>
	<CAL_JsqJJ4Cbh5poMa-KRwy+bp_t3VtRd7bCpcWey+DZ74eYHJQ@mail.gmail.com>
	<53568641.2020300@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53568641.2020300-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 22, 2014 at 10:09 AM, Grygorii Strashko
<grygorii.strashko-l0cyMroinI0@public.gmane.org> wrote:
> Hi Rob,
>
> On 04/21/2014 05:58 PM, Rob Herring wrote:
>> On Sat, Apr 19, 2014 at 9:32 AM, Santosh Shilimkar
>> <santosh.shilimkar-l0cyMroinI0@public.gmane.org> wrote:
>>> Retrieve DMA configuration from DT and setup platform device's DMA
>>> parameters. The DMA configuration in DT has to be specified using
>>> "dma-ranges" and "dma-coherent" properties if supported.
>>>
>>> We setup dma_pfn_offset using "dma-ranges" and dma_coherent_ops
>>> using "dma-coherent" device tree properties.
>>>
>>> The set_arch_dma_coherent_ops macro has to be defined by arch if
>>> it supports coherent dma_ops. Otherwise, set_arch_dma_coherent_ops() is
>>> declared as nop.

[...]

>>>
>>> +       ret = of_dma_get_range(dev->of_node, &dma_addr, &paddr, &size);
>>> +       if (ret < 0) {
>>
>> Perhaps an error is not the right return for the default case. The
>> default should probably be dma_addr and paddr equal to 0 and size 4GB.
>
> The error code is needed here to properly distinguish the case when
> there are no "dma-ranges" defined in DT. Also, I think, that
> of_dma_get_range() shouldn't return any default values - It just
> has to get data from DT. And the caller should decide what to do
> with this data and how to handle error cases.
>
> So, I prefer to keep behavior as is:
> - in case of failure of_dma_get_range() will not touch values of
>   &dma_addr, &paddr, &size.

Fine, but that is not how of_dma_get_range currently behaves:

+       *dma_addr = of_read_number(ranges, naddr);
+       *paddr = of_translate_dma_address(np, ranges);
+       if (*paddr == OF_BAD_ADDR) {
+               pr_err("%s: translation of DMA address(%pad) to CPU
address failed node(%s)\n",
+                      __func__, dma_addr, np->full_name);
+               ret = -EINVAL;
+       }

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
