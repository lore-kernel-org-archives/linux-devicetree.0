From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH 13/13] dt/bindings: drm/msm/hdmi: Add hdmi phy bindings
Date: Thu, 21 Jan 2016 12:39:41 +0530
Message-ID: <1453360181-31738-14-git-send-email-architt@codeaurora.org>
References: <1453360181-31738-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1453360181-31738-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robdclark@gmail.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Add hdmi phy bindings. Update the example to use hdmi phy.

Add a missing power-domains property in the hdmi core bindings.

Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>

Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 .../devicetree/bindings/display/msm/hdmi.txt       | 39 +++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.txt b/Documentation/devicetree/bindings/display/msm/hdmi.txt
index 379ee2e..21590ee 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.txt
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.txt
@@ -11,6 +11,7 @@ Required properties:
 - reg: Physical base address and length of the controller's registers
 - reg-names: "core_physical"
 - interrupts: The interrupt signal from the hdmi block.
+- power-domains: Should be <&mmcc MDSS_GDSC>.
 - clocks: device clocks
   See ../clocks/clock-bindings.txt for details.
 - qcom,hdmi-tx-ddc-clk-gpio: ddc clk pin
@@ -18,6 +19,7 @@ Required properties:
 - qcom,hdmi-tx-hpd-gpio: hpd pin
 - core-vdda-supply: phandle to supply regulator
 - hdmi-mux-supply: phandle to mux regulator
+- qcom,dsi-phy: phandle to HDMI PHY device node
 
 Optional properties:
 - qcom,hdmi-tx-mux-en-gpio: hdmi mux enable pin
@@ -27,6 +29,27 @@ Optional properties:
 - pinctrl-0: the default pinctrl state (active)
 - pinctrl-1: the "sleep" pinctrl state
 
+HDMI PHY:
+Required properties:
+- compatible: Could be the following
+  * "qcom,hdmi-phy-8x60"
+  * "qcom,hdmi-phy-8960"
+  * "qcom,hdmi-phy-8x74"
+  * "qcom,hdmi-phy-8996"
+- reg: Physical base address and length of the registers of the PHY sub blocks.
+- reg-names: The names of register regions. The following regions are required:
+  * "hdmi_pll"
+  * "hdmi_phy"
+  For HDMI PHY on msm8996, these additional register regions are required:
+    * "hdmi_tx_l0"
+    * "hdmi_tx_l1"
+    * "hdmi_tx_l3"
+    * "hdmi_tx_l4"
+- power-domains: Should be <&mmcc MDSS_GDSC>.
+- clocks: device clocks
+  See Documentation/devicetree/bindings/clocks/clock-bindings.txt for details.
+- core-vdda-supply: phandle to vdda regulator device node
+
 Example:
 
 / {
@@ -35,7 +58,7 @@ Example:
 	hdmi: qcom,hdmi-tx-8960@4a00000 {
 		compatible = "qcom,hdmi-tx-8960";
 		reg-names = "core_physical";
-		reg = <0x04a00000 0x1000>;
+		reg = <0x04a00000 0x2f0>;
 		interrupts = <GIC_SPI 79 0>;
 		power-domains = <&mmcc MDSS_GDSC>;
 		clock-names =
@@ -54,5 +77,19 @@ Example:
 		pinctrl-names = "default", "sleep";
 		pinctrl-0 = <&hpd_active  &ddc_active  &cec_active>;
 		pinctrl-1 = <&hpd_suspend &ddc_suspend &cec_suspend>;
+
+		qcom,hdmi-phy = <&hdmi_phy>;
+	};
+
+	hdmi_phy: qcom,hdmi-phy-8960@4a00400 {
+		compatible = "qcom,hdmi-phy-8960";
+		reg-names = "hdmi_phy",
+			    "hdmi_pll";
+		reg = <0x4a00400 0x60>,
+		      <0x4a00500 0x100>;
+		power-domains = <&mmcc MDSS_GDSC>;
+		clock-names = "slave_iface_clk";
+		clocks = <&mmcc HDMI_S_AHB_CLK>;
+		core-vdda-supply = <&pm8921_hdmi_mvs>;
 	};
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
