From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 14/22] dt-bindings: display: dw-hdmi: Clean up DT bindings documentation
Date: Fri,  2 Dec 2016 01:43:29 +0200
Message-ID: <1480635817-1258-15-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Andy Yan <andy.yan@rock-chips.com>, Archit Taneja <architt@codeaurora.org>, Fabio Estevam <fabio.estevam@freescale.com>, Heiko Stuebner <heiko@sntech.de>, Jose Abreu <Jose.Abreu@synopsys.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mark Yao <mark.yao@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Russell King <rmk+kernel@arm.linux.org.uk>, Ulrich Hecht <ulrich.hecht@gmail.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Make it clear that the core bridge/dw_hdmi.txt document isn't a device
tree binding by itself but is meant to be referenced by platform device
tree bindings, and update the Rockchip and Freescale DWC HDMI TX
bindings to reference it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../devicetree/bindings/display/bridge/dw_hdmi.txt | 85 +++++++++-------------
 .../devicetree/bindings/display/imx/hdmi.txt       | 51 +++++++------
 .../bindings/display/rockchip/dw_hdmi-rockchip.txt | 43 +++++++----
 3 files changed, 91 insertions(+), 88 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt b/Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
index 5e9a84d6e5f1..33bf981fbe33 100644
--- a/Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
+++ b/Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
@@ -1,52 +1,33 @@
-DesignWare HDMI bridge bindings
-
-Required properties:
-- compatible: platform specific such as:
-   * "snps,dw-hdmi-tx"
-   * "fsl,imx6q-hdmi"
-   * "fsl,imx6dl-hdmi"
-   * "rockchip,rk3288-dw-hdmi"
-- reg: Physical base address and length of the controller's registers.
-- interrupts: The HDMI interrupt number
-- clocks, clock-names : must have the phandles to the HDMI iahb and isfr clocks,
-  as described in Documentation/devicetree/bindings/clock/clock-bindings.txt,
-  the clocks are soc specific, the clock-names should be "iahb", "isfr"
--port@[X]: SoC specific port nodes with endpoint definitions as defined
-   in Documentation/devicetree/bindings/media/video-interfaces.txt,
-   please refer to the SoC specific binding document:
-    * Documentation/devicetree/bindings/display/imx/hdmi.txt
-    * Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
-
-Optional properties
-- reg-io-width: the width of the reg:1,4, default set to 1 if not present
-- ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing,
-  if the property is omitted, a functionally reduced I2C bus
-  controller on DW HDMI is probed
-- clocks, clock-names: phandle to the HDMI CEC clock, name should be "cec"
-
-Example:
-	hdmi: hdmi@0120000 {
-		compatible = "fsl,imx6q-hdmi";
-		reg = <0x00120000 0x9000>;
-		interrupts = <0 115 0x04>;
-		gpr = <&gpr>;
-		clocks = <&clks 123>, <&clks 124>;
-		clock-names = "iahb", "isfr";
-		ddc-i2c-bus = <&i2c2>;
-
-		port@0 {
-			reg = <0>;
-
-			hdmi_mux_0: endpoint {
-				remote-endpoint = <&ipu1_di0_hdmi>;
-			};
-		};
-
-		port@1 {
-			reg = <1>;
-
-			hdmi_mux_1: endpoint {
-				remote-endpoint = <&ipu1_di1_hdmi>;
-			};
-		};
-	};
+Synopsys DesignWare HDMI TX Encoder
+===================================
+
+This document defines device tree properties for the Synopsys DesignWare HDMI
+TX Encoder (DWC HDMI TX). It doesn't constitue a device tree binding
+specification by itself but is meant to be referenced by platform-specific
+device tree bindings.
+
+When referenced from platform device tree bindings the properties defined in
+this document are defined as follows. The platform device tree bindings are
+responsible for defining whether each property is required or optional.
+
+- reg: Memory mapped base address and length of the DWC HDMI TX registers.
+
+- reg-io-width: Width of the registers specified by the reg property. The
+  value is expressed in bytes and must be equal to 1 or 4 if specified. The
+  register width defaults to 1 if the property is not present.
+
+- interrupts: Reference to the DWC HDMI TX interrupt.
+
+- clocks: References to all the clocks specified in the clock-names property
+  as specified in Documentation/devicetree/bindings/clock/clock-bindings.txt.
+
+- clock-names: The DWC HDMI TX uses the following clocks.
+
+  - "iahb" is the bus clock for either AHB and APB (mandatory).
+  - "isfr" is the internal register configuration clock (mandatory).
+  - "cec" is the HDMI CEC controller main clock (optional).
+
+- ports: The connectivity of the DWC HDMI TX with the rest of the system is
+  expressed in using ports as specified in the device graph bindings defined
+  in Documentation/devicetree/bindings/graph.txt. The numbering of the ports
+  is platform-specific.
diff --git a/Documentation/devicetree/bindings/display/imx/hdmi.txt b/Documentation/devicetree/bindings/display/imx/hdmi.txt
index 1b756cf9afb0..66a8f86e5d12 100644
--- a/Documentation/devicetree/bindings/display/imx/hdmi.txt
+++ b/Documentation/devicetree/bindings/display/imx/hdmi.txt
@@ -1,29 +1,36 @@
-Device-Tree bindings for HDMI Transmitter
+Freescale i.MX6 DWC HDMI TX Encoder
+===================================
 
