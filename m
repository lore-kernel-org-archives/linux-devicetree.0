From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] bus: add Broadcom GISB arbiter bus timeout/error handler
Date: Wed, 14 May 2014 12:46:06 -0700
Message-ID: <CAGVrzcag3aKiuuQsfZWrAJT+-cpO__kNF3Lc9XXkpswQxzL56A@mail.gmail.com>
References: <1400094649-11193-1-git-send-email-f.fainelli@gmail.com>
 <1400094649-11193-2-git-send-email-f.fainelli@gmail.com> <8057197.5nM8JDA8pQ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8057197.5nM8JDA8pQ@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "open list:DOCUMENTATION" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2014-05-14 12:33 GMT-07:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> On Wednesday 14 May 2014 12:10:46 Florian Fainelli wrote:
>> This patch adds support for the Broadcom GISB arbiter bus timeout/error
>> handler. GISB is a proprietary bus used by Broadcom Set Top Box
>> System-on-a-chip devices (BCM7xxx) which allows multiple masters and
>> clients to be interfaced with each other.
>>
>> The bus arbiter offers support for generating two interrupts towards the
>> host CPU, thus allowing us to "catch" clock gated masters, or masters
>> being volontarily blocked for powersaving purposes, or do general system
>> troubleshooting.
>>
>> We also register a hook with the ARM fault exception handling to allow
>> printing a more informative message than "imprecise external abort at
>> 0x00000000" for instance.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Looks pretty good to me.

Cool, thanks!, BTW, which tree should we attempt to get this merged into?

>
>> +static int brcmstb_gisb_arb_decode_addr(struct brcmstb_gisb_arb_device *gdev,
>> +                                     const char *reason)
>> +{
>> +     u32 cap_status;
>> +     unsigned long arb_addr;
>> +     u32 master;
>> +     const char *m_name;
>> +     char m_fmt[11];
>> +
>> +     cap_status = ioread32(gdev->base + ARB_ERR_CAP_STATUS);
>> +
>> +     /* Invalid captured address, bail out */
>> +     if (!(cap_status & ARB_ERR_CAP_STATUS_VALID))
>> +             return 1;
>> +
>> +     /* Read the address and master */
>> +     arb_addr = ioread32(gdev->base + ARB_ERR_CAP_ADDR) & 0xffffffff;
>> +#ifdef CONFIG_PHYS_ADDR_T_64BIT
>> +     arb_addr |= (u64)ioread32(gdev->base + ARB_ERR_CAP_HI_ADDR) << 32;
>> +#endif
>
> Can you use 'if (IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))' here, or does that
> cause a warning?

No warning is issued, I will use that instead. Thanks!

>
>> +static int brcmstb_bus_error_handler(unsigned long addr, unsigned int fsr,
>> +                                  struct pt_regs *regs)
>> +{
>> +     int ret = 0;
>> +     struct brcmstb_gisb_arb_device *gdev;
>> +
>> +     /* iterate over each GISB arb registered handlers */
>> +     list_for_each_entry(gdev, &brcmstb_gisb_arb_device_list, next)
>> +             ret |= brcmstb_gisb_arb_decode_addr(gdev, "bus error");
>> +     /*
>> +      * If it was an imprecise abort, then we need to correct the
>> +      * return address to be _after_ the instruction.
>> +     */
>> +     if (fsr & (1 << 10))
>> +             regs->ARM_pc += 4;
>> +
>> +     return ret;
>> +}
>
> This will cause the normal abort handler to trigger if the GISB
> arbiter doesn't know what happened, right?

That's right, one of the very first things that the GISB arbiter
checks is whether the faulting error is valid or not, if it is not, it
bails out and so we keep on processing the other exception handlers.
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
