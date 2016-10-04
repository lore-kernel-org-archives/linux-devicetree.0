From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [RFC 09/10] ARM: dts: amlogic: enable gpio interrupt controller on meson8
Date: Tue,  4 Oct 2016 17:08:27 +0200
Message-ID: <1475593708-10526-10-git-send-email-jbrunet@baylibre.com>
References: <1475593708-10526-1-git-send-email-jbrunet@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475593708-10526-1-git-send-email-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/meson8.dtsi  | 19 +++++++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi | 19 +++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 45619f6162c5..82690e0352c9 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -43,6 +43,8 @@
  *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/meson8-gpio.h>
 /include/ "meson.dtsi"
 
@@ -91,6 +93,21 @@
 		clock-frequency = <141666666>;
 	};
 
+	gpio_interrupt: interrupt-controller@c1109880 {
+		compatible = "amlogic,meson8-gpio-intc";
+		reg = <0xc1109880 0x10>;
+		interrupts = <GIC_SPI 64 IRQ_TYPE_NONE>,
+			   <GIC_SPI 65 IRQ_TYPE_NONE>,
+			   <GIC_SPI 66 IRQ_TYPE_NONE>,
+			   <GIC_SPI 67 IRQ_TYPE_NONE>,
+			   <GIC_SPI 68 IRQ_TYPE_NONE>,
+			   <GIC_SPI 69 IRQ_TYPE_NONE>,
+			   <GIC_SPI 70 IRQ_TYPE_NONE>,
+			   <GIC_SPI 71 IRQ_TYPE_NONE>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
 	pinctrl_cbus: pinctrl@c1109880 {
 		compatible = "amlogic,meson8-cbus-pinctrl";
 		reg = <0xc1109880 0x10>;
@@ -106,6 +123,7 @@
 			reg-names = "mux", "pull", "pull-enable", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
+			interrupt-parent = <&gpio_interrupt>;
 		};
 
 		spi_nor_pins: nor {
@@ -148,6 +166,7 @@
 			reg-names = "mux", "pull", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
+			interrupt-parent = <&gpio_interrupt>;
 		};
 
 		uart_ao_a_pins: uart_ao_a {
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 41fd53671859..d76e7cb4d3dc 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -44,6 +44,8 @@
  *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/meson8b-clkc.h>
 #include <dt-bindings/gpio/meson8b-gpio.h>
 #include <dt-bindings/reset/amlogic,meson8b-reset.h>
@@ -183,6 +185,21 @@
 			status = "disabled";
 		};
 
+		gpio_interrupt: interrupt-controller@c1109880 {
+			compatible = "amlogic,meson8b-gpio-intc";
+			reg = <0xc1109880 0x10>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_NONE>,
+				   <GIC_SPI 65 IRQ_TYPE_NONE>,
+				   <GIC_SPI 66 IRQ_TYPE_NONE>,
+				   <GIC_SPI 67 IRQ_TYPE_NONE>,
+				   <GIC_SPI 68 IRQ_TYPE_NONE>,
+				   <GIC_SPI 69 IRQ_TYPE_NONE>,
+				   <GIC_SPI 70 IRQ_TYPE_NONE>,
+				   <GIC_SPI 71 IRQ_TYPE_NONE>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 		pinctrl_cbus: pinctrl@c1109880 {
 			compatible = "amlogic,meson8b-cbus-pinctrl";
 			reg = <0xc1109880 0x10>;
@@ -198,6 +215,7 @@
 				reg-names = "mux", "pull", "pull-enable", "gpio";
 				gpio-controller;
 				#gpio-cells = <2>;
+				interrupt-parent = <&gpio_interrupt>;
 			};
 		};
 
@@ -215,6 +233,7 @@
 				reg-names = "mux", "pull", "gpio";
 				gpio-controller;
 				#gpio-cells = <2>;
+				interrupt-parent = <&gpio_interrupt>;
 			};
 
 			uart_ao_a_pins: uart_ao_a {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
