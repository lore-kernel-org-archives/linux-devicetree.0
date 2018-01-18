From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 2/2] dt-bindings: drm/bridge: Document Cadence DSI bridge bindings
Date: Thu, 18 Jan 2018 14:43:09 +0100
Message-ID: <20180118134309.13123-2-boris.brezillon@free-electrons.com>
References: <20180118134309.13123-1-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180118134309.13123-1-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Suresh Punnoose <sureshp-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, "Menon, Nishanth" <nm-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document the bindings used for the Cadence DSI bridge.

Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes in v5:
- Add optional reset line for the peripheral/APB logic

Changes in v4:
- Rename DSI clks (suggested by Tomi)
- Drop the IP version in the compatible since it can be extracted from
  a register (suggested by Andrzej)

Changes in v3:
- Fix clock names in the example
- Document how to represent DSI devices that are controller through
  an external bus like I2C or SPI

Changes in v2:
- None
---
 .../bindings/display/bridge/cdns,dsi.txt           | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
new file mode 100644
index 000000000000..785141e302c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
@@ -0,0 +1,113 @@
+Cadence DSI bridge
+==================
+
+The Cadence DSI bridge is a DPI to DSI bridge supporting up to 4 DSI lanes.
+
+Required properties:
+- compatible: should be set to "cdns,dsi".
+- reg: physical base address and length of the controller's registers.
+- interrupts: interrupt line connected to the DSI bridge.
+- clocks: DSI bridge clocks.
+- clock-names: must contain "dsi_p_clk" and "dsi_sys_clk".
+- phys: phandle link to the MIPI D-PHY controller.
+- phy-names: must contain "dphy".
+- #address-cells: must be set to 1.
+- #size-cells: must be set to 0.
+
+Optional properties:
+- resets: DSI reset lines.
+- reset-names: can contain "dsi_p_rst".
+
+Required subnodes:
+- ports: Ports as described in Documentation/devicetree/bindings/graph.txt.
+  2 ports are available:
+  * port 0: this port is only needed if some of your DSI devices are
+	    controlled through  an external bus like I2C or SPI. Can have at
+	    most 4 endpoints. The endpoint number is directly encoding the
+	    DSI virtual channel used by this device.
+  * port 1: represents the DPI input.
+  Other ports will be added later to support the new kind of inputs.
+
+- one subnode per DSI device connected on the DSI bus. Each DSI device should
+  contain a reg property encoding its virtual channel.
+
+Example:
+
+	dsi0: dsi@fd0c0000 {
+		compatible = "cdns,dsi-1.3.1";
+		reg = <0x0 0xfd0c0000 0x0 0x1000>;
+		clocks = <&pclk>, <&sysclk>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		interrupts = <1>;
+		phys = <&dphy1>;
+		phy-names = "dphy";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+				dsi0_dpi_input: endpoint {
+					remote-endpoint = <&xxx_dpi_output>;
+				};
+			};
+		};
+
+		panel: dsi-dev@0 {
+			compatible = "<vendor,panel>";
+			reg = <0>;
+		};
+	};
+
+or
+
+	dsi0: dsi@fd0c0000 {
+		compatible = "cdns,dsi";
+		reg = <0x0 0xfd0c0000 0x0 0x1000>;
+		clocks = <&pclk>, <&sysclk>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		interrupts = <1>;
+		phys = <&dphy1>;
+		phy-names = "dphy";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dsi0_output: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&dsi_panel_input>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dsi0_dpi_input: endpoint {
+					remote-endpoint = <&xxx_dpi_output>;
+				};
+			};
+		};
+	};
+
+	i2c@xxx {
+		panel: panel@59 {
+			compatible = "<vendor,panel>";
+			reg = <0x59>;
+
+			port {
+				dsi_panel_input: endpoint {
+					remote-endpoint = <&dsi0_output>;
+				};
+			};
+		};
+	};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
