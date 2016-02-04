From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH] arm64: dts: apq8016-sbc: Add DT node for the uSD SDHC interface
Date: Thu,  4 Feb 2016 14:53:22 +0200
Message-ID: <1454590402-13507-1-git-send-email-georgi.djakov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org
List-Id: devicetree@vger.kernel.org

Add the necessary properties to enable the SD-card on db410c boards.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 6b4289dd2495..9a6c595a9b15 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -139,6 +139,18 @@
 			pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
 			status = "okay";
 		};
+
+		sdhci@07864000 {
+			vmmc-supply = <&pm8916_l11>;
+			vqmmc-supply = <&pm8916_l12>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
+			pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
+
+			cd-gpios = <&msmgpio 38 0x1>;
+			status = "okay";
+		};
 	};
 };
 
