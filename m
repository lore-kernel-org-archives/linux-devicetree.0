From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] ARM: dts: sh73a0: Correct interrupt type for ARM TWD
Date: Fri, 18 Mar 2016 11:19:20 +0100
Message-ID: <1458296361-4468-2-git-send-email-geert+renesas@glider.be>
References: <1458296361-4468-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1458296361-4468-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Jon Hunter <jonathanh@nvidia.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

The ARM TWD interrupt is a private peripheral interrupt (PPI), and per
the ARM GIC documentation, whether the type for PPIs can be set is
IMPLEMENTATION DEFINED.

For SH-Mobile AG5 devices the PPI type cannot be set, and so when we
attempt to set the type for the ARM TWD interrupt it fails.  This has
gone unnoticed because it fails silently, and because we cannot
re-configure the type it has had no impact. Nevertheless fix the type
for the TWD interrupt so that it matches the hardware configuration.

Based on patches by Jon Hunter for Tegra20/30 and OMAP4.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Exposed by Jon Hunter's "[PATCH 04/15] irqchip/gic: WARN if setting the
interrupt type fails":

WARNING: CPU: 0 PID: 0 at drivers/irqchip/irq-gic-common.c:61 gic_configure_irq+0x64/0x7c()
Modules linked in:
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.5.0-kzm9g-00426-g226dd0f378de2fe5-dirty #721
Hardware name: Generic SH73A0 (Flattened Device Tree)
[<c010e570>] (unwind_backtrace) from [<c010acc0>] (show_stack+0x10/0x14)
[<c010acc0>] (show_stack) from [<c02de4dc>] (dump_stack+0xa4/0xdc)
[<c02de4dc>] (dump_stack) from [<c011fdb4>] (warn_slowpath_common+0x84/0xb0)
[<c011fdb4>] (warn_slowpath_common) from [<c011fe70>] (warn_slowpath_null+0x18/0x20)
[<c011fe70>] (warn_slowpath_null) from [<c02fd2d8>] (gic_configure_irq+0x64/0x7c)
[<c02fd2d8>] (gic_configure_irq) from [<c02fc98c>] (gic_set_type+0x48/0x60)
[<c02fc98c>] (gic_set_type) from [<c016f934>] (__irq_set_trigger+0x64/0x13c)
[<c016f934>] (__irq_set_trigger) from [<c016fd50>] (__setup_irq+0x344/0x5d8)
[<c016fd50>] (__setup_irq) from [<c01702d0>] (request_percpu_irq+0x98/0xe0)
[<c01702d0>] (request_percpu_irq) from [<c0802f84>] (twd_local_timer_common_register+0x38/0x1ac)
[<c0802f84>] (twd_local_timer_common_register) from [<c0803140>] (twd_local_timer_of_register+0x48/0x70)
[<c0803140>] (twd_local_timer_of_register) from [<c08180b4>] (clocksource_probe+0x48/0x88)
[<c08180b4>] (clocksource_probe) from [<c0800b04>] (start_kernel+0x250/0x374)
[<c0800b04>] (start_kernel) from [<4000807c>] (0x4000807c)
---
 arch/arm/boot/dts/sh73a0.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
index bf825ca4f6f7912a..3d41fb97689e6a49 100644
--- a/arch/arm/boot/dts/sh73a0.dtsi
+++ b/arch/arm/boot/dts/sh73a0.dtsi
@@ -43,7 +43,7 @@
 	timer@f0000600 {
 		compatible = "arm,cortex-a9-twd-timer";
 		reg = <0xf0000600 0x20>;
-		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
 		clocks = <&twd_clk>;
 	};
 
-- 
1.9.1
