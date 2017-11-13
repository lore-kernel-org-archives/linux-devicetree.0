From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a77970: add GPIO support
Date: Tue, 14 Nov 2017 00:23:20 +0300
Message-ID: <20171113213149.295833059@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline; filename=arm64-dts-renesas-r8a77970-add-GPIO-support.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Describe all 6 GPIO controllers in the R8A77970 device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77970.dtsi |   90 ++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -139,6 +139,96 @@
 			reg = <0 0xe6060000 0 0x504>;
 		};
 
+		gpio0: gpio@e6050000 {
+			compatible = "renesas,gpio-r8a77970",
+				     "renesas,rcar-gen3-gpio";
+			reg = <0 0xe6050000 0 0x50>;
+			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 0 22>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 912>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 912>;
+		};
+
+		gpio1: gpio@e6051000 {
+			compatible = "renesas,gpio-r8a77970",
+				     "renesas,rcar-gen3-gpio";
+			reg = <0 0xe6051000 0 0x50>;
+			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 32 28>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 911>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 911>;
+		};
+
+		gpio2: gpio@e6052000 {
+			compatible = "renesas,gpio-r8a77970",
+				     "renesas,rcar-gen3-gpio";
+			reg = <0 0xe6052000 0 0x50>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 64 17>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 910>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 910>;
+		};
+
+		gpio3: gpio@e6053000 {
+			compatible = "renesas,gpio-r8a77970",
+				     "renesas,rcar-gen3-gpio";
+			reg = <0 0xe6053000 0 0x50>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 96 17>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 909>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 909>;
+		};
+
+		gpio4: gpio@e6054000 {
+			compatible = "renesas,gpio-r8a77970",
+				     "renesas,rcar-gen3-gpio";
+			reg = <0 0xe6054000 0 0x50>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 128 6>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 908>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 908>;
+		};
+
+		gpio5: gpio@e6055000 {
+			compatible = "renesas,gpio-r8a77970",
+				     "renesas,rcar-gen3-gpio";
+			reg = <0 0xe6055000 0 0x50>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 160 15>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 907>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 907>;
+		};
+
 		intc_ex: interrupt-controller@e61c0000 {
 			compatible = "renesas,intc-ex-r8a77970", "renesas,irqc";
 			#interrupt-cells = <2>;
