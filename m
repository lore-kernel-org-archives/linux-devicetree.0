From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 10/10] dt-bindings: msm/dsi: Some binding doc cleanups
Date: Fri, 10 Jun 2016 16:16:40 +0530
Message-ID: <1465555600-25742-11-git-send-email-architt@codeaurora.org>
References: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
 <1465555600-25742-1-git-send-email-architt@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465555600-25742-1-git-send-email-architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some cleanups:

- Use simpler names for DT nodes in the example
- Use references instead of dumping Document links everywhere

Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 .../devicetree/bindings/display/msm/dsi.txt        | 45 +++++++++++-----------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
index f458929..6b1cab1 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
@@ -11,7 +11,7 @@ Required properties:
   be 0 or 1, since we have 2 DSI controllers at most for now.
 - interrupts: The interrupt signal from the DSI block.
 - power-domains: Should be <&mmcc MDSS_GDSC>.
-- clocks: device clocks
+- clocks: Phandles to device clocks.
 - clock-names: the following clocks are required:
   * "mdp_core_clk"
   * "iface_clk"
@@ -24,8 +24,7 @@ Required properties:
    * "src_clk"
 - assigned-clocks: Parents of "byte_clk" and "pixel_clk" for the given platform.
 - assigned-clock-parents: The Byte clock and Pixel clock PLL outputs provided
-  by a DSI PHY block.
-  See Documentation/devicetree/bindings/clocks/clock-bindings.txt for details.
+  by a DSI PHY block. See [1] for details on clock bindings.
 - vdd-supply: phandle to vdd regulator device node
 - vddio-supply: phandle to vdd-io regulator device node
 - vdda-supply: phandle to vdda regulator device node
@@ -33,15 +32,11 @@ Required properties:
 - phy-names: the name of the corresponding PHY device
 - syscon-sfpb: A phandle to mmss_sfpb syscon node (only for DSIv2)
 - ports: Contains 2 DSI controller ports as child nodes. Each port contains
-  an endpoint subnode as defined in these documents:
-
-  Documentation/devicetree/bindings/graph.txt
-  Documentation/devicetree/bindings/media/video-interfaces.txt
+  an endpoint subnode as defined in [2] and [3].
 
 Optional properties:
 - panel@0: Node of panel connected to this DSI controller.
-  See files in Documentation/devicetree/bindings/display/panel/ for each supported
-  panel.
+  See files in [4] for each supported panel.
 - qcom,dual-dsi-mode: Boolean value indicating if the DSI controller is
   driving a panel which needs 2 DSI links.
 - qcom,master-dsi: Boolean value indicating if the DSI controller is driving
@@ -58,15 +53,15 @@ Optional properties:
 
   DSI Endpoint properties:
   - remote-endpoint: For port@0, set to phandle of the connected panel/bridge's
-    input endpoint. For port@1, set to the MDP interface output.
-    See Documentation/devicetree/bindings/graph.txt for device graph info.
+    input endpoint. For port@1, set to the MDP interface output. See [2] for
+    device graph info.
 
   - data-lanes: this describes how the physical DSI data lanes are mapped
     to the logical lanes on the given platform. The value contained in
     index n describes what physical lane is mapped to the logical lane n
     (DATAn, where n lies between 0 and 3). The clock lane position is fixed
-    and can't be changed. Hence, they aren't a part of the DT bindings. For
-    more info, see Documentation/devicetree/bindings/media/video-interfaces.txt
+    and can't be changed. Hence, they aren't a part of the DT bindings. See
+    [3] for more info on the data-lanes property.
 
     For example:
 
@@ -104,8 +99,7 @@ Required properties:
 - qcom,dsi-phy-index: The ID of DSI PHY hardware instance. This should
   be 0 or 1, since we have 2 DSI PHYs at most for now.
 - power-domains: Should be <&mmcc MDSS_GDSC>.
-- clocks: device clocks
-  See Documentation/devicetree/bindings/clocks/clock-bindings.txt for details.
+- clocks: Phandles to device clocks. See [1] for details on clock bindings.
 - clock-names: the following clocks are required:
   * "iface_clk"
 - vddio-supply: phandle to vdd-io regulator device node
@@ -114,11 +108,16 @@ Optional properties:
 - qcom,dsi-phy-regulator-ldo-mode: Boolean value indicating if the LDO mode PHY
   regulator is wanted.
 
+[1] Documentation/devicetree/bindings/clocks/clock-bindings.txt
+[2] Documentation/devicetree/bindings/graph.txt
+[3] Documentation/devicetree/bindings/media/video-interfaces.txt
+[4] Documentation/devicetree/bindings/display/panel/
+
 Example:
-	mdss_dsi0: qcom,mdss_dsi@fd922800 {
+	dsi0: dsi@fd922800 {
 		compatible = "qcom,mdss-dsi-ctrl";
 		qcom,dsi-host-index = <0>;
-		interrupt-parent = <&mdss_mdp>;
+		interrupt-parent = <&mdp>;
 		interrupts = <4 0>;
 		reg-names = "dsi_ctrl";
 		reg = <0xfd922800 0x200>;
@@ -144,14 +143,14 @@ Example:
 				 <&mmcc BYTE0_CLK_SRC>,
 				 <&mmcc PCLK0_CLK_SRC>;
 		assigned-clock-parents =
-				 <&mdss_dsi_phy0 0>,
-				 <&mdss_dsi_phy0 1>;
+				 <&dsi_phy0 0>,
+				 <&dsi_phy0 1>;
 
 		vdda-supply = <&pma8084_l2>;
 		vdd-supply = <&pma8084_l22>;
 		vddio-supply = <&pma8084_l12>;
 
-		phys = <&mdss_dsi_phy0>;
+		phys = <&dsi_phy0>;
 		phy-names ="dsi-phy";
 
 		qcom,dual-dsi-mode;
@@ -159,8 +158,8 @@ Example:
 		qcom,sync-dual-dsi;
 
 		pinctrl-names = "default", "sleep";
-		pinctrl-0 = <&mdss_dsi_active>;
-		pinctrl-1 = <&mdss_dsi_suspend>;
+		pinctrl-0 = <&dsi_active>;
+		pinctrl-1 = <&dsi_suspend>;
 
 		ports {
 			#address-cells = <1>;
@@ -198,7 +197,7 @@ Example:
 		};
 	};
 
-	mdss_dsi_phy0: qcom,mdss_dsi_phy@fd922a00 {
+	dsi_phy0: dsi-phy@fd922a00 {
 		compatible = "qcom,dsi-phy-28nm-hpm";
 		qcom,dsi-phy-index = <0>;
 		reg-names =
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
