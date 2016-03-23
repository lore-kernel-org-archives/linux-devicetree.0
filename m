From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 10/12] ARM: dts: dragonboard-600c: Add on board leds support
Date: Wed, 23 Mar 2016 19:48:04 +0000
Message-ID: <1458762484-9768-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1458762366-9233-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458762366-9233-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds support to 4 user leds, wlan and bt led on board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../arm/boot/dts/qcom-apq8064-dragonboard-600c.dts | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts b/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts
index 52f742c..4fecd94 100644
--- a/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts
@@ -53,6 +53,33 @@
 					bias-disable;
 				};
 			};
+
+			user_leds: user_leds {
+				mux {
+					pins = "gpio3", "gpio7", "gpio10", "gpio11";
+					function = "gpio";
+				};
+
+				conf {
+					pins = "gpio3", "gpio7", "gpio10", "gpio11";
+					function = "gpio";
+					output-low;
+				};
+			};
+		};
+
+		qcom,ssbi@500000 {
+			pmic@0 {
+				mpps@50 {
+					mpp_leds: mpp_leds {
+						pinconf {
+							pins = "mpp7", "mpp8";
+							function = "digital";
+							output-low;
+						};
+					};
+				};
+			};
 		};
 
 		rpm@108000 {
@@ -165,6 +192,55 @@
 			};
 		};
 
+		leds {
+			pinctrl-names = "default";
+			pinctrl-0 = <&user_leds>, <&mpp_leds>;
+
+			compatible = "gpio-leds";
+
+			led@1 {
+				label = "dragonboard-600c:green:user1";
+				gpios = <&tlmm_pinmux 3 GPIO_ACTIVE_HIGH>;
+				linux,default-trigger = "heartbeat";
+				default-state = "off";
+			};
+
+			led@2 {
+				label = "dragonboard-600c:green:user2";
+				gpios = <&tlmm_pinmux 7 GPIO_ACTIVE_HIGH>;
+				linux,default-trigger = "mmc0";
+				default-state = "off";
+			};
+
+			led@3 {
+				label = "dragonboard-600c:green:user3";
+				gpios = <&tlmm_pinmux 10 GPIO_ACTIVE_HIGH>;
+				linux,default-trigger = "mmc1";
+				default-state = "off";
+			};
+
+			led@4 {
+				label = "apq8016-sbc:green:user4";
+				gpios = <&tlmm_pinmux 11 GPIO_ACTIVE_HIGH>;
+				linux,default-trigger = "none";
+				default-state = "off";
+			};
+
+			led@5 {
+				label = "dragonboard-600c:yellow:wlan";
+				gpios = <&pm8921_mpps 7 GPIO_ACTIVE_HIGH>;
+				linux,default-trigger = "wlan";
+				default-state = "off";
+			};
+
+			led@6 {
+				label = "dragonboard-600c:blue:bt";
+				gpios = <&pm8921_mpps 8 GPIO_ACTIVE_HIGH>;
+				linux,default-trigger = "bt";
+				default-state = "off";
+			};
+		};
+
 		pci@1b500000 {
 			status = "okay";
 			vdda-supply = <&pm8921_s3>;
-- 
2.5.0
