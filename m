From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/7] of: introduce of_dma_is_coherent() helper
Date: Thu, 6 Mar 2014 21:55:56 -0600
Message-ID: <CAL_JsqJ3QhRRNVAsvAPP=Ex_ptQcbpCXh7pf44K1xh+scFqiug@mail.gmail.com>
References: <1394097598-17622-1-git-send-email-santosh.shilimkar@ti.com>
	<1394097598-17622-4-git-send-email-santosh.shilimkar@ti.com>
	<CAL_JsqJnG1c0=+UgOmNOGs7a5jv2f3O074-TsXibiHsXapXhcQ@mail.gmail.com>
	<53194092.7010809@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53194092.7010809-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 6, 2014 at 9:44 PM, Santosh Shilimkar
<santosh.shilimkar-l0cyMroinI0@public.gmane.org> wrote:
> On Friday 07 March 2014 11:13 AM, Rob Herring wrote:
>> On Thu, Mar 6, 2014 at 3:19 AM, Santosh Shilimkar
>> <santosh.shilimkar-l0cyMroinI0@public.gmane.org> wrote:
>>> The of_dma_is_coherent() helper parses the given DT device
>>> node to see if the "dma-coherent" property is supported and
>>> returns true or false accordingly.
>>>
>>> For the architectures which are fully dma coherent and don't need per device
>>> property, it can enable CONFIG_ARCH_IS_DMA_COHERENT config option which
>>> enables DMA coherent for all devices by default.
>>
>> This worries me. I killed off arch_is_coherent() for arm. Now we're
>> adding something back. Also, we already have HAVE_GENERIC_DMA_COHERENT
>> which is different, but the names will be confusing. MIPS also has
>> DMA_NONCOHERENT.
>>
> Thanks for comments Rob. I will address them in next version.
> Specifically about ARCH_IS_DMA_COHERENT, I wasn't very comfortable either
> while adding it. But as Arnd mentioned, there is a need to have a way
> for the arch's which are fully coherent to use coherent ops by default.
>
> Am not sure whats the best way to have such support without imposing
> any special updates on such arches.

Thinking about this some more, if the arch is always coherent or
always non-coherent, then the default ops are always fine. In that
case set_arch_dma_coherent_ops is always a nop and of_dma_is_coherent
is a don't care.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
