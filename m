From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 12/13] ARM: dts: rv1108: Pass the 'arm,cpu-registers-not-fw-configured' property
Date: Sun, 25 Nov 2018 19:19:06 -0200
Message-ID: <20181125211907.9895-12-otavio@ossystems.com.br>
References: <20181125211907.9895-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181125211907.9895-1-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: Otavio Salvador <otavio@ossystems.com.br>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Since firmware does not initialize  any of the generic timer CPU
registers pass the 'arm,cpu-registers-not-fw-configured' property as
suggested in Documentation/devicetree/bindings/timer/arm,arch_timer.txt.

This also aligns with other Rockchip SoC dtsi files.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 arch/arm/boot/dts/rv1108.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
index 42566adadc83..d96c58728b28 100644
--- a/arch/arm/boot/dts/rv1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -71,6 +71,7 @@
 
 	timer {
 		compatible = "arm,armv7-timer";
+		arm,cpu-registers-not-fw-configured;
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
 			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		clock-frequency = <24000000>;
-- 
2.19.1
