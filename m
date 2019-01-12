Return-Path: <SRS0=+lSs=PU=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: [PATCH RFC 1/3] arm64: dts: renesas: r8a779{7|8}0: add RPC-IF support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
References: <4b74a2a5-6b3b-9b06-6a8f-fce39124ec59@cogentembedded.com>
Message-ID: <c2a18d73-b9c2-f228-0306-e39dc1b54bc5@cogentembedded.com>
Date: Sat, 12 Jan 2019 20:43:37 +0300
MIME-Version: 1.0
In-Reply-To: <4b74a2a5-6b3b-9b06-6a8f-fce39124ec59@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Describe RPC-IF in the R8A779{7|8}0 device trees.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77970.dtsi |   15 +++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |   15 +++++++++++++++
 2 files changed, 30 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -1038,6 +1038,21 @@
 			status = "disabled";
 		};
 
+		rpc: rpc@ee200000 {
+			compatible = "renesas,r8a77970-rpc";
+			reg = <0 0xee200000 0 0x8100>,
+			      <0 0x08000000 0 0x4000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 917>;
+			clock-names = "rpc";
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 917>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@f1010000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -1325,6 +1325,21 @@
 			status = "disabled";
 		};
 
+		rpc: rpc@ee200000 {
+			compatible = "renesas,r8a77980-rpc";
+			reg = <0 0xee200000 0 0x8100>,
+			      <0 0x08000000 0 0x4000000>;
+			reg-names = "regs", "dirmap";
+			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 917>;
+			clock-names = "rpc";
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 917>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@f1010000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
