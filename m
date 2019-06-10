From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] arm64: dts: meson: g12a: sort sdio nodes correctly
Date: Mon, 10 Jun 2019 14:49:31 +0200
Message-ID: <20190610124931.17422-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Fix sdio node order in the soc device tree

Fixes: a1737347250e ("arm64: dts: meson: g12a: add SDIO controller")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 73 ++++++++++-----------
 1 file changed, 36 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 6aec4cf87350..0642e0a6c605 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -843,6 +843,29 @@
 						};
 					};
 
+					sdio_pins: sdio {
+						mux {
+							groups = "sdio_d0",
+								 "sdio_d1",
+								 "sdio_d2",
+								 "sdio_d3",
+								 "sdio_clk",
+								 "sdio_cmd";
+							function = "sdio";
+							bias-disable;
+							drive-strength-microamp = <4000>;
+						};
+					};
+
+					sdio_clk_gate_pins: sdio_clk_gate {
+						mux {
+							groups = "GPIOX_4";
+							function = "gpio_periphs";
+							bias-pull-down;
+							drive-strength-microamp = <4000>;
+						};
+					};
+
 					spdif_in_a10_pins: spdif-in-a10 {
 						mux {
 							groups = "spdif_in_a10";
@@ -1326,30 +1349,6 @@
 						};
 					};
 
-					sdio_pins: sdio {
-						mux {
-							groups = "sdio_d0",
-								 "sdio_d1",
-								 "sdio_d2",
-								 "sdio_d3",
-								 "sdio_cmd",
-								 "sdio_clk";
-							function = "sdio";
-							bias-disable;
-							drive-strength-microamp = <4000>;
-						};
-					};
-
-					sdio_clk_gate_pins: sdio_clk_gate {
-						mux {
-							groups = "GPIOX_4";
-							function = "gpio_periphs";
-							bias-pull-down;
-							drive-strength-microamp = <4000>;
-						};
-					};
-
-
 					uart_a_pins: uart-a {
 						mux {
 							groups = "uart_a_tx",
@@ -2316,6 +2315,19 @@
 			};
 		};
 
+		sd_emmc_a: sd@ffe03000 {
+			compatible = "amlogic,meson-axg-mmc";
+			reg = <0x0 0xffe03000 0x0 0x800>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
+			status = "disabled";
+			clocks = <&clkc CLKID_SD_EMMC_A>,
+				 <&clkc CLKID_SD_EMMC_A_CLK0>,
+				 <&clkc CLKID_FCLK_DIV2>;
+			clock-names = "core", "clkin0", "clkin1";
+			resets = <&reset RESET_SD_EMMC_A>;
+			amlogic,dram-access-quirk;
+		};
+
 		sd_emmc_b: sd@ffe05000 {
 			compatible = "amlogic,meson-axg-mmc";
 			reg = <0x0 0xffe05000 0x0 0x800>;
@@ -2340,19 +2352,6 @@
 			resets = <&reset RESET_SD_EMMC_C>;
 		};
 
-		sd_emmc_a: sd@ffe03000 {
-			compatible = "amlogic,meson-axg-mmc";
-			reg = <0x0 0xffe03000 0x0 0x800>;
-			interrupts = <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
-			status = "disabled";
-			clocks = <&clkc CLKID_SD_EMMC_A>,
-				 <&clkc CLKID_SD_EMMC_A_CLK0>,
-				 <&clkc CLKID_FCLK_DIV2>;
-			clock-names = "core", "clkin0", "clkin1";
-			resets = <&reset RESET_SD_EMMC_A>;
-			amlogic,dram-access-quirk;
-		};
-
 		usb: usb@ffe09000 {
 			status = "disabled";
 			compatible = "amlogic,meson-g12a-usb-ctrl";
-- 
2.20.1
