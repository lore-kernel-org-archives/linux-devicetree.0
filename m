From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v2 02/10] ARM: dts: meson: use GIC_SPI and IRQ_TYPE_EDGE_RISING macros
Date: Thu, 15 Jun 2017 23:33:44 +0200
Message-ID: <20170615213352.25134-3-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170615213352.25134-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170615213352.25134-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This makes meson.dtsi easier to read as we are not using magic numbers
for the GIC interrupt type (GIC_SPI) and the interrupt polarity
(IRQ_TYPE_EDGE_RISING).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm/boot/dts/meson.dtsi | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 8d9c36970dfd..d287f606e06f 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -45,6 +45,8 @@
  *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 /include/ "skeleton.dtsi"
 
 / {
@@ -81,21 +83,21 @@
 			uart_A: serial@84c0 {
 				compatible = "amlogic,meson-uart";
 				reg = <0x84c0 0x18>;
-				interrupts = <0 26 1>;
+				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
 
 			uart_B: serial@84dc {
 				compatible = "amlogic,meson-uart";
 				reg = <0x84dc 0x18>;
-				interrupts = <0 75 1>;
+				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
 
 			i2c_A: i2c@8500 {
 				compatible = "amlogic,meson6-i2c";
 				reg = <0x8500 0x20>;
-				interrupts = <0 21 1>;
+				interrupts = <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -104,14 +106,14 @@
 			uart_C: serial@8700 {
 				compatible = "amlogic,meson-uart";
 				reg = <0x8700 0x18>;
-				interrupts = <0 93 1>;
+				interrupts = <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
 
 			i2c_B: i2c@87c0 {
 				compatible = "amlogic,meson6-i2c";
 				reg = <0x87c0 0x20>;
-				interrupts = <0 128 1>;
+				interrupts = <GIC_SPI 128 IRQ_TYPE_EDGE_RISING>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -128,13 +130,13 @@
 			wdt: watchdog@9900 {
 				compatible = "amlogic,meson6-wdt";
 				reg = <0x9900 0x8>;
-				interrupts = <0 0 1>;
+				interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 			};
 
 			timer@9940 {
 				compatible = "amlogic,meson6-timer";
 				reg = <0x9940 0x18>;
-				interrupts = <0 10 1>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_EDGE_RISING>;
 			};
 		};
 
@@ -148,21 +150,21 @@
 			ir_receiver: ir-receiver@480 {
 				compatible= "amlogic,meson6-ir";
 				reg = <0x480 0x20>;
-				interrupts = <0 15 1>;
+				interrupts = <GIC_SPI 15 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
 
 			uart_AO: serial@4c0 {
 				compatible = "amlogic,meson-uart";
 				reg = <0x4c0 0x18>;
-				interrupts = <0 90 1>;
+				interrupts = <GIC_SPI 90 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
 
 			i2c_AO: i2c@500 {
 				compatible = "amlogic,meson6-i2c";
 				reg = <0x500 0x20>;
-				interrupts = <0 92 1>;
+				interrupts = <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -173,7 +175,7 @@
 			compatible = "amlogic,meson6-dwmac", "snps,dwmac";
 			reg = <0xc9410000 0x10000
 			       0xc1108108 0x4>;
-			interrupts = <0 8 1>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "macirq";
 			status = "disabled";
 		};
-- 
2.13.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
