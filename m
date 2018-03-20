From: srinivas.kandagatla@linaro.org
Subject: [PATCH] ARM: dts: db600c: add support to pcie refclk
Date: Tue, 20 Mar 2018 09:28:40 +0000
Message-ID: <20180320092840.4600-1-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org
Cc: david.brown@linaro.org, robh+dt@kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This patch adds support to external pcie refclk.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-db600c.dts | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-db600c.dts b/arch/arm/boot/dts/qcom-apq8064-db600c.dts
index 50151ef6e912..7587088c122f 100644
--- a/arch/arm/boot/dts/qcom-apq8064-db600c.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-db600c.dts
@@ -45,6 +45,18 @@
 
 	};
 
+	clocks {
+		compatible = "simple-bus";
+		pcie_refclk: pcie-refclk {
+			pinctrl-0 = <&pcie_pins>;
+			pinctrl-names = "default";
+			compatible = "gpio-gate-clock";
+	                clocks = <&rpmcc 27>;
+			#clock-cells = <0>;
+			enable-gpios = <&pm8921_gpio 22 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	hdmi-out {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -140,6 +152,16 @@
 
 		qcom,ssbi@500000 {
 			pmic@0 {
+				gpio@150 {
+					pcie_pins: pcie_pins {
+						pios {
+							pins = "gpio22";
+							function = "normal";
+							power-source = <PM8921_GPIO_VPH>;
+						};
+					};
+				};
+
 				mpps@50 {
 					pcie_perst: pcie-perst {
 						pinconf {
@@ -439,6 +461,11 @@
 			pinctrl-0 = <&pcie_perst>;
 			pinctrl-names = "default";
 			perst-gpio = <&pm8921_mpps 1 GPIO_ACTIVE_LOW>;
+			clocks = <&gcc PCIE_A_CLK>,
+				 <&gcc PCIE_H_CLK>,
+				 <&gcc PCIE_PHY_REF_CLK>,
+				 <&pcie_refclk>;
+			clock-names = "core", "iface", "phy", "ref";
 		};
 
 		/* OTG */
-- 
2.16.2
