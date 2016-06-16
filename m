From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH 19/22] dt-bindings: msm/mdp5: Add MDP5 display bindings
Date: Thu, 16 Jun 2016 17:06:44 +0530
Message-ID: <1466077007-26792-20-git-send-email-architt@codeaurora.org>
References: <1466077007-26792-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1466077007-26792-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robdclark@gmail.com
Cc: robh@kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a new doc for DT bindings for platforms that contain MDP5 display
controller hardware. The doc describes bindings for the top level
MDSS wrapper hardware and MDP5 itself.

Add an example for the bindings as found in MSM8916.

Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org

Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 .../devicetree/bindings/display/msm/mdp5.txt       | 114 +++++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt

diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
new file mode 100644
index 0000000..b395905
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
@@ -0,0 +1,114 @@
+Qualcomm adreno/snapdragon MDP5 display controller
+
+Description:
+
+This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
+encapsulates sub-blocks like MDP5, DSI, HDMI, eDP etc, and the MDP5 display
+controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.
+
+MDSS:
+Required properties:
+- compatible:
+  * "qcom,mdss" - MDSS
+- reg: Physical base address and length of the controller's registers.
+- reg-names: The names of register regions. The following regions are required:
+  * "mdss_phys"
+  * "vbif_phys"
+- interrupts: The interrupt signal from MDSS.
+- interrupt-controller: identifies the node as an interrupt controller.
+- #interrupt-cells: specifies the number of cells needed to encode an interrupt
+  source, should be 1.
+- power-domains: a power domain consumer specifier according to
+  Documentation/devicetree/bindings/power/power_domain.txt
+- clocks: device clocks. See ../clocks/clock-bindings.txt for details.
+- clock-names: the following clocks are required.
+  * "iface_clk"
+  * "bus_clk"
+  * "vsync_clk"
+- #address-cells: number of address cells for the MDSS children. Should be 1.
+- #size-cells: Should be 1.
+- ranges: parent bus address space is the same as the child bus address space.
+
+Optional properties:
+- clock-names: the following clocks are optional:
+  * "lut_clk"
+
+MDP5:
+Required properties:
+- compatible:
+  * "qcom,mdp5" - MDP5
+- reg: Physical base address and length of the controller's registers.
+- reg-names: The names of register regions. The following regions are required:
+  * "mdp_phys"
+- interrupts: Interrupt line from MDP5 to MDSS interrupt controller.
+- interrupt-parent: phandle to the MDSS block
+  through MDP block
+- clocks: device clocks. See ../clocks/clock-bindings.txt for details.
+- clock-names: the following clocks are required.
+-   * "bus_clk"
+-   * "iface_clk"
+-   * "core_clk"
+-   * "vsync_clk"
+
+Optional properties:
+- clock-names: the following clocks are optional:
+  * "lut_clk"
+
+
+Example:
+
+/ {
+	...
+
+	mdss: mdss@1a00000 {
+		compatible = "qcom,mdss";
+		reg = <0x1a00000 0x1000>,
+		      <0x1ac8000 0x3000>;
+		reg-names = "mdss_phys", "vbif_phys";
+
+		power-domains = <&gcc MDSS_GDSC>;
+
+		clocks = <&gcc GCC_MDSS_AHB_CLK>,
+			 <&gcc GCC_MDSS_AXI_CLK>,
+			 <&gcc GCC_MDSS_VSYNC_CLK>;
+		clock-names = "iface_clk",
+			      "bus_clk",
+			      "vsync_clk"
+
+		interrupts = <0 72 0>;
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		mdp: mdp@1a01000 {
+			compatible = "qcom,mdp5";
+			reg = <0x1a01000 0x90000>;
+			reg-names = "mdp_phys";
+
+			interrupt-parent = <&mdss>;
+			interrupts = <0 0>;
+
+			clocks = <&gcc GCC_MDSS_AHB_CLK>,
+				 <&gcc GCC_MDSS_AXI_CLK>,
+				 <&gcc GCC_MDSS_MDP_CLK>,
+				 <&gcc GCC_MDSS_VSYNC_CLK>;
+			clock-names = "iface_clk",
+				      "bus_clk",
+				      "core_clk",
+				      "vsync_clk";
+
+		};
+
+		dsi0: dsi@1a98000 {
+			...
+		};
+
+		dsi_phy0: dsi-phy@1a98300 {
+			...
+		};
+	};
+};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
