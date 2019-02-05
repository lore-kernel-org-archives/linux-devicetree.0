From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sdm845: Define iommus for USB controllers
Date: Mon,  4 Feb 2019 16:56:08 -0800
Message-ID: <20190205005608.21556-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Zhuowei Zhang <zhuoweizhang@yahoo.com>, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The USB controllers need to be associated with their respective IOMMU
bank, so define this on the dwc3 nodes.

Also add dma-ranges to the qcom-dwc3 nodes to make the bus' DMA mask
propagate to the dwc3 controller instances.

Fixes: 4429e57567bb ("arm64: dts: sdm845: Add node for arm,mmu-500")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 05577f08d18f..1deebf797636 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1659,6 +1659,7 @@
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
+			dma-ranges;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
 				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
@@ -1687,6 +1688,7 @@
 				compatible = "snps,dwc3";
 				reg = <0 0x0a600000 0 0xcd00>;
 				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+				iommus = <&apps_smmu 0x740 0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
@@ -1701,6 +1703,7 @@
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
+			dma-ranges;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
 				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
@@ -1729,6 +1732,7 @@
 				compatible = "snps,dwc3";
 				reg = <0 0x0a800000 0 0xcd00>;
 				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+				iommus = <&apps_smmu 0x760 0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
 				phys = <&usb_2_hsphy>, <&usb_2_ssphy>;
-- 
2.18.0
