From: Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH] arm64: dts: sdm845: Add video nodes
Date: Wed, 26 Jun 2019 17:24:07 +0530
Message-ID: <1561550047-19600-1-git-send-email-amasule@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, mgottam@codeaurora.org, vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This adds video nodes to sdm845 based on the examples
in the bindings.

Signed-off-by: Malathi Gottam <mgottam@codeaurora.org>
Signed-off-by: Aniket Masule <amasule@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index fcb9330..ff94cfa 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2437,6 +2437,36 @@
 				<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
 			iommus = <&apps_smmu 0x0040 0x1>;
 		};
+
+		video-codec@aa00000 {
+			compatible = "qcom,sdm845-venus";
+			reg = <0x0aa00000 0xff000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&videocc VENUS_GDSC>;
+			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
+				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
+				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>;
+			clock-names = "core", "iface", "bus";
+			iommus = <&apps_smmu 0x10a0 0x8>,
+				 <&apps_smmu 0x10b0 0x0>;
+			memory-region = <&venus_region>;
+
+			video-core0 {
+				compatible = "venus-decoder";
+				clocks = <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
+					 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
+				clock-names = "core", "bus";
+				power-domains = <&videocc VCODEC0_GDSC>;
+			};
+
+			video-core1 {
+				compatible = "venus-encoder";
+				clocks = <&videocc VIDEO_CC_VCODEC1_CORE_CLK>,
+					 <&videocc VIDEO_CC_VCODEC1_AXI_CLK>;
+				clock-names = "core", "bus";
+				power-domains = <&videocc VCODEC1_GDSC>;
+			};
+		};
 	};
 
 	thermal-zones {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
