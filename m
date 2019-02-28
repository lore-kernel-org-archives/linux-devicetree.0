From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] ARM: sun8i: h3: bluetooth for Banana Pi M2 Zero board
Date: Thu, 28 Feb 2019 22:28:40 +0100
Message-ID: <20190228212840.24964-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

The Banana Pi M2 Zero board has an AP6212 BT+Wifi combo chip
with broadcom internals attached to UART1 and some gpios.
This addition is in line with similar boards

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts    | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
index 1db2541135a7..39e206fac4e3 100644
--- a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
+++ b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
@@ -69,6 +69,8 @@
 		compatible = "mmc-pwrseq-simple";
 		pinctrl-names = "default";
 		reset-gpios = <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
+		clocks = <&rtc 1>;
+		clock-names = "ext_clock";
 	};
 };
 
@@ -122,7 +124,34 @@
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_pins_out>, <&bt_pins_in>;
+		clocks = <&rtc 1>;
+		clock-names = "lpo";
+		vbat-supply = <&reg_vcc3v3>;
+		vddio-supply = <&reg_vcc3v3>;
+		device-wakeup-gpios = <&pio 6 13 GPIO_ACTIVE_HIGH>; /* PG13 */
+		host-wakeup-gpios = <&pio 6 11 GPIO_ACTIVE_HIGH>; /* PG11 */
+		shutdown-gpios = <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
+	};
+
+};
+
+&pio {
+	bt_pins_out: bt_out {
+		pins = "PG12", "PG13";
+		function = "gpio_out";
+	};
+
+	bt_pins_in: bt_in {
+		pins = "PG11";
+		function = "gpio_in";
+	};
 };
 
 &usb_otg {
-- 
2.11.0
