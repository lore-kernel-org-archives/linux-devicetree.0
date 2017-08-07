From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/3] arm64 xilinx zynqmp firmware interface
Date: Mon, 7 Aug 2017 08:09:32 +0200
Message-ID: <1182e5f8-2588-32ff-8380-04273c28d1cd@xilinx.com>
References: <cover.1501854302.git.michal.simek@xilinx.com>
 <34C9E6FB-A8CA-462F-8B10-3E15F9EC87D4@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <34C9E6FB-A8CA-462F-8B10-3E15F9EC87D4-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bharat Kumar Gogada <bharatku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, yangbo lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Simek <monst>
List-Id: devicetree@vger.kernel.org

On 5.8.2017 06:23, Alexander Graf wrote:
> 
> 
>> Am 04.08.2017 um 15:45 schrieb Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>:
>>
>> Hi,
>>
>> xilinx is using this interface for very long time and we can't merge our
>> driver changes to Linux because of missing communication layer with
>> firmware. This interface was developed before scpi and scmi was
>> available. In connection to power management scpi and scmi are missing
>> pieces which we already use. There is a separate discussion how to
>> extend scmi to support all our use cases.
>> This simply patch is not adding any power management features but only
>> adding minimum functionality which are needed for drivers.
> 
> If you're thinking of changing the interface later down the road, wouldn't it make sense to probe EL3 for its existence? 
You could then expose this interface on today's EL3 and something
scpi/scmi based on tomorrow's.

Right now driver is checking pmu firmware version. Based on this it is
clear how to communicate with it. The same checking could be there for
ATF version. Both of these should tell you exactly what's the
communication channel.
If we decide to use scmi or any other implementation we will increase
versions.

Thanks,
Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
