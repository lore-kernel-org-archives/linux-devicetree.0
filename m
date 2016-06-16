From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH 18/22] dt-bindings: msm/mdp4: Create a separate binding doc for MDP4
Date: Thu, 16 Jun 2016 17:06:43 +0530
Message-ID: <1466077007-26792-19-git-send-email-architt@codeaurora.org>
References: <1466077007-26792-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1466077007-26792-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robdclark@gmail.com
Cc: robh@kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

MDP4 and MDP5 vary a bit in terms of device hierarchy and the properties
they require. Rename the binding doc to mdp4.txt and remove MDP5 specific
pieces. A separate document will be created for MDP5

Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org

Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 .../devicetree/bindings/display/msm/mdp.txt        | 57 ----------------------
 .../devicetree/bindings/display/msm/mdp4.txt       | 54 ++++++++++++++++++++
 2 files changed, 54 insertions(+), 57 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdp4.txt

diff --git a/Documentation/devicetree/bindings/display/msm/mdp.txt b/Documentation/devicetree/bindings/display/msm/mdp.txt
deleted file mode 100644
index ebfe016..0000000
--- a/Documentation/devicetree/bindings/display/msm/mdp.txt
+++ /dev/null
@@ -1,57 +0,0 @@
-Qualcomm adreno/snapdragon display controller
-
-Required properties:
-- compatible:
-  * "qcom,mdp4" - mdp4
-  * "qcom,mdp5" - mdp5
-- reg: Physical base address and length of the controller's registers.
-- interrupts: The interrupt signal from the display controller.
-- connectors: array of phandles for output device(s)
-- clocks: device clocks
-  See ../clocks/clock-bindings.txt for details.
-- clock-names: the following clocks are required.
-  For MDP4:
-   * "core_clk"
-   * "iface_clk"
-   * "bus_clk"
-   * "lut_clk"
-   * "hdmi_clk"
-   * "tv_clk"
-  For MDP5:
-   * "bus_clk"
-   * "iface_clk"
-   * "core_clk"
-   * "lut_clk" (some MDP5 versions may not need this)
-   * "vsync_clk"
-
-Optional properties:
-- gpus: phandle for gpu device
-- clock-names: the following clocks are optional:
-  * "lut_clk"
-
-Example:
-
-/ {
-	...
-
-	mdp: qcom,mdp@5100000 {
-		compatible = "qcom,mdp4";
-		reg = <0x05100000 0xf0000>;
-		interrupts = <GIC_SPI 75 0>;
-		connectors = <&hdmi>;
-		gpus = <&gpu>;
-		clock-names =
-		    "core_clk",
-		    "iface_clk",
-		    "lut_clk",
-		    "hdmi_clk",
-		    "tv_clk";
-		clocks =
-		    <&mmcc MDP_CLK>,
-		    <&mmcc MDP_AHB_CLK>,
-		    <&mmcc MDP_AXI_CLK>,
-		    <&mmcc MDP_LUT_CLK>,
-		    <&mmcc HDMI_TV_CLK>,
-		    <&mmcc MDP_TV_CLK>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/msm/mdp4.txt b/Documentation/devicetree/bindings/display/msm/mdp4.txt
new file mode 100644
index 0000000..1de9b17
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/mdp4.txt
@@ -0,0 +1,54 @@
+Qualcomm adreno/snapdragon MDP4 display controller
+
+Description:
+
+This is the bindings documentation for the MDP4 display controller found in
+SoCs like MSM8960, APQ8064 and MSM8660.
+
+Required properties:
+- compatible:
+  * "qcom,mdp4" - mdp4
+- reg: Physical base address and length of the controller's registers.
+- interrupts: The interrupt signal from the display controller.
+- connectors: array of phandles for output device(s)
+- clocks: device clocks
+  See ../clocks/clock-bindings.txt for details.
+- clock-names: the following clocks are required.
+  * "core_clk"
+  * "iface_clk"
+  * "bus_clk"
+  * "lut_clk"
+  * "hdmi_clk"
+  * "tv_clk"
+
+Optional properties:
+- gpus: phandle for gpu device
+- clock-names: the following clocks are optional:
+  * "lut_clk"
+
+Example:
+
+/ {
+	...
+
+	mdp: qcom,mdp@5100000 {
+		compatible = "qcom,mdp4";
+		reg = <0x05100000 0xf0000>;
+		interrupts = <GIC_SPI 75 0>;
+		connectors = <&hdmi>;
+		gpus = <&gpu>;
+		clock-names =
+		    "core_clk",
+		    "iface_clk",
+		    "lut_clk",
+		    "hdmi_clk",
+		    "tv_clk";
+		clocks =
+		    <&mmcc MDP_CLK>,
+		    <&mmcc MDP_AHB_CLK>,
+		    <&mmcc MDP_AXI_CLK>,
+		    <&mmcc MDP_LUT_CLK>,
+		    <&mmcc HDMI_TV_CLK>,
+		    <&mmcc MDP_TV_CLK>;
+	};
+};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
