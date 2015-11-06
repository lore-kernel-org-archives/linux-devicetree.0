From: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH RESEND 3/4] ARM: BCM: Add SMP support for Broadcom NSP
Date: Fri, 6 Nov 2015 17:45:19 +0530
Message-ID: <563C99D7.6050102@broadcom.com>
References: <1446702681-45339-1-git-send-email-kapilh@broadcom.com>
 <1446702681-45339-4-git-send-email-kapilh@broadcom.com>
 <CACRpkda8Fg+Z0h1+3dv=xAAKJnnXvPR=i5eyjLeLxFn467cvzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkda8Fg+Z0h1+3dv=xAAKJnnXvPR=i5eyjLeLxFn467cvzA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kerne>
List-Id: devicetree@vger.kernel.org



On 11/5/2015 3:14 PM, Linus Walleij wrote:
> On Thu, Nov 5, 2015 at 6:51 AM, Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> 
>> Add SMP support for Broadcom's Northstar Plus SoC,
>> cpu enable method and pen_release procedures. This
>> changes also consolidates iProc family's - BCM NSP
>> and BCM Kona, SMP handling in a common file.
>>
>> Northstar Plus SoC is based on ARM Cortex-A9
>> revision r3p0 which requires configuration for ARM
>> Errata 764369 for SMP. This change adds the needed
>> configuration option.
>>
>> Signed-off-by: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> (...)
>> +/*
>> + * iProc specific entry point for secondary CPUs.  This provides
>> + * a "holding pen" into which all secondary cores are held until
>> + * we are ready for them to initialise.
>> + */
> 
> Do you *REALLY* need the complex pen hold/release semaphore
> stuff?
> 
> Consult for example commit
> c00def71efd919e8ae835a25f4f4c80a4b2d36d3
> "ARM: ux500: simplify secondary CPU boot"
> 
> I realized the pen hold/release stuff was totally surplus on the
> ux500 platform, it was probably just copied from the Vexpress
> or RealView reference design and kept around because ARM
> did things that way. And you are copying the same code from
> other platforms again. Do you *really* understand the pen hold/release
> code? (I don't.)
> 
> In our case it turned out that all that was really needed was:
> 
> - Map and enable SCU at .smp_prepare_cpus()
> 
> - Write the start address for the secondary CPU(s) in their
>   magic registers/addresses i.e what you do in
>   nsp_write_lut() and then call
>   arch_send_wakeup_ipi_mask(cpumask_of(cpu)); in
>   .smp_boot_secondary()
>   It seems you may not even need the IPI, I can't see
>   that call in your patch so I guess your secondary
>   CPUs aren't in WFI at boot.
> 
There is a dsb_sev() to get secondary core out of standby. However,
I think arch_send_wakeup_ipi_mask() is a better way as it is per
core. I will make the required changes in the next patch set.
> No pen hold/release magic! Works like a charm for us.
> So see of you really need this horror story with copied
> assembly code from realview etc.
> 
> Yours,
> Linus Walleij
> 
Thanks,
Kapil Hali


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
