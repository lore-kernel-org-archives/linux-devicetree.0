From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH 2/2] arm64: dts: msm8996: Add display smmu node
Date: Wed, 12 Dec 2018 19:06:47 +0530
Message-ID: <20181212133647.9692-3-vivek.gautam@codeaurora.org>
References: <20181212133647.9692-1-vivek.gautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212133647.9692-1-vivek.gautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: devicetree@vger.kernel.org

From: Archit Taneja <architt@codeaurora.org>

Add device node for display smmu, aka. mdp_smmu.

Signed-off-by: Archit Taneja <architt@codeaurora.org>
Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 197e186eac10..949e3b99fda4 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1121,6 +1121,23 @@
 			power-domains = <&mmcc GPU_GDSC>;
 		};
 
+		mdp_smmu: arm,smmu@d00000 {
+			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
+			reg = <0xd00000 0x10000>;
+
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+
+			clocks = <&mmcc SMMU_MDP_AHB_CLK>,
+				 <&mmcc SMMU_MDP_AXI_CLK>;
+			clock-names = "iface", "bus";
+
+			power-domains = <&mmcc MDSS_GDSC>;
+		};
+
 		agnoc@0 {
 			power-domains = <&gcc AGGRE0_NOC_GDSC>;
 			compatible = "simple-pm-bus";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
