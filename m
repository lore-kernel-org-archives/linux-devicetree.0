From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: qcom: msm8996: Enable SMMUs
Date: Mon, 17 Jun 2019 22:23:46 -0700
Message-ID: <20190618052346.32239-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Enable SMMUs on 8996 now that the WRZ workaround in the arm-smmu driver
has landed.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 1e3143c4fe8f..2ecd9d775d61 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1177,7 +1177,6 @@
 			clock-names = "iface",
 				      "bus";
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		camss: camss@a00000 {
@@ -1330,8 +1329,6 @@
 			clock-names = "iface", "bus";
 
 			power-domains = <&mmcc GPU_GDSC>;
-
-			status = "disabled";
 		};
 
 		mdp_smmu: arm,smmu@d00000 {
@@ -1348,8 +1345,6 @@
 			clock-names = "iface", "bus";
 
 			power-domains = <&mmcc MDSS_GDSC>;
-
-			status = "disabled";
 		};
 
 		lpass_q6_smmu: arm,smmu-lpass_q6@1600000 {
@@ -1376,7 +1371,6 @@
 			clocks = <&gcc GCC_HLOS1_VOTE_LPASS_CORE_SMMU_CLK>,
 				 <&gcc GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK>;
 			clock-names = "iface", "bus";
-			status = "disabled";
 		};
 
 		agnoc@0 {
-- 
2.18.0
