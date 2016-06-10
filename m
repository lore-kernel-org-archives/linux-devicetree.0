From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v2 09/10] dt-bindings: msm/dsi: Add assigned clocks bindings
Date: Fri, 10 Jun 2016 16:16:39 +0530
Message-ID: <1465555600-25742-10-git-send-email-architt@codeaurora.org>
References: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
 <1465555600-25742-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1465555600-25742-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robdclark@gmail.com, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, heiko@sntech.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org, Archit Taneja <architt@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The PLL in the DSI PHY block generates 2 clock outputs (Byte and Pixel
clocks) that are fed into the Multimedia Clock Controller (MMCC). The MMCC
uses these as source clocks for some of its RCGs to generate clocks that
finally feed to the DSI host controller.

Use the assigned clocks DT bindings to set up the MMCC RCGs that feed to
the DSI host. Use the DSI PHY provided clocks to set up the parents
of these assigned clocks.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 Documentation/devicetree/bindings/display/msm/dsi.txt | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
index 6442408..f458929 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
@@ -12,7 +12,6 @@ Required properties:
 - interrupts: The interrupt signal from the DSI block.
 - power-domains: Should be <&mmcc MDSS_GDSC>.
 - clocks: device clocks
-  See Documentation/devicetree/bindings/clocks/clock-bindings.txt for details.
 - clock-names: the following clocks are required:
   * "mdp_core_clk"
   * "iface_clk"
@@ -23,6 +22,10 @@ Required properties:
   * "core_clk"
   For DSIv2, we need an additional clock:
    * "src_clk"
+- assigned-clocks: Parents of "byte_clk" and "pixel_clk" for the given platform.
+- assigned-clock-parents: The Byte clock and Pixel clock PLL outputs provided
+  by a DSI PHY block.
+  See Documentation/devicetree/bindings/clocks/clock-bindings.txt for details.
 - vdd-supply: phandle to vdd regulator device node
 - vddio-supply: phandle to vdd-io regulator device node
 - vdda-supply: phandle to vdda regulator device node
@@ -96,6 +99,8 @@ Required properties:
   * "dsi_pll"
   * "dsi_phy"
   * "dsi_phy_regulator"
+- clock-cells: Must be 1. The DSI PHY block acts as a clock provider, creating
+  2 clocks: A byte clock (index 0), and a pixel clock (index 1).
 - qcom,dsi-phy-index: The ID of DSI PHY hardware instance. This should
   be 0 or 1, since we have 2 DSI PHYs at most for now.
 - power-domains: Should be <&mmcc MDSS_GDSC>.
@@ -134,6 +139,14 @@ Example:
 			<&mmcc MDSS_AHB_CLK>,
 			<&mmcc MDSS_MDP_CLK>,
 			<&mmcc MDSS_PCLK0_CLK>;
+
+		assigned-clocks =
+				 <&mmcc BYTE0_CLK_SRC>,
+				 <&mmcc PCLK0_CLK_SRC>;
+		assigned-clock-parents =
+				 <&mdss_dsi_phy0 0>,
+				 <&mdss_dsi_phy0 1>;
+
 		vdda-supply = <&pma8084_l2>;
 		vdd-supply = <&pma8084_l22>;
 		vddio-supply = <&pma8084_l12>;
@@ -197,6 +210,7 @@ Example:
 			<0xfd922d80 0x7b>;
 		clock-names = "iface_clk";
 		clocks = <&mmcc MDSS_AHB_CLK>;
+		#clock-cells = <1>;
 		vddio-supply = <&pma8084_l12>;
 
 		qcom,dsi-phy-regulator-ldo-mode;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
