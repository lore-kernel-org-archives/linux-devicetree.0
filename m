From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] arm64: dts: meson: fix g12a buses
Date: Wed, 16 Jan 2019 17:52:36 +0100
Message-ID: <20190116165236.8330-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

periph and hiu bus addresses/size are wrong.
cbus, aobus and apb just don't exist in the memory map so remove them.

Fixes: 9c8c52f7cb4f ("arm64: dts: meson-g12a: add initial g12a s905d2 SoC DT support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 70 +++++++--------------
 1 file changed, 24 insertions(+), 46 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 3b82a975c663..2aea5ba62fee 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -78,46 +78,40 @@
 		#size-cells = <2>;
 		ranges;
 
-		periphs: periphs@ff634000 {
+		periphs: bus@ff634400 {
 			compatible = "simple-bus";
-			reg = <0x0 0xff634000 0x0 0x2000>;
+			reg = <0x0 0xff634400 0x0 0x400>;
 			#address-cells = <2>;
 			#size-cells = <2>;
-			ranges = <0x0 0x0 0x0 0xff634000 0x0 0x2000>;
+			ranges = <0x0 0x0 0x0 0xff634400 0x0 0x400>;
 		};
 
-		hiubus: bus@ff63c000 {
+		hiu: bus@ff63c000 {
 			compatible = "simple-bus";
-			reg = <0x0 0xff63c000 0x0 0x1c00>;
+			reg = <0x0 0xff63c000 0x0 0x1400>;
 			#address-cells = <2>;
 			#size-cells = <2>;
-			ranges = <0x0 0x0 0x0 0xff63c000 0x0 0x1c00>;
+			ranges = <0x0 0x0 0x0 0xff63c000 0x0 0x1400>;
 		};
 
-		aobus: bus@ff800000 {
-			compatible = "simple-bus";
-			reg = <0x0 0xff800000 0x0 0x100000>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges = <0x0 0x0 0x0 0xff800000 0x0 0x100000>;
-
-			uart_AO: serial@3000 {
-				compatible = "amlogic,meson-gx-uart", "amlogic,meson-ao-uart";
-				reg = <0x0 0x3000 0x0 0x18>;
-				interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&xtal>, <&xtal>, <&xtal>;
-				clock-names = "xtal", "pclk", "baud";
-				status = "disabled";
-			};
-
-			uart_AO_B: serial@4000 {
-				compatible = "amlogic,meson-gx-uart", "amlogic,meson-ao-uart";
-				reg = <0x0 0x4000 0x0 0x18>;
-				interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&xtal>, <&xtal>, <&xtal>;
-				clock-names = "xtal", "pclk", "baud";
-				status = "disabled";
-			};
+		uart_AO: serial@ff803000 {
+			compatible = "amlogic,meson-gx-uart",
+				     "amlogic,meson-ao-uart";
+			reg = <0x0 0xff803000 0x0 0x18>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&xtal>, <&xtal>, <&xtal>;
+			clock-names = "xtal", "pclk", "baud";
+			status = "disabled";
+		};
+
+		uart_AO_B: serial@ff804000 {
+			compatible = "amlogic,meson-gx-uart",
+				     "amlogic,meson-ao-uart";
+			reg = <0x0 0xff804000 0x0 0x18>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&xtal>, <&xtal>, <&xtal>;
+			clock-names = "xtal", "pclk", "baud";
+			status = "disabled";
 		};
 
 		gic: interrupt-controller@ffc01000 {
@@ -132,22 +126,6 @@
 			#interrupt-cells = <3>;
 			#address-cells = <0>;
 		};
-
-		cbus: bus@ffd00000 {
-			compatible = "simple-bus";
-			reg = <0x0 0xffd00000 0x0 0x25000>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges = <0x0 0x0 0x0 0xffd00000 0x0 0x25000>;
-		};
-
-		apb: apb@ffe00000 {
-			compatible = "simple-bus";
-			reg = <0x0 0xffe00000 0x0 0x200000>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges = <0x0 0x0 0x0 0xffe00000 0x0 0x200000>;
-		};
 	};
 
 	timer {
-- 
2.20.1
