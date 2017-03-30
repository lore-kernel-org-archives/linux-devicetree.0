From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 0/7] Implement clocksource for rockchip SoC using
 rockchip timer
Date: Thu, 30 Mar 2017 11:26:30 +0200
Message-ID: <95a1610f-a784-83de-135d-0e742a34ce17@linaro.org>
References: <1490197714-25415-1-git-send-email-al.kochet@gmail.com>
 <DAFDD95C-3244-4217-B3A4-E9FB176AE989@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DAFDD95C-3244-4217-B3A4-E9FB176AE989-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 29/03/2017 15:22, Alexander Kochetkov wrote:
> Hello, Daniel.

Hi Alexander,

> Due to recent comments from Mark[1], may be is better to apply v6[2] series instead of v7[3]?
> Because my main goal was to fix wall time on rk3188. And I did it the same way how that was
> already done for other timer drivers (one of possible solution).
> 
> You can rename CLOCKSOURCE_OF to TIMER_OF later. I can help with that, but I don’t
> think it is good idea to combine my changes and timer framework cleanups/improvements
> into single series.
> 
> And I thinks, that probably is is better to drop [3] and [4] and revert 0c8893c9095d ("clockevents: Add a
> clkevt-of mechanism like clksrc-of»).
> 
> What do you think?

I share your opinion.

  -- Daniel


> [1] https://lkml.org/lkml/2017/3/29/286
> [2] https://lkml.org/lkml/2017/1/31/401
> [3] https://lkml.org/lkml/2017/3/22/508
> [4] https://lkml.org/lkml/2017/3/22/420
> [5] https://lkml.org/lkml/2017/3/22/426
> 
>> 22 марта 2017 г., в 18:48, Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> написал(а):
>>
>> Hello, Daniel, Heiko.
>>
>> Here is try 7 :) Could you please take a look into it?
>>
>> rockchip_timer init code implemented using CLOCKEVENT_OF_DECLARE()
>> introduced in commit 0c8893c9095d ("clockevents: Add a clkevt-of
>> mechanism like clksrc-of")
>>
>> There is change in the arch/arm/mach-rockchip/rockchip.c.
>>
>> This series should be applied after the commit:
>> https://lkml.org/lkml/2017/3/22/426
>>
>> As without the commit, you will get linker error ("clkevt-probe.c:63:
>> undefined reference to `__clkevt_of_table’")
>>
>> Regards,
>> Alexander.
>>
>>
>> Alexander Kochetkov (6):
>>  dt-bindings: clarify compatible property for rockchip timers
>>  ARM: dts: rockchip: update compatible property for rk322x timer
>>  ARM: dts: rockchip: add clockevent attribute to rockchip timers
>>  clocksource/drivers/rockchip_timer: implement clocksource timer
>>  ARM: dts: rockchip: add timer entries to rk3188 SoC
>>  ARM: dts: rockchip: disable arm-global-timer for rk3188
>>
>> Daniel Lezcano (1):
>>  clocksource/drivers/clksrc-evt-probe: Describe with the DT both the
>>    clocksource and the clockevent
>>
>> .../bindings/timer/rockchip,rk-timer.txt           |   12 +-
>> Documentation/devicetree/bindings/timer/timer.txt  |   38 ++++
>> arch/arm/boot/dts/rk3036.dtsi                      |    1 +
>> arch/arm/boot/dts/rk3188.dtsi                      |   19 ++
>> arch/arm/boot/dts/rk322x.dtsi                      |    3 +-
>> arch/arm/boot/dts/rk3288.dtsi                      |    1 +
>> arch/arm/mach-rockchip/rockchip.c                  |    2 +
>> arch/arm64/boot/dts/rockchip/rk3368.dtsi           |    1 +
>> drivers/clocksource/Kconfig                        |    2 +
>> drivers/clocksource/clkevt-probe.c                 |    7 +
>> drivers/clocksource/clksrc-probe.c                 |    7 +
>> drivers/clocksource/rockchip_timer.c               |  215 ++++++++++++++------
>> 12 files changed, 241 insertions(+), 67 deletions(-)
>> create mode 100644 Documentation/devicetree/bindings/timer/timer.txt
>>
>> -- 
>> 1.7.9.5
>>
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
