From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH v2 05/13] Documentation: dt-bindings: Add bindings for Synopsys DW MIPI DSI DRM bridge driver
Date: Sat, 31 Oct 2015 20:56:01 +0800
Message-ID: <1446296170-3702-6-git-send-email-zyw@rock-chips.com>
References: <1446296170-3702-1-git-send-email-zyw@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446296170-3702-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, linux-rockchip@lists.infradead.org
Cc: Liu Ying <Ying.liu@freescale.com>, Liu Ying <Ying.Liu@freescale.com>, Chris Zhong <zyw@rock-chips.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

From: Liu Ying <Ying.liu@freescale.com>

This patch adds device tree bindings for Synopsys DesignWare MIPI DSI
host controller DRM bridge driver.

Signed-off-by: Liu Ying <Ying.Liu@freescale.com>
Signed-off-by: Chris Zhong <zyw@rock-chips.com>
---

Changes in v2: None

 .../devicetree/bindings/drm/bridge/dw_mipi_dsi.txt | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/drm/bridge/dw_mipi_dsi.txt

diff --git a/Documentation/devicetree/bindings/drm/bridge/dw_mipi_dsi.txt b/Documentation/devicetree/bindings/drm/bridge/dw_mipi_dsi.txt
new file mode 100644
index 0000000..bb87466
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/bridge/dw_mipi_dsi.txt
@@ -0,0 +1,76 @@
+Device-Tree bindings for Synopsys DesignWare MIPI DSI host controller
+
+The controller is a digital core that implements all protocol functions
+defined in the MIPI DSI specification, providing an interface between
+the system and the MIPI DPHY, and allowing communication with a MIPI DSI
+compliant display.
+
+Required properties:
+ - #address-cells: Should be <1>.
+ - #size-cells: Should be <0>.
+ - compatible: The first compatible string should be "fsl,imx6q-mipi-dsi"
+   for i.MX6q/sdl SoCs.  For other SoCs, please refer to their specific
+   device tree binding documentations.  A common compatible string
+   "snps,dw-mipi-dsi" should be appended for all SoCs.
+ - reg: Represent the physical address range of the controller.
+ - interrupts: Represent the controller's interrupt to the CPU(s).
+ - clocks, clock-names: Phandles to the controller's pll reference
+   clock(ref), configuration clock(cfg) and APB clock(pclk), as
+   described in [1].
+
+For more required properties, please refer to relevant device tree binding
+documentations which describe the controller embedded in specific SoCs.
+
+Required sub-nodes:
+ - A node to represent a DSI peripheral as described in [2].
+
+For more required sub-nodes, please refer to relevant device tree binding
+documentations which describe the controller embedded in specific SoCs.
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+[2] Documentation/devicetree/bindings/mipi/dsi/mipi-dsi-bus.txt
+
+example:
+	gpr: iomuxc-gpr@020e0000 {
+		/* ... */
+	};
+
+	mipi_dsi: mipi@021e0000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "fsl,imx6q-mipi-dsi", "snps,dw-mipi-dsi";
+		reg = <0x021e0000 0x4000>;
+		interrupts = <0 102 IRQ_TYPE_LEVEL_HIGH>;
+		gpr = <&gpr>;
+		clocks = <&clks IMX6QDL_CLK_MIPI_CORE_CFG>,
+			 <&clks IMX6QDL_CLK_MIPI_CORE_CFG>,
+			 <&clks IMX6QDL_CLK_MIPI_IPG>;
+		clock-names = "ref", "cfg", "pclk";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				mipi_mux_0: endpoint {
+					remote-endpoint = <&ipu1_di0_mipi>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				mipi_mux_1: endpoint {
+					remote-endpoint = <&ipu1_di1_mipi>;
+				};
+			};
+		};
+
+		panel {
+			compatible = "truly,tft480800-16-e-dsi";
+			reg = <0>;
+			/* ... */
+		};
+	};
-- 
2.6.2
