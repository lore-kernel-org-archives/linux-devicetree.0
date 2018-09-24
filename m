Return-Path: <SRS0=k11Z=MG=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v3] arm64: dts: renesas: r8a779{7|8}0: add TPU support
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
Message-ID: <841a2957-dcf6-a7ec-88c1-245c360f01d5@cogentembedded.com>
Date: Mon, 24 Sep 2018 21:33:00 +0300
MIME-Version: 1.0
In-Reply-To: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Describe TPU in the R8A779{7|8}0 device trees.

Based on the original (and large) patches by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20180924-v4.19-rc5' branch of
Simon Horman's 'renesas.git' repo.

Changes in version 3:
- added the "interrupts" and "resets" properties.

Changes in version 2:
- fixed up the size cells in the "regs" properties;
- fixed up the "#pwm-cells" properties;
- fixed up the R8A77980's "compatible" property.

 arch/arm64/boot/dts/renesas/r8a77970.dtsi |   10 ++++++++++
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |   11 +++++++++++
 2 files changed, 21 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -614,6 +614,16 @@
 			status = "disabled";
 		};
 
+		tpu: pwm@e6e80000 {
+			compatible = "renesas,tpu-r8a77970", "renesas,tpu";
+			reg = <0 0xe6e80000 0 0x148>;
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 304>;
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 304>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
 
 		vin0: video@e6ef0000 {
 			compatible = "renesas,vin-r8a77970";
Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -666,6 +666,17 @@
 			status = "disabled";
 		};
 
+		tpu: pwm@e6e80000 {
+			compatible = "renesas,tpu-r8a77980", "renesas,tpu";
+			reg = <0 0xe6e80000 0 0x148>;
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 304>;
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 304>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		vin0: video@e6ef0000 {
 			compatible = "renesas,vin-r8a77980";
 			reg = <0 0xe6ef0000 0 0x1000>;
