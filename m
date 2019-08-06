From: Chuanhua Han <chuanhua.han@nxp.com>
Subject: [PATCH 1/4] arm64: dts: ls1088a: Fix incorrect I2C clock divider
Date: Tue,  6 Aug 2019 16:42:20 +0800
Message-ID: <20190806084223.23543-1-chuanhua.han@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chuanhua Han <chuanhua.han@nxp.com>
List-Id: devicetree@vger.kernel.org

Ls1088a platform, the i2c input clock is actually platform pll CLK / 8
(this is the hardware connection), other clock divider can not get the
correct i2c clock, resulting in the output of SCL pin clock is not
accurate.

Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 20f5ebd..30b760e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -324,7 +324,7 @@
 			#size-cells = <0>;
 			reg = <0x0 0x2000000 0x0 0x10000>;
 			interrupts = <0 34 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clockgen 4 3>;
+			clocks = <&clockgen 4 7>;
 			status = "disabled";
 		};
 
@@ -334,7 +334,7 @@
 			#size-cells = <0>;
 			reg = <0x0 0x2010000 0x0 0x10000>;
 			interrupts = <0 34 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clockgen 4 3>;
+			clocks = <&clockgen 4 7>;
 			status = "disabled";
 		};
 
@@ -344,7 +344,7 @@
 			#size-cells = <0>;
 			reg = <0x0 0x2020000 0x0 0x10000>;
 			interrupts = <0 35 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clockgen 4 3>;
+			clocks = <&clockgen 4 7>;
 			status = "disabled";
 		};
 
@@ -354,7 +354,7 @@
 			#size-cells = <0>;
 			reg = <0x0 0x2030000 0x0 0x10000>;
 			interrupts = <0 35 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clockgen 4 3>;
+			clocks = <&clockgen 4 7>;
 			status = "disabled";
 		};
 
-- 
2.9.5
