From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH 22/22] arm64: dts: apq8016-sbc: Add HDMI display support
Date: Thu, 16 Jun 2016 17:06:47 +0530
Message-ID: <1466077007-26792-23-git-send-email-architt@codeaurora.org>
References: <1466077007-26792-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1466077007-26792-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robdclark@gmail.com
Cc: robh@kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The APQ8016-sbc provides a HDMI output. The APQ8016 display block only
provides a MIPI DSI output. So, the board has a ADV7533 DSI to HDMI
encoder chip that sits between the DSI PHY output and the HDMI
connector.

Add the ADV7533 DT node under its I2C control bus, and tie the DSI
output port to the ADV7533's input port.

Cc: Andy Gross <andy.gross@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org

Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi | 48 +++++++++++++
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi          | 82 ++++++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi
index ee828a8..e1e6c6b 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi
@@ -24,4 +24,52 @@
 			bias-pull-up;
 		};
 	};
+
+	adv7533_int_active: adv533_int_active {
+		pinmux {
+			function = "gpio";
+			pins = "gpio31";
+		};
+		pinconf {
+			pins = "gpio31";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	adv7533_int_suspend: adv7533_int_suspend {
+		pinmux {
+			function = "gpio";
+			pins = "gpio31";
+		};
+		pinconf {
+			pins = "gpio31";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	adv7533_switch_active: adv7533_switch_active {
+		pinmux {
+			function = "gpio";
+			pins = "gpio32";
+		};
+		pinconf {
+			pins = "gpio32";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	adv7533_switch_suspend: adv7533_switch_suspend {
+		pinmux {
+			function = "gpio";
+			pins = "gpio32";
+		};
+		pinconf {
+			pins = "gpio32";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 205ef89..5045695 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -59,6 +59,47 @@
 		/* On High speed expansion */
 			label = "HS-I2C2";
 			status = "okay";
+
+			adv_bridge: bridge@39 {
+				status = "okay";
+
+				compatible = "adi,adv7533";
+				reg = <0x39>;
+
+				interrupt-parent = <&msmgpio>;
+				interrupts = <31 2>;
+
+				adi,dsi-lanes = <4>;
+
+				pd-gpios = <&msmgpio 32 0>;
+
+				avdd-supply = <&pm8916_l6>;
+				v1p2-supply = <&pm8916_l6>;
+				v3p3-supply = <&pm8916_l17>;
+
+				pinctrl-names = "default","sleep";
+				pinctrl-0 = <&adv7533_int_active &adv7533_switch_active>;
+				pinctrl-1 = <&adv7533_int_suspend &adv7533_switch_suspend>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						adv7533_in: endpoint {
+							remote-endpoint = <&dsi0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						adv7533_out: endpoint {
+							remote-endpoint = <&hdmi_con>;
+						};
+					};
+				};
+			};
 		};
 
 		i2c@78ba000 {
@@ -164,6 +205,36 @@
 		lpass@07708000 {
 			status = "okay";
 		};
+
+		mdss@1a00000 {
+			status = "okay";
+
+			mdp@1a01000 {
+				status = "okay";
+			};
+
+			dsi@1a98000 {
+				status = "okay";
+
+				vdda-supply = <&pm8916_l2>;
+				vddio-supply = <&pm8916_l6>;
+
+				ports {
+					port@1 {
+						endpoint {
+							remote-endpoint = <&adv7533_in>;
+							data-lanes = <0 1 2 3>;
+						};
+					};
+				};
+			};
+
+			dsi-phy@1a98300 {
+				status = "okay";
+
+				vddio-supply = <&pm8916_l6>;
+			};
+		};
 	};
 
 	usb2513 {
@@ -178,6 +249,17 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_id_default>;
 	};
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&adv7533_out>;
+			};
+		};
+	};
 };
 
 &smd_rpm_regulators {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
