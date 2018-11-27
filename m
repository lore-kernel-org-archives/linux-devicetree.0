Return-Path: <SRS0=lXjp=OG=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 15/22] ARM: dts: r8a7744: Add thermal device to DT
Date: Tue, 27 Nov 2018 11:56:28 +0000
Message-Id: <1543319795-48325-16-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com>
References: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch instantiates the thermal sensor module with thermal-zone
support.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7744.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index b26315d..0eaf8a1 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -329,6 +329,17 @@
 			resets = <&cpg 407>;
 		};
 
+		thermal: thermal@e61f0000 {
+			compatible = "renesas,thermal-r8a7744",
+				     "renesas,rcar-gen2-thermal";
+			reg = <0 0xe61f0000 0 0x10>, <0 0xe61f0100 0 0x38>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 522>;
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 522>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		icram0:	sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
@@ -1373,6 +1384,26 @@
 		};
 	};
 
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&thermal>;
+
+			trips {
+				cpu-crit {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
-- 
2.7.4
