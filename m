Return-Path: <SRS0=lN0X=UD=renesas.com=prvs=50588f7500=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 1/2] ARM: dts: r7s9210: Add IRQC device node
Date: Tue, 4 Jun 2019 15:09:13 -0500
Message-ID: <20190604200914.64896-2-chris.brandt@renesas.com>
In-Reply-To: <20190604200914.64896-1-chris.brandt@renesas.com>
References: <20190604200914.64896-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Enable support for the IRQC on RZ/A2M, which is a small front-end to the
GIC.  This allows to use up to 8 external interrupts with configurable
sense select.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s9210.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
index 3d0bbc1f4543..72b79770e336 100644
--- a/arch/arm/boot/dts/r7s9210.dtsi
+++ b/arch/arm/boot/dts/r7s9210.dtsi
@@ -473,6 +473,25 @@
 			reg = <0xfcfe8004 4>;
 		};
 
+		irqc: interrupt-controller@fcfef800 {
+			compatible = "renesas,r7s9210-irqc",
+				     "renesas,rza1-irqc";
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0xfcfef800 0x6>;
+			interrupt-map =
+				<0 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				<1 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+				<2 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+				<3 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+				<4 0 &gic GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+				<5 0 &gic GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+				<6 0 &gic GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+				<7 0 &gic GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map-mask = <7 0>;
+		};
+
 		pinctrl: pin-controller@fcffe000 {
 			compatible = "renesas,r7s9210-pinctrl";
 			reg = <0xfcffe000 0x1000>;
-- 
2.16.1
