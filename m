From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 07/10] ARM: sun6i: a31: Use new sun6i-a31-r-intc compatible for NMI/R_INTC
Date: Tue,  6 Jun 2017 13:59:29 +0800
Message-ID: <20170606055932.22548-8-wens@csie.org>
References: <20170606055932.22548-1-wens@csie.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170606055932.22548-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

We introduced a new compatible for the NMI or R_INTC interrupt
controller. This new compatible has the register region aligned
to the boundary listed in the SoC's memory map.

This patch converts the NMI/R_INTC node to using the new compatible,
and fixes up the register region and device node name.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun6i-a31.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index d0cede5aaeb5..d36211ceb950 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -1154,11 +1154,11 @@
 				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		nmi_intc: interrupt-controller@01f00c0c {
-			compatible = "allwinner,sun6i-a31-sc-nmi";
+		nmi_intc: interrupt-controller@1f00c00 {
+			compatible = "allwinner,sun6i-a31-r-intc";
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			reg = <0x01f00c0c 0x38>;
+			reg = <0x01f00c00 0x400>;
 			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.11.0
