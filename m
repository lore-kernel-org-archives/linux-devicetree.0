From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: qcom: msm8996: Stop using legacy clock names
Date: Fri,  3 May 2019 16:24:42 -0700
Message-ID: <20190503232442.1530-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

MDSS and its friends complain about the DTS is using legacy clock names,
update these to silence the warnings.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index a988edabe474..3d861f1d836c 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1678,7 +1678,7 @@
 			#interrupt-cells = <1>;
 
 			clocks = <&mmcc MDSS_AHB_CLK>;
-			clock-names = "iface_clk";
+			clock-names = "iface";
 
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -1697,11 +1697,11 @@
 					 <&mmcc MDSS_MDP_CLK>,
 					 <&mmcc SMMU_MDP_AXI_CLK>,
 					 <&mmcc MDSS_VSYNC_CLK>;
-				clock-names = "iface_clk",
-					      "bus_clk",
-					      "core_clk",
-					      "iommu_clk",
-					      "vsync_clk";
+				clock-names = "iface",
+					      "bus",
+					      "core",
+					      "iommu",
+					      "vsync";
 
 				iommus = <&mdp_smmu 0>;
 
@@ -1736,11 +1736,11 @@
 					 <&mmcc MDSS_HDMI_AHB_CLK>,
 					 <&mmcc MDSS_EXTPCLK_CLK>;
 				clock-names =
-					"mdp_core_clk",
-					"iface_clk",
-					"core_clk",
-					"alt_iface_clk",
-					"extp_clk";
+					"mdp_core",
+					"iface",
+					"core",
+					"alt_iface",
+					"extp";
 
 				phys = <&hdmi_phy>;
 				phy-names = "hdmi_phy";
@@ -1777,8 +1777,8 @@
 
 				clocks = <&mmcc MDSS_AHB_CLK>,
 					 <&gcc GCC_HDMI_CLKREF_CLK>;
-				clock-names = "iface_clk",
-					      "ref_clk";
+				clock-names = "iface",
+					      "ref";
 			};
 		};
 	};
-- 
2.18.0
