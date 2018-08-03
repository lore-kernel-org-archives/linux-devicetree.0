From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH 5/5] arm: dts: qcom: Add led and gpio-button nodes to ipq8064 boards
Date: Fri,  3 Aug 2018 19:40:19 +0530
Message-ID: <1533305419-29152-6-git-send-email-sricharan@codeaurora.org>
References: <1533305419-29152-1-git-send-email-sricharan@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533305419-29152-1-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

Add the dt nodes for enabling the leds and gpio-buttons.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts |  8 +++++
 arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi | 60 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/qcom-ipq8064.dtsi      | 19 ++++++++++
 3 files changed, 87 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
index f45b05e..554c65e 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
+++ b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
@@ -12,6 +12,14 @@
 				function = "gsbi4";
 				bias-disable;
 			};
+
+			buttons_pins: buttons_pins {
+				mux {
+					pins = "gpio54", "gpio65";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
 		};
 
 		gsbi@16300000 {
diff --git a/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi b/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
index ee32f97..e239a04 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "qcom-ipq8064.dtsi"
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. IPQ8064-v1.0";
@@ -63,5 +64,64 @@
 			ports-implemented = <0x1>;
 			status = "ok";
 		};
+
+		gpio_keys {
+			compatible = "gpio-keys";
+			pinctrl-0 = <&buttons_pins>;
+			pinctrl-names = "default";
+
+			button@1 {
+				label = "reset";
+				linux,code = <KEY_RESTART>;
+				gpios = <&qcom_pinmux 54 GPIO_ACTIVE_LOW>;
+				linux,input-type = <1>;
+				debounce-interval = <60>;
+			};
+			button@2 {
+				label = "wps";
+				linux,code = <KEY_WPS_BUTTON>;
+				gpios = <&qcom_pinmux 65 GPIO_ACTIVE_LOW>;
+				linux,input-type = <1>;
+				debounce-interval = <60>;
+			};
+		};
+
+		leds {
+			compatible = "gpio-leds";
+			pinctrl-0 = <&leds_pins>;
+			pinctrl-names = "default";
+
+			led@7 {
+				label = "led_usb1";
+				gpios = <&qcom_pinmux 7 GPIO_ACTIVE_HIGH>;
+				linux,default-trigger = "usbdev";
+				default-state = "off";
+			};
+
+			led@8 {
+				label = "led_usb3";
+				gpios = <&qcom_pinmux 8 GPIO_ACTIVE_HIGH>;
+				linux,default-trigger = "usbdev";
+				default-state = "off";
+			};
+
+			led@9 {
+				label = "status_led_fail";
+				gpios = <&qcom_pinmux 9 GPIO_ACTIVE_HIGH>;
+				default-state = "off";
+			};
+
+			led@26 {
+				label = "sata_led";
+				gpios = <&qcom_pinmux 26 GPIO_ACTIVE_HIGH>;
+				default-state = "off";
+			};
+
+			led@53 {
+				label = "status_led_pass";
+				gpios = <&qcom_pinmux 53 GPIO_ACTIVE_HIGH>;
+				default-state = "off";
+			};
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 04cc822..f793cd1 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -153,6 +153,25 @@
 					bias-none;
 				};
 			};
+
+			leds_pins: leds_pins {
+				mux {
+					pins = "gpio7", "gpio8", "gpio9",
+					       "gpio26", "gpio53";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+					output-low;
+				};
+			};
+
+			buttons_pins: buttons_pins {
+				mux {
+					pins = "gpio54";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
 		};
 
 		intc: interrupt-controller@2000000 {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
