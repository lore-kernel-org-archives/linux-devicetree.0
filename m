From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 0/2] arm64: dts: rockchip: Support PMU for rk3399 SoCs
Date: Fri,  1 Jul 2016 15:36:08 +0800
Message-ID: <1467358570-24417-1-git-send-email-wxt@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Heiko, Marc & ARM guys

When Jay first submitted the rk3399.dtsi upstream
<https://patchwork.kernel.org/patch/8885821/> he had the PMU node in there,
but then took it out because the upstream binding wasn't done yet.
It looks as if the upstream stuff has landed, since in linux/master I see:
287e9357abcc DT/arm,gic-v3: Documment PPI partition support
e3825ba1af3a irqchip/gic-v3: Add support for partitioned PPIs
9e2c986cb460 irqchip: Add per-cpu interrupt partitioning library
222df54fd8b7 genirq: Allow the affinity of a percpu interrupt to be set/retrieved
651e8b54abde irqdomain: Allow domain matching on irq_fwspec

This series patches add to support the rk3399 SoCs PMU.
As my do some tests with ChromeOs for my rk3399 board.

TEST=$perf list |grep Hardware
cpu-cycles OR cycles                               [Hardware event]
instructions                                       [Hardware event]
cache-references                                   [Hardware event]
branch-instructions OR branches                    [Hardware event]
branch-misses                                      [Hardware event]
..
Also,
localhost / # perf stat sleep 1
watch the Hardware event.
e.g.:
2375647      instructions              #    0.79  insns per cycle
18482      branch-misses             #    0.00% of all branches
--

And perf top/stat to watch the hardware event. That work for me on now.

-Caesar



Caesar Wang (2):
  arm64: dts: rockchip: change all interrupts cells for 4 on rk3399 SoCs
  arm64: dts: rockchip: support the pmu node for rk3399

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 124 +++++++++++++++++++------------
 1 file changed, 75 insertions(+), 49 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
