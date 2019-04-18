From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 3/6] arm64: dts: meson: fix mmc pin bias
Date: Thu, 18 Apr 2019 14:27:11 +0200
Message-ID: <20190418122714.30805-4-jbrunet@baylibre.com>
References: <20190418122714.30805-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190418122714.30805-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

Clk pin does not require bias, data strobe should be pulled low.
The rest of the pin (data and cmd) are pulled up.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../arm64/boot/dts/amlogic/meson-axg-s400.dts |  4 +--
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    | 31 ++++++++++++----
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   | 35 +++++++++++++------
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    | 35 +++++++++++++------
 4 files changed, 76 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 75fe1a2c49d0..4cd2d5951822 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -482,8 +482,8 @@
 
 /* emmc storage */
 &sd_emmc_c {
-	status = "disabled";
-	pinctrl-0 = <&emmc_pins>;
+	status = "okay";
+	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
 	pinctrl-1 = <&emmc_clk_gate_pins>;
 	pinctrl-names = "default", "clk-gate";
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 34704fecf756..38169c85e91f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -299,7 +299,7 @@
 				};
 
 				emmc_pins: emmc {
-					mux {
+					mux-0 {
 						groups = "emmc_nand_d0",
 							 "emmc_nand_d1",
 							 "emmc_nand_d2",
@@ -308,14 +308,26 @@
 							 "emmc_nand_d5",
 							 "emmc_nand_d6",
 							 "emmc_nand_d7",
-							 "emmc_clk",
-							 "emmc_cmd",
-							 "emmc_ds";
+							 "emmc_cmd";
+						function = "emmc";
+						bias-pull-up;
+					};
+
+					mux-1 {
+						groups = "emmc_clk";
 						function = "emmc";
 						bias-disable;
 					};
 				};
 
+				emmc_ds_pins: emmc_ds {
+					mux {
+						groups = "emmc_ds";
+						function = "emmc";
+						bias-pull-down;
+					};
+				};
+
 				emmc_clk_gate_pins: emmc_clk_gate {
 					mux {
 						groups = "BOOT_8";
@@ -559,13 +571,18 @@
 				};
 
 				sdio_pins: sdio {
-					mux {
+					mux-0 {
 						groups = "sdio_d0",
 							 "sdio_d1",
 							 "sdio_d2",
 							 "sdio_d3",
-							 "sdio_cmd",
-							 "sdio_clk";
+							 "sdio_cmd";
+						function = "sdio";
+						bias-pull-up;
+					};
+
+					mux-1 {
+						groups = "sdio_clk";
 						function = "sdio";
 						bias-disable;
 					};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a60d3652beee..f734faaf7b78 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -381,10 +381,15 @@
 		};
 
 		emmc_pins: emmc {
-			mux {
+			mux-0 {
 				groups = "emmc_nand_d07",
-				       "emmc_cmd",
-				       "emmc_clk";
+				       "emmc_cmd";
+				function = "emmc";
+				bias-pull-up;
+			};
+
+			mux-1 {
+				groups = "emmc_clk";
 				function = "emmc";
 				bias-disable;
 			};
@@ -394,7 +399,7 @@
 			mux {
 				groups = "emmc_ds";
 				function = "emmc";
-				bias-disable;
+				bias-pull-down;
 			};
 		};
 
@@ -436,13 +441,18 @@
 		};
 
 		sdcard_pins: sdcard {
-			mux {
+			mux-0 {
 				groups = "sdcard_d0",
 				       "sdcard_d1",
 				       "sdcard_d2",
 				       "sdcard_d3",
-				       "sdcard_cmd",
-				       "sdcard_clk";
+				       "sdcard_cmd";
+				function = "sdcard";
+				bias-pull-up;
+			};
+
+			mux-1 {
+				groups = "sdcard_clk";
 				function = "sdcard";
 				bias-disable;
 			};
@@ -457,13 +467,18 @@
 		};
 
 		sdio_pins: sdio {
-			mux {
+			mux-0 {
 				groups = "sdio_d0",
 				       "sdio_d1",
 				       "sdio_d2",
 				       "sdio_d3",
-				       "sdio_cmd",
-				       "sdio_clk";
+				       "sdio_cmd";
+				function = "sdio";
+				bias-pull-up;
+			};
+
+			mux-1 {
+				groups = "sdio_clk";
 				function = "sdio";
 				bias-disable;
 			};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 3093ae421b17..c959456bacc6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -326,10 +326,15 @@
 		};
 
 		emmc_pins: emmc {
-			mux {
+			mux-0 {
 				groups = "emmc_nand_d07",
-				       "emmc_cmd",
-				       "emmc_clk";
+				       "emmc_cmd";
+				function = "emmc";
+				bias-pull-up;
+			};
+
+			mux-1 {
+				groups = "emmc_clk";
 				function = "emmc";
 				bias-disable;
 			};
@@ -339,7 +344,7 @@
 			mux {
 				groups = "emmc_ds";
 				function = "emmc";
-				bias-disable;
+				bias-pull-down;
 			};
 		};
 
@@ -381,13 +386,18 @@
 		};
 
 		sdcard_pins: sdcard {
-			mux {
+			mux-0 {
 				groups = "sdcard_d0",
 				       "sdcard_d1",
 				       "sdcard_d2",
 				       "sdcard_d3",
-				       "sdcard_cmd",
-				       "sdcard_clk";
+				       "sdcard_cmd";
+				function = "sdcard";
+				bias-pull-up;
+			};
+
+			mux-1 {
+				groups = "sdcard_clk";
 				function = "sdcard";
 				bias-disable;
 			};
@@ -402,13 +412,18 @@
 		};
 
 		sdio_pins: sdio {
-			mux {
+			mux-0 {
 				groups = "sdio_d0",
 				       "sdio_d1",
 				       "sdio_d2",
 				       "sdio_d3",
-				       "sdio_cmd",
-				       "sdio_clk";
+				       "sdio_cmd";
+				function = "sdio";
+				bias-pull-up;
+			};
+
+			mux-1 {
+				groups = "sdio_clk";
 				function = "sdio";
 				bias-disable;
 			};
-- 
2.20.1
