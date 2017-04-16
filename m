From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 26/29] ARM: dts: rockchip: disable arm-global-timer for rk3188
Date: Sun, 16 Apr 2017 22:27:16 +0200
Message-ID: <1492374441-23336-26-git-send-email-daniel.lezcano@linaro.org>
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

The clocksource and the sched_clock provided by the arm_global_timer
are quite unstable because their rates depend on the cpu frequency.

On the other side, the arm_global_timer has a higher rating than the
rockchip_timer, it will be selected by default by the time framework
while we want to use the stable rockchip clocksource.

Let's disable the arm_global_timer in order to have the rockchip
clocksource selected by default.

Signed-off-by: Alexander Kochetkov <al.kochet@gmail.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/boot/dts/rk3188.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
index 8428fae..1aff4ad2 100644
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@ -546,6 +546,7 @@
 
 &global_timer {
 	interrupts = <GIC_PPI 11 0xf04>;
+	status = "disabled";
 };
 
 &local_timer {
-- 
2.7.4
