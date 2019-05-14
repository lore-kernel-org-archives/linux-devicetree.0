From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 1/3] arm64: dts: meson: g12a: add mmc nodes
Date: Tue, 14 May 2019 11:16:09 +0200
Message-ID: <20190514091611.15278-2-jbrunet@baylibre.com>
References: <20190514091611.15278-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514091611.15278-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add port B (sdcard) and port C (eMMC) pinctrl and controllers nodes to
the g12a DT.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 124 ++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 2f4f4dd54cba..b2f08fc96568 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -185,6 +185,48 @@
 						};
 					};
 
+					emmc_pins: emmc {
+						mux-0 {
+							groups = "emmc_nand_d0",
+								 "emmc_nand_d1",
+								 "emmc_nand_d2",
+								 "emmc_nand_d3",
+								 "emmc_nand_d4",
+								 "emmc_nand_d5",
+								 "emmc_nand_d6",
+								 "emmc_nand_d7",
+								 "emmc_cmd";
+							function = "emmc";
+							bias-pull-up;
+							drive-strength-microamp = <4000>;
+						};
+
+						mux-1 {
+							groups = "emmc_clk";
+							function = "emmc";
+							bias-disable;
+							drive-strength-microamp = <4000>;
+						};
+					};
+
+					emmc_ds_pins: emmc-ds {
+						mux {
+							groups = "emmc_nand_ds";
+							function = "emmc";
+							bias-pull-down;
+							drive-strength-microamp = <4000>;
+						};
+					};
+
+					emmc_clk_gate_pins: emmc_clk_gate {
+						mux {
+							groups = "BOOT_8";
+							function = "gpio_periphs";
+							bias-pull-down;
+							drive-strength-microamp = <4000>;
+						};
+					};
+
 					hdmitx_ddc_pins: hdmitx_ddc {
 						mux {
 							groups = "hdmitx_sda",
@@ -290,6 +332,64 @@
 						};
 					};
 
+					sdcard_c_pins: sdcard_c {
+						mux-0 {
+							groups = "sdcard_d0_c",
+								 "sdcard_d1_c",
+								 "sdcard_d2_c",
+								 "sdcard_d3_c",
+								 "sdcard_cmd_c";
+							function = "sdcard";
+							bias-pull-up;
+							drive-strength-microamp = <4000>;
+						};
+
+						mux-1 {
+							groups = "sdcard_clk_c";
+							function = "sdcard";
+							bias-disable;
+							drive-strength-microamp = <4000>;
+						};
+					};
+
+					sdcard_clk_gate_c_pins: sdcard_clk_gate_c {
+						mux {
+							groups = "GPIOC_4";
+							function = "gpio_periphs";
+							bias-pull-down;
+							drive-strength-microamp = <4000>;
+						};
+					};
+
+					sdcard_z_pins: sdcard_z {
+						mux-0 {
+							groups = "sdcard_d0_z",
+								 "sdcard_d1_z",
+								 "sdcard_d2_z",
+								 "sdcard_d3_z",
+								 "sdcard_cmd_z";
+							function = "sdcard";
+							bias-pull-up;
+							drive-strength-microamp = <4000>;
+						};
+
+						mux-1 {
+							groups = "sdcard_clk_z";
+							function = "sdcard";
+							bias-disable;
+							drive-strength-microamp = <4000>;
+						};
+					};
+
+					sdcard_clk_gate_z_pins: sdcard_clk_gate_z {
+						mux {
+							groups = "GPIOZ_6";
+							function = "gpio_periphs";
+							bias-pull-down;
+							drive-strength-microamp = <4000>;
+						};
+					};
+
 					uart_a_pins: uart-a {
 						mux {
 							groups = "uart_a_tx",
@@ -759,6 +859,30 @@
 			};
 		};
 
+		sd_emmc_b: sd@ffe05000 {
+			compatible = "amlogic,meson-axg-mmc";
+			reg = <0x0 0xffe05000 0x0 0x800>;
+			interrupts = <GIC_SPI 190 IRQ_TYPE_EDGE_RISING>;
+			status = "disabled";
+			clocks = <&clkc CLKID_SD_EMMC_B>,
+				 <&clkc CLKID_SD_EMMC_B_CLK0>,
+				 <&clkc CLKID_FCLK_DIV2>;
+			clock-names = "core", "clkin0", "clkin1";
+			resets = <&reset RESET_SD_EMMC_B>;
+		};
+
+		sd_emmc_c: mmc@ffe07000 {
+			compatible = "amlogic,meson-axg-mmc";
+			reg = <0x0 0xffe07000 0x0 0x800>;
+			interrupts = <GIC_SPI 191 IRQ_TYPE_EDGE_RISING>;
+			status = "disabled";
+			clocks = <&clkc CLKID_SD_EMMC_C>,
+				 <&clkc CLKID_SD_EMMC_C_CLK0>,
+				 <&clkc CLKID_FCLK_DIV2>;
+			clock-names = "core", "clkin0", "clkin1";
+			resets = <&reset RESET_SD_EMMC_C>;
+		};
+
 		usb: usb@ffe09000 {
 			status = "disabled";
 			compatible = "amlogic,meson-g12a-usb-ctrl";
-- 
2.20.1
