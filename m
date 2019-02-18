From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v1 01/12] arm64: dts: msm8998: thermal: split address space into two
Date: Mon, 18 Feb 2019 18:05:15 +0530
Message-ID: <fb19401249fb49cbc62e9b5f8b49925c9d00b128.1550493113.git.amit.kucheria@linaro.org>
References: <cover.1550493113.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550493113.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1550493113.git.amit.kucheria@linaro.org>
References: <cover.1550493113.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, David Brown <david.brown@linaro.org>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We've earlier added support to split the register address space into TM
and SROT regions. Split up the regmap address space into two for msm8998
that has a similar register layout.

The order is important (TM before SROT) because we make an assumption
that SROT is always the second address space in order to support legacy
DTs.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 8d41b69ec2da..3c5fb2509d5f 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -579,17 +579,19 @@
 			cell-index = <0>;
 		};
 
-		tsens0: thermal@10aa000 {
+		tsens0: thermal@10ab000 {
 			compatible = "qcom,msm8998-tsens", "qcom,tsens-v2";
-			reg = <0x10aa000 0x2000>;
+			reg = <0x10ab000 0x1000>, /* TM */
+			      <0x10aa000 0x1000>; /* SROT */
 
 			#qcom,sensors = <12>;
 			#thermal-sensor-cells = <1>;
 		};
 
-		tsens1: thermal@10ad000 {
+		tsens1: thermal@10ae000 {
 			compatible = "qcom,msm8998-tsens", "qcom,tsens-v2";
-			reg = <0x10ad000 0x2000>;
+			reg = <0x10ae000 0x1000>, /* TM */
+			      <0x10ad000 0x1000>; /* SROT */
 
 			#qcom,sensors = <8>;
 			#thermal-sensor-cells = <1>;
-- 
2.17.1
