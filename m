From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 14/16] arm64: dts: hikey: Add hi655x pmic dts node
Date: Wed, 13 Apr 2016 07:55:50 +0800
Message-ID: <1460505352-13157-15-git-send-email-guodong.xu@linaro.org>
References: <1460505352-13157-1-git-send-email-guodong.xu@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460505352-13157-1-git-send-email-guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Fei Wang <w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>

Add the mfd hi655x dts node and regulator support on hi6220 platform.

Signed-off-by: Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Signed-off-by: Fei Wang <w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Reviewed-by: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 87 +++++++++++++++++++++++++-
 1 file changed, 86 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index b7c41f8..cc1148d 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -6,9 +6,9 @@
  */
 
 /dts-v1/;
-
 #include "hi6220.dtsi"
 #include "hikey-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "HiKey Development Board";
@@ -107,6 +107,91 @@
 			default-state = "off";
 		};
 	};
+
+	pmic: pmic@f8000000 {
+		compatible = "hisilicon,hi655x-pmic";
+		reg = <0x0 0xf8000000 0x0 0x1000>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		pmic-gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			ldo2: LDO2 {
+				regulator-name = "LDO2_2V8";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <3200000>;
+				regulator-enable-ramp-delay = <120>;
+			};
+
+			ldo7: LDO7 {
+				regulator-name = "LDO7_SDIO";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <120>;
+			};
+
+			ldo10: LDO10 {
+				regulator-name = "LDO10_2V85";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-enable-ramp-delay = <360>;
+			};
+
+			ldo13: LDO13 {
+				regulator-name = "LDO13_1V8";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+				regulator-enable-ramp-delay = <120>;
+			};
+
+			ldo14: LDO14 {
+				regulator-name = "LDO14_2V8";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <3200000>;
+				regulator-enable-ramp-delay = <120>;
+			};
+
+			ldo15: LDO15 {
+				regulator-name = "LDO15_1V8";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-enable-ramp-delay = <120>;
+			};
+
+			ldo17: LDO17 {
+				regulator-name = "LDO17_2V5";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <3200000>;
+				regulator-enable-ramp-delay = <120>;
+			};
+
+			ldo19: LDO19 {
+				regulator-name = "LDO19_3V0";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-enable-ramp-delay = <360>;
+			};
+
+			ldo21: LDO21 {
+				regulator-name = "LDO21_1V8";
+				regulator-min-microvolt = <1650000>;
+				regulator-max-microvolt = <2000000>;
+				regulator-always-on;
+				regulator-enable-ramp-delay = <120>;
+			};
+
+			ldo22: LDO22 {
+				regulator-name = "LDO22_1V2";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-enable-ramp-delay = <120>;
+			};
+		};
+	};
 };
 
 &uart2 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
