From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH 4/4] arm: dts: qcom: apq8064-ifc6410: Add HDMI support
Date: Fri,  8 Jul 2016 11:25:54 +0530
Message-ID: <1467957354-7620-5-git-send-email-architt@codeaurora.org>
References: <1467957354-7620-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1467957354-7620-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robdclark@gmail.com, andy.gross@linaro.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add HDMI support on IFC6410. Populate the regulators required by HDMI-TX
and PHY. Establish the link between the MDP4 DTV encoder and HDMI. Create
a generic micro HDMI connector DT node. The msm drm driver doesn't parse
for HDMI connectors in DT, but it will do so later.

Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org

Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 74 ++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index 2eeb090..dfe23af 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -43,6 +43,17 @@
 		};
 	};
 
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&hdmi_out>;
+			};
+		};
+	};
+
 	soc {
 		pinctrl@800000 {
 			card_detect: card_detect {
@@ -64,6 +75,25 @@
 					bias-disable;
 				};
 			};
+
+			hdmi_pinctrl: hdmi-pinctrl {
+				mux {
+					pins = "gpio70", "gpio71", "gpio72";
+					function = "hdmi";
+				};
+
+				pinconf_ddc {
+					pins = "gpio70", "gpio71";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				pinconf_hpd {
+					pins = "gpio72";
+					bias-pull-down;
+					drive-strength = <16>;
+				};
+			};
 		};
 
 		rpm@108000 {
@@ -329,5 +359,49 @@
 				mmc-pwrseq = <&sdcc4_pwrseq>;
 			};
 		};
+
+		hdmi-tx@4a00000 {
+			status = "okay";
+
+			core-vdda-supply = <&pm8921_hdmi_switch>;
+			hdmi-mux-supply = <&ext_3p3v>;
+
+			hpd-gpio = <&tlmm_pinmux 72 GPIO_ACTIVE_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&hdmi_pinctrl>;
+
+			ports {
+				port@0 {
+					endpoint {
+						remote-endpoint = <&mdp_dtv_out>;
+					};
+				};
+
+				port@1 {
+					endpoint {
+						remote-endpoint = <&hdmi_con>;
+					};
+				};
+			};
+		};
+
+		hdmi-phy@4a00400 {
+			status = "okay";
+
+			core-vdda-supply = <&pm8921_hdmi_switch>;
+		};
+
+		mdp@5100000 {
+			status = "okay";
+
+			ports {
+				port@3 {
+					endpoint {
+						remote-endpoint = <&hdmi_in>;
+					};
+				};
+			};
+		};
 	};
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
