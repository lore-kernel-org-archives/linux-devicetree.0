From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: qcom: Add AOSS reset driver node for SDM845
Date: Sat,  1 Sep 2018 15:23:55 -0700
Message-ID: <20180901222355.21803-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Sibi Sankar <sibis@codeaurora.org>

This patch adds the node to support AOSS reset driver on
SDM845

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
[bjorn: Updated addresses to match the binding that was merged]
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 0c9a2aa6a1b5..077760792cf0 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/reset/qcom,sdm845-aoss.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -978,6 +979,12 @@
 			#thermal-sensor-cells = <1>;
 		};
 
+		aoss_reset: reset-controller@c2a0000 {
+			compatible = "qcom,sdm845-aoss-cc";
+			reg = <0xc2a0000 0x31000>;
+			#reset-cells = <1>;
+		};
+
 		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0xc440000 0x1100>,
-- 
2.18.0
