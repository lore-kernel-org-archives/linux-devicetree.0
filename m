Return-Path: <SRS0=HRCn=TA=renesas.com=prvs=40235708d9=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 2/7] ARM: dts: r7s9210: Add Ethernet support
Date: Tue, 30 Apr 2019 08:23:04 -0500
Message-ID: <20190430132309.12473-3-chris.brandt@renesas.com>
In-Reply-To: <20190430132309.12473-1-chris.brandt@renesas.com>
References: <20190430132309.12473-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark
Cc: devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add Ethernet support for the RZ/A2 SoC.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s9210.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
index 8423004bb4b7..8e9738467bfa 100644
--- a/arch/arm/boot/dts/r7s9210.dtsi
+++ b/arch/arm/boot/dts/r7s9210.dtsi
@@ -191,6 +191,31 @@
 			status = "disabled";
 		};
 
+		ether0: ethernet@e8204000 {
+			compatible = "renesas,ether-r7s9210";
+			reg = <0xe8204000 0x200>;
+			interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 65>;
+			power-domains = <&cpg>;
+
+			phy-mode = "rmii";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		ether1: ethernet@e8204200 {
+			compatible = "renesas,ether-r7s9210";
+			reg = <0xe8204200 0x200>;
+			interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 64>;
+			power-domains = <&cpg>;
+			phy-mode = "rmii";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		ostm0: timer@e803b000 {
 			compatible = "renesas,r7s9210-ostm", "renesas,ostm";
 			reg = <0xe803b000 0x30>;
-- 
2.16.1
