From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v2 0/4] clocksource: rockchip/timer: Support rktimer for rk3399
Date: Tue,  7 Jun 2016 12:54:29 +0800
Message-ID: <1465275273-22076-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, Heiko Stuebner <heiko@sntech.de>
Cc: dianders@chromium.org, briannorris@google.com, smbarber@google.com, linux-rockchip@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, cf@rock-chips.com, huangtao@rock-chips.com, Caesar Wang <wxt@rock-chips.com>, devicetree@vger.kernel.org, Xing Zheng <zhengxing@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series patches had been tested on rockchip inside kernel.
In order to support the rk3399 SoC timer and turn off interrupts and IPIs to
save power in idle.
Okay, it still works bootup on rk3288/other SoCs, even though many socs hasn't used
the broadcast timer.

History version:
v1:
https://lkml.org/lkml/2016/5/25/186

Easy to test for my borad.
localhost / # cat /proc/interrupts
CPU0       CPU1       CPU2       CPU3       CPU4       CPU5
1:          0          0          0          0          0          0     GICv3  29 Edge      arch_timer
...
5:          0          0          0          0          0          0     GICv3 113 Level     rk_timer
..

localhost / # cat /proc/timer_list | grep event_handler
get "event_handler:  hrtimer_interrupt"
event_handler:  tick_handle_oneshot_broadcast
event_handler:  hrtimer_interrupt

That should work for my board.


Changes in v2:
- Add the Rob' Ack.
- s/cpu_all_mask/cpu_possible_mask/, As Daniel comments on
  https://patchwork.kernel.org/patch/9135053/.
- As the Daniel suggests on https://patchwork.kernel.org/patch/9135061/,
  That will be better for the rockchip timer driver.
- %s/ARM64/arm64.

Huang Tao (2):
  dt-bindings: document rk3399 rk-timer bindings
  arm64: dts: rockchip: add rktimer device node for rk3399

Huang, Tao (2):
  clocksource: rockchip: add dynamic irq flag to the timer
  clocksource: rockchip: add support for rk3399 SoC

 ...chip,rk3288-timer.txt => rockchip,rk-timer.txt} |  6 ++--
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |  8 +++++
 drivers/clocksource/rockchip_timer.c               | 36 +++++++++++++++++-----
 3 files changed, 41 insertions(+), 9 deletions(-)
 rename Documentation/devicetree/bindings/timer/{rockchip,rk3288-timer.txt => rockchip,rk-timer.txt} (75%)

-- 
1.9.1
