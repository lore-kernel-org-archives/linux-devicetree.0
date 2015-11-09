From: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 4/4] ARM: BCM: Add SMP support for Broadcom 4708
Date: Mon, 9 Nov 2015 10:29:53 -0500
Message-ID: <20151109152953.GH16778@broadcom.com>
References: <1446844273-6460-1-git-send-email-kapilh@broadcom.com>
 <1446844273-6460-5-git-send-email-kapilh@broadcom.com>
 <563D1ED1.6050506@hauke-m.de>
 <20151106225419.GP8792@broadcom.com>
 <563D3777.3050208@hauke-m.de>
 <563D3AA1.6050508@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <563D3AA1.6050508-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 07, 2015 at 12:41:21AM +0100, Hauke Mehrtens wrote:
> On 11/07/2015 12:27 AM, Hauke Mehrtens wrote:
> > On 11/06/2015 11:54 PM, Jon Mason wrote:
> >> On Fri, Nov 06, 2015 at 10:42:41PM +0100, Hauke Mehrtens wrote:
> >>> On 11/06/2015 10:11 PM, Kapil Hali wrote:
> >>>> From: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> >>>>
> >>>> Add SMP support for Broadcom's 4708 SoCs.
> >>>>
> >>>> Signed-off-by: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> >>>> Acked-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
> >>>> Tested-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
> >>>> Signed-off-by: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> >>>
> >>> I tested this on a Netgear R6250 V1 (BCM4708) and SMP worked.
> >>>
> >>>> ---
> >>>>  arch/arm/boot/dts/bcm4708.dtsi | 2 ++
> >>>>  arch/arm/mach-bcm/Kconfig      | 1 +
> >>>>  arch/arm/mach-bcm/Makefile     | 3 +++
> >>>>  3 files changed, 6 insertions(+)
> >>>>
> >>>
> >>> ...
> >>>
> >>>> --- a/arch/arm/mach-bcm/Kconfig
> >>>> +++ b/arch/arm/mach-bcm/Kconfig
> >>>> @@ -54,6 +54,7 @@ config ARCH_BCM_NSP
> >>>>  config ARCH_BCM_5301X
> >>>>  	bool "Broadcom BCM470X / BCM5301X ARM SoC" if ARCH_MULTI_V7
> >>>>  	select ARCH_BCM_IPROC
> >>>
> >>> You activated ARM_ERRATA_764369 for NSP is this not needed for NS?
> >>
> >> I'm not certain the CPU version, and without that it is difficult to
> >> know what errata's are present in the underlying hardware.  My guess
> >> is that all present in NSP are present in NS (for UP and SMP).  This
> >> would put it as:
> >>         select ARM_ERRATA_754322
> >>         select ARM_ERRATA_775420
> >>         select ARM_ERRATA_764369 if SMP
> >>
> >> Would you like me to have them added?
> >>
> > 
> > I will send a separate patch adding all the workarounds for erratas in
> > the CPU core and the cache controller.
> > 
> > Hauke
> > 
> > 
> Hi,
> 
> BCM4708 uses a Cortex-A9 rev r3p0 and a L2C-310 rev r3p2. For this CPU
> and cache controller the same workaround are needed as for NSP, if you
> will resend this patch, please add all of them.

Agreed.  Kapil or I will mod the patch.

Thanks,
Jon

> 
> Hauke
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
