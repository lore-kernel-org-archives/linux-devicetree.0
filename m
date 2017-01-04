From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/4] ARM: dts: sd-600eval: add hdmi support
Date: Wed,  4 Jan 2017 13:34:12 +0000
Message-ID: <1483536854-21389-2-git-send-email-srinivas.kandagatla@linaro.org>
References: <1483536854-21389-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1483536854-21389-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts b/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts
index 39ae2bc..4e908af 100644
--- a/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dts
@@ -39,6 +39,17 @@
 
 	};
 
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&hdmi_out>;
+			};
+		};
+	};
+
 	soc {
 		rpm@108000 {
 			regulators {
@@ -347,5 +358,38 @@
 				cd-gpios	= <&tlmm_pinmux 26 GPIO_ACTIVE_HIGH>;
 			};
 		};
+
+		hdmi-tx@4a00000 {
+			status = "okay";
+			core-vdda-supply = <&pm8921_hdmi_switch>;
+			hdmi-mux-supply = <&vcc3v3>;
+
+			hpd-gpio = <&tlmm_pinmux 72 GPIO_ACTIVE_HIGH>;
+
+			ports {
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
2.10.1
