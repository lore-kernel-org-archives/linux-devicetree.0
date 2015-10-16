From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH 1/2] dt-bindings: drm/msm: Update bindings for MDP5
Date: Fri, 16 Oct 2015 17:36:11 +0530
Message-ID: <1444997172-9308-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: agross@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, robdclark@gmail.com, devicetree@vger.kernel.org, Archit Taneja <architt@codeaurora.org>
List-Id: devicetree@vger.kernel.org

MDP5 has a different compatible string (which causes checkpatch warnings
when we try to add MDP5 device nodes). It also has different list of
clocks.

Update the bindings for MDP5.

Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 Documentation/devicetree/bindings/drm/msm/mdp.txt | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/drm/msm/mdp.txt b/Documentation/devicetree/bindings/drm/msm/mdp.txt
index 1a0598e..e926daa 100644
--- a/Documentation/devicetree/bindings/drm/msm/mdp.txt
+++ b/Documentation/devicetree/bindings/drm/msm/mdp.txt
@@ -3,18 +3,27 @@ Qualcomm adreno/snapdragon display controller
 Required properties:
 - compatible:
   * "qcom,mdp" - mdp4
+  * "qcom,mdss_mdp" - mdp5
 - reg: Physical base address and length of the controller's registers.
 - interrupts: The interrupt signal from the display controller.
 - connectors: array of phandles for output device(s)
 - clocks: device clocks
   See ../clocks/clock-bindings.txt for details.
-- clock-names: the following clocks are required:
-  * "core_clk"
-  * "iface_clk"
-  * "lut_clk"
-  * "src_clk"
-  * "hdmi_clk"
-  * "mpd_clk"
+- clock-names: the following clocks are required.
+  For MDP4:
+   * "core_clk"
+   * "iface_clk"
+   * "lut_clk"
+   * "src_clk"
+   * "hdmi_clk"
+   * "mdp_clk"
+  For MDP5:
+   * "bus_clk"
+   * "iface_clk"
+   * "core_clk_src"
+   * "core_clk"
+   * "lut_clk" (some MDP5 versions may not need this)
+   * "vsync_clk"
 
 Optional properties:
 - gpus: phandle for gpu device
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
