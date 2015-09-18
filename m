From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 13/14] ARM: dts: apq8064-ifc6410: add notify led support.
Date: Fri, 18 Sep 2015 13:32:11 +0100
Message-ID: <1442579531-20482-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1442579371-19822-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442579371-19822-1-git-send-email-srinivas.kandagatla@linaro.org>
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
index 9c71a51..11ac608 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -26,6 +26,18 @@
 		};
 	};
 
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&notify_led>;
+
+		led@1 {
+			label = "apq8064:green:user1";
+			gpios = <&pm8921_gpio 18 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+	};
+
 	soc {
 		pinctrl@800000 {
 			card_detect: card_detect {
@@ -230,6 +242,15 @@
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
