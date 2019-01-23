Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 2/3] arm64: dts: qcom: qcs404: Enable ethernet for EVB-4000
Date: Wed, 23 Jan 2019 23:18:38 +0530
Message-Id: <20190123174839.5321-2-vkoul@kernel.org>
In-Reply-To: <20190123174839.5321-1-vkoul@kernel.org>
References: <20190123174839.5321-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>
List-ID: <devicetree@vger.kernel.org>

EVB-4000 comes with ethernet so enable it and add pinctrl bindings.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts | 70 ++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
index 11269ad3de0d..5c02e874be12 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
@@ -3,9 +3,79 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "qcs404-evb.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. QCS404 EVB 4000";
 	compatible = "qcom,qcs404-evb";
 };
+
+&ethernet {
+	status = "ok";
+
+	snps,reset-gpio = <&tlmm 60 GPIO_ACTIVE_LOW>;
+	snps,reset-active-low;
+	snps,reset-delays-us = <0 10000 10000>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&ethernet_defaults>;
+
+};
+
+&tlmm {
+	ethernet_defaults: ethernet-defaults {
+		int {
+			pins = "gpio61";
+			function = "rgmii_int";
+			bias-disable;
+			drive-strength = <2>;
+		};
+		mdc {
+			pins = "gpio76";
+			function = "rgmii_mdc";
+			bias-pull-up;
+		};
+		mdio {
+			pins = "gpio75";
+			function = "rgmii_mdio";
+			bias-pull-up;
+		};
+		tx {
+			pins = "gpio67", "gpio66", "gpio65", "gpio64";
+			function = "rgmii_tx";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+		rx {
+			pins = "gpio73", "gpio72", "gpio71", "gpio70";
+			function = "rgmii_rx";
+			bias-disable;
+			drive-strength = <2>;
+		};
+		tx-ctl {
+			pins = "gpio68";
+			function = "rgmii_ctl";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+		rx-ctl {
+			pins = "gpio74";
+			function = "rgmii_ctl";
+			bias-disable;
+			drive-strength = <2>;
+		};
+		tx-ck {
+			pins = "gpio63";
+			function = "rgmii_ck";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+		rx-ck {
+			pins = "gpio69";
+			function = "rgmii_ck";
+			bias-disable;
+			drive-strength = <2>;
+		};
+	};
+};
-- 
2.20.1
