From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] ARM: dts: ls1021a: add quadspi node
Date: Fri, 26 Jan 2018 15:20:14 +0100
Message-ID: <20180126142014.13819-1-rasmus.villemoes@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a node to device tree repesenting the QuadSPI controller present on
LS1021a. Driver support has been present since e8c034b2fbe5 (mtd:
spi-nor: fsl-quadspi: add support for ls1021a).

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 arch/arm/boot/dts/ls1021a.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index d82d8fa7afbb..5e5c84db3946 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -162,6 +162,20 @@
 			big-endian;
 		};
 
+		qspi: quadspi@1550000 {
+			compatible = "fsl,ls1021a-qspi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x1550000 0x0 0x10000>,
+				<0x0 0x40000000 0x0 0x4000000>;
+			reg-names = "QuadSPI", "QuadSPI-memory";
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "qspi_en", "qspi";
+			clocks = <&clockgen 4 1>, <&clockgen 4 1>;
+			big-endian;
+			status = "disabled";
+		};
+
 		esdhc: esdhc@1560000 {
 			compatible = "fsl,esdhc";
 			reg = <0x0 0x1560000 0x0 0x10000>;
-- 
2.15.1
