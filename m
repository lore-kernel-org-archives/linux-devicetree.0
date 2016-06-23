From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v2 24/25] arm64: dts: msm8916: Add display support
Date: Thu, 23 Jun 2016 19:43:29 +0530
Message-ID: <1466691210-22779-25-git-send-email-architt@codeaurora.org>
References: <1466077007-26792-1-git-send-email-architt@codeaurora.org>
 <1466691210-22779-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1466691210-22779-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robdclark@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, robh@kernel.org, Archit Taneja <architt@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The MSM8916 SoC contains a MDP5 based display block, and one DSI output.
Add the top level MDSS DT node, and the MDP5, DSI and DSI PHY children
sub-blocks. Establish the link between MDP5's INTF1 output port and DSI's
input port.

Cc: Andy Gross <andy.gross@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org

Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
v2:
 - Removed "qcom,dsi-host-index" and "qcom,dsi-phy-index" props

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 117 ++++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 9681200..fe74fea 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -537,6 +537,123 @@
 			clocks = <&gcc GCC_PRNG_AHB_CLK>;
 			clock-names = "core";
 		};
+
+		mdss: mdss@1a00000 {
+			compatible = "qcom,mdss";
+			reg = <0x1a00000 0x1000>,
+			      <0x1ac8000 0x3000>;
+			reg-names = "mdss_phys", "vbif_phys";
+
+			power-domains = <&gcc MDSS_GDSC>;
+
+			clocks = <&gcc GCC_MDSS_AHB_CLK>,
+				 <&gcc GCC_MDSS_AXI_CLK>,
+				 <&gcc GCC_MDSS_VSYNC_CLK>;
+			clock-names = "iface_clk",
+				      "bus_clk",
+				      "vsync_clk";
+
+			interrupts = <0 72 0>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			mdp: mdp@1a01000 {
+				compatible = "qcom,mdp5";
+				reg = <0x1a01000 0x90000>;
+				reg-names = "mdp_phys";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0 0>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_VSYNC_CLK>;
+				clock-names = "iface_clk",
+					      "bus_clk",
+					      "core_clk",
+					      "vsync_clk";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdp5_intf1_out: endpoint {
+							remote-endpoint = <&dsi0_in>;
+						};
+					};
+				};
+			};
+
+			dsi0: dsi@1a98000 {
+				compatible = "qcom,mdss-dsi-ctrl";
+				reg = <0x1a98000 0x25c>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4 0>;
+
+				assigned-clocks = <&gcc BYTE0_CLK_SRC>,
+						  <&gcc PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi_phy0 0>,
+							 <&dsi_phy0 1>;
+
+				clocks = <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_BYTE0_CLK>,
+					 <&gcc GCC_MDSS_PCLK0_CLK>,
+					 <&gcc GCC_MDSS_ESC0_CLK>;
+				clock-names = "mdp_core_clk",
+					      "iface_clk",
+					      "bus_clk",
+					      "byte_clk",
+					      "pixel_clk",
+					      "core_clk";
+				phys = <&dsi_phy0>;
+				phy-names = "dsi-phy";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dsi0_in: endpoint {
+							remote-endpoint = <&mdp5_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			dsi_phy0: dsi-phy@1a98300 {
+				compatible = "qcom,dsi-phy-28nm-lp";
+				reg = <0x1a98300 0xd4>,
+				      <0x1a98500 0x280>,
+				      <0x1a98780 0x30>;
+				reg-names = "dsi_pll",
+					    "dsi_phy",
+					    "dsi_phy_regulator";
+
+				#clock-cells = <1>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>;
+				clock-names = "iface_clk";
+			};
+		};
 	};
 
 	smd {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
