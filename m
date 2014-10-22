From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 8/8] ARM: mediatek: Add config option for mediatek SoCs.
Date: Wed, 22 Oct 2014 15:53:23 +0200
Message-ID: <CABuKBeLJuaDnCYuvvS6csNzvbTeEdgEUdZ4tBQeVPuw37JK11Q@mail.gmail.com>
References: <1413973797-17619-1-git-send-email-yingjoe.chen@mediatek.com>
	<1413973797-17619-9-git-send-email-yingjoe.chen@mediatek.com>
	<CABuKBe+Ew6R2Kb90-gDHBQ4HuydfFxJdYmr+v9-KNC-b0K4Tkw@mail.gmail.com>
	<1413984696.19686.72.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413984696.19686.72.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hsien-Chun Yen <hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, huang eddie <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Nathan Chung <nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yuhau Chen <yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Joe,

2014-10-22 15:31 GMT+02:00 Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
>
> Hi Matthias,
>
> On Wed, 2014-10-22 at 15:18 +0200, Matthias Brugger wrote:
>> 2014-10-22 12:29 GMT+02:00 Joe.C <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
>> > +
>> > +if ARCH_MEDIATEK
>> > +
>> > +config MACH_MT6589
>> > +       bool "MediaTek MT6589 SoCs support"
>> > +       default ARCH_MEDIATEK
>> > +
>> > +config MACH_MT8127
>> > +       bool "MediaTek MT8127 SoCs support"
>> > +       default ARCH_MEDIATEK
>> > +
>> > +config MACH_MT8135
>> > +       bool "MediaTek MT8135 SoCs support"
>> > +       default ARCH_MEDIATEK
>> > +
>> > +endif
>>
>> MACH_MTxxxx are not used nowhere, please remove them.
>
> Yes, they are not used in this series yet.
>
> MACH_MT8135 was used in mt8135 pinctrl driver [1] and will be used in
> mt8135 clk driver we are about to send. I don't want to create false
> dependency between these 2 series so I put it here.
> Do you prefer add them when they are first used?

Yes please add them, when they are first used.
Today I had a look on the pinctrl patches you mentioned. It looks to
me as if the config is not needed in the series.

Thanks,
Matthias

[0] http://thread.gmane.org/gmane.linux.ports.arm.kernel/358505

>
> Joe.C
>
> [1]
> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-September/289288.html
>
>



-- 
motzblog.wordpress.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
