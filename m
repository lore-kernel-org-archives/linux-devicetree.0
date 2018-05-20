Return-Path: <SRS0=E3S+=IH=gmail.com=ykaneko0929@kernel.org>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH v4 3/3] arm64: dts: renesas: r8a77995: add thermal device support
Date: Sun, 20 May 2018 18:26:19 +0900
Message-Id: <1526808379-3850-4-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1526808379-3850-1-git-send-email-ykaneko0929@gmail.com>
References: <1526808379-3850-1-git-send-email-ykaneko0929@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 82aed7e..d4884e3 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -216,6 +216,18 @@
 			#power-domain-cells = <1>;
 		};
 
+		thermal: thermal@e6190000 {
+			compatible = "renesas,thermal-r8a77995";
+			reg = <0 0xe6190000 0 0x10>, <0 0xe6190100 0 0x38>;
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 522>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 522>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		intc_ex: interrupt-controller@e61c0000 {
 			compatible = "renesas,intc-ex-r8a77995", "renesas,irqc";
 			#interrupt-cells = <2>;
@@ -785,6 +797,25 @@
 		};
 	};
 
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&thermal>;
+
+			trips {
+				cpu-crit {
+					temperature = <120000>;
+					hysteresis = <2000>;
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
 		compatible = "arm,armv8-timer";
 		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-- 
1.9.1
