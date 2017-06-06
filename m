From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 10/10] arm64: allwinner: a64: add NMI (R_INTC) controller on A64
Date: Tue,  6 Jun 2017 13:59:32 +0800
Message-ID: <20170606055932.22548-11-wens@csie.org>
References: <20170606055932.22548-1-wens@csie.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170606055932.22548-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
List-Id: devicetree@vger.kernel.org

From: Icenowy Zheng <icenowy@aosc.io>

Allwinner A64 SoC features a R_INTC controller, which controls the NMI
line, and this interrupt line is usually connected to the AXP PMIC.

Add support for it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
[wens@csie.org: Add fallback sun6i-a31-r-intc compatible]
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 4eb2f3ca602a..1865bc01d89e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -445,6 +445,15 @@
 				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		r_intc: interrupt-controller@1f00c00 {
+			compatible = "allwinner,sun50i-a64-r-intc",
+				     "allwinner,sun6i-a31-r-intc";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			reg = <0x01f00c00 0x400>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		r_ccu: clock@1f01400 {
 			compatible = "allwinner,sun50i-a64-r-ccu";
 			reg = <0x01f01400 0x100>;
-- 
2.11.0
