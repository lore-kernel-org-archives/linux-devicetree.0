From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 11/16] arm64: dts: msm8996: add support to blsp1_spi0 pinctrl
Date: Fri, 17 Jun 2016 16:14:08 +0100
Message-ID: <1466176454-28084-12-git-send-email-srinivas.kandagatla@linaro.org>
References: <1466176454-28084-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1466176454-28084-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds pinctrl nodes required for blsp1_spi0.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996-pins.dtsi | 34 ++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
index 79ed98c..9fd37a0 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
@@ -13,6 +13,40 @@
 
 &msmgpio {
 
+	blsp1_spi0_default: blsp1_spi0_default {
+		pinmux {
+			function = "blsp_spi1";
+			pins = "gpio0", "gpio1", "gpio3";
+		};
+		pinmux_cs {
+			function = "gpio";
+			pins = "gpio2";
+		};
+		pinconf {
+			pins = "gpio0", "gpio1", "gpio3";
+			drive-strength = <12>;
+			bias-disable;
+		};
+		pinconf_cs {
+			pins = "gpio2";
+			drive-strength = <16>;
+			bias-disable;
+			output-high;
+		};
+	};
+
+	blsp1_spi0_sleep: blsp1_spi0_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+		};
+		pinconf {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+	};
+
 	blsp1_i2c2_default: blsp1_i2c2_default {
 		pinmux {
 			function = "blsp_i2c3";
-- 
2.7.4
