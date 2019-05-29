From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [DO NOT MERGE] [PATCH v9 9/9] arm64: dts: allwinner: oceanic-5205-5inmfd: Enable Microtech MTF050FHDI-03 panel
Date: Wed, 29 May 2019 16:26:15 +0530
Message-ID: <20190529105615.14027-10-jagan@amarulasolutions.com>
References: <20190529105615.14027-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529105615.14027-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Michael Trimarchi <michael@amarulasolutions.com>, devicetree@vger.kernel.org, linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com, Sergey Suloev <ssuloev@orpaltech.com>, Ryan Pannell <ryan@osukl.com>, bshah@mykolab.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Microtech MTF050FHDI-03 is 1080x1920, 4-lane MIPI DSI LCD panel which
has inbuilt NT35596 IC chip.

DSI panel connected to board via 39-pin FPC port with,
- DLDO1 as VCC-DSI supply
- DLDO2 as DVDD supply
- DC1SW as AVDD supply
- DC1SW as AVEE supply
- PD24 gpio for reset pin
- PH10 gpio for backlight enable pin

Tested-by: Tamas Papp <tamas@osukl.com>
Signed-off-by: Ryan Pannell <ryan@osukl.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../sun50i-a64-oceanic-5205-5inmfd.dts        | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts
index a4ddc0b9664c..ab9ee10ba6a2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "sun50i-a64-sopine.dtsi"
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "Oceanic 5205 5inMFD";
@@ -22,6 +23,15 @@
 		stdout-path = "serial0:115200n8";
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&r_pwm 0 50000 PWM_POLARITY_INVERTED>;
+		brightness-levels = <412 512>;
+		num-interpolated-steps = <100>;
+		default-brightness-level = <100>;
+		enable-gpios = <&pio 7 10 GPIO_ACTIVE_HIGH>; /* LCD-BL-EN: PH10 */
+	};
+
 	can_osc: can-osc {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -40,6 +50,29 @@
 	};
 };
 
+&de {
+	status = "okay";
+};
+
+&dphy {
+	status = "okay";
+};
+
+&dsi {
+	vcc-dsi-supply = <&reg_dldo1>;		/* VCC-DSI */
+	status = "okay";
+
+	panel@0 {
+		compatible = "microtech,mtf050fhdi-03", "novatek,nt35596";
+		reg = <0>;
+		dvdd-supply = <&reg_dldo2>;			/* VCC-MIPI */
+		avdd-supply = <&reg_dc1sw>;			/* AVDD_5V0 */
+		avee-supply = <&reg_dc1sw>;			/* AVEE_5V */
+		reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>;	/* LCD-RST: PD24 */
+		backlight = <&backlight>;
+	};
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -81,10 +114,26 @@
 	status = "okay";
 };
 
+&r_pwm {
+	status = "okay";
+};
+
 &reg_dc1sw {
 	regulator-name = "vcc-phy";
 };
 
+&reg_dldo1 {
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-name = "vcc-dsi";
+};
+
+&reg_dldo2 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-mipi";
+};
+
 &reg_ldo_io0 {
 	regulator-min-microvolt = <2800000>;
 	regulator-max-microvolt = <2800000>;
-- 
2.18.0.321.gffc6fa0e3
