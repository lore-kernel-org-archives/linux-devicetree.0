From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 4/9] ARM: dts: sun9i: cubieboard4: Add GPIO pin-bank regulator supplies
Date: Wed,  6 Feb 2019 11:32:34 +0800
Message-ID: <20190206033239.3619-5-wens@csie.org>
References: <20190206033239.3619-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190206033239.3619-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

The Cubieboard 4 has the PMIC providing voltage to all the pin-bank
supply rails from its various regulator outputs. All pin-banks that
have supply rails are accounted for. PN pin-bank does not have a
supply rail.

Also remove any "regulator-always-on" properties from regulators that
were only marked to provide pin-bank power.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts | 23 ++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
index 85da85faf869..0daab9b374e6 100644
--- a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
+++ b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
@@ -183,10 +183,26 @@
 	clocks = <&ac100_rtc 0>;
 };
 
+&pio {
+	vcc-pa-supply = <&reg_ldo_io1>;
+	vcc-pb-supply = <&reg_aldo2>;
+	vcc-pc-supply = <&reg_dcdc1>;
+	vcc-pd-supply = <&reg_dc1sw>;
+	vcc-pe-supply = <&reg_eldo2>;
+	vcc-pf-supply = <&reg_dcdc1>;
+	vcc-pg-supply = <&reg_ldo_io0>;
+	vcc-ph-supply = <&reg_dcdc1>;
+};
+
 &r_ir {
 	status = "okay";
 };
 
+&r_pio {
+	vcc-pl-supply = <&reg_dldo2>;
+	vcc-pm-supply = <&reg_eldo3>;
+};
+
 &r_rsb {
 	status = "okay";
 
@@ -217,6 +233,10 @@
 				/* unused */
 			};
 
+			reg_dc1sw: dc1sw {
+				regulator-name = "vcc-pd";
+			};
+
 			reg_dc5ldo: dc5ldo {
 				regulator-always-on;
 				regulator-min-microvolt = <800000>;
@@ -271,7 +291,6 @@
 			};
 
 			reg_dldo2: dldo2 {
-				regulator-always-on;
 				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3000000>;
 				regulator-name = "vcc-pl";
@@ -290,14 +309,12 @@
 			};
 
 			reg_eldo3: eldo3 {
-				regulator-always-on;
 				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3000000>;
 				regulator-name = "vcc-pm-codec-io1";
 			};
 
 			reg_ldo_io0: ldo_io0 {
-				regulator-always-on;
 				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3000000>;
 				regulator-name = "vcc-pg";
-- 
2.20.1
