From: Chuanhua Han <chuanhua.han@nxp.com>
Subject: [PATCH 2/4] arm64: dts: ls1012a: Fix incorrect I2C clock divider
Date: Tue,  6 Aug 2019 16:42:21 +0800
Message-ID: <20190806084223.23543-2-chuanhua.han@nxp.com>
References: <20190806084223.23543-1-chuanhua.han@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190806084223.23543-1-chuanhua.han@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chuanhua Han <chuanhua.han@nxp.com>
List-Id: devicetree@vger.kernel.org

Ls1012a platform, the i2c input clock is actually platform pll CLK / 4
(this is the hardware connection), other clock divider can not get the
correct i2c clock, resulting in the output of SCL pin clock is not
accurate.

Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
index ec6257a..124a7e2 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
@@ -323,7 +323,7 @@
 			#size-cells = <0>;
 			reg = <0x0 0x2180000 0x0 0x10000>;
 			interrupts = <0 56 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clockgen 4 0>;
+			clocks = <&clockgen 4 3>;
 			status = "disabled";
 		};
 
@@ -333,7 +333,7 @@
 			#size-cells = <0>;
 			reg = <0x0 0x2190000 0x0 0x10000>;
 			interrupts = <0 57 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clockgen 4 0>;
+			clocks = <&clockgen 4 3>;
 			status = "disabled";
 		};
 
-- 
2.9.5
