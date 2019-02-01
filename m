From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2] arm64: dts: meson: fix g12a buses
Date: Fri,  1 Feb 2019 14:37:32 +0100
Message-ID: <20190201133732.32169-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jianxin Pan <jianxin.pan@amlogic.com>
List-Id: devicetree@vger.kernel.org

Fix apb, cbus, hiu and periph regions which are not aligned
with the documentation and the information provided by Amlogic

Fixes: 9c8c52f7cb4f ("arm64: dts: meson-g12a: add initial g12a s905d2 SoC DT support")
Cc: Jianxin Pan <jianxin.pan@amlogic.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 46 +++++++++++----------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 3b82a975c663..349c4e2df1b0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -78,20 +78,28 @@
 		#size-cells = <2>;
 		ranges;
 
-		periphs: periphs@ff634000 {
+		apb: bus@ff600000 {
 			compatible = "simple-bus";
-			reg = <0x0 0xff634000 0x0 0x2000>;
+			reg = <0x0 0xff600000 0x0 0x200000>;
 			#address-cells = <2>;
 			#size-cells = <2>;
-			ranges = <0x0 0x0 0x0 0xff634000 0x0 0x2000>;
-		};
+			ranges = <0x0 0x0 0x0 0xff600000 0x0 0x200000>;
+
+			periphs: bus@34400 {
+				compatible = "simple-bus";
+				reg = <0x0 0x34400 0x0 0x400>;
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges = <0x0 0x0 0x0 0x34400 0x0 0x400>;
+			};
 
-		hiubus: bus@ff63c000 {
-			compatible = "simple-bus";
-			reg = <0x0 0xff63c000 0x0 0x1c00>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges = <0x0 0x0 0x0 0xff63c000 0x0 0x1c00>;
+			hiu: bus@3c000 {
+				compatible = "simple-bus";
+				reg = <0x0 0x3c000 0x0 0x1400>;
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges = <0x0 0x0 0x0 0x3c000 0x0 0x1400>;
+			};
 		};
 
 		aobus: bus@ff800000 {
@@ -102,7 +110,8 @@
 			ranges = <0x0 0x0 0x0 0xff800000 0x0 0x100000>;
 
 			uart_AO: serial@3000 {
-				compatible = "amlogic,meson-gx-uart", "amlogic,meson-ao-uart";
+				compatible = "amlogic,meson-gx-uart",
+					     "amlogic,meson-ao-uart";
 				reg = <0x0 0x3000 0x0 0x18>;
 				interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&xtal>, <&xtal>, <&xtal>;
@@ -111,7 +120,8 @@
 			};
 
 			uart_AO_B: serial@4000 {
-				compatible = "amlogic,meson-gx-uart", "amlogic,meson-ao-uart";
+				compatible = "amlogic,meson-gx-uart",
+					     "amlogic,meson-ao-uart";
 				reg = <0x0 0x4000 0x0 0x18>;
 				interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&xtal>, <&xtal>, <&xtal>;
@@ -135,18 +145,10 @@
 
 		cbus: bus@ffd00000 {
 			compatible = "simple-bus";
-			reg = <0x0 0xffd00000 0x0 0x25000>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges = <0x0 0x0 0x0 0xffd00000 0x0 0x25000>;
-		};
-
-		apb: apb@ffe00000 {
-			compatible = "simple-bus";
-			reg = <0x0 0xffe00000 0x0 0x200000>;
+			reg = <0x0 0xffd00000 0x0 0x100000>;
 			#address-cells = <2>;
 			#size-cells = <2>;
-			ranges = <0x0 0x0 0x0 0xffe00000 0x0 0x200000>;
+			ranges = <0x0 0x0 0x0 0xffd00000 0x0 0x100000>;
 		};
 	};
 
-- 
2.20.1
