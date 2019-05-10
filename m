From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 2/2] arm64: dts: meson: u200: consistently order nodes
Date: Fri, 10 May 2019 17:53:27 +0200
Message-ID: <20190510155327.5759-3-jbrunet@baylibre.com>
References: <20190510155327.5759-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190510155327.5759-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Like order boards, order nodes by address then node names then aliases.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-u200.dts      | 50 ++++++++++---------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index e91201809abf..7cc3e2d6a4f1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -16,13 +16,10 @@
 	aliases {
 		serial0 = &uart_AO;
 	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
-	memory@0 {
-		device_type = "memory";
-		reg = <0x0 0x0 0x0 0x40000000>;
-	};
 
 	cvbs-connector {
 		compatible = "composite-video-connector";
@@ -34,15 +31,6 @@
 		};
 	};
 
-	flash_1v8: regulator-flash_1v8 {
-		compatible = "regulator-fixed";
-		regulator-name = "FLASH_1V8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		vin-supply = <&vcc_3v3>;
-		regulator-always-on;
-	};
-
 	hdmi-connector {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -54,6 +42,20 @@
 		};
 	};
 
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+
+	flash_1v8: regulator-flash_1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "FLASH_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+		regulator-always-on;
+	};
+
 	main_12v: regulator-main_12v {
 		compatible = "regulator-fixed";
 		regulator-name = "12V";
@@ -62,6 +64,17 @@
 		regulator-always-on;
 	};
 
+	usb_pwr_en: regulator-usb_pwr_en {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_PWR_EN";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v>;
+
+		gpio = <&gpio GPIOH_6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	vcc_1v8: regulator-vcc_1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_1V8";
@@ -92,17 +105,6 @@
 		enable-active-high;
 	};
 
-	usb_pwr_en: regulator-usb_pwr_en {
-		compatible = "regulator-fixed";
-		regulator-name = "USB_PWR_EN";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc_5v>;
-
-		gpio = <&gpio GPIOH_6 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
 	vddao_1v8: regulator-vddao_1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_1V8";
-- 
2.20.1
