From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/7] of: setup dma parameters using dma-ranges and dma-coherent
Date: Mon, 21 Apr 2014 10:35:17 -0500
Message-ID: <CAL_JsqJws80+o6E13rQQjEwxOaTvACpmYoa5fvnRwJ7Yry3q0A@mail.gmail.com>
References: <1397917972-6293-1-git-send-email-santosh.shilimkar@ti.com>
	<CAL_JsqLogKfqHyw4zYBkPrYh=f6tVibtmX25oYB1Q2hO11Whcw@mail.gmail.com>
	<535535A1.4020501@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <535535A1.4020501-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 21, 2014 at 10:13 AM, Santosh Shilimkar
<santosh.shilimkar-l0cyMroinI0@public.gmane.org> wrote:
> Hi Rob,
>
> On Monday 21 April 2014 10:37 AM, Rob Herring wrote:
>> On Sat, Apr 19, 2014 at 9:32 AM, Santosh Shilimkar
>> <santosh.shilimkar-l0cyMroinI0@public.gmane.org> wrote:
>>> Here is an updated version of [2] based on discussion. Series introduces
>>> support for setting up dma parameters based on device tree properties
>>> like 'dma-ranges' and 'dma-coherent' and also update to ARM 32 bit port.
>>> Earlier version of the same series is here [1].
>>>
>>> The 'dma-ranges' helps to take care of few DMAable system memory restrictions
>>> by use of dma_pfn_offset which we maintain now per device. Arch code then
>>> uses it for dma address translations for such cases. We update the
>>> dma_pfn_offset accordingly during DT the device creation process.The
>>> 'dma-coherent' property is used to setup arch's coherent dma_ops.
>>>
>>> After some off-list discussion with RMK and Arnd, I have now dropped the
>>> controversial dma_mask setup code from the series which actually isn't blocking
>>> me as such. Considering rest of the parts of the series are already aligned,
>>> am hoping to get this version merged for 3.16 merge window.
>>
>> Can you briefly describe what the h/w looks like in terms of addresses
>> for the problem you are trying to solve? Something like: Cpu view of
>> RAM is X to Y address, X corresponds to DMA address Z. Max DMA address
>> is ?
>>
> Let me try with say 8 GB RAM example
>
> CPU view of memory : 0x0000 0008 0000 0000 to 0x0000 000a 0000 0000
>
> From above memory range, first 2 GB of memory has an alias 32 bit
> view in the hardware. Hardware internally map the address issued within
> that first 2 GB to same memory.
>
> DMA view of first 2 GB [ 0x0000 0008 0000 0000 to 0x0000 0008 7fff ffff]
> is : 0x8000 0000 to 0xffff fffff.

Are you setting ZONE_DMA to be 2GB so allocations stay within DMAable
memory and that is enough that you don't need to set DMA masks?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
