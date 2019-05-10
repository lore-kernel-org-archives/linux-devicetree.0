From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 2/4] arm64: dts: bitmain: Add reset controller support for BM1880 SoC
Date: Sat, 11 May 2019 00:15:23 +0530
Message-ID: <20190510184525.13568-3-manivannan.sadhasivam@linaro.org>
References: <20190510184525.13568-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190510184525.13568-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, alec.lin@bitmain.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add reset controller support for Bitmain BM1880 SoC. This commit also
adds reset support to UART peripherals.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 arch/arm64/boot/dts/bitmain/bm1880.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/bitmain/bm1880.dtsi b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
index fdfdc65d29ef..3ab039029bf2 100644
--- a/arch/arm64/boot/dts/bitmain/bm1880.dtsi
+++ b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/bitmain,bm1880-reset.h>
 
 / {
 	compatible = "bitmain,bm1880";
@@ -92,6 +93,12 @@
 				compatible = "bitmain,bm1880-pinctrl";
 				reg = <0x50 0x4B0>;
 			};
+
+			rst: reset-controller@c00 {
+				compatible = "bitmain,bm1880-reset";
+				reg = <0xc00 0x8>;
+				#reset-cells = <1>;
+			};
 		};
 
 		uart0: serial@58018000 {
@@ -100,6 +107,7 @@
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst BM1880_RST_UART0_1_CLK>;
 			status = "disabled";
 		};
 
@@ -109,6 +117,7 @@
 			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst BM1880_RST_UART0_1_ACLK>;
 			status = "disabled";
 		};
 
@@ -118,6 +127,7 @@
 			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst BM1880_RST_UART2_3_CLK>;
 			status = "disabled";
 		};
 
@@ -127,6 +137,7 @@
 			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst BM1880_RST_UART2_3_ACLK>;
 			status = "disabled";
 		};
 	};
-- 
2.17.1
