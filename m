From: Todor Tomov <todor.tomov@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: msm8916: Add CAMSS support
Date: Fri, 26 Oct 2018 18:37:16 +0300
Message-ID: <1540568236-18299-2-git-send-email-todor.tomov@linaro.org>
References: <1540568236-18299-1-git-send-email-todor.tomov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540568236-18299-1-git-send-email-todor.tomov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
List-Id: devicetree@vger.kernel.org

Add a node for the Camera Subsystem present on the Qualcomm
MSM8916 SoC.

Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 80 +++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index da9867b..7f7ad86 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1396,6 +1396,86 @@
 				compatible = "venus-encoder";
 			};
 		};
+
+		camss: camss@1b00000 {
+			compatible = "qcom,msm8916-camss";
+			reg = <0x1b0ac00 0x200>,
+				<0x1b00030 0x4>,
+				<0x1b0b000 0x200>,
+				<0x1b00038 0x4>,
+				<0x1b08000 0x100>,
+				<0x1b08400 0x100>,
+				<0x1b0a000 0x500>,
+				<0x1b00020 0x10>,
+				<0x1b10000 0x1000>;
+			reg-names = "csiphy0",
+				"csiphy0_clk_mux",
+				"csiphy1",
+				"csiphy1_clk_mux",
+				"csid0",
+				"csid1",
+				"ispif",
+				"csi_clk_mux",
+				"vfe0";
+			interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csiphy0",
+				"csiphy1",
+				"csid0",
+				"csid1",
+				"ispif",
+				"vfe0";
+			power-domains = <&gcc VFE_GDSC>;
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				<&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
+				<&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				<&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				<&gcc GCC_CAMSS_CSI0_AHB_CLK>,
+				<&gcc GCC_CAMSS_CSI0_CLK>,
+				<&gcc GCC_CAMSS_CSI0PHY_CLK>,
+				<&gcc GCC_CAMSS_CSI0PIX_CLK>,
+				<&gcc GCC_CAMSS_CSI0RDI_CLK>,
+				<&gcc GCC_CAMSS_CSI1_AHB_CLK>,
+				<&gcc GCC_CAMSS_CSI1_CLK>,
+				<&gcc GCC_CAMSS_CSI1PHY_CLK>,
+				<&gcc GCC_CAMSS_CSI1PIX_CLK>,
+				<&gcc GCC_CAMSS_CSI1RDI_CLK>,
+				<&gcc GCC_CAMSS_AHB_CLK>,
+				<&gcc GCC_CAMSS_VFE0_CLK>,
+				<&gcc GCC_CAMSS_CSI_VFE0_CLK>,
+				<&gcc GCC_CAMSS_VFE_AHB_CLK>,
+				<&gcc GCC_CAMSS_VFE_AXI_CLK>;
+			clock-names = "top_ahb",
+				"ispif_ahb",
+				"csiphy0_timer",
+				"csiphy1_timer",
+				"csi0_ahb",
+				"csi0",
+				"csi0_phy",
+				"csi0_pix",
+				"csi0_rdi",
+				"csi1_ahb",
+				"csi1",
+				"csi1_phy",
+				"csi1_pix",
+				"csi1_rdi",
+				"ahb",
+				"vfe0",
+				"csi_vfe0",
+				"vfe_ahb",
+				"vfe_axi";
+			vdda-supply = <&pm8916_l2>;
+			iommus = <&apps_iommu 3>;
+			status = "disabled";
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
 	};
 
 	smd {
-- 
2.7.4
