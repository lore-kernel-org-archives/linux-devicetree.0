Return-Path: <SRS0=q+06=GB=gmail.com=ykaneko0929@kernel.org>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH 3/3] arm64: dts: renesas: r8a77995: add thermal device support
Date: Mon, 12 Mar 2018 05:26:35 +0900
Message-Id: <1520799995-26347-4-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1520799995-26347-1-git-send-email-ykaneko0929@gmail.com>
References: <1520799995-26347-1-git-send-email-ykaneko0929@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 788e3af..d1a5197 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -402,5 +402,36 @@
 			#phy-cells = <0>;
 			status = "disabled";
 		};
+
+		thermal: thermal@e61f0000 {
+			compatible = "renesas,thermal-r8a77995",
+				     "renesas,rcar-thermal";
+			reg = <0 0xe61f0000 0 0x10>, <0 0xe61f0100 0 0x38>;
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 522>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 522>;
+			#thermal-sensor-cells = <0>;
+		};
+	};
+
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
+			cooling-maps {
+			};
+		};
 	};
 };
-- 
1.9.1
