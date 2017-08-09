From: SZ Lin <sz.lin@moxa.com>
Subject: [PATCH] ARM: dts: ls1021a: Add support for QSPI with ls1021a SoC
Date: Wed,  9 Aug 2017 09:59:09 +0800
Message-ID: <20170809015909.12969-1-sz.lin@moxa.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: SZ Lin <sz.lin@moxa.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add QSPI node support, and this function is disabled by default
This setting could be overwritten in board-level definitions

Signed-off-by: SZ Lin <sz.lin@moxa.com>
---
 arch/arm/boot/dts/ls1021a.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 7bb9df2c1460..9da876e47810 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -154,6 +154,20 @@
 			big-endian;
 		};
 
+		qspi: quadspi@1550000 {
+			compatible = "fsl,ls1021a-qspi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x1550000 0x0 0x10000>,
+			      <0x0 0x40000000 0x0 0x40000000>;
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
2.14.0
