From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: meson8: add and use the real clock controller
Date: Sun,  4 Jun 2017 20:33:41 +0200
Message-ID: <20170604183341.21417-4-martin.blumenstingl@googlemail.com>
References: <20170604183341.21417-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170604183341.21417-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This removes the dummy clk81 gate and replaces it with the actual clock
controller's CLKID_CLK81. This will also allow us to pass the real clock
IDs to all devices where the clock is controlled by clkc in the future.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm/boot/dts/meson8.dtsi | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 6993077331c7..9b0b3ddbb17e 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -43,6 +43,7 @@
  *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <dt-bindings/clock/meson8b-clkc.h>
 #include <dt-bindings/gpio/meson8-gpio.h>
 /include/ "meson.dtsi"
 
@@ -82,13 +83,6 @@
 			reg = <0x203>;
 		};
 	};
-
-	clk81: clk@0 {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <141666666>;
-	};
-
 }; /* end of / */
 
 &aobus {
@@ -126,6 +120,12 @@
 };
 
 &cbus {
+	clkc: clock-controller@4000 {
+		#clock-cells = <1>;
+		compatible = "amlogic,meson8-clkc";
+		reg = <0x8000 0x4>, <0x4000 0x460>;
+	};
+
 	pinctrl_cbus: pinctrl@9880 {
 		compatible = "amlogic,meson8-cbus-pinctrl";
 		reg = <0x9880 0x10>;
@@ -172,20 +172,20 @@
 };
 
 &ethmac {
-	clocks = <&clk81>;
+	clocks = <&clkc CLKID_CLK81>;
 	clock-names = "stmmaceth";
 };
 
 &i2c_AO {
-	clocks = <&clk81>;
+	clocks = <&clkc CLKID_CLK81>;
 };
 
 &i2c_A {
-	clocks = <&clk81>;
+	clocks = <&clkc CLKID_CLK81>;
 };
 
 &i2c_B {
-	clocks = <&clk81>;
+	clocks = <&clkc CLKID_CLK81>;
 };
 
 &L2 {
@@ -195,21 +195,21 @@
 };
 
 &spifc {
-	clocks = <&clk81>;
+	clocks = <&clkc CLKID_CLK81>;
 };
 
 &uart_AO {
-	clocks = <&clk81>;
+	clocks = <&clkc CLKID_CLK81>;
 };
 
 &uart_A {
-	clocks = <&clk81>;
+	clocks = <&clkc CLKID_CLK81>;
 };
 
 &uart_B {
-	clocks = <&clk81>;
+	clocks = <&clkc CLKID_CLK81>;
 };
 
 &uart_C {
-	clocks = <&clk81>;
+	clocks = <&clkc CLKID_CLK81>;
 };
-- 
2.13.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
