From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH 20/22] dt-bindings: msm/mdp: Provide details on MDP interface ports
Date: Thu, 16 Jun 2016 17:06:45 +0530
Message-ID: <1466077007-26792-21-git-send-email-architt@codeaurora.org>
References: <1466077007-26792-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1466077007-26792-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robdclark@gmail.com
Cc: robh@kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The MDP4/5 DT node now contains a list of ports that describe how it
connects to external encoder interfaces like DSI and HDMI. These follow
the standard of_graph bindings, and allow us to get rid of the 'connectors'
phandle that contained a list of all the external encoders connected to
MDP.

The GPU phandle is removed too until we figure out what's the right way
to specify it in DT.

Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org

Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 .../devicetree/bindings/display/msm/mdp4.txt       | 68 ++++++++++++++++++++--
 .../devicetree/bindings/display/msm/mdp5.txt       | 48 ++++++++++++++-
 2 files changed, 110 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdp4.txt b/Documentation/devicetree/bindings/display/msm/mdp4.txt
index 1de9b17..3c341a1 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp4.txt
+++ b/Documentation/devicetree/bindings/display/msm/mdp4.txt
@@ -10,7 +10,6 @@ Required properties:
   * "qcom,mdp4" - mdp4
 - reg: Physical base address and length of the controller's registers.
 - interrupts: The interrupt signal from the display controller.
-- connectors: array of phandles for output device(s)
 - clocks: device clocks
   See ../clocks/clock-bindings.txt for details.
 - clock-names: the following clocks are required.
@@ -20,9 +19,23 @@ Required properties:
   * "lut_clk"
   * "hdmi_clk"
   * "tv_clk"
+- ports: contains the list of output ports from MDP. These connect to interfaces
+  that are external to the MDP hardware, such as HDMI, DSI, EDP etc (LVDS is a
+  special case since it is a part of the MDP block itself).
+
+  Each output port contains an endpoint that describes how it is connected to an
+  external interface. These are described by the standard properties documented
+  here:
+	Documentation/devicetree/bindings/graph.txt
+	Documentation/devicetree/bindings/media/video-interfaces.txt
+
+  The output port mappings are:
+	Port 0 -> LCDC/LVDS
+	Port 1 -> DSI1 Cmd/Video
+	Port 2 -> DSI2 Cmd/Video
+	Port 3 -> DTV
 
 Optional properties:
-- gpus: phandle for gpu device
 - clock-names: the following clocks are optional:
   * "lut_clk"
 
@@ -31,12 +44,27 @@ Example:
 / {
 	...
 
-	mdp: qcom,mdp@5100000 {
+	hdmi: hdmi@4a00000 {
+		...
+		ports {
+			...
+			port@0 {
+				reg = <0>;
+				hdmi_in: endpoint {
+					remote-endpoint = <&mdp_dtv_out>;
+				};
+			};
+			...
+		};
+		...
+	};
+
+	...
+
+	mdp: mdp@5100000 {
 		compatible = "qcom,mdp4";
 		reg = <0x05100000 0xf0000>;
 		interrupts = <GIC_SPI 75 0>;
-		connectors = <&hdmi>;
-		gpus = <&gpu>;
 		clock-names =
 		    "core_clk",
 		    "iface_clk",
@@ -50,5 +78,35 @@ Example:
 		    <&mmcc MDP_LUT_CLK>,
 		    <&mmcc HDMI_TV_CLK>,
 		    <&mmcc MDP_TV_CLK>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
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
+						remote-endpoint = <&hdmi_in>;
+					};
+				};
+		};
 	};
 };
diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
index b395905..30c11ea 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
+++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
@@ -49,12 +49,36 @@ Required properties:
 -   * "iface_clk"
 -   * "core_clk"
 -   * "vsync_clk"
+- ports: contains the list of output ports from MDP. These connect to interfaces
+  that are external to the MDP hardware, such as HDMI, DSI, EDP etc (LVDS is a
+  special case since it is a part of the MDP block itself).
+
+  Each output port contains an endpoint that describes how it is connected to an
+  external interface. These are described by the standard properties documented
+  here:
+	Documentation/devicetree/bindings/graph.txt
+	Documentation/devicetree/bindings/media/video-interfaces.txt
+
+  The availability of output ports can vary across SoC revisions:
+
+  For MSM8974 and APQ8084:
+	 Port 0 -> MDP_INTF0 (eDP)
+	 Port 1 -> MDP_INTF1 (DSI1)
+	 Port 2 -> MDP_INTF2 (DSI2)
+	 Port 3 -> MDP_INTF3 (HDMI)
+
+  For MSM8916:
+	 Port 0 -> MDP_INTF1 (DSI1)
+
+  For MSM8994 and MSM8996:
+	 Port 0 -> MDP_INTF1 (DSI1)
+	 Port 1 -> MDP_INTF2 (DSI2)
+	 Port 2 -> MDP_INTF3 (HDMI)
 
 Optional properties:
 - clock-names: the following clocks are optional:
   * "lut_clk"
 
-
 Example:
 
 / {
@@ -101,10 +125,32 @@ Example:
 				      "core_clk",
 				      "vsync_clk";
 
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					mdp5_intf1_out: endpoint {
+						remote-endpoint = <&dsi0_in>;
+					};
+				};
+			};
 		};
 
 		dsi0: dsi@1a98000 {
 			...
+			ports {
+				...
+				port@0 {
+					reg = <0>;
+					dsi0_in: endpoint {
+						remote-endpoint = <&mdp5_intf1_out>;
+					};
+				};
+				...
+			};
+			...
 		};
 
 		dsi_phy0: dsi-phy@1a98300 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
