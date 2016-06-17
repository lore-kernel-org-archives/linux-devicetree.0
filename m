From: Caesar Wang <wxt@rock-chips.com>
Subject: Re: [PATCH v2 0/4] clocksource: rockchip/timer: Support rktimer for
 rk3399
Date: Fri, 17 Jun 2016 09:08:28 +0800
Message-ID: <57634D8C.1050501@rock-chips.com>
References: <1465275273-22076-1-git-send-email-wxt@rock-chips.com> <5762B70E.7090909@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5762B70E.7090909@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Cc: dianders@chromium.org, briannorris@google.com, smbarber@google.com, linux-rockchip@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, cf@rock-chips.com, huangtao@rock-chips.com, devicetree@vger.kernel.org, Xing Zheng <zhengxing@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


On 2016=E5=B9=B406=E6=9C=8816=E6=97=A5 22:26, Daniel Lezcano wrote:
> On 06/07/2016 06:54 AM, Caesar Wang wrote:
>> This series patches had been tested on rockchip inside kernel.
>> In order to support the rk3399 SoC timer and turn off interrupts and=
=20
>> IPIs to
>> save power in idle.
>> Okay, it still works bootup on rk3288/other SoCs, even though many=20
>> socs hasn't used
>> the broadcast timer.
>>
>> History version:
>> v1:
>> https://lkml.org/lkml/2016/5/25/186
>>
>> Easy to test for my borad.
>> localhost / # cat /proc/interrupts
>> CPU0       CPU1       CPU2       CPU3       CPU4       CPU5
>> 1:          0          0          0          0 0          0    =20
>> GICv3  29 Edge      arch_timer
>> ...
>> 5:          0          0          0          0 0          0     GICv=
3=20
>> 113 Level     rk_timer
>> ..
>>
>> localhost / # cat /proc/timer_list | grep event_handler
>> get "event_handler:  hrtimer_interrupt"
>> event_handler:  tick_handle_oneshot_broadcast
>> event_handler:  hrtimer_interrupt
>>
>> That should work for my board.
>
> Hi Caesar,
>
> I applied the patches on my tree. I humbly reworded the changelog, if=
=20
> you disagree with the content, let me know.

Have a look at your tree.=20
(https://git.linaro.org/people/daniel.lezcano/linux.git/shortlog/refs/h=
eads/clockevents/next)
That's LGTM.


>
> Please, in the future, take care of the following:
>
>  - patch prefix is 'clocksource/driver/<driver_name>: [A-Z].*'
>
>  - the change log is important, it deserves some love.
>

Thanks for pointing out, I will keep in mind it.

-
Caesar

> Thanks.
>
>   -- Daniel
>
>

--=20
caesar wang | software engineer | wxt@rock-chip.com
