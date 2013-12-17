From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 5/5] regulator: s5m8767: Document new bindings for Buck9 GPIO
 control
Date: Tue, 17 Dec 2013 14:23:21 +0100
Message-ID: <1387286601-21646-6-git-send-email-k.kozlowski@samsung.com>
References: <1387286601-21646-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1387286601-21646-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Amit Daniel Kachhap <amit.daniel-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add documentation for new bindings for controlling (enable/disable) the
Buck9 Converter by GPIO (BUCK9EN).

Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../bindings/regulator/s5m8767-regulator.txt       |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt b/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
index d1660a90fc06..6a921b5582a2 100644
--- a/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
@@ -43,6 +43,7 @@ Optional properties:
 - s5m8767,pmic-buck2-uses-gpio-dvs: 'buck2' can be controlled by gpio dvs.
 - s5m8767,pmic-buck3-uses-gpio-dvs: 'buck3' can be controlled by gpio dvs.
 - s5m8767,pmic-buck4-uses-gpio-dvs: 'buck4' can be controlled by gpio dvs.
+- s5m8767,pmic-buck9-uses-gpio: 'buck9' can be enabled/disabled by GPIO.
 
 Additional properties required if either of the optional properties are used:
 
@@ -54,6 +55,11 @@ Additional properties required if either of the optional properties are used:
 - s5m8767,pmic-buck-dvs-gpios: GPIO specifiers for three host gpio's used
   for dvs. The format of the gpio specifier depends in the gpio controller.
 
+- s5m8767,pmic-buck9-gpio: GPIO specifier for one GPIO controlling buck9.
+  This property is required when 's5m8767,pmic-buck9-uses-gpio' is specified.
+  Additionally for proper GPIO control the buck9 regulator should be also
+  configured with proper opmode (low power or suspend).
+
 Regulators: The regulators of s5m8767 that have to be instantiated should be
 included in a sub-node named 'regulators'. Regulator nodes included in this
 sub-node should be of the format as listed below.
@@ -126,6 +132,9 @@ Example:
 						 <1200000>, <1200000>,
 						 <1200000>, <1200000>;
 
+		s5m8767,pmic-buck9-uses-gpio;
+		s5m8767,pmic-buck9-gpio = <&gpk0 2 0>;
+
 		regulators {
 			ldo1_reg: LDO1 {
 				regulator-name = "VDD_ABB_3.3V";
@@ -148,5 +157,12 @@ Example:
 				regulator-always-on;
 				regulator-boot-on;
 			};
+
+			vemmc_reg: BUCK9 {
+				regulator-name = "VMEM_VDD_2.8V";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				op_mode = <3>; /* Standby Mode */
+			};
 		};
 	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
