From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: mvebu: move DT Dove to MVEBU
Date: Thu, 27 Feb 2014 22:43:59 +0100
Message-ID: <530FB19F.3050209@gmail.com>
References: <1393536486-3827-1-git-send-email-sebastian.hesselbarth@gmail.com> <1393536486-3827-4-git-send-email-sebastian.hesselbarth@gmail.com> <20140227214039.GJ1872@titan.lakedaemon.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140227214039.GJ1872-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/27/2014 10:40 PM, Jason Cooper wrote:
> On Thu, Feb 27, 2014 at 10:28:04PM +0100, Sebastian Hesselbarth wrote:
>> With all the DT support preparation done, we are able to move Dove
>> to MVEBU easily. Legacy non-DT mach-dove is left untouched to rot
>> for a while before removal. Also, convert SATA PHY Kconfig entry,
>> which is DT-only.
>>
>> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
>> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
>> Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
>> Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
>> Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> ---
>>   arch/arm/boot/dts/Makefile                           | 12 ++++++------
>>   arch/arm/mach-dove/Kconfig                           | 12 ------------
>>   arch/arm/mach-dove/Makefile                          |  1 -
>>   arch/arm/mach-mvebu/Kconfig                          | 12 ++++++++++++
>>   arch/arm/mach-mvebu/Makefile                         |  1 +
>>   arch/arm/{mach-dove/board-dt.c => mach-mvebu/dove.c} | 20 ++++++++------------
>>   drivers/phy/Kconfig                                  |  2 +-
>>   7 files changed, 28 insertions(+), 32 deletions(-)
>>   rename arch/arm/{mach-dove/board-dt.c => mach-mvebu/dove.c} (61%)
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 032030361bef..376a2573e500 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -55,11 +55,6 @@ dtb-$(CONFIG_ARCH_BERLIN) += \
>>   	berlin2cd-google-chromecast.dtb
>>   dtb-$(CONFIG_ARCH_DAVINCI) += da850-enbw-cmc.dtb \
>>   	da850-evm.dtb
>> -dtb-$(CONFIG_ARCH_DOVE) += dove-cm-a510.dtb \
>> -	dove-cubox.dtb \
>> -	dove-d2plug.dtb \
>> -	dove-d3plug.dtb \
>> -	dove-dove-db.dtb
>>   dtb-$(CONFIG_ARCH_EFM32) += efm32gg-dk3750.dtb
>>   dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-origen.dtb \
>>   	exynos4210-smdkv310.dtb \
>> @@ -132,7 +127,12 @@ dtb-$(CONFIG_ARCH_MVEBU) += armada-370-db.dtb \
>>   	armada-xp-gp.dtb \
>>   	armada-xp-netgear-rn2120.dtb \
>>   	armada-xp-matrix.dtb \
>> -	armada-xp-openblocks-ax3-4.dtb
>> +	armada-xp-openblocks-ax3-4.dtb \
>> +	dove-cm-a510.dtb \
>> +	dove-cubox.dtb \
>> +	dove-d2plug.dtb \
>> +	dove-d3plug.dtb \
>> +	dove-dove-db.dtb
>
> This is going to conflict badly with
>
>    a02dd0271d01 ARM: mvebu: select dtbs from MACH_ARMADA_*
>
> Perhaps you could mimic what Andrew did in his series:
>
> dove := dove-cm-a510.dtb \
> 	dove-cubox.dtb \
> 	dove-d2plug.dtb \
> 	dove-d3plug.dtb \
> 	dove-dove-db.dtb
> dtb-$(CONFIG_ARCH_DOVE) += $(dove)
> dtb-$(CONFIG_MACH_DOVE) += $(dove)

Ok, will do - except dtb-$(CONFIG_ARCH_DOVE) above.. there is no
DT in ARCH_DOVE after this patch.

> We plan on re-alphabetizing next window to prevent bad conflicts in this
> window.

Good!

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
