From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH 2/2] arm64: dtsi: Add device nodes for GPU and MDSS on MSM8916
Date: Fri, 16 Oct 2015 17:36:12 +0530
Message-ID: <1444997172-9308-2-git-send-email-architt@codeaurora.org>
References: <1444997172-9308-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1444997172-9308-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: agross@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, robdclark@gmail.com, devicetree@vger.kernel.org, Archit Taneja <architt@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add device nodes for gpu, mdp and dsi blocks.

The gpu and dsi nodes are missing the 'power-domains' property needed
for configuring GDSC. This needs to be added when its available.

Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 105 ++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index ac006e8..7807d77 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -391,6 +391,111 @@
 			interrupt-controller;
 			#interrupt-cells = <4>;
 		};
+
+		gpu: qcom,adreno-3xx@01c00000 {
+			compatible = "qcom,adreno-3xx";
+			#stream-id-cells = <16>;
+			reg = <0x01c00000 0x20000>;
+			reg-names = "kgsl_3d0_reg_memory";
+			interrupts = <GIC_SPI 33 IRQ_TYPE_NONE>;
+			interrupt-names = "kgsl_3d0_irq";
+			clocks =
+			    <&gcc GCC_OXILI_GFX3D_CLK>,
+			    <&gcc GCC_OXILI_AHB_CLK>,
+			    <&gcc GCC_OXILI_GMEM_CLK>,
+			    <&gcc GCC_BIMC_GFX_CLK>,
+			    <&gcc GCC_BIMC_GPU_CLK>,
+			    <&gcc GFX3D_CLK_SRC>;
+			clock-names =
+			    "core_clk",
+			    "iface_clk",
+			    "mem_clk",
+			    "mem_iface_clk",
+			    "alt_mem_iface_clk",
+			    "gfx3d_clk_src";
+
+			qcom,chipid = <0x03000600>;
+			qcom,gpu-pwrlevels {
+				compatible = "qcom,gpu-pwrlevels";
+				qcom,gpu-pwrlevel@0 {
+					qcom,gpu-freq = <400000000>;
+				};
+				qcom,gpu-pwrlevel@1 {
+					qcom,gpu-freq = <19200000>;
+				};
+			};
+		};
+
+		mdss_mdp: qcom,mdss_mdp@1a00000 {
+			compatible = "qcom,mdss_mdp";
+			reg = <0x1a00000 0x90000>,
+			      <0x1ac8000 0x3000>;
+			reg-names = "mdp_phys",
+				    "vbif_phys";
+			interrupts = <GIC_SPI 72 IRQ_TYPE_NONE>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			connectors = <&mdss_dsi0>;
+			gpus = <&gpu>;
+
+			clocks = <&gcc GCC_MDSS_AHB_CLK>,
+				 <&gcc GCC_MDSS_AXI_CLK>,
+				 <&gcc MDP_CLK_SRC>,
+				 <&gcc GCC_MDSS_MDP_CLK>,
+				 <&gcc GCC_MDSS_VSYNC_CLK>;
+			clock-names = "iface_clk",
+				      "bus_clk",
+				      "core_clk_src",
+				      "core_clk",
+				      "vsync_clk";
+		};
+
+		mdss_dsi0: qcom,mdss_dsi@1a98000 {
+			compatible = "qcom,mdss-dsi-ctrl";
+			qcom,dsi-host-index = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1a98000 0x25c>;
+			reg-names = "dsi_ctrl";
+			interrupt-parent = <&mdss_mdp>;
+			interrupts = <4 IRQ_TYPE_NONE>;
+
+			clocks = <&gcc GCC_MDSS_MDP_CLK>,
+				 <&gcc GCC_MDSS_AHB_CLK>,
+				 <&gcc GCC_MDSS_AXI_CLK>,
+				 <&gcc GCC_MDSS_BYTE0_CLK>,
+				 <&gcc GCC_MDSS_PCLK0_CLK>,
+				 <&gcc GCC_MDSS_ESC0_CLK>,
+				 <&gcc BYTE0_CLK_SRC>,
+				 <&gcc PCLK0_CLK_SRC>;
+			clock-names = "mdp_core_clk",
+				      "iface_clk",
+				      "bus_clk",
+				      "byte_clk",
+				      "pixel_clk",
+				      "core_clk",
+				      "byte_clk_src",
+				      "pixel_clk_src";
+			qcom,dsi-phy = <&mdss_dsi_phy0>;
+			status = "disabled";
+		};
+
+		mdss_dsi_phy0: qcom,mdss_dsi_phy@1a98300 {
+			compatible = "qcom,dsi-phy-28nm-lp";
+			qcom,dsi-phy-index = <0>;
+			reg = <0x1a98300 0xd4>,
+			      <0x1a98500 0x280>,
+			      <0x1a98780 0x30>;
+			reg-names = "dsi_pll",
+				    "dsi_phy",
+				    "dsi_phy_regulator";
+
+			clocks = <&gcc GCC_MDSS_AHB_CLK>;
+			clock-names = "iface_clk";
+			status = "disabled";
+		};
 	};
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
