From: Ziping Chen <techping.chan@gmail.com>
Subject: [PATCH 2/3] ARM: dts: sunxi: add MMC support for A83T
Date: Sun, 18 Jun 2017 21:00:17 +0800
Message-ID: <20170618130018.10684-2-techping.chan@gmail.com>
References: <20170618130018.10684-1-techping.chan@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170618130018.10684-1-techping.chan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@free-electrons.com, wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Ziping Chen <techping.chan@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Ziping Chen <techping.chan@gmail.com>

The Allwinner A83T's MMC can work with
compatible "allwinner,sun7i-a20-mmc".

Add support for it.

Signed-off-by: Ziping Chen <techping.chan@gmail.com>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 69 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index ecc75bf6780e..b39425900bdb 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -45,6 +45,8 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 #include <dt-bindings/clock/sun8i-r-ccu.h>
+#include <dt-bindings/clock/sun8i-a83t-ccu.h>
+#include <dt-bindings/reset/sun8i-a83t-ccu.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -180,6 +182,63 @@
 			#dma-cells = <1>;
 		};
 
+		mmc0: mmc@01c0f000 {
+			compatible = "allwinner,sun7i-a20-mmc";
+			clocks = <&ccu CLK_BUS_MMC0>,
+				 <&ccu CLK_MMC0>,
+				 <&ccu CLK_MMC0_OUTPUT>,
+				 <&ccu CLK_MMC0_SAMPLE>;
+			clock-names = "ahb",
+				      "mmc",
+				      "output",
+				      "sample";
+			reg = <0x01c0f000 0x1000>;
+			resets = <&ccu RST_BUS_MMC0>;
+			reset-names = "ahb";
+			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		mmc1: mmc@01c10000 {
+			compatible = "allwinner,sun7i-a20-mmc";
+			clocks = <&ccu CLK_BUS_MMC1>,
+				 <&ccu CLK_MMC1>,
+				 <&ccu CLK_MMC1_OUTPUT>,
+				 <&ccu CLK_MMC1_SAMPLE>;
+			clock-names = "ahb",
+				      "mmc",
+				      "output",
+				      "sample";
+			reg = <0x01c10000 0x1000>;
+			resets = <&ccu RST_BUS_MMC1>;
+			reset-names = "ahb";
+			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		mmc2: mmc@01c11000 {
+			compatible = "allwinner,sun7i-a20-mmc";
+			clocks = <&ccu CLK_BUS_MMC2>,
+				 <&ccu CLK_MMC2>,
+				 <&ccu CLK_MMC2_OUTPUT>,
+				 <&ccu CLK_MMC2_SAMPLE>;
+			clock-names = "ahb",
+				      "mmc",
+				      "output",
+				      "sample";
+			reg = <0x01c11000 0x1000>;
+			resets = <&ccu RST_BUS_MMC2>;
+			reset-names = "ahb";
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		ccu: clock@1c20000 {
 			compatible = "allwinner,sun8i-a83t-ccu";
 			reg = <0x01c20000 0x400>;
@@ -210,6 +269,16 @@
 				bias-pull-up;
 			};
 
+			mmc2_8bit_pins: mmc2_8bit {
+				pins = "PC5", "PC6", "PC8",
+				       "PC9", "PC10", "PC11",
+				       "PC12", "PC13", "PC14",
+				       "PC15", "PC16";
+				function = "mmc2";
+				drive-strength = <30>;
+				bias-pull-up;
+			};
+
 			spdif_tx_pin: spdif-tx-pin {
 				pins = "PE18";
 				function = "spdif";
-- 
2.11.0
