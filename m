From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 3/3] arm64: dts: meson: add clock controller clock inputs
Date: Mon,  3 Dec 2018 14:18:50 +0100
Message-ID: <20181203131850.31388-4-jbrunet@baylibre.com>
References: <20181203131850.31388-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203131850.31388-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the clock inputs of the clock controllers

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi  | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 5f512c91471e..5f3ac275f1ab 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1089,6 +1089,8 @@
 				clkc: clock-controller {
 					compatible = "amlogic,axg-clkc";
 					#clock-cells = <1>;
+					clocks = <&xtal>;
+					clock-names = "xtal";
 				};
 			};
 		};
@@ -1334,6 +1336,8 @@
 					compatible = "amlogic,meson-axg-aoclkc";
 					#clock-cells = <1>;
 					#reset-cells = <1>;
+					clocks = <&xtal>, <&clkc CLKID_CLK81>;
+					clock-names = "xtal", "mpeg-clk";
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 6796d250985a..a7b883ced0a8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -299,6 +299,8 @@
 
 &clkc_AO {
 	compatible = "amlogic,meson-gxbb-aoclkc", "amlogic,meson-gx-aoclkc";
+	clocks = <&xtal>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "mpeg-clk";
 };
 
 &efuse {
@@ -334,6 +336,8 @@
 	clkc: clock-controller {
 		compatible = "amlogic,gxbb-clkc";
 		#clock-cells = <1>;
+		clocks = <&xtal>;
+		clock-names = "xtal";
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index ed278097825b..d5c3d78aafeb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -260,6 +260,8 @@
 
 &clkc_AO {
 	compatible = "amlogic,meson-gxl-aoclkc", "amlogic,meson-gx-aoclkc";
+	clocks = <&xtal>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "mpeg-clk";
 };
 
 &gpio_intc {
@@ -284,6 +286,8 @@
 	clkc: clock-controller {
 		compatible = "amlogic,gxl-clkc";
 		#clock-cells = <1>;
+		clocks = <&xtal>;
+		clock-names = "xtal";
 	};
 };
 
-- 
2.19.1
