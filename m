From: Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v10 1/3] dt-bindings: clock: Update GCC bindings for protected-clocks
Date: Thu, 22 Nov 2018 13:23:39 +0530
Message-ID: <1542873221-13693-2-git-send-email-tdas@codeaurora.org>
References: <1542873221-13693-1-git-send-email-tdas@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542873221-13693-1-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add protected-clocks list which could used to specify the clocks to be
bypassed on certain devices.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
index 52d9345..5e37de9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
@@ -35,6 +35,8 @@ be part of GCC and hence the TSENS properties can also be
 part of the GCC/clock-controller node.
 For more details on the TSENS properties please refer
 Documentation/devicetree/bindings/thermal/qcom-tsens.txt
+- protected-clocks : Protected clock specifier list as per common clock
+ binding.

 Example:
 	clock-controller@900000 {
@@ -55,3 +57,15 @@ Example of GCC with TSENS properties:
 		#reset-cells = <1>;
 		#thermal-sensor-cells = <1>;
 	};
+
+Example of GCC with protected-clocks properties:
+	clock-controller@100000 {
+		compatible = "qcom,gcc-sdm845";
+		reg = <0x100000 0x1f0000>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+		protected-clocks = <GCC_QSPI_CORE_CLK>,
+				   <GCC_QSPI_CORE_CLK_SRC>,
+				   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
+	};
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
