From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v2 08/10] dt-bindings: msm/dsi: Modify port and PHY bindings
Date: Fri, 10 Jun 2016 16:16:38 +0530
Message-ID: <1465555600-25742-9-git-send-email-architt@codeaurora.org>
References: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
 <1465555600-25742-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1465555600-25742-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robdclark@gmail.com, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, heiko@sntech.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org, Archit Taneja <architt@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The DSI node now has two ports that describe the connection between the
MDP interface output and the DSI input, and the connection between the DSI
output and the connected panel/bridge. Update the properties and the
example.

Also, use generic PHY bindings instead of the custom one.

Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
v2:
- Use hyphen for dsi phy name

 .../devicetree/bindings/display/msm/dsi.txt        | 45 ++++++++++++++++------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
index 9d2d2bb..6442408 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
@@ -26,8 +26,14 @@ Required properties:
 - vdd-supply: phandle to vdd regulator device node
 - vddio-supply: phandle to vdd-io regulator device node
 - vdda-supply: phandle to vdda regulator device node
-- qcom,dsi-phy: phandle to DSI PHY device node
+- phys: phandle to DSI PHY device node
+- phy-names: the name of the corresponding PHY device
 - syscon-sfpb: A phandle to mmss_sfpb syscon node (only for DSIv2)
+- ports: Contains 2 DSI controller ports as child nodes. Each port contains
+  an endpoint subnode as defined in these documents:
+
+  Documentation/devicetree/bindings/graph.txt
+  Documentation/devicetree/bindings/media/video-interfaces.txt
 
 Optional properties:
 - panel@0: Node of panel connected to this DSI controller.
@@ -44,11 +50,14 @@ Optional properties:
 - pinctrl-names: the pin control state names; should contain "default"
 - pinctrl-0: the default pinctrl state (active)
 - pinctrl-n: the "sleep" pinctrl state
-- port: DSI controller output port, containing one endpoint subnode.
+- ports: contains DSI controller input and output ports as children, each
+  containing one endpoint subnode.
 
   DSI Endpoint properties:
-  - remote-endpoint: set to phandle of the connected panel's endpoint.
+  - remote-endpoint: For port@0, set to phandle of the connected panel/bridge's
+    input endpoint. For port@1, set to the MDP interface output.
     See Documentation/devicetree/bindings/graph.txt for device graph info.
+
   - data-lanes: this describes how the physical DSI data lanes are mapped
     to the logical lanes on the given platform. The value contained in
     index n describes what physical lane is mapped to the logical lane n
@@ -129,7 +138,8 @@ Example:
 		vdd-supply = <&pma8084_l22>;
 		vddio-supply = <&pma8084_l12>;
 
-		qcom,dsi-phy = <&mdss_dsi_phy0>;
+		phys = <&mdss_dsi_phy0>;
+		phy-names ="dsi-phy";
 
 		qcom,dual-dsi-mode;
 		qcom,master-dsi;
@@ -139,6 +149,26 @@ Example:
 		pinctrl-0 = <&mdss_dsi_active>;
 		pinctrl-1 = <&mdss_dsi_suspend>;
 
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dsi0_in: endpoint {
+					remote-endpoint = <&mdp_intf1_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dsi0_out: endpoint {
+					remote-endpoint = <&panel_in>;
+					data-lanes = <0 1 2 3>;
+				};
+			};
+		};
+
 		panel: panel@0 {
 			compatible = "sharp,lq101r1sx01";
 			reg = <0>;
@@ -153,13 +183,6 @@ Example:
 				};
 			};
 		};
-
-		port {
-			dsi0_out: endpoint {
-				remote-endpoint = <&panel_in>;
-				data-lanes = <0 1 2 3>;
-			};
-		};
 	};
 
 	mdss_dsi_phy0: qcom,mdss_dsi_phy@fd922a00 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
