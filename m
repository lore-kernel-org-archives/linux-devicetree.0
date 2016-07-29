From: Bhushan Shah <bshah@kde.org>
Subject: [PATCH v3 5/5] ARM: dts: msm8974-hammerhead: Introduce gpio-keys nodes
Date: Fri, 29 Jul 2016 11:39:10 +0530
Message-ID: <20160729060910.16943-6-bshah@kde.org>
References: <20160729060910.16943-1-bshah@kde.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160729060910.16943-1-bshah@kde.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Cc: Bhushan Shah <bshah@kde.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This introduces the gpio-keys node for keys of hammerhead and pinctrl
state associated with it.

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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index df957cb..c0fb4a6 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -2,6 +2,7 @@
 #include "qcom-pm8841.dtsi"
 #include "qcom-pm8941.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
@@ -223,4 +224,39 @@
 		status = "ok";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		input-name = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys_pin_a>;
+
+		volume-up {
+			label = "volume_up";
+			gpios = <&pm8941_gpios 2 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		volume-down {
+			label = "volume_down";
+			gpios = <&pm8941_gpios 3 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+	};
+};
+
+&spmi_bus {
+	pm8941@0 {
+		gpios@c000 {
+			gpio_keys_pin_a: gpio-keys-active {
+				pins = "gpio2", "gpio3";
+				function = "normal";
+
+				bias-pull-up;
+				power-source = <PM8941_GPIO_S3>;
+			};
+		};
+	};
 };
-- 
2.9.0
