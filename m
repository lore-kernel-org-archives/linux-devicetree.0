From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH 4/9] dt-bindings: msm/mdp: Remove connector and gpu bindings
Date: Tue,  3 May 2016 16:27:56 +0530
Message-ID: <1462273081-5814-5-git-send-email-architt@codeaurora.org>
References: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robdclark@gmail.com, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, heiko@sntech.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org, Archit Taneja <architt@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The MDP DT node now contains a list of ports that describe how it connects
to external encoder interfaces like DSI and HDMI. These follow the
standard of_graph bindings, and allow us to get rid of the 'connectors'
phandle that contained a list of all the external encoders connected to
MDP.

The GPU phandle is removed too until we figure out what's the right way
to specify it in DT.

Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 .../devicetree/bindings/display/msm/mdp.txt        | 75 ++++++++++++++++++++--
 1 file changed, 71 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdp.txt b/Documentation/devicetree/bindings/display/msm/mdp.txt
index a214f6c..5f6ae3c 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp.txt
+++ b/Documentation/devicetree/bindings/display/msm/mdp.txt
@@ -6,7 +6,6 @@ Required properties:
   * "qcom,mdp5" - mdp5
 - reg: Physical base address and length of the controller's registers.
 - interrupts: The interrupt signal from the display controller.
-- connectors: array of phandles for output device(s)
 - clocks: device clocks
   See ../clocks/clock-bindings.txt for details.
 - clock-names: the following clocks are required.
@@ -24,9 +23,33 @@ Required properties:
    * "core_clk"
    * "lut_clk" (some MDP5 versions may not need this)
    * "vsync_clk"
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
+  For MDP4, the output port mappings are:
+	Port 0 -> LCDC/LVDS
+	Port 1 -> DSI1 Cmd/Video
+	Port 2 -> DSI2 Cmd/Video
+	Port 3 -> DTV
+
+ For MDP5, the availability of output ports vary across each SoC revision, but
+ they generally have the following mapping:
+	Port 0 -> MDP_INTF0 (eDP)
+	Port 1 -> MDP_INTF1 (DSI1)
+	Port 2 -> MDP_INTF2 (DSI2)
+	Port 3 -> MDP_INTF3 (HDMI)
+
+ See drivers/gpu/drm/msm/mdp/mdp5/mdp5_cfg.c to see what all INTFs a particular
+ SoC revision has enabled.
 
 Optional properties:
-- gpus: phandle for gpu device
 - clock-names: the following clocks are optional:
   * "lut_clk"
 
@@ -35,11 +58,25 @@ Example:
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
+	mdp: mdp@5100000 {
 		compatible = "qcom,mdp4";
 		reg = <0x05100000 0xf0000>;
 		interrupts = <GIC_SPI 75 0>;
-		connectors = <&hdmi>;
 		gpus = <&gpu>;
 		clock-names =
 		    "core_clk",
@@ -55,5 +92,35 @@ Example:
 		    <&mmcc TV_SRC>,
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
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
