From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: tc358767: add DT documentation
Date: Fri,  1 Jul 2016 16:50:09 +0200
Message-ID: <1467384610-29908-2-git-send-email-p.zabel@pengutronix.de>
References: <1467384610-29908-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467384610-29908-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrey Gusakov <andrey.gusakov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Chris Healy <Chris.Healy-c8ZVq/bFV1I@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add DT binding documentation for the Toshiba TC358767 eDP bridge.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 .../bindings/display/bridge/toshiba,tc358767.txt   | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.txt b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.txt
new file mode 100644
index 0000000..c58a59f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.txt
@@ -0,0 +1,48 @@
+Toshiba TC358767 eDP bridge bindings
+
+Required properties:
+ - compatible: "toshiba,tc358767"
+ - reg: i2c address of the bridge, 0x68 or 0x0f, depending on bootstrap pins
+ - clock-names: should be "ref"
+ - clocks: OF device-tree clock specification for refclk input. The reference
+   clock rate must be 13 MHz, 19.2 MHz, 26 MHz, or 38.4 MHz.
+
+Optional properties:
+ - shutdown-gpios: OF device-tree gpio specification for SD pin
+                   (active high shutdown input)
+ - reset-gpios: OF device-tree gpio specification for RSTX pin
+                (active low system reset)
+ - ports: the ports node can contain video interface port nodes to connect
+   to a DPI/DSI source and to an eDP/DP sink according to [1][2].
+
+[1]: Documentation/devicetree/bindings/graph.txt
+[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+	edp-bridge@68 {
+		compatible = "toshiba,tc358767";
+		reg = <0x68>;
+		shutdown-gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio3 24 GPIO_ACTIVE_LOW>;
+		clock-names = "ref";
+		clocks = <&edp_refclk>;
+
+		ports {
+			port@0 {
+				reg = <0>;
+
+				bridge_in: endpoint {
+					remote-endpoint = <&dpi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				bridge_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+	};
+
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
