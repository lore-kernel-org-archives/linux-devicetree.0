From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH v2] arm64: dts: msm8916: drop legacy suffix for clocks used by MSM DRM driver
Date: Thu, 19 Jul 2018 13:12:34 +0200
Message-ID: <20180719111235.22421-1-niklas.cassel@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Drop legacy suffix for clocks used by MSM DRM driver.

The _clk suffix has been deprecated since commit 20c3bb80235 ("drm/msm:
drop _clk suffix from clk names").

Fixes the following warnings during boot:

msm_dsi_phy 1a98300.dsi-phy: Using legacy clk name binding.  Use "iface" instead of "iface_clk"
msm 1a00000.mdss: Using legacy clk name binding.  Use "iface" instead of "iface_clk"
msm 1a00000.mdss: Using legacy clk name binding.  Use "bus" instead of "bus_clk"
msm 1a00000.mdss: Using legacy clk name binding.  Use "vsync" instead of "vsync_clk"
msm_mdp 1a01000.mdp: Using legacy clk name binding.  Use "bus" instead of "bus_clk"
msm_mdp 1a01000.mdp: Using legacy clk name binding.  Use "iface" instead of "iface_clk"
msm_mdp 1a01000.mdp: Using legacy clk name binding.  Use "core" instead of "core_clk"
msm_mdp 1a01000.mdp: Using legacy clk name binding.  Use "vsync" instead of "vsync_clk"
msm_dsi 1a98000.dsi: Using legacy clk name binding.  Use "mdp_core" instead of "mdp_core_clk"
msm_dsi 1a98000.dsi: Using legacy clk name binding.  Use "iface" instead of "iface_clk"
msm_dsi 1a98000.dsi: Using legacy clk name binding.  Use "bus" instead of "bus_clk"
msm_dsi 1a98000.dsi: Using legacy clk name binding.  Use "byte" instead of "byte_clk"
msm_dsi 1a98000.dsi: Using legacy clk name binding.  Use "pixel" instead of "pixel_clk"
msm_dsi 1a98000.dsi: Using legacy clk name binding.  Use "core" instead of "core_clk"

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
Changes since v1:
-Improved commit message.

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 28 +++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index c2625d15a8c0..7b32b8990d62 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -858,9 +858,9 @@
 			clocks = <&gcc GCC_MDSS_AHB_CLK>,
 				 <&gcc GCC_MDSS_AXI_CLK>,
 				 <&gcc GCC_MDSS_VSYNC_CLK>;
-			clock-names = "iface_clk",
-				      "bus_clk",
-				      "vsync_clk";
+			clock-names = "iface",
+				      "bus",
+				      "vsync";
 
 			interrupts = <0 72 IRQ_TYPE_LEVEL_HIGH>;
 
@@ -883,10 +883,10 @@
 					 <&gcc GCC_MDSS_AXI_CLK>,
 					 <&gcc GCC_MDSS_MDP_CLK>,
 					 <&gcc GCC_MDSS_VSYNC_CLK>;
-				clock-names = "iface_clk",
-					      "bus_clk",
-					      "core_clk",
-					      "vsync_clk";
+				clock-names = "iface",
+					      "bus",
+					      "core",
+					      "vsync";
 
 				iommus = <&apps_iommu 4>;
 
@@ -922,12 +922,12 @@
 					 <&gcc GCC_MDSS_BYTE0_CLK>,
 					 <&gcc GCC_MDSS_PCLK0_CLK>,
 					 <&gcc GCC_MDSS_ESC0_CLK>;
-				clock-names = "mdp_core_clk",
-					      "iface_clk",
-					      "bus_clk",
-					      "byte_clk",
-					      "pixel_clk",
-					      "core_clk";
+				clock-names = "mdp_core",
+					      "iface",
+					      "bus",
+					      "byte",
+					      "pixel",
+					      "core";
 				phys = <&dsi_phy0>;
 				phy-names = "dsi-phy";
 
@@ -963,7 +963,7 @@
 				#phy-cells = <0>;
 
 				clocks = <&gcc GCC_MDSS_AHB_CLK>;
-				clock-names = "iface_clk";
+				clock-names = "iface";
 			};
 		};
 
-- 
2.17.1
