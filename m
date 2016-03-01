From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/4] ARM: dts: amlogic: Split pinctrl device for Meson8 / Meson8b
Date: Tue,  1 Mar 2016 23:04:35 +0100
Message-ID: <1456869876-19320-4-git-send-email-carlo@caione.org>
References: <1456869876-19320-1-git-send-email-carlo@caione.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456869876-19320-1-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/meson8.dtsi  | 57 ++++++++++++++++++++++++------------------
 arch/arm/boot/dts/meson8b.dtsi | 12 +++++++--
 2 files changed, 42 insertions(+), 27 deletions(-)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index a2ddcb8..45619f6 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -91,8 +91,8 @@
 		clock-frequency = <141666666>;
 	};
 
-	pinctrl: pinctrl@c1109880 {
-		compatible = "amlogic,meson8-pinctrl";
+	pinctrl_cbus: pinctrl@c1109880 {
+		compatible = "amlogic,meson8-cbus-pinctrl";
 		reg = <0xc1109880 0x10>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -108,29 +108,6 @@
 			#gpio-cells = <2>;
 		};
 
-		gpio_ao: ao-bank@c1108030 {
-			reg = <0xc8100014 0x4>,
-			      <0xc810002c 0x4>,
-			      <0xc8100024 0x8>;
-			reg-names = "mux", "pull", "gpio";
-			gpio-controller;
-			#gpio-cells = <2>;
-		};
-
-		uart_ao_a_pins: uart_ao_a {
-			mux {
-				groups = "uart_tx_ao_a", "uart_rx_ao_a";
-				function = "uart_ao";
-			};
-		};
-
-		i2c_ao_pins: i2c_mst_ao {
-			mux {
-				groups = "i2c_mst_sck_ao", "i2c_mst_sda_ao";
-				function = "i2c_mst_ao";
-			};
-		};
-
 		spi_nor_pins: nor {
 			mux {
 				groups = "nor_d", "nor_q", "nor_c", "nor_cs";
@@ -157,4 +134,34 @@
 		};
 	};
 
+	pinctrl_aobus: pinctrl@c8100084 {
+		compatible = "amlogic,meson8-aobus-pinctrl";
+		reg = <0xc8100084 0xc>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gpio_ao: ao-bank@c1108030 {
+			reg = <0xc8100014 0x4>,
+			      <0xc810002c 0x4>,
+			      <0xc8100024 0x8>;
+			reg-names = "mux", "pull", "gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		uart_ao_a_pins: uart_ao_a {
+			mux {
+				groups = "uart_tx_ao_a", "uart_rx_ao_a";
+				function = "uart_ao";
+			};
+		};
+
+		i2c_ao_pins: i2c_mst_ao {
+			mux {
+				groups = "i2c_mst_sck_ao", "i2c_mst_sda_ao";
+				function = "i2c_mst_ao";
+			};
+		};
+	};
 }; /* end of / */
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 8bad557..2bfe401 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -155,8 +155,8 @@
 			reg = <0xc1108000 0x4>, <0xc1104000 0x460>;
 		};
 
-		pinctrl: pinctrl@c1109880 {
-			compatible = "amlogic,meson8b-pinctrl";
+		pinctrl_cbus: pinctrl@c1109880 {
+			compatible = "amlogic,meson8b-cbus-pinctrl";
 			reg = <0xc1109880 0x10>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -171,6 +171,14 @@
 				gpio-controller;
 				#gpio-cells = <2>;
 			};
+		};
+
+		pinctrl_aobus: pinctrl@c8100084 {
+			compatible = "amlogic,meson8b-aobus-pinctrl";
+			reg = <0xc8100084 0xc>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
 
 			gpio_ao: ao-bank@c1108030 {
 				reg = <0xc8100014 0x4>,
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
