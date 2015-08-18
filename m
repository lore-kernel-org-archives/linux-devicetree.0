From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 3/6] ARM: dts: apq8064-ifc6410: add notify led support.
Date: Tue, 18 Aug 2015 14:10:09 +0100
Message-ID: <1439903409-20233-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1439903069-19752-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439903069-19752-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org
List-Id: devicetree@vger.kernel.org

This patch adds notify led support on IFC6410, whose trigger can be
configured from userspace.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index b1f9ddb..08daafe 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -221,6 +221,18 @@
 			status = "okay";
 		};
 
+		leds {
+			compatible = "gpio-leds";
+			pinctrl-names = "default";
+			pinctrl-0 = <&notify_led>;
+
+			led@1 {
+				label = "apq8064:green:user1";
+				gpios = <&pm8921_gpio 18 GPIO_ACTIVE_HIGH>;
+				default-state = "on";
+			};
+		};
+
 		qcom,ssbi@500000 {
 			pmic@0 {
 				gpio@150 {
@@ -232,6 +244,15 @@
 							power-source = <PM8921_GPIO_S4>;
 						};
 					};
+
+					notify_led: nled {
+						pios {
+							pins = "gpio18";
+							function = "normal";
+							bias-disable;
+							power-source = <PM8921_GPIO_S4>;
+						};
+					};
 				};
 			};
 		};
-- 
1.9.1
