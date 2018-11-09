From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 1/4] arm64: dts: meson: remove extra subnode in mmc clk_gate pinmux
Date: Fri,  9 Nov 2018 15:04:42 +0100
Message-ID: <20181109140445.17795-2-jbrunet@baylibre.com>
References: <20181109140445.17795-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181109140445.17795-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In the pinmux of the mmc clk_gate nodes, we define 2 subnodes. One for
the function definition, the other for the bias. This is not necessary
since we can define the function and the bias in the same subnode.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi  | 6 ------
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 9 ---------
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 9 ---------
 3 files changed, 24 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index eb46db001ce0..e86f5f721f8f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -280,9 +280,6 @@
 					mux {
 						groups = "BOOT_8";
 						function = "gpio_periphs";
-					};
-					cfg-pull-down {
-						pins = "BOOT_8";
 						bias-pull-down;
 					};
 				};
@@ -513,9 +510,6 @@
 					mux {
 						groups = "GPIOX_4";
 						function = "gpio_periphs";
-					};
-					cfg-pull-down {
-						pins = "GPIOX_4";
 						bias-pull-down;
 					};
 				};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 524f533e41d4..1cb8e7e0d0da 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -377,9 +377,6 @@
 			mux {
 				groups = "BOOT_8";
 				function = "gpio_periphs";
-			};
-			cfg-pull-down {
-				pins = "BOOT_8";
 				bias-pull-down;
 			};
 		};
@@ -426,9 +423,6 @@
 			mux {
 				groups = "CARD_2";
 				function = "gpio_periphs";
-			};
-			cfg-pull-down {
-				pins = "CARD_2";
 				bias-pull-down;
 			};
 		};
@@ -449,9 +443,6 @@
 			mux {
 				groups = "GPIOX_4";
 				function = "gpio_periphs";
-			};
-			cfg-pull-down {
-				pins = "GPIOX_4";
 				bias-pull-down;
 			};
 		};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 8ccab9a1ebcc..7cfee40d89e9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -324,9 +324,6 @@
 			mux {
 				groups = "BOOT_8";
 				function = "gpio_periphs";
-			};
-			cfg-pull-down {
-				pins = "BOOT_8";
 				bias-pull-down;
 			};
 		};
@@ -373,9 +370,6 @@
 			mux {
 				groups = "CARD_2";
 				function = "gpio_periphs";
-			};
-			cfg-pull-down {
-				pins = "CARD_2";
 				bias-pull-down;
 			};
 		};
@@ -396,9 +390,6 @@
 			mux {
 				groups = "GPIOX_4";
 				function = "gpio_periphs";
-			};
-			cfg-pull-down {
-				pins = "GPIOX_4";
 				bias-pull-down;
 			};
 		};
-- 
2.19.1
