From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 3/4] ARM: mediatek: Add sysirq in mt6589/mt8135/mt8127 dtsi
Date: Fri, 2 Jan 2015 11:16:10 +0100
Message-ID: <CABuKBeKj_+-7r-bUe_vuDdyE2V-uugfZ03dMwcbaqnNz8fLEXA@mail.gmail.com>
References: <1416902662-19281-1-git-send-email-yingjoe.chen@mediatek.com>
	<1416902662-19281-4-git-send-email-yingjoe.chen@mediatek.com>
	<1419473469.7238.0.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419473469.7238.0.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, HC Yen <hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?WUggQ2hlbiAo6Zmz5pix6LGqKQ==?= <yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yijing Wang <wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nathan Chung <nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, huang eddie <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWMMKQXVYFwzLw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Joe,

2014-12-25 3:11 GMT+01:00 Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
>
> Hi Matthias,
>
> On Tue, 2014-11-25 at 16:04 +0800, Yingjoe Chen wrote:
>> Add sysirq settings for mt6589/mt8135/mt8127
>> This also correct timer interrupt flag. The old setting works
>> because boot loader already set polarity for timer interrupt.
>> Without intpol support, the setting was not changed so gic
>> can get the irq correctly.
>>
>> Signed-off-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/mt6589.dtsi | 14 ++++++++++++--
>>  arch/arm/boot/dts/mt8127.dtsi | 14 ++++++++++++--
>>  arch/arm/boot/dts/mt8135.dtsi | 14 ++++++++++++--
>>  3 files changed, 36 insertions(+), 6 deletions(-)
>
> It seems this patch is not merged in 3.19-rc1. This do have dependency
> on other patches, and all the other patches in this series are merged.
>
> Is this planed to merge later or do we need to send additional pull
> request for it?

This patch got somehow lost, sorry for that. I apply it for v3.20.

>
> Joe.C
>
>



-- 
motzblog.wordpress.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
