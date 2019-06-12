From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH v3 4/4] arm64: dts/sdm845: Enable FW implemented safe sequence handler on MTP
Date: Wed, 12 Jun 2019 12:45:54 +0530
Message-ID: <20190612071554.13573-5-vivek.gautam@codeaurora.org>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@kernel.org, robh+dt@kernel.org, will.deacon@arm.com, robin.murphy@arm.com, joro@8bytes.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, iommu@lists.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, david.brown@linaro.org, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Indicate on MTP SDM845 that firmware implements handler to
TLB invalidate erratum SCM call where SAFE sequence is toggled
to achieve optimum performance on real-time clients, such as
display and camera.

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 78ec373a2b18..6a73d9744a71 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2368,6 +2368,7 @@
 			compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x80000>;
 			#iommu-cells = <2>;
+			qcom,smmu-500-fw-impl-safe-errata;
 			#global-interrupts = <1>;
 			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
