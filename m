From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 5/9] dt-bindings: msm/dsi: Some binding doc cleanups
Date: Tue,  3 May 2016 16:27:57 +0530
Message-ID: <1462273081-5814-6-git-send-email-architt@codeaurora.org>
References: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462273081-5814-1-git-send-email-architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some cleanups:

- Use simpler names for DT nodes in the example
- Fix phandle for specifying data lane mapping in the example.
- Use references instead of dumping Document links everywhere

Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 .../devicetree/bindings/display/msm/dsi.txt        | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
index f5948c4..bf41d7c 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
@@ -11,8 +11,7 @@ Required properties:
   be 0 or 1, since we have 2 DSI controllers at most for now.
 - interrupts: The interrupt signal from the DSI block.
 - power-domains: Should be <&mmcc MDSS_GDSC>.
-- clocks: device clocks
-  See Documentation/devicetree/bindings/clocks/clock-bindings.txt for details.
+- clocks: Phandles to device clocks as descirbed in [1]
 - clock-names: the following clocks are required:
   * "mdp_core_clk"
   * "iface_clk"
@@ -31,8 +30,7 @@ Required properties:
 
 Optional properties:
 - panel@0: Node of panel connected to this DSI controller.
-  See files in Documentation/devicetree/bindings/display/panel/ for each supported
-  panel.
+  See files in [2] for each supported panel.
 - qcom,dual-dsi-mode: Boolean value indicating if the DSI controller is
   driving a panel which needs 2 DSI links.
 - qcom,master-dsi: Boolean value indicating if the DSI controller is driving
@@ -48,7 +46,7 @@ Optional properties:
 
   DSI Endpoint properties:
   - remote-endpoint: set to phandle of the connected panel's endpoint.
-    See Documentation/devicetree/bindings/graph.txt for device graph info.
+    See [3] for device graph info.
   - qcom,data-lane-map: this describes how the logical DSI lanes are mapped
     to the physical lanes on the given platform. The value contained in
     index n describes what logical data lane is mapped to the physical data
@@ -89,8 +87,7 @@ Required properties:
 - qcom,dsi-phy-index: The ID of DSI PHY hardware instance. This should
   be 0 or 1, since we have 2 DSI PHYs at most for now.
 - power-domains: Should be <&mmcc MDSS_GDSC>.
-- clocks: device clocks
-  See Documentation/devicetree/bindings/clocks/clock-bindings.txt for details.
+- clocks: Phandles to device clocks as descirbed in [1]
 - clock-names: the following clocks are required:
   * "iface_clk"
 - vddio-supply: phandle to vdd-io regulator device node
@@ -99,8 +96,12 @@ Optional properties:
 - qcom,dsi-phy-regulator-ldo-mode: Boolean value indicating if the LDO mode PHY
   regulator is wanted.
 
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+[2] Documentation/devicetree/bindings/display/panel/
+[3] Documentation/devicetree/bindings/graph.txt
+
 Example:
-	mdss_dsi0: qcom,mdss_dsi@fd922800 {
+	dsi0: dsi@fd922800 {
 		compatible = "qcom,mdss-dsi-ctrl";
 		qcom,dsi-host-index = <0>;
 		interrupt-parent = <&mdss_mdp>;
@@ -128,7 +129,7 @@ Example:
 		vdd-supply = <&pma8084_l22>;
 		vddio-supply = <&pma8084_l12>;
 
-		qcom,dsi-phy = <&mdss_dsi_phy0>;
+		qcom,dsi-phy = <&dsi_phy0>;
 
 		qcom,dual-dsi-mode;
 		qcom,master-dsi;
@@ -156,12 +157,12 @@ Example:
 		port {
 			dsi0_out: endpoint {
 				remote-endpoint = <&panel_in>;
-				lanes = <0 1 2 3>;
+				qcom,data-lane-map = <0 1 2 3>;
 			};
 		};
 	};
 
-	mdss_dsi_phy0: qcom,mdss_dsi_phy@fd922a00 {
+	dsi_phy0: dsi_phy@fd922a00 {
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
