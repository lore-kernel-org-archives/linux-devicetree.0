From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 0/7] Rename RK1108 to RV1108
Date: Tue, 14 Feb 2017 08:44:31 +0800
Message-ID: <0bbc4151-d954-1a27-48c3-1e8c9cb9e16f@rock-chips.com>
References: <1486983566-32265-1-git-send-email-andy.yan@rock-chips.com>
 <2809087.MHZWQWdaOC@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2809087.MHZWQWdaOC@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko & Rob:


On 2017年02月13日 20:51, Heiko Stuebner wrote:
> Hi Andy,
>
> Am Montag, 13. Februar 2017, 18:59:26 CET schrieb Andy Yan:
>> Rockchip finally named this soc as RV1108, so change
>> RK1108/rk1108 to RV1108/rv1108 for compatible.
> renaming existing bindings (that have been in multiple kernel versions
> already) always is a hot topic. So I'll be hoping for Rob to give a go-ahead
> for it :-) .
>
> Just to confirm, the rk1108/rv1108 is completely new to the market, so we're
> not breaking any existing devices, right?

     Yes, the 1108 Soc is completely new to market, this change will not 
breaking any existing devices.
     Hope more suggestions from you.
>
> Heiko
>
>
>
>> Andy Yan (7):
>>    dt-bindings: rockchip-dw-mshc: rename RK1108 to RV1108
>>    dt-bindings: rk1108-cru: rename RK1108 to RV1108
>>    clk: rockchip: rename RK1108 to RV1108
>>    dt-bindings: rockchip,pinctrl: rename RK1108 to RV1108
>>    pinctrl: rockchip: rename RK1108 to RV1108
>>    ARM: dts: rename RK1108 to RV1108
>>    ARM: rockchip: reanme RK1108 to RV1108
>>
>>   Documentation/devicetree/bindings/arm/rockchip.txt |   4 +-
>>   ...chip,rk1108-cru.txt => rockchip,rv1108-cru.txt} |  12 +-
>>   .../devicetree/bindings/mmc/rockchip-dw-mshc.txt   |   2 +-
>>   .../bindings/pinctrl/rockchip,pinctrl.txt          |  16 +-
>>   arch/arm/boot/dts/Makefile                         |   2 +-
>>   .../boot/dts/{rk1108-evb.dts => rv1108-evb.dts}    |   7 +-
>>   arch/arm/boot/dts/{rk1108.dtsi => rv1108.dtsi}     |  24 +-
>>   drivers/clk/rockchip/Makefile                      |   2 +-
>>   .../clk/rockchip/{clk-rk1108.c => clk-rv1108.c}    | 414
>> ++++++++++----------- drivers/clk/rockchip/clk.h                         |
>> 28 +-
>>   drivers/pinctrl/pinctrl-rockchip.c                 |  76 ++--
>>   .../clock/{rk1108-cru.h => rv1108-cru.h}           |   6 +-
>>   12 files changed, 300 insertions(+), 293 deletions(-)
>>   rename Documentation/devicetree/bindings/clock/{rockchip,rk1108-cru.txt =>
>> rockchip,rv1108-cru.txt} (83%) rename arch/arm/boot/dts/{rk1108-evb.dts =>
>> rv1108-evb.dts} (89%) rename arch/arm/boot/dts/{rk1108.dtsi => rv1108.dtsi}
>> (94%)
>>   rename drivers/clk/rockchip/{clk-rk1108.c => clk-rv1108.c} (57%)
>>   rename include/dt-bindings/clock/{rk1108-cru.h => rv1108-cru.h} (97%)
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
