From: Bhushan Shah <bshah@kde.org>
Subject: [PATCH 2/3] ARM: dts: msm8974-hammerhead: Add regulator nodes for hammerhead
Date: Sun, 17 Jul 2016 16:22:07 +0530
Message-ID: <20160717105208.9596-3-bshah@kde.org>
References: <20160717105208.9596-1-bshah@kde.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160717105208.9596-1-bshah@kde.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Cc: Bhushan Shah <bshah@kde.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Cc: Andy Gross <andy.gross@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Bhushan Shah <bshah@kde.org>
---
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     | 241 +++++++++++++++++++++
 1 file changed, 241 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index 88d494f..29fa0bb 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -1,6 +1,8 @@
 #include "qcom-msm8974.dtsi"
 #include "qcom-pm8841.dtsi"
 #include "qcom-pm8941.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
 	model = "LGE MSM 8974 HAMMERHEAD";
@@ -14,6 +16,234 @@
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	smd {
+		rpm {
+			rpm_requests {
+				pm8841-regulators {
+					s1 {
+						regulator-min-microvolt = <675000>;
+						regulator-max-microvolt = <1050000>;
+					};
+
+					s2 {
+						regulator-min-microvolt = <500000>;
+						regulator-max-microvolt = <1050000>;
+					};
+
+					s3 {
+						regulator-min-microvolt = <1050000>;
+						regulator-max-microvolt = <1050000>;
+					};
+
+					s4 {
+						regulator-min-microvolt = <815000>;
+						regulator-max-microvolt = <900000>;
+					};
+				};
+
+				pm8941-regulators {
+					vdd_l1_l3-supply = <&pm8941_s1>;
+					vdd_l2_lvs1_2_3-supply = <&pm8941_s3>;
+					vdd_l4_l11-supply = <&pm8941_s1>;
+					vdd_l5_l7-supply = <&pm8941_s2>;
+					vdd_l6_l12_l14_l15-supply = <&pm8941_s2>;
+					vdd_l8_l16_l18_l19-supply = <&vph_pwr_reg>;
+					vdd_l9_l10_l17_l22-supply = <&vreg_boost>;
+					vdd_l13_l20_l23_l24-supply = <&vreg_boost>;
+					vdd_l21-supply = <&vreg_boost>;
+
+					s1 {
+						regulator-min-microvolt = <1300000>;
+						regulator-max-microvolt = <1300000>;
+
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					s2 {
+						regulator-min-microvolt = <2150000>;
+						regulator-max-microvolt = <2150000>;
+
+						regulator-boot-on;
+					};
+
+					s3 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					l1 {
+						regulator-min-microvolt = <1225000>;
+						regulator-max-microvolt = <1225000>;
+
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					l2 {
+						regulator-min-microvolt = <1200000>;
+						regulator-max-microvolt = <1200000>;
+					};
+
+					l3 {
+						regulator-min-microvolt = <1225000>;
+						regulator-max-microvolt = <1225000>;
+					};
+
+					l4 {
+						regulator-min-microvolt = <1225000>;
+						regulator-max-microvolt = <1225000>;
+					};
+
+					l5 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					l6 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+
+						regulator-boot-on;
+					};
+
+					l7 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+
+						regulator-boot-on;
+					};
+
+					l8 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					l9 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <2950000>;
+					};
+
+					l10 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <2950000>;
+					};
+
+					l11 {
+						regulator-min-microvolt = <1300000>;
+						regulator-max-microvolt = <1300000>;
+					};
+
+					l12 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					l13 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <2950000>;
+
+						regulator-boot-on;
+					};
+
+					l14 {
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+					};
+
+					l15 {
+						regulator-min-microvolt = <2050000>;
+						regulator-max-microvolt = <2050000>;
+					};
+
+					l16 {
+						regulator-min-microvolt = <2700000>;
+						regulator-max-microvolt = <2700000>;
+					};
+
+					l17 {
+						regulator-min-microvolt = <2850000>;
+						regulator-max-microvolt = <2850000>;
+					};
+
+					l18 {
+						regulator-min-microvolt = <2850000>;
+						regulator-max-microvolt = <2850000>;
+					};
+
+					l19 {
+						regulator-min-microvolt = <3000000>;
+						regulator-max-microvolt = <3300000>;
+					};
+
+					l20 {
+						regulator-min-microvolt = <2950000>;
+						regulator-max-microvolt = <2950000>;
+
+						regulator-boot-on;
+					};
+
+					l21 {
+						regulator-min-microvolt = <2950000>;
+						regulator-max-microvolt = <2950000>;
+
+						regulator-boot-on;
+					};
+
+					l22 {
+						regulator-min-microvolt = <3000000>;
+						regulator-max-microvolt = <3300000>;
+					};
+
+					l23 {
+						regulator-min-microvolt = <3000000>;
+						regulator-max-microvolt = <3000000>;
+					};
+
+					l24 {
+						regulator-min-microvolt = <3075000>;
+						regulator-max-microvolt = <3075000>;
+
+						regulator-boot-on;
+					};
+				};
+			};
+		};
+	};
+
+	vreg_boost: vreg-boost {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg-boost";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&boost_bypass_n_pin>;
+	};
+
+	vph_pwr_reg: vph_pwr_reg {
+		compatible = "regulator-fixed";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
 };
 
 &soc {
@@ -23,3 +253,14 @@
 	};
 
 };
+
+&spmi_bus {
+	pm8941@0 {
+		gpios@c000 {
+			boost_bypass_n_pin: boost-bypass {
+				pins = "gpio21";
+				function = "normal";
+			};
+		};
+	};
+};
-- 
2.9.0
