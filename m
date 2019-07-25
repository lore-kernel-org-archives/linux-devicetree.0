From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] arm64: dts: qcom: msm8996: Add Venus video codec DT node
Date: Thu, 25 Jul 2019 15:39:49 +0300
Message-ID: <20190725123949.31763-1-stanimir.varbanov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stanimir Varbanov <stanimir.varbanov@linaro.org>
List-Id: devicetree@vger.kernel.org

This adds Qualcomm Venus video codec DT node for the video
codec hardware found in MSM8996 platforms.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 68 +++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 942465d8aeb7..ac6e4e430eec 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1777,6 +1777,74 @@
 					      "ref_clk";
 			};
 		};
+
+		venus_smmu: arm,smmu-venus@d40000 {
+			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
+			reg = <0xd40000 0x20000>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&mmcc MMAGIC_VIDEO_GDSC>;
+			clocks = <&mmcc SMMU_VIDEO_AHB_CLK>,
+				 <&mmcc SMMU_VIDEO_AXI_CLK>;
+			clock-names = "iface", "bus";
+			#iommu-cells = <1>;
+			status = "okay";
+		};
+
+		video-codec@c00000 {
+			compatible = "qcom,msm8996-venus";
+			reg = <0x00c00000 0xff000>;
+			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&mmcc VENUS_GDSC>;
+			clocks = <&mmcc VIDEO_CORE_CLK>,
+				 <&mmcc VIDEO_AHB_CLK>,
+				 <&mmcc VIDEO_AXI_CLK>,
+				 <&mmcc VIDEO_MAXI_CLK>;
+			clock-names = "core", "iface", "bus", "mbus";
+			iommus = <&venus_smmu 0x00>,
+				 <&venus_smmu 0x01>,
+				 <&venus_smmu 0x0a>,
+				 <&venus_smmu 0x07>,
+				 <&venus_smmu 0x0e>,
+				 <&venus_smmu 0x0f>,
+				 <&venus_smmu 0x08>,
+				 <&venus_smmu 0x09>,
+				 <&venus_smmu 0x0b>,
+				 <&venus_smmu 0x0c>,
+				 <&venus_smmu 0x0d>,
+				 <&venus_smmu 0x10>,
+				 <&venus_smmu 0x11>,
+				 <&venus_smmu 0x21>,
+				 <&venus_smmu 0x28>,
+				 <&venus_smmu 0x29>,
+				 <&venus_smmu 0x2b>,
+				 <&venus_smmu 0x2c>,
+				 <&venus_smmu 0x2d>,
+				 <&venus_smmu 0x31>;
+			memory-region = <&venus_region>;
+			status = "okay";
+
+			video-decoder {
+				compatible = "venus-decoder";
+				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
+				clock-names = "core";
+				power-domains = <&mmcc VENUS_CORE0_GDSC>;
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+				clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
+				clock-names = "core";
+				power-domains = <&mmcc VENUS_CORE1_GDSC>;
+			};
+		};
 	};
 
 	sound: sound {
-- 
2.17.1
