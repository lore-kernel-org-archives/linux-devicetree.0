From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 25/25] arm64: dts: apq8016-sbc: Add HDMI display support
Date: Thu, 23 Jun 2016 19:43:30 +0530
Message-ID: <1466691210-22779-26-git-send-email-architt@codeaurora.org>
References: <1466077007-26792-1-git-send-email-architt@codeaurora.org>
 <1466691210-22779-1-git-send-email-architt@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466691210-22779-1-git-send-email-architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The APQ8016-sbc provides a HDMI output. The APQ8016 display block only
provides a MIPI DSI output. So, the board has a ADV7533 DSI to HDMI
encoder chip that sits between the DSI PHY output and the HDMI
connector.

Add the ADV7533 DT node under its I2C control bus, and tie the DSI
output port to the ADV7533's input port.

Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
