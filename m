From: Bhushan Shah <bshah-RoXCvvDuEio@public.gmane.org>
Subject: [PATCH v3 4/5] ARM: dts: msm8974-hammerhead: Add regulator nodes for hammerhead
Date: Fri, 29 Jul 2016 11:39:09 +0530
Message-ID: <20160729060910.16943-5-bshah@kde.org>
References: <20160729060910.16943-1-bshah@kde.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160729060910.16943-1-bshah-RoXCvvDuEio@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Bhushan Shah <bshah-RoXCvvDuEio@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Bhushan Shah <bshah-RoXCvvDuEio@public.gmane.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     | 203 +++++++++++++++++++++
 1 file changed, 203 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index 68f3a8a..df957cb 100644
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
@@ -13,6 +15,207 @@
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
+					vdd_l8_l16_l18_l19-supply = <&vreg_vph_pwr>;
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
 };
 
 &soc {
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
