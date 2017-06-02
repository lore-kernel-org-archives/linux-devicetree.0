From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 2/2] dt-bindings: drm/bridge: Document Cadence DSI bridge bindings
Date: Fri,  2 Jun 2017 14:04:56 +0200
Message-ID: <1496405096-18275-2-git-send-email-boris.brezillon@free-electrons.com>
References: <1496405096-18275-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496405096-18275-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Neil Webb <neilw-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Cyprian Wronka <cwronka-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document the bindings used for the Cadence DSI bridge.

Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../bindings/display/bridge/cdns,dsi.txt           | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
new file mode 100644
index 000000000000..770c5c5b1e93
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
@@ -0,0 +1,55 @@
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
+- clock-names: must contain "pclk" and "sysclk".
+- phys: phandle link to the MIPI D-PHY controller.
+- phy-names: must contain "dphy".
+- #address-cells: must be set to 1.
+- #size-cells: must be set to 0.
+
+Required subnodes:
+- ports: Ports as described in Documentation/devicetree/bindings/graph.txt.
+  Currently contains a single input port at address 0 representing the DPI
+  input. Other ports will be added later to support the SDI inputs.
+  Port 0 should be connected to a DPI encoder output.
+- one subnode per DSI device connected on the DSI bus. Each DSI device should
+  contain a reg property encoding its address on the bus.
+
+Example:
+
+	dsi0: dsi@fd0c0000 {
+		compatible = "cdns,dsi";
+		reg = <0x0 0xfd0c0000 0x0 0x1000>;
+		clocks = <&pclk>, <&sysclk>;
+		clock-names = "pclk", "hclk";
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
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
