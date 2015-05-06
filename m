From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 03/10] mtd: nand: add NAND driver for Broadcom STB
 NAND controller
Date: Wed, 6 May 2015 14:18:47 -0700
Message-ID: <554A8537.8050404@broadcom.com>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com> <1430935194-7579-4-git-send-email-computersforpeace@gmail.com> <2114576.uWbXPVDdyI@wuerfel> <20150506210534.GK32500@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150506210534.GK32500@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Corneliu Doban <cdoban-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Dan Ehrenberg <dehrenberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 5/6/2015 2:05 PM, Brian Norris wrote:
> On Wed, May 06, 2015 at 09:17:36PM +0200, Arnd Bergmann wrote:
>> On Wednesday 06 May 2015 10:59:47 Brian Norris wrote:
>>> +
>>> +static inline u32 nand_readreg(struct brcmnand_controller *ctrl, u32 offs)
>>> +{
>>> +       return __raw_readl(ctrl->nand_base + offs);
>>> +}
>>> +
>>> +static inline void nand_writereg(struct brcmnand_controller *ctrl, u32 offs,
>>> +                                u32 val)
>>> +{
>>> +       __raw_writel(val, ctrl->nand_base + offs);
>>> +}
>>> +
>>>
>>
>> You had mentioned previously that there might be an endianess issue in this
>> driver.
> 
> Might. I have a patch already, but I failed to boot a BE kernel, so I
> kept it out for now. If you don't mind, I'd prefer patching something
> like this once it's testable on ARM BE. This *is*, however, extensively
> tested on MIPS (LE and BE) and ARM (LE).

Correct, extensive test and pass all MTD test cases. We should
eventually be able to test this on a working ARM BE platform, within the
next couple months.

> 
>> I think this won't work on big-endian architectures other than MIPS,
>> so it would be good to either list in the DT the endianess of the device
>> and use appropriate accessors here, or hardcode it based on the architecture
>> (using ioread32_be in big-endian mips, but readl elsewhere).
> 
> I suspect we wouldn't need a DT property but could just special-case
> MIPS BE, as you note.
> 
>> Using __raw_writel has another problem regarding the DMA capability of this
>> driver, as it will not flush any write buffers or synchronize caches before
>> sending data off to the device, so you risk data corruption.
> 
> We use mb() before kicking off DMA or other commands.
> 
>> Also, the
>> compiler can choose to split up the 32-bit word access into byte accesses,
>> which on most hardware does not do what you want.
> 
> Huh? Wouldn't that break just about every driver in existence? And how
> is writel() any different than __raw_writel() in that regard? From
> include/asm-generic/io.h:
> 
> static inline void writel(u32 value, volatile void __iomem *addr)
> {
>         __raw_writel(__cpu_to_le32(value), addr);
> }
> 
> And BTW, splitting isn't possible on ARM. From
> arch/arm/include/asm/io.h:
> 
> static inline void __raw_writel(u32 val, volatile void __iomem *addr)
> {
>         asm volatile("str %1, %0"
>                      : "+Qo" (*(volatile u32 __force *)addr)
>                      : "r" (val));
> }
> 
> Brian
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