-HDMI Transmitter
-================
+The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
+with a companion PHY IP.
+
+These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
+Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt with the
+following device-specific properties.
 
-The HDMI Transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
-with accompanying PHY IP.
 
 Required properties:
- - #address-cells : should be <1>
- - #size-cells : should be <0>
- - compatible : should be "fsl,imx6q-hdmi" or "fsl,imx6dl-hdmi".
- - gpr : should be <&gpr>.
-   The phandle points to the iomuxc-gpr region containing the HDMI
-   multiplexer control register.
- - clocks, clock-names : phandles to the HDMI iahb and isrf clocks, as described
-   in Documentation/devicetree/bindings/clock/clock-bindings.txt and
-   Documentation/devicetree/bindings/clock/imx6q-clock.txt.
- - port@[0-4]: Up to four port nodes with endpoint definitions as defined in
-   Documentation/devicetree/bindings/media/video-interfaces.txt,
-   corresponding to the four inputs to the HDMI multiplexer.
-
-Optional properties:
- - ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
-
-example:
+
+- compatible : Shall be one of "fsl,imx6q-hdmi" or "fsl,imx6dl-hdmi".
+- reg: See dw_hdmi.txt.
+- interrupts: HDMI interrupt number
+- clocks: See dw_hdmi.txt.
+- clock-names: Shall contain "iahb" and "isfr" as defined in dw_hdmi.txt.
+- ports: See dw_hdmi.txt. The DWC HDMI shall have between one and four ports,
+  numbered 0 to 3, corresponding to the four inputs of the HDMI multiplexer.
+  Each port shall have a single endpoint.
+- gpr : Shall contain a phandle to the iomuxc-gpr region containing the HDMI
+  multiplexer control register.
+
+Optional properties
+
+- ddc-i2c-bus: The HDMI DDC bus can be connected to either a system I2C master
+  or the functionally-reduced I2C master contained in the DWC HDMI. When
+  connected to a system I2C master this property contains a phandle to that
+  I2C master controller.
+
+
+Example:
 
 	gpr: iomuxc-gpr@020e0000 {
 		/* ... */
diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
index 668091f27674..046076c6b277 100644
--- a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
+++ b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
@@ -1,24 +1,39 @@
-Rockchip specific extensions to the Synopsys Designware HDMI
-================================
+Rockchip DWC HDMI TX Encoder
+============================
+
+The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
+with a companion PHY IP.
+
+These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
+Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt with the
+following device-specific properties.
+
 
 Required properties:
-- compatible: "rockchip,rk3288-dw-hdmi";
-- reg: Physical base address and length of the controller's registers.
-- clocks: phandle to hdmi iahb and isfr clocks.
-- clock-names: should be "iahb" "isfr"
-- rockchip,grf: this soc should set GRF regs to mux vopl/vopb.
+
+- compatible: Shall contain "rockchip,rk3288-dw-hdmi".
+- reg: See dw_hdmi.txt.
+- reg-io-width: See dw_hdmi.txt. Shall be 4.
 - interrupts: HDMI interrupt number
-- ports: contain a port node with endpoint definitions as defined in
-  Documentation/devicetree/bindings/media/video-interfaces.txt. For
-  vopb,set the reg = <0> and set the reg = <1> for vopl.
-- reg-io-width: the width of the reg:1,4, the value should be 4 on
-  rk3288 platform
+- clocks: See dw_hdmi.txt.
+- clock-names: Shall contain "iahb" and "isfr" as defined in dw_hdmi.txt.
+- ports: See dw_hdmi.txt. The DWC HDMI shall have a single port numbered 0
+  corresponding to the video input of the controller. The port shall have two
+  endpoints, numbered 0 and 1, connected respectively to the vopb and vopl.
+- rockchip,grf: Shall reference the GRF to mux vopl/vopb.
 
 Optional properties
-- ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
-- clocks, clock-names: phandle to the HDMI CEC clock, name should be "cec"
+
+- ddc-i2c-bus: The HDMI DDC bus can be connected to either a system I2C master
+  or the functionally-reduced I2C master contained in the DWC HDMI. When
+  connected to a system I2C master this property contains a phandle to that
+  I2C master controller.
+- clock-names: See dw_hdmi.txt. The "cec" clock is optional.
+- clock-names: May contain "cec" as defined in dw_hdmi.txt.
+
 
 Example:
+
 hdmi: hdmi@ff980000 {
 	compatible = "rockchip,rk3288-dw-hdmi";
 	reg = <0xff980000 0x20000>;
-- 
Regards,

Laurent Pinchart
