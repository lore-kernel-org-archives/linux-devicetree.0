From: Chuanhua Han <chuanhua.han@nxp.com>
Subject: [PATCH 3/4] arm64: dts: ls1028a: Fix incorrect I2C clock divider
Date: Tue,  6 Aug 2019 16:42:22 +0800
Message-ID: <20190806084223.23543-3-chuanhua.han@nxp.com>
References: <20190806084223.23543-1-chuanhua.han@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190806084223.23543-1-chuanhua.han@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chuanhua Han <chuanhua.han@nxp.com>
List-Id: devicetree@vger.kernel.org

Ls1028a platform, the i2c input clock is actually platform pll CLK / 4
(this is the hardware connection), other clock divider can not get the
correct i2c clock, resulting in the output of SCL pin clock is not
accurate.

Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index aef5b06..cca7bfdb 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -171,7 +171,7 @@
 			#size-cells = <0>;
 			reg = <0x0 0x2000000 0x0 0x10000>;
 			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clockgen 4 1>;
+			clocks = <&clockgen 4 3>;
 			status = "disabled";
 		};
 
@@ -181,7 +181,7 @@
 			#size-cells = <0>;
 			reg = <0x0 0x2010000 0x0 0x10000>;
 			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clockgen 4 1>;
+			clocks = <&clockgen 4 3>;
 			status = "disabled";
 		};
 
@@ -191,7 +191,7 @@
 			#size-cells = <0>;
 			reg = <0x0 0x2020000 0x0 0x10000>;
 			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clockgen 4 1>;
+			clocks = <&clockgen 4 3>;
 			status = "disabled";
 		};
 
@@ -201,7 +201,7 @@
 			#size-cells = <0>;
 			reg = <0x0 0x2030000 0x0 0x10000>;
 			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clockgen 4 1>;
+			clocks = <&clockgen 4 3>;
 			status = "disabled";
 		};
 
@@ -211,7 +211,7 @@
 			#size-cells = <0>;
 			reg = <0x0 0x2040000 0x0 0x10000>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clockgen 4 1>;
+			clocks = <&clockgen 4 3>;
 			status = "disabled";
 		};
 
@@ -221,7 +221,7 @@
 			#size-cells = <0>;
 			reg = <0x0 0x2050000 0x0 0x10000>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clockgen 4 1>;
+			clocks = <&clockgen 4 3>;
 			status = "disabled";
 		};
 
@@ -231,7 +231,7 @@
 			#size-cells = <0>;
 			reg = <0x0 0x2060000 0x0 0x10000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clockgen 4 1>;
+			clocks = <&clockgen 4 3>;
 			status = "disabled";
 		};
 
@@ -241,7 +241,7 @@
 			#size-cells = <0>;
 			reg = <0x0 0x2070000 0x0 0x10000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clockgen 4 1>;
+			clocks = <&clockgen 4 3>;
 			status = "disabled";
 		};
 
-- 
2.9.5
