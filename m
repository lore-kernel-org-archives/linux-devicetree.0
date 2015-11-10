From: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH RESEND v2 3/4] ARM: BCM: Add SMP support for Broadcom NSP
Date: Tue, 10 Nov 2015 21:51:32 +0530
Message-ID: <5642198C.2040205@broadcom.com>
References: <1446839371-22601-1-git-send-email-kapilh@broadcom.com>
 <1446839371-22601-4-git-send-email-kapilh@broadcom.com>
 <CACRpkdZN-iwdR_VwktdHsw+rGQLhCgmWnERYVDE+KaYOqJR30w@mail.gmail.com>
 <CAGVrzca34xrVznoEE2e26JyR11Q9L1sT4mJcNZ=NuprqUnZnjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGVrzca34xrVznoEE2e26JyR11Q9L1sT4mJcNZ=NuprqUnZnjw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broad>
List-Id: devicetree@vger.kernel.org

Hi Florian, Linus,

On 11/10/2015 7:59 AM, Florian Fainelli wrote:
> 2015-11-09 2:09 GMT-08:00 Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
>> On Fri, Nov 6, 2015 at 8:49 PM, Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
>>
>>> Add SMP support for Broadcom's Northstar Plus SoC
>>> cpu enable method. This changes also consolidates
>>> iProc family's - BCM NSP and BCM Kona, platform
>>> SMP handling in a common file.
>>>
>>> Northstar Plus SoC is based on ARM Cortex-A9
>>> revision r3p0 which requires configuration for ARM
>>> Errata 764369 for SMP. This change adds the needed
>>> configuration option.
>>>
>>> Signed-off-by: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>
>> This version looks saner to me.
>>
>>> +static int nsp_write_lut(void)
>>> +{
>>> +       void __iomem *sku_rom_lut;
>>> +       phys_addr_t secondary_startup_phy;
>>> +
>>> +       if (!secondary_boot) {
>>> +               pr_warn("required secondary boot register not specified\n");
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       sku_rom_lut = ioremap_nocache((phys_addr_t)secondary_boot,
>>> +                                               sizeof(secondary_boot));
>>
>> Why is this address not just taken directly from the device tree?
> 
> It comes directly from DT, that's what bcm_smp_prepare_cpus() does
> read from Device Tree.
> 
>>
>> If it is not in the device tree: why?
>>
>> Also give it a sane name, bcm_sec_boot_address or so.
>> "secondary_boot" sounds like a function you call to boot
>> the second core.
> 
> Agree with that, there could be a better name which better reflects
> this is a variable.
> 
As this change is consolidating SMP implementation, I kept the same 
name of the variable which was used in kona_smp.c so that the changes
in the common code is minimal. Also, the fact that the change is part
of up-streamed code, I didn't alter with the variable name. Shall I 
change it in the next patch?

Thanks,
Kapil

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
