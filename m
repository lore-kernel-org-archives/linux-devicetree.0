From: Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH v3 1/3] dt-bindings: usb: Update documentation for Qualcomm DWC3 driver
Date: Sat,  5 May 2018 00:18:07 +0530
Message-ID: <1525459689-1358-2-git-send-email-mgautam@codeaurora.org>
References: <1525459689-1358-1-git-send-email-mgautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525459689-1358-1-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org, robh@kernel.org, andy.gross@linaro.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Existing documentation has lot of incorrect information as it
was originally added for a driver that no longer exists.

Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
---
 .../devicetree/bindings/usb/qcom,dwc3.txt          | 85 ++++++++++++++++------
 1 file changed, 63 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
index bc8a2fa..95afdcf 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
@@ -1,54 +1,95 @@
 Qualcomm SuperSpeed DWC3 USB SoC controller
 
 Required properties:
-- compatible:	should contain "qcom,dwc3"
+- compatible:		Compatible list, contains
+			"qcom,dwc3"
+			"qcom,msm8996-dwc3" for msm8996 SOC.
+			"qcom,sdm845-dwc3" for sdm845 SOC.
+- reg:			Offset and length of register set for QSCRATCH wrapper
+- power-domains:	specifies a phandle to PM domain provider node
 - clocks:		A list of phandle + clock-specifier pairs for the
 				clocks listed in clock-names
-- clock-names:	Should contain the following:
+- clock-names:		Should contain the following:
   "core"		Master/Core clock, have to be >= 125 MHz for SS
 				operation and >= 60MHz for HS operation
+  "mock_utmi"		Mock utmi clock needed for ITP/SOF generation in
+				host mode. Its frequency should be 19.2MHz.
+  "sleep"		Sleep clock, used for wakeup when USB3 core goes
+				into low power mode (U3).
 
 Optional clocks:
-  "iface"		System bus AXI clock.  Not present on all platforms
-  "sleep"		Sleep clock, used when USB3 core goes into low
-				power mode (U3).
+  "iface"		System bus AXI clock.
+			Not present on "qcom,msm8996-dwc3" compatible.
+  "cfg_noc"		System Config NOC clock.
+			Not present on "qcom,msm8996-dwc3" compatible.
+- assigned-clocks:	Should be:
+				MOCK_UTMI_CLK
+				MASTER_CLK
+- assigned-clock-rates: Should be:
+                                19.2Mhz (192000000) for MOCK_UTMI_CLK
+                                >=125Mhz (125000000) for MASTER_CLK in SS mode
+                                >=60Mhz (60000000) for MASTER_CLK in HS mode
+
+Optional properties:
+- resets:		Phandle to reset control that resets core and wrapper.
+- interrupts:		specifies interrupts from controller wrapper used
+			to wakeup from low power/susepnd state.	Must contain
+			one or more entry for interrupt-names property
+- interrupt-names:	Must include the following entries:
+			- "hs_phy_irq": The interrupt that is asserted when a
+			   wakeup event is received on USB2 bus
+			- "ss_phy_irq": The interrupt that is asserted when a
+			   wakeup event is received on USB3 bus
+			- "dm_hs_phy_irq" and "dp_hs_phy_irq": Separate
+			   interrupts for any wakeup event on DM and DP lines
+- qcom,select-utmi-as-pipe-clk: if present, disable USB3 pipe_clk requirement.
+				Used when dwc3 operates without SSPHY and only
+				HS/FS/LS modes are supported.
 
 Required child node:
 A child node must exist to represent the core DWC3 IP block. The name of
 the node is not important. The content of the node is defined in dwc3.txt.
 
 Phy documentation is provided in the following places:
-Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt
+Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt   - USB3 QMP PHY
+Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt - USB2 QUSB2 PHY
 
 Example device nodes:
 
 		hs_phy: phy@100f8800 {
-			compatible = "qcom,dwc3-hs-usb-phy";
-			reg = <0x100f8800 0x30>;
-			clocks = <&gcc USB30_0_UTMI_CLK>;
-			clock-names = "ref";
-			#phy-cells = <0>;
-
+			compatible = "qcom,qusb2-v2-phy";
+			...
 		};
 
 		ss_phy: phy@100f8830 {
-			compatible = "qcom,dwc3-ss-usb-phy";
-			reg = <0x100f8830 0x30>;
-			clocks = <&gcc USB30_0_MASTER_CLK>;
-			clock-names = "ref";
-			#phy-cells = <0>;
-
+			compatible = "qcom,qmp-v3-usb3-phy";
+			...
 		};
 
-		usb3_0: usb30@0 {
+		usb3_0: usb30@a6f8800 {
 			compatible = "qcom,dwc3";
+			reg = <0xa6f8800 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			clocks = <&gcc USB30_0_MASTER_CLK>;
-			clock-names = "core";
-
 			ranges;
 
+			interrupts = <0 131 0>, <0 486 0>, <0 488 0>, <0 489 0>;
+			interrupt-names = "hs_phy_irq", "ss_phy_irq",
+				  "dm_hs_phy_irq", "dp_hs_phy_irq";
+
+			clocks = <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				<&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+				<&gcc GCC_USB30_PRIM_SLEEP_CLK>;
+			clock-names = "core", "mock_utmi", "sleep";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <133000000>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+			reset-names = "core_reset";
+			power-domains = <&gcc USB30_PRIM_GDSC>;
+			qcom,select-utmi-as-pipe-clk;
 
 			dwc3@10000000 {
 				compatible = "snps,dwc3";
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
