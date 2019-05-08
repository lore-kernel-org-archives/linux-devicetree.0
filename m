From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 3/3] arm64: dts: qcom: qcs404-evb: Enable PCIe
Date: Wed,  8 May 2019 15:43:09 -0700
Message-ID: <20190508224309.5744-4-bjorn.andersson@linaro.org>
References: <20190508224309.5744-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508224309.5744-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enable the PCIe PHY and controller found on the QCS404 EVB.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- Split single patch, no functional change

 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 2c3127167e3c..d1108a6abd0a 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018, Linaro Limited
 
+#include <dt-bindings/gpio/gpio.h>
 #include "qcs404.dtsi"
 #include "pms405.dtsi"
 
@@ -68,6 +69,22 @@
 	};
 };
 
+&pcie {
+	status = "ok";
+
+	perst-gpio = <&tlmm 43 GPIO_ACTIVE_LOW>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&perst_state>;
+};
+
+&pcie_phy {
+	status = "ok";
+
+	vdda-vp-supply = <&vreg_l3_1p05>;
+	vdda-vph-supply = <&vreg_l5_1p8>;
+};
+
 &remoteproc_adsp {
 	status = "ok";
 };
@@ -184,6 +201,15 @@
 };
 
 &tlmm {
+	perst_state: perst {
+		pins = "gpio43";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
 	sdc1_on: sdc1-on {
 		clk {
 			pins = "sdc1_clk";
-- 
2.18.0
