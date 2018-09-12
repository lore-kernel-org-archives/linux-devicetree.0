From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v3 10/16] arm64: dts: msm8916: thermal: split address space into two
Date: Wed, 12 Sep 2018 15:22:55 +0530
Message-ID: <226a3b61f23f27d54b4dad390d6796b429fad837.1536744310.git.amit.kucheria@linaro.org>
References: <cover.1536744310.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1536744310.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1536744310.git.amit.kucheria@linaro.org>
References: <cover.1536744310.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, smohanad@codeaurora.org, andy.gross@linaro.org, dianders@chromium.org, mka@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We've earlier added support to split the register address space into TM
and SROT regions. Split up the regmap address space into two for msm8916
that has a similar register layout.

Since tsens-common.c/init_common() currently only registers one address
space, the order is important (TM before SROT).  This is OK since the
code doesn't really use the SROT functionality yet.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 7b32b8990d62..6a277fce3333 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -761,9 +761,10 @@
 			};
 		};
 
-		tsens: thermal-sensor@4a8000 {
+		tsens: thermal-sensor@4a9000 {
 			compatible = "qcom,msm8916-tsens";
-			reg = <0x4a8000 0x2000>;
+			reg = <0x4a9000 0x1000>, /* TM */
+			      <0x4a8000 0x1000>; /* SROT */
 			nvmem-cells = <&tsens_caldata>, <&tsens_calsel>;
 			nvmem-cell-names = "calib", "calib_sel";
 			#thermal-sensor-cells = <1>;
-- 
2.17.1
