Return-Path: <SRS0=HRCn=TA=renesas.com=prvs=40235708d9=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 5/7] ARM: dts: r7s9210: Add SDHI support
Date: Tue, 30 Apr 2019 08:23:07 -0500
Message-ID: <20190430132309.12473-6-chris.brandt@renesas.com>
In-Reply-To: <20190430132309.12473-1-chris.brandt@renesas.com>
References: <20190430132309.12473-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark
Cc: devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add SDHI support for the R7S9210 (RZ/A2) SoC.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s9210.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
index 1cd982c9920f..2eaa5eeba509 100644
--- a/arch/arm/boot/dts/r7s9210.dtsi
+++ b/arch/arm/boot/dts/r7s9210.dtsi
@@ -322,6 +322,30 @@
 			status = "disabled";
 		};
 
+		sdhi0: sd@e8228000 {
+			compatible = "renesas,sdhi-r7s9210";
+			reg = <0xe8228000 0x8c0>;
+			interrupts = <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 103>, <&cpg CPG_MOD 102>;
+			clock-names = "core", "cd";
+			power-domains = <&cpg>;
+			cap-sd-highspeed;
+			cap-sdio-irq;
+			status = "disabled";
+		};
+
+		sdhi1: sd@e822a000 {
+			compatible = "renesas,sdhi-r7s9210";
+			reg = <0xe822a000 0x8c0>;
+			interrupts = <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 101>, <&cpg CPG_MOD 100>;
+			clock-names = "core", "cd";
+			power-domains = <&cpg>;
+			cap-sd-highspeed;
+			cap-sdio-irq;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@e8221000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.16.1
