From: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Subject: [PATCH 2/3] ARM: dts: move regulator settings from common to specifics
Date: Thu,  7 Jul 2016 01:52:43 +0800
Message-ID: <1467827564-28007-3-git-send-email-ayaka@soulik.info>
References: <3015470.z4L7UQJKa9@phil>
 <1467827564-28007-1-git-send-email-ayaka@soulik.info>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467827564-28007-1-git-send-email-ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The regulator settings are the same in the firefly beta and
firefly release version. But the firefly reload is different.
I remove the different part from the common header dtsi file,
but remained those common one to keep references.

Signed-off-by: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
---
 arch/arm/boot/dts/rk3288-firefly-beta.dts | 30 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/rk3288-firefly.dts      | 30 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/rk3288-firefly.dtsi     | 14 +++++++-------
 3 files changed, 67 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-firefly-beta.dts b/arch/arm/boot/dts/rk3288-firefly-beta.dts
index 75d77e3..6c08dae2 100644
--- a/arch/arm/boot/dts/rk3288-firefly-beta.dts
+++ b/arch/arm/boot/dts/rk3288-firefly-beta.dts
@@ -69,3 +69,33 @@
 &pwm0 {
 	status = "okay";
 };
+
+&gmac {
+	phy-supply = <&vcc_lan>;
+};
+
+&io_domains {
+		audio-supply = <&vcca_33>;
+		flash1-supply = <&vcc_lan>;
+};
+
+&regulators {
+	vcca_18: REG7  {
+		regulator-name = "vcca_18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vcca_33: REG8 {
+		regulator-name = "vcca_33";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	vcc_lan: REG9 {
+		regulator-name = "vcc_lan";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
diff --git a/arch/arm/boot/dts/rk3288-firefly.dts b/arch/arm/boot/dts/rk3288-firefly.dts
index c07fe92..1964b6f 100644
--- a/arch/arm/boot/dts/rk3288-firefly.dts
+++ b/arch/arm/boot/dts/rk3288-firefly.dts
@@ -69,3 +69,33 @@
 &pwm1 {
 	status = "okay";
 };
+
+&gmac {
+	phy-supply = <&vcc_lan>;
+};
+
+&io_domains {
+		audio-supply = <&vcca_33>;
+		flash1-supply = <&vcc_lan>;
+};
+
+&regulators {
+	vcca_18: REG7  {
+		regulator-name = "vcca_18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vcca_33: REG8 {
+		regulator-name = "vcca_33";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	vcc_lan: REG9 {
+		regulator-name = "vcc_lan";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
diff --git a/arch/arm/boot/dts/rk3288-firefly.dtsi b/arch/arm/boot/dts/rk3288-firefly.dtsi
index 1d7f03c..205348f 100644
--- a/arch/arm/boot/dts/rk3288-firefly.dtsi
+++ b/arch/arm/boot/dts/rk3288-firefly.dtsi
@@ -68,11 +68,9 @@
 		compatible = "rockchip,rk3288-io-voltage-domain";
 		rockchip,grf = <&grf>;
 
-		audio-supply = <&vcca_33>;
 		bb-supply = <&vcc_io>;
 		dvp-supply = <&dovdd_1v8>;
 		flash0-supply = <&vcc_flash>;
-		flash1-supply = <&vcc_lan>;
 		gpio30-supply = <&vcc_io>;
 		gpio1830-supply = <&vcc_io>;
 		lcdc-supply = <&vcc_io>;
@@ -225,7 +223,6 @@
 	clock_in_out = "input";
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii_pins>, <&phy_rst>, <&phy_pmeb>, <&phy_int>;
-	phy-supply = <&vcc_lan>;
 	phy-mode = "rgmii";
 	snps,reset-active-low;
 	snps,reset-delays-us = <0 10000 1000000>;
@@ -296,7 +293,7 @@
 		inl2-supply = <&vcc_sys>;
 		inl3-supply = <&vcc_20>;
 
-		regulators {
+		regulators: regulators {
 			vcc_ddr: REG1 {
 				regulator-name = "vcc_ddr";
 				regulator-min-microvolt = <1200000>;
@@ -339,24 +336,27 @@
 				regulator-always-on;
 			};
 
-			vcca_18: REG7 {
+			REG7  {
 				regulator-name = "vcca_18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 			};
 
-			vcca_33: REG8 {
+
+			REG8 {
 				regulator-name = "vcca_33";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
 			};
 
-			vcc_lan: REG9 {
+			REG9 {
 				regulator-name = "vcc_lan";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 			};
 
+
 			vdd_10: REG10 {
 				regulator-name = "vdd_10";
 				regulator-min-microvolt = <1000000>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
