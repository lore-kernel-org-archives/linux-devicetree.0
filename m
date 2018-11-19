From: Todor Tomov <todor.tomov@linaro.org>
Subject: [PATCH 1/2] arm64: dts: qcom: msm8996: Add VFE SMMU node
Date: Mon, 19 Nov 2018 11:25:36 +0200
Message-ID: <1542619537-24038-1-git-send-email-todor.tomov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vivek.gautam@codeaurora.org, Todor Tomov <todor.tomov@linaro.org>
List-Id: devicetree@vger.kernel.org

Add VFE SMMU node.

Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
---

This patch depends on patchset:
https://lore.kernel.org/patchwork/cover/1013166/

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 13bb964..a4d087e5 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -950,6 +950,23 @@
 			};
 		};
 
+		vfe_smmu: arm,smmu@da0000 {
+			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
+			reg = <0xda0000 0x10000>;
+
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&mmcc MMAGIC_CAMSS_GDSC>;
+			clocks = <&mmcc SMMU_VFE_AHB_CLK>,
+				 <&mmcc SMMU_VFE_AXI_CLK>;
+			clock-names = "iface",
+				      "bus";
+			#iommu-cells = <1>;
+			status = "ok";
+		};
+
 		agnoc@0 {
 			power-domains = <&gcc AGGRE0_NOC_GDSC>;
 			compatible = "simple-pm-bus";
-- 
2.7.4
