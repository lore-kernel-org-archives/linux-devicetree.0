From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 2/8] arm64: dts: qcom: apq8016-sbc: add usb support
Date: Tue, 23 Feb 2016 16:49:56 +0000
Message-ID: <1456246196-18173-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1456246153-18087-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456246153-18087-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi | 14 +++++++++
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi          | 34 ++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi
index cbeee0b..ee828a8 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi
@@ -10,4 +10,18 @@
 			output-low;
 		};
 	};
+
+	usb_id_default: usb-id-default {
+		pinmux {
+			function = "gpio";
+			pins = "gpio121";
+		};
+
+		pinconf {
+			pins = "gpio121";
+			drive-strength = <8>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 8102929..15bb485 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -133,6 +133,40 @@
 		sdhci@07824000 {
 			status = "okay";
 		};
+
+		usb@78d9000 {
+			extcon = <&usb_id>, <&usb_id>;
+			status = "okay";
+		};
+
+		ehci@78d9000 {
+			status = "okay";
+		};
+
+		phy@78d9000 {
+			v1p8-supply = <&pm8916_l7>;
+			v3p3-supply = <&pm8916_l13>;
+			vddcx-supply = <&pm8916_s1>;
+			extcon = <&usb_id>, <&usb_id>;
+			dr_mode = "otg";
+			status = "okay";
+			switch-gpio = <&pm8916_gpios 4 GPIO_ACTIVE_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&usb_sw_sel_pm>;
+		};
+	};
+
+	usb2513 {
+		compatible = "smsc,usb3503";
+		reset-gpios = <&pm8916_gpios 3 GPIO_ACTIVE_LOW>;
+		initial-mode = <1>;
+	};
+
+	usb_id: usb-id {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpio = <&msmgpio 121 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_id_default>;
 	};
 };
 
-- 
1.9.1
