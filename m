From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v1 1/7] ARM: dts: ifc6410: Add pwrseq support for WLAN
Date: Tue, 28 Jul 2015 13:53:42 +0100
Message-ID: <1438088022-17350-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1438087956-17307-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1438087956-17307-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds pwrseq for WLAN which resets the WLAN just before the
SDIO bus is up.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index 88d6655..df560cf 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -1,5 +1,6 @@
 #include "qcom-apq8064-v2.0.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
 	model = "Qualcomm APQ8064/IFC6410";
@@ -206,6 +207,28 @@
 			status = "okay";
 		};
 
+		qcom,ssbi@500000 {
+			pmicintc: pmic@0 {
+				pm8921_gpio: gpio@150 {
+					pinctrl-names = "default";
+					pinctrl-0 = <&wlan_default_gpios>;
+					wlan_default_gpios: wlan-gpios {
+						pios {
+							pins = "gpio43";
+							function = "normal";
+							bias-disable;
+							power-source = <PM8921_GPIO_S4>;
+						};
+					};
+				};
+			};
+		};
+
+		sdcc4_pwrseq:pwrseq {
+			compatible = "mmc-pwrseq-simple";
+			reset-gpios = <&pm8921_gpio 43 GPIO_ACTIVE_LOW>;
+		};
+
 		amba {
 			/* eMMC */
 			sdcc1: sdcc@12400000 {
@@ -227,6 +250,7 @@
 				status = "okay";
 				vmmc-supply = <&ext_3p3v>;
 				vqmmc-supply = <&pm8921_lvs1>;
+				mmc-pwrseq = <&sdcc4_pwrseq>;
 			};
 		};
 	};
-- 
1.9.1
