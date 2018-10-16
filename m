Return-Path: <SRS0=S257=M4=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] arm64: dts: renesas: r8a779{7|8}0: add MSIOF support
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
Message-ID: <2c172c3a-8c79-5430-22c6-66464819e801@cogentembedded.com>
Date: Tue, 16 Oct 2018 22:36:33 +0300
MIME-Version: 1.0
In-Reply-To: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Describe MSIOF in the R8A779{7|8}0 device trees.

The DMA props are deliberately omitted as the MSIOF DMA doesn't work on
R8A77970 (due to IPMMU issue) and the RT-DMAC isn't supported on R8A77980. 

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20181015-v4.19-rc8' branch of
Simon Horman's 'renesas.git' repo.

The MSIOF bindings patch has just been posted...

 arch/arm64/boot/dts/renesas/r8a77970.dtsi |   56 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |   56 ++++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -22,6 +22,10 @@
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
 		i2c4 = &i2c4;
+		spi1 = &msiof0;
+		spi2 = &msiof1;
+		spi3 = &msiof2;
+		spi4 = &msiof3;
 	};
 
 	/* External CAN clock - to be overridden by boards that provide it */
@@ -688,6 +692,58 @@
 			status = "disabled";
 		};
 
+		msiof0: spi@e6e90000 {
+			compatible = "renesas,msiof-r8a77970",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6e90000 0 0x64>;
+			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 211>;
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 211>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof1: spi@e6ea0000 {
+			compatible = "renesas,msiof-r8a77970",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6ea0000 0 0x0064>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 210>;
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 210>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof2: spi@e6c00000 {
+			compatible = "renesas,msiof-r8a77970",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6c00000 0 0x0064>;
+			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 209>;
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 209>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof3: spi@e6c10000 {
+			compatible = "renesas,msiof-r8a77970",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6c10000 0 0x0064>;
+			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 208>;
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 208>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		vin0: video@e6ef0000 {
 			compatible = "renesas,vin-r8a77970";
 			reg = <0 0xe6ef0000 0 0x1000>;
Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -23,6 +23,10 @@
 		i2c3 = &i2c3;
 		i2c4 = &i2c4;
 		i2c5 = &i2c5;
+		spi1 = &msiof0;
+		spi2 = &msiof1;
+		spi3 = &msiof2;
+		spi4 = &msiof3;
 	};
 
 	/* External CAN clock - to be overridden by boards that provide it */
@@ -740,6 +744,58 @@
 			status = "disabled";
 		};
 
+		msiof0: spi@e6e90000 {
+			compatible = "renesas,msiof-r8a77980",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6e90000 0 0x64>;
+			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 211>;
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 211>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof1: spi@e6ea0000 {
+			compatible = "renesas,msiof-r8a77980",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6ea0000 0 0x0064>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 210>;
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 210>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof2: spi@e6c00000 {
+			compatible = "renesas,msiof-r8a77980",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6c00000 0 0x0064>;
+			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 209>;
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 209>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof3: spi@e6c10000 {
+			compatible = "renesas,msiof-r8a77980",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6c10000 0 0x0064>;
+			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 208>;
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 208>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		vin0: video@e6ef0000 {
 			compatible = "renesas,vin-r8a77980";
 			reg = <0 0xe6ef0000 0 0x1000>;
