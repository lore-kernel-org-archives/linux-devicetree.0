From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 09/10] ARM: sun8i: a83t: Add device node for R_INTC interrupt controller
Date: Tue,  6 Jun 2017 13:59:31 +0800
Message-ID: <20170606055932.22548-10-wens@csie.org>
References: <20170606055932.22548-1-wens@csie.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170606055932.22548-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

The R_INTC interrupt controller handles the NMI interrupt pin for the
SoC. While there is no documentation or code from the vendor for this
device on the A83T, existing mainline kernel drivers and bindings show
this to be similar to the old Allwinner interrupt controller found on
the A10 SoC, but with only the NMI interrupt wired. Register poking
experiments confirm this.

The device seems to be the same across all recent Allwinner SoCs, apart
from the A20 and A80, which have a separate set of registers to handle
the NMI interrupt. We already have a set of bindings supporting this
on the A31.

Add a device node for it, with an SoC specific compatible.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 49aeb56970ba..4d64dfdc10d3 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -271,6 +271,15 @@
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		r_intc: interrupt-controller@1f00c00 {
+			compatible = "allwinner,sun8i-a83t-r-intc",
+				     "allwinner,sun6i-a31-r-intc";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			reg = <0x01f00c00 0x400>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		r_ccu: clock@1f01400 {
 			compatible = "allwinner,sun8i-a83t-r-ccu";
 			reg = <0x01f01400 0x400>;
-- 
2.11.0
