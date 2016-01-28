From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 9/9] arm64: dts: apq8016-sbc: Add real regulators and pinctrl for sdhc
Date: Thu, 28 Jan 2016 17:44:23 +0000
Message-ID: <1454003063-3498-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1454002960-3106-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1454002960-3106-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds real regulators and pinctrl nodes for sdhc_1.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 8102929..6b4289d 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -131,6 +131,12 @@
 		};
 
 		sdhci@07824000 {
+			vmmc-supply = <&pm8916_l8>;
+			vqmmc-supply = <&pm8916_l5>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
+			pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
 			status = "okay";
 		};
 	};
-- 
1.9.1
