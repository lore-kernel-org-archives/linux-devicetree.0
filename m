From: Chuanhua Han <chuanhua.han@nxp.com>
Subject: [PATCH 4/4] arm64: dts: lx2160a: Fix incorrect I2C clock divider
Date: Tue,  6 Aug 2019 16:42:23 +0800
Message-ID: <20190806084223.23543-4-chuanhua.han@nxp.com>
References: <20190806084223.23543-1-chuanhua.han@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190806084223.23543-1-chuanhua.han@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chuanhua Han <chuanhua.han@nxp.com>
List-Id: devicetree@vger.kernel.org

Lx2160a platform, the i2c input clock is actually platform pll CLK / 16
(this is the hardware connection), other clock divider can not get the
correct i2c clock, resulting in the output of SCL pin clock is not
accurate.

Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 4720a8e..408e0ec 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -485,7 +485,7 @@
 			reg = <0x0 0x2000000 0x0 0x10000>;
 			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "i2c";
-			clocks = <&clockgen 4 7>;
+			clocks = <&clockgen 4 15>;
 			scl-gpio = <&gpio2 15 GPIO_ACTIVE_HIGH>;
 			status = "disabled";
 		};
@@ -497,7 +497,7 @@
 			reg = <0x0 0x2010000 0x0 0x10000>;
 			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "i2c";
-			clocks = <&clockgen 4 7>;
+			clocks = <&clockgen 4 15>;
 			status = "disabled";
 		};
 
@@ -508,7 +508,7 @@
 			reg = <0x0 0x2020000 0x0 0x10000>;
 			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "i2c";
-			clocks = <&clockgen 4 7>;
+			clocks = <&clockgen 4 15>;
 			status = "disabled";
 		};
 
@@ -519,7 +519,7 @@
 			reg = <0x0 0x2030000 0x0 0x10000>;
 			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "i2c";
-			clocks = <&clockgen 4 7>;
+			clocks = <&clockgen 4 15>;
 			status = "disabled";
 		};
 
@@ -530,7 +530,7 @@
 			reg = <0x0 0x2040000 0x0 0x10000>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "i2c";
-			clocks = <&clockgen 4 7>;
+			clocks = <&clockgen 4 15>;
 			scl-gpio = <&gpio2 16 GPIO_ACTIVE_HIGH>;
 			status = "disabled";
 		};
@@ -542,7 +542,7 @@
 			reg = <0x0 0x2050000 0x0 0x10000>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "i2c";
-			clocks = <&clockgen 4 7>;
+			clocks = <&clockgen 4 15>;
 			status = "disabled";
 		};
 
@@ -553,7 +553,7 @@
 			reg = <0x0 0x2060000 0x0 0x10000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "i2c";
-			clocks = <&clockgen 4 7>;
+			clocks = <&clockgen 4 15>;
 			status = "disabled";
 		};
 
@@ -564,7 +564,7 @@
 			reg = <0x0 0x2070000 0x0 0x10000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "i2c";
-			clocks = <&clockgen 4 7>;
+			clocks = <&clockgen 4 15>;
 			status = "disabled";
 		};
 
-- 
2.9.5
