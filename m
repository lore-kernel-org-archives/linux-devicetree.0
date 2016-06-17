From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 05/16] arm64: dts: msm8996: add blsp1_i2c2 pinctrl nodes.
Date: Fri, 17 Jun 2016 16:14:02 +0100
Message-ID: <1466176454-28084-6-git-send-email-srinivas.kandagatla@linaro.org>
References: <1466176454-28084-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466176454-28084-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds pinctrl nodes required for blsp1_i2c2.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996-pins.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
index 03c1e0d..1f6a0a4 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
@@ -13,6 +13,30 @@
 
 &msmgpio {
 
+	blsp1_i2c2_default: blsp1_i2c2_default {
+		pinmux {
+			function = "blsp_i2c3";
+			pins = "gpio47", "gpio48";
+		};
+		pinconf {
+			pins = "gpio47", "gpio48";
+			drive-strength = <16>;
+			bias-disable = <0>;
+		};
+	};
+
+	blsp1_i2c2_sleep: blsp1_i2c2_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio47", "gpio48";
+		};
+		pinconf {
+			pins = "gpio47", "gpio48";
+			drive-strength = <2>;
+			bias-disable = <0>;
+		};
+	};
+
 	blsp2_uart1_2pins_default: blsp2_uart1_2pins {
 		pinmux {
 			function = "blsp_uart8";
-- 
2.7.4
