Return-Path: <SRS0=NUHq=LV=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2] arm64: dts: renesas: r8a779{7|8}0: add CMT support
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
Message-ID: <63ac4c06-fd9c-2ced-2a7a-d68420f54746@cogentembedded.com>
Date: Fri, 7 Sep 2018 21:58:41 +0300
MIME-Version: 1.0
In-Reply-To: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Describe CMTs in the R8A779{7|8}0 device trees.

Based on the original (and large) patches by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20180906-v4.19-rc2' branch of
Simon Horman's 'renesas.git' repo.

The R8A779{7|8}0 CMT DT binding updates have been posted the other day...

Changes in version 2:
- added the "resets" prop to all CMT nodes;
- credited Vladimir Barinov as the formal author of the original patches.

 arch/arm64/boot/dts/renesas/r8a77970.dtsi |   70 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |   70 ++++++++++++++++++++++++++++++
 2 files changed, 140 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -209,6 +209,76 @@
 			reg = <0 0xe6060000 0 0x504>;
 		};
 
+		cmt0: timer@e60f0000 {
+			compatible = "renesas,r8a77970-cmt0",
+				     "renesas,rcar-gen3-cmt0";
+			reg = <0 0xe60f0000 0 0x1004>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 303>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 303>;
+			status = "disabled";
+		};
+
+		cmt1: timer@e6130000 {
+			compatible = "renesas,r8a77970-cmt1",
+				     "renesas,rcar-gen3-cmt1";
+			reg = <0 0xe6130000 0 0x1004>;
+			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 302>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 302>;
+			status = "disabled";
+		};
+
+		cmt2: timer@e6140000 {
+			compatible = "renesas,r8a77970-cmt1",
+				     "renesas,rcar-gen3-cmt1";
+			reg = <0 0xe6140000 0 0x1004>;
+			interrupts = <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 301>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 301>;
+			status = "disabled";
+		};
+
+		cmt3: timer@e6148000 {
+			compatible = "renesas,r8a77970-cmt1",
+				     "renesas,rcar-gen3-cmt1";
+			reg = <0 0xe6148000 0 0x1004>;
+			interrupts = <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 300>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 300>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a77970-cpg-mssr";
 			reg = <0 0xe6150000 0 0x1000>;
Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -239,6 +239,76 @@
 			reg = <0 0xe6060000 0 0x50c>;
 		};
 
+		cmt0: timer@e60f0000 {
+			compatible = "renesas,r8a77980-cmt0",
+				     "renesas,rcar-gen3-cmt0";
+			reg = <0 0xe60f0000 0 0x1004>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 303>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 303>;
+			status = "disabled";
+		};
+
+		cmt1: timer@e6130000 {
+			compatible = "renesas,r8a77980-cmt1",
+				     "renesas,rcar-gen3-cmt1";
+			reg = <0 0xe6130000 0 0x1004>;
+			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 302>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 302>;
+			status = "disabled";
+		};
+
+		cmt2: timer@e6140000 {
+			compatible = "renesas,r8a77980-cmt1",
+				     "renesas,rcar-gen3-cmt1";
+			reg = <0 0xe6140000 0 0x1004>;
+			interrupts = <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 301>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 301>;
+			status = "disabled";
+		};
+
+		cmt3: timer@e6148000 {
+			compatible = "renesas,r8a77980-cmt1",
+				     "renesas,rcar-gen3-cmt1";
+			reg = <0 0xe6148000 0 0x1004>;
+			interrupts = <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 300>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 300>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a77980-cpg-mssr";
 			reg = <0 0xe6150000 0 0x1000>;
