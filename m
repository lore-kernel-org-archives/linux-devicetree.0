From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 25/29] ARM: dts: rockchip: Add timer entries to rk3188 SoC
Date: Sun, 16 Apr 2017 22:27:15 +0200
Message-ID: <1492374441-23336-25-git-send-email-daniel.lezcano@linaro.org>
References: <20170416202542.GV2078@mai>
 <1492374441-23336-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1492374441-23336-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Alexander Kochetkov <al.kochet@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "moderated list:ARM/Rockchip SoC
        support" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Alexander Kochetkov <al.kochet@gmail.com>

The patch add two timers to all rk3188 based boards.

The first timer is from alive subsystem and it act as a backup
for the local timers at sleep time. It act the same as other
SoC rockchip timers already present in kernel.

The second timer is from CPU subsystem and act as replacement
for the arm-global-timer clocksource and sched clock. It run
at stable frequency 24MHz.

Signed-off-by: Alexander Kochetkov <al.kochet@gmail.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/boot/dts/rk3188.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
index cf91254..8428fae 100644
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@ -106,6 +106,22 @@
 		};
 	};
 
+	timer3: timer@2000e000 {
+		compatible = "rockchip,rk3188-timer", "rockchip,rk3288-timer";
+		reg = <0x2000e000 0x20>;
+		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_TIMER3>, <&cru PCLK_TIMER3>;
+		clock-names = "timer", "pclk";
+	};
+
+	timer6: timer@200380a0 {
+		compatible = "rockchip,rk3188-timer", "rockchip,rk3288-timer";
+		reg = <0x200380a0 0x20>;
+		interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_TIMER6>, <&cru PCLK_TIMER0>;
+		clock-names = "timer", "pclk";
+	};
+
 	i2s0: i2s@1011a000 {
 		compatible = "rockchip,rk3188-i2s", "rockchip,rk3066-i2s";
 		reg = <0x1011a000 0x2000>;
-- 
2.7.4
