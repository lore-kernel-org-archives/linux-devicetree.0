From: Akash Gajjar <Akash_Gajjar@mentor.com>
Subject: [PATCH 1/4] arm64: dts: rockchip: rockpro64 dts make regulator more readable
Date: Wed, 13 Feb 2019 22:36:37 +0530
Message-ID: <20190213170651.3210-2-Akash_Gajjar@mentor.com>
References: <20190213170651.3210-1-Akash_Gajjar@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213170651.3210-1-Akash_Gajjar@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Oskari Lemmela <oskari@lemmela.net>, Shohei Maruyama <cheat.sc.linux@outlook.com>, Levin Du <djw@t-chip.com.cn>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

rename dc12, vcc_sys, vcc1v8_pmu regulators and make it more redable as per the
schematic of rk3399-rockpro64.

Signed-off-by: Akash Gajjar <Akash_Gajjar@mentor.com>
---
 .../boot/dts/rockchip/rk3399-rockpro64.dts    | 62 +++++++++----------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
index be78172abc09..49e83ba64045 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
@@ -25,15 +25,6 @@
 		#clock-cells = <0>;
 	};
 
-	dc_12v: dc-12v {
-		compatible = "regulator-fixed";
-		regulator-name = "dc_12v";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;
@@ -83,6 +74,15 @@
 		reset-gpios = <&gpio0 RK_PB2 GPIO_ACTIVE_LOW>;
 	};
 
+	vcc12v_dcin: vcc12v-dcin {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc12v_dcin";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
 	/* switched by pmic_sleep */
 	vcc1v8_s3: vcca1v8_s3: vcc1v8-s3 {
 		compatible = "regulator-fixed";
@@ -103,7 +103,7 @@
 		regulator-name = "vcc3v3_pcie";
 		regulator-always-on;
 		regulator-boot-on;
-		vin-supply = <&dc_12v>;
+		vin-supply = <&vcc12v_dcin>;
 	};
 
 	vcc3v3_sys: vcc3v3-sys {
@@ -113,7 +113,7 @@
 		regulator-boot-on;
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vcc_sys>;
+		vin-supply = <&vcc5v0_sys>;
 	};
 
 	/* Actually 3 regulators (host0, 1, 2) controlled by the same gpio */
@@ -125,7 +125,7 @@
 		pinctrl-0 = <&vcc5v0_host_en>;
 		regulator-name = "vcc5v0_host";
 		regulator-always-on;
-		vin-supply = <&vcc_sys>;
+		vin-supply = <&vcc5v0_sys>;
 	};
 
 	vcc5v0_typec: vcc5v0-typec-regulator {
@@ -136,17 +136,17 @@
 		pinctrl-0 = <&vcc5v0_typec_en>;
 		regulator-name = "vcc5v0_typec";
 		regulator-always-on;
-		vin-supply = <&vcc_sys>;
+		vin-supply = <&vcc5v0_sys>;
 	};
 
-	vcc_sys: vcc-sys {
+	vcc5v0_sys: vcc5v0-sys {
 		compatible = "regulator-fixed";
-		regulator-name = "vcc_sys";
+		regulator-name = "vcc5v0_sys";
 		regulator-always-on;
 		regulator-boot-on;
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		vin-supply = <&dc_12v>;
+		vin-supply = <&vcc12v_dcin>;
 	};
 
 	vdd_log: vdd-log {
@@ -157,7 +157,7 @@
 		regulator-boot-on;
 		regulator-min-microvolt = <800000>;
 		regulator-max-microvolt = <1400000>;
-		vin-supply = <&vcc_sys>;
+		vin-supply = <&vcc5v0_sys>;
 	};
 };
 
@@ -230,18 +230,18 @@
 		rockchip,system-power-controller;
 		wakeup-source;
 
-		vcc1-supply = <&vcc_sys>;
-		vcc2-supply = <&vcc_sys>;
-		vcc3-supply = <&vcc_sys>;
-		vcc4-supply = <&vcc_sys>;
-		vcc6-supply = <&vcc_sys>;
-		vcc7-supply = <&vcc_sys>;
+		vcc1-supply = <&vcc5v0_sys>;
+		vcc2-supply = <&vcc5v0_sys>;
+		vcc3-supply = <&vcc5v0_sys>;
+		vcc4-supply = <&vcc5v0_sys>;
+		vcc6-supply = <&vcc5v0_sys>;
+		vcc7-supply = <&vcc5v0_sys>;
 		vcc8-supply = <&vcc3v3_sys>;
-		vcc9-supply = <&vcc_sys>;
-		vcc10-supply = <&vcc_sys>;
-		vcc11-supply = <&vcc_sys>;
+		vcc9-supply = <&vcc5v0_sys>;
+		vcc10-supply = <&vcc5v0_sys>;
+		vcc11-supply = <&vcc5v0_sys>;
 		vcc12-supply = <&vcc3v3_sys>;
-		vddio-supply = <&vcc1v8_pmu>;
+		vddio-supply = <&vcca_1v8>;
 
 		regulators {
 			vdd_center: DCDC_REG1 {
@@ -311,8 +311,8 @@
 				};
 			};
 
-			vcc1v8_pmu: LDO_REG3 {
-				regulator-name = "vcc1v8_pmu";
+			vcca_1v8: LDO_REG3 {
+				regulator-name = "vcca_1v8";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <1800000>;
@@ -413,7 +413,7 @@
 		regulator-ramp-delay = <1000>;
 		regulator-always-on;
 		regulator-boot-on;
-		vin-supply = <&vcc_sys>;
+		vin-supply = <&vcc5v0_sys>;
 
 		regulator-state-mem {
 			regulator-off-in-suspend;
@@ -432,7 +432,7 @@
 		regulator-ramp-delay = <1000>;
 		regulator-always-on;
 		regulator-boot-on;
-		vin-supply = <&vcc_sys>;
+		vin-supply = <&vcc5v0_sys>;
 
 		regulator-state-mem {
 			regulator-off-in-suspend;
-- 
2.17.1
