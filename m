From: Chenhui Zhao <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v5] powerpc/rcpm: add RCPM driver
Date: Mon, 3 Aug 2015 19:14:46 +0800
Message-ID: <1438600486.7515.1@remotesmtp.freescale.net>
References: <1435304656-34505-1-git-send-email-Yuantian.Tang@freescale.com>
	<1438389906.19345.101.camel@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438389906.19345.101.camel-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org, b07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Sat, Aug 1, 2015 at 8:45 AM, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> 
wrote:
> On Fri, 2015-06-26 at 15:44 +0800, Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
>>  +static void rcpm_v1_set_ip_power(bool enable, u32 *mask)
>>  +{
>>  +     if (enable)
>>  +             setbits32(&rcpm_v1_regs->ippdexpcr, *mask);
>>  +     else
>>  +             clrbits32(&rcpm_v1_regs->ippdexpcr, *mask);
>>  +}
>>  +
>>  +static void rcpm_v2_set_ip_power(bool enable, u32 *mask)
>>  +{
>>  +     if (enable)
>>  +             setbits32(&rcpm_v2_regs->ippdexpcr[0], *mask);
>>  +     else
>>  +             clrbits32(&rcpm_v2_regs->ippdexpcr[0], *mask);
>>  +}
> 
> Why do these take "u32 *mask" instead of "u32 mask"?
> 
> -Scott

I think it can be used in the case where there are several mask values.

-Chenhui

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
