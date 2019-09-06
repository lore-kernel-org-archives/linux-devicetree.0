From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv3-next 3/3] arm64: dts: meson: odroid-c2: Add missing regulator linked to HDMI supply
Date: Fri,  6 Sep 2019 12:32:59 +0000
Message-ID: <20190906123259.351-4-linux.amoon@gmail.com>
References: <20190906123259.351-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190906123259.351-1-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

As per schematics HDMI_P5V0 is supplied by P5V0 so add missing link.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Changes from previous
Patchv1
- As per Martin's suggestion added the HDMI_P5V0 fix regulator node.
Patchv2
- Added Matrin's and Neil's Reviewed-by.
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 5624ff034659..6ae9fafe4244 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -66,6 +66,15 @@
 		regulator-always-on;
 	};
 
+	hdmi_p5v0: regulator-hdmi_p5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "HDMI_P5V0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		/* AP2331SA-7 */
+		vin-supply = <&p5v0>;
+	};
+
 	tflash_vdd: regulator-tflash_vdd {
 		compatible = "regulator-fixed";
 
@@ -220,6 +229,7 @@
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	hdmi-supply = <&hdmi_p5v0>;
 };
 
 &hdmi_tx_tmds_port {
-- 
2.23.0
