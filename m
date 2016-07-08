From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH 3/4] arm: dts: qcom: apq8064: Add display DT nodes
Date: Fri,  8 Jul 2016 11:25:53 +0530
Message-ID: <1467957354-7620-4-git-send-email-architt@codeaurora.org>
References: <1467957354-7620-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1467957354-7620-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robdclark@gmail.com, andy.gross@linaro.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

APQ8064 contains a MDP4 based display controller. It contains a HDMI, LVDS
and 2 DSI outputs.

Add display DT nodes for MDP4, HDMI TX and HDMI PHY. MDP4 based display
blocks have a flat device hierarchy.

Nodes for other outputs will be added later.

Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org

Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 91 +++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index df96ccd..435a3ab 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -946,6 +946,97 @@
 			reset-names = "axi", "ahb", "por", "pci", "phy";
 			status = "disabled";
 		};
+
+		hdmi: hdmi-tx@4a00000 {
+			compatible = "qcom,hdmi-tx-8960";
+			reg = <0x04a00000 0x2f0>;
+			reg-names = "core_physical";
+			interrupts = <GIC_SPI 79 IRQ_TYPE_NONE>;
+			clocks = <&mmcc HDMI_APP_CLK>,
+				 <&mmcc HDMI_M_AHB_CLK>,
+				 <&mmcc HDMI_S_AHB_CLK>;
+			clock-names = "core_clk",
+				      "master_iface_clk",
+				      "slave_iface_clk";
+
+			phys = <&hdmi_phy>;
+			phy-names = "hdmi-phy";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					hdmi_in: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					hdmi_out: endpoint {
+					};
+				};
+			};
+		};
+
+		hdmi_phy: hdmi-phy@4a00400 {
+			compatible = "qcom,hdmi-phy-8960";
+			reg = <0x4a00400 0x60>,
+			      <0x4a00500 0x100>;
+			reg-names = "hdmi_phy",
+				    "hdmi_pll";
+
+			clocks = <&mmcc HDMI_S_AHB_CLK>;
+			clock-names = "slave_iface_clk";
+		};
+
+		mdp: mdp@5100000 {
+			compatible = "qcom,mdp4";
+			reg = <0x05100000 0xf0000>;
+			interrupts = <GIC_SPI 75 IRQ_TYPE_NONE>;
+			clocks = <&mmcc MDP_CLK>,
+				 <&mmcc MDP_AHB_CLK>,
+				 <&mmcc MDP_AXI_CLK>,
+				 <&mmcc MDP_LUT_CLK>,
+				 <&mmcc HDMI_TV_CLK>,
+				 <&mmcc MDP_TV_CLK>;
+			clock-names = "core_clk",
+				      "iface_clk",
+				      "bus_clk",
+				      "lut_clk",
+				      "hdmi_clk",
+				      "tv_clk";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					mdp_lvds_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					mdp_dsi1_out: endpoint {
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					mdp_dsi2_out: endpoint {
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					mdp_dtv_out: endpoint {
+					};
+				};
+			};
+		};
 	};
 };
 #include "qcom-apq8064-pins.dtsi"
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
