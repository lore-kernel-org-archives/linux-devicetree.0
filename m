From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v1 4/7] ARM: dts: apq8064: Add pm8921 mfd and its gpio node
Date: Mon, 27 Jul 2015 14:51:52 +0100
Message-ID: <1438005112-16433-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1438004945-16175-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438004945-16175-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds pmic gpio node to the device tree, this node is
necessary for devices like wlan to control reset gpio.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 1e1706e..647a7e0 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -6,7 +6,6 @@
 #include <dt-bindings/clock/qcom,mmcc-msm8960.h>
 #include <dt-bindings/soc/qcom,gsbi.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
-
 / {
 	model = "Qualcomm APQ8064";
 	compatible = "qcom,apq8064";
@@ -287,6 +286,41 @@
 			compatible = "qcom,ssbi";
 			reg = <0x00500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
+
+			pmicintc: pmic@0 {
+				compatible = "qcom,pm8921";
+				interrupt-parent = <&tlmm_pinmux>;
+				interrupts = <74 8>;
+				#interrupt-cells = <2>;
+				interrupt-controller;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				pm8921_gpio: gpio@150 {
+
+					compatible = "qcom,pm8921-gpio";
+					reg = <0x150>;
+					interrupts = <192 1>, <193 1>, <194 1>,
+						     <195 1>, <196 1>, <197 1>,
+						     <198 1>, <199 1>, <200 1>,
+						     <201 1>, <202 1>, <203 1>,
+						     <204 1>, <205 1>, <206 1>,
+						     <207 1>, <208 1>, <209 1>,
+						     <210 1>, <211 1>, <212 1>,
+						     <213 1>, <214 1>, <215 1>,
+						     <216 1>, <217 1>, <218 1>,
+						     <219 1>, <220 1>, <221 1>,
+						     <222 1>, <223 1>, <224 1>,
+						     <225 1>, <226 1>, <227 1>,
+						     <228 1>, <229 1>, <230 1>,
+						     <231 1>, <232 1>, <233 1>,
+						     <234 1>, <235 1>;
+
+					gpio-controller;
+					#gpio-cells = <2>;
+
+				};
+			};
 		};
 
 		gcc: clock-controller@900000 {
-- 
1.9.1
