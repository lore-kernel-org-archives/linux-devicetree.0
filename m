From: Caesar Wang <caesar.upstream@gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: Support PMU for rk3399 SoCs
Date: Thu, 14 Jul 2016 09:14:57 +0800
Message-ID: <5786E791.1010906@gmail.com>
References: <1467792357-9749-1-git-send-email-wxt@rock-chips.com> <20160706112444.GB14657@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160706112444.GB14657@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Caesar Wang <wxt@rock-chips.com>, Will Deacon <will.deacon@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, huangtao@rock-chips.com, devicetree@vger.kernel.org, Xing Zheng <zhengxing@rock-chips.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Catalin Marinas <catalin.marinas@arm.com>, Brian Norris <briannorris@chromium.org>, dianders@chromium.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, David Wu <david.wu@rock-chips.com>, cf@rock-chips.com, Jianqun Xu <jay.xu@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On 2016=E5=B9=B407=E6=9C=8806=E6=97=A5 19:24, Mark Rutland wrote:
> On Wed, Jul 06, 2016 at 04:05:55PM +0800, Caesar Wang wrote:
>> Hello Heiko, Marc & ARM guys
> Hi,
>
> These patches themselves look fine, so FWIW:
>
> Acked-by: Mark Rutland <mark.rutland@arm.com>

Thanks your ack.

>
> The prerequisite patch from Marc [1] also largely looks fine, but the=
re
> are some minor details to sort out [2], so at this point in time I'm
> guesssing this is all v4.9 material.
>
> Thanks,
> Mark.
>
> [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2016-July/4=
40647.html
> [2] http://lists.infradead.org/pipermail/linux-arm-kernel/2016-July/4=
41495.html

Okay, I saw the Marc's patch had been merged on next kernel.:-)


-Caesar
>
>> When Jay first submitted the rk3399.dtsi upstream
>> <https://patchwork.kernel.org/patch/8885821/> he had the PMU node in=
 there,
>> but then took it out because the upstream binding wasn't done yet.
>> It looks as if the upstream stuff has landed, since in linux/master =
I see:
>> 287e9357abcc DT/arm,gic-v3: Documment PPI partition support
>> e3825ba1af3a irqchip/gic-v3: Add support for partitioned PPIs
>> 9e2c986cb460 irqchip: Add per-cpu interrupt partitioning library
>> 222df54fd8b7 genirq: Allow the affinity of a percpu interrupt to be =
set/retrieved
>> 651e8b54abde irqdomain: Allow domain matching on irq_fwspec
>>
>> This series patches add to support the rk3399 SoCs PMU.
>> I pick up the https://patchwork.kernel.org/patch/9209369/.
>>
>> As do some tests with ChromeOs for my rk3399 board.
>> Tested with linus master 4.7-rc6 kernel on rk3399 board.
>> https://github.com/Caesar-github/rockchip/tree/rk3399/pmu-upstream
>>
>> localhost / # perf list
>>
>> List of pre-defined events (to be used in -e):
>> cpu-cycles OR cycles [Hardware event]
>> instructions [Hardware event]
>> cache-references [Hardware event]
>> cache-misses [Hardware event]
>> branch-instructions OR branches [Hardware event]
>> branch-misses [Hardware event]
>> bus-cycles [Hardware event]
>> ...
>>
>> perf stat --cpu 0/1/2/3..... to minitor
>> e.g. cpu0;
>>
>> localhost / # perf stat --cpu 0
>>
>> Performance counter stats for 'CPU(s) 0':
>>
>> 3374.917571 task-clock (msec) # 1.001 CPUs utilized [100.00%]
>> 20 context-switches # 0.006 K/sec [100.00%]
>> 2 cpu-migrations # 0.001 K/sec [100.00%]
>> 55 page-faults # 0.016 K/sec
>> 7151843 cycles # 0.002 GHz [100.00%]
>> <not supported> stalled-cycles-frontend
>> <not supported> stalled-cycles-backend
>> 4272536 instructions # 0.60 insns per cycle [100.00%]
>> 568406 branches # 0.168 M/sec [100.00%]
>> 65652 branch-misses # 11.55% of all branches
>>
>> Also, 'perf top' to monitor the PMU interrupts from cpus
>>
>> -Caesar
>>
>>
>> Changes in v2:
>> - AS Mark comments on https://patchwork.kernel.org/patch/9209369/
>>    remove the interrupt-affinity property, we need depend on Marc' p=
erf
>>    code on https://patchwork.kernel.org/patch/9209369/.
>>
>> Caesar Wang (2):
>>    arm64: dts: rockchip: change all interrupts cells for 4 on rk3399=
 SoCs
>>    arm64: dts: rockchip: support the pmu node for rk3399
>>
>>   arch/arm64/boot/dts/rockchip/rk3399.dtsi | 118 ++++++++++++++++++-=
------------
>>   1 file changed, 69 insertions(+), 49 deletions(-)
>>
>> --=20
>> 1.9.1
>>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
