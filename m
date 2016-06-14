From: Caesar Wang <wxt@rock-chips.com>
Subject: Re: [PATCH v2 0/4] clocksource: rockchip/timer: Support rktimer for
 rk3399
Date: Tue, 14 Jun 2016 17:12:12 +0800
Message-ID: <575FCA6C.1010405@rock-chips.com>
References: <1465275273-22076-1-git-send-email-wxt@rock-chips.com> <20160613130625.GC10634@linaro.org> <575F814C.104@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <575F814C.104@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "Huang, Tao" <huangtao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, dianders@chromium.org, briannorris@google.com, smbarber@google.com, linux-rockchip@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, cf@rock-chips.com, devicetree@vger.kernel.org, Xing Zheng <zhengxing@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


On 2016=E5=B9=B406=E6=9C=8814=E6=97=A5 12:00, Huang, Tao wrote:
> Hi Daniel:
> On 2016=E5=B9=B406=E6=9C=8813=E6=97=A5 21:06, Daniel Lezcano wrote:
>> On Tue, Jun 07, 2016 at 12:54:29PM +0800, Caesar Wang wrote:
>>> This series patches had been tested on rockchip inside kernel.
>>> In order to support the rk3399 SoC timer and turn off interrupts an=
d IPIs to
>>> save power in idle.
>> For my personnal information, are the arch_timer in the same power d=
omain
>> than the CPU ? IOW, what is the 'always-on' property in the DT ?
> Yes. In our SoC design, all arch (generic) timer in the same power
> domain of CPU core. So if one CPU core power down, the arch (generic)
> timer will lose it's state and stop working.
> While rk timer maybe in peri power domain or pmu power domain, so the
> timer will still work when CPU power down.
>
> But before RK3399, all SoCs with CPU power domain, do not support aut=
o
> power down while cpu idle. So the arch timer can be seem as always on=
,
> i.e. we don't need a broadcast timer at all.
>
>>> Okay, it still works bootup on rk3288/other SoCs, even though many =
socs
>>> hasn't used
>>> the broadcast timer.
>> Yes, unfortunately the SoC design on rk3288 and the previous ones do=
 not
>> allow to use a cpuidle driver with cpu/cluster power down, so obviou=
sly the
>> broadcast timer is pointless on these boards :)
>>
> You are right.
>
>>> History version:
>>> v1:
>>> https://lkml.org/lkml/2016/5/25/186
>>>
>>> Easy to test for my borad.
>>> localhost / # cat /proc/interrupts
>>> CPU0       CPU1       CPU2       CPU3       CPU4       CPU5
>>> 1:          0          0          0          0          0          =
0     GICv3  29 Edge      arch_timer
>>> ...
>>> 5:          0          0          0          0          0          =
0     GICv3 113 Level     rk_timer
>>> ..
>>>
>>> localhost / # cat /proc/timer_list | grep event_handler
>>> get "event_handler:  hrtimer_interrupt"
>>> event_handler:  tick_handle_oneshot_broadcast
>>> event_handler:  hrtimer_interrupt
>> What are you trying to demonstrate here ? There are no interrupts fo=
r both
>> arch_timer and rk_timer.

My god!! let's forget it now!
Sorry for forgetting what happened.
---

Re-picked them up for my board since I'm doing other things to run a=20
single cpu.

localhost / # cat /proc/interrupts
            CPU0
   1:          0     GICv3  29 Edge      arch_timer
   2:        807     GICv3  30 Edge      arch_timer
   5:        712     GICv3 113 Level     rk_timer
=2E...


> I don't know. Maybe Caesar do something wrong :(
> This is my output:
>             CPU0       CPU1       CPU2       CPU3       CPU4       CP=
U5
>
> ...
>    2:       2911       1967       1588       1608       1295       16=
06
>     GICv3  30 Edge      arch_timer
>    5:        578        637        684        626        161        1=
65
>     GICv3 113 Level     rk_timer
>
>
>

--=20
caesar wang | software engineer | wxt@rock-chip.com
