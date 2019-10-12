From: nikitos.tr@gmail.com
Subject: [PATCH 2/2] arm64: dts: msm8916-longcheer-l8150: Add Volume buttons
Date: Sat, 12 Oct 2019 19:58:21 +0500
Message-ID: <20191012145821.20846-2-nikitos.tr@gmail.com>
References: <20191012145821.20846-1-nikitos.tr@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191012145821.20846-1-nikitos.tr@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@kernel.org, bjorn.andersson@linaro.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stephan@gerhold.net, Nikita Travkin <nikitos.tr@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Nikita Travkin <nikitos.tr@gmail.com>

Add nodes for Volume UP button connected to GPIO and Volume DOWN button,
which is handled by the pm8916 as is common with msm8916 devices.

Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
---
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index e4d467e7dedb..d1ccb9472c8b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -5,6 +5,7 @@
 #include "msm8916.dtsi"
 #include "pm8916.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "Longcheer L8150";
@@ -113,9 +114,36 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_vbus_default>;
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys_default>;
+
+		label = "GPIO Buttons";
+
+		volume-up {
+			label = "Volume Up";
+			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
 };
 
 &msmgpio {
+	gpio_keys_default: gpio_keys_default {
+		pinmux {
+			function = "gpio";
+			pins = "gpio107";
+		};
+		pinconf {
+			pins = "gpio107";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
 	usb_vbus_default: usb-vbus-default {
 		pinmux {
 			function = "gpio";
@@ -128,6 +156,19 @@
 	};
 };
 
+&spmi_bus {
+	pm8916@0 {
+		pon@800 {
+			volume-down {
+				compatible = "qcom,pm8941-resin";
+				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+				bias-pull-up;
+				linux,code = <KEY_VOLUMEDOWN>;
+			};
+		};
+	};
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
-- 
2.19.1
