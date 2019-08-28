From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv1 2/3] arm64: dts: meson: odroid-c2: Add missing regulator linked to VDDIO_AO3V3 regulator
Date: Wed, 28 Aug 2019 20:27:22 +0000
Message-ID: <20190828202723.1145-3-linux.amoon@gmail.com>
References: <20190828202723.1145-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828202723.1145-1-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

As per shematics TFLASH_VDD, TF_IO, VCC3V3 fixed regulator output which
is supplied by VDDIO_AO3V3.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 98e742bf44c1..a078a1ee5004 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -67,17 +67,19 @@
 	};
 
 	tflash_vdd: regulator-tflash_vdd {
-		/*
-		 * signal name from schematics: TFLASH_VDD_EN
-		 */
 		compatible = "regulator-fixed";
 
 		regulator-name = "TFLASH_VDD";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
+		/*
+		 * signal name from schematics: TFLASH_VDD_EN
+		 */
 		gpio = <&gpio GPIOY_12 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		/* U16 RT9179GB */
+		vin-supply = <&vddio_ao3v3>;
 	};
 
 	tf_io: gpio-regulator-tf_io {
@@ -95,6 +97,8 @@
 
 		states = <3300000 0
 			  1800000 1>;
+		/* U12/U13 RT9179GB */
+		vin-supply = <&vddio_ao3v3>;
 	};
 
 	vcc1v8: regulator-vcc1v8 {
@@ -102,6 +106,9 @@
 		regulator-name = "VCC1V8";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		/* U18 RT9179GB */
+		vin-supply = <&vddio_ao3v3>;
 	};
 
 	vddio_ao1v8: regulator-vddio-ao1v8 {
-- 
2.23.0
