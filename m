From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v8 1/2] dt-bindings: media: Add Cadence MIPI-CSI2 RX Device Tree bindings
Date: Thu, 15 Feb 2018 14:33:34 +0100
Message-ID: <20180215133335.9335-2-maxime.ripard@bootlin.com>
References: <20180215133335.9335-1-maxime.ripard@bootlin.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180215133335.9335-1-maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Steve Creaney <screaney-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Boris Brezillon <boris.brezillon-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, nm-l0cyMroinI0@public.gmane.org, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Cadence MIPI-CSI2 RX controller is a CSI2RX bridge that supports up to
4 CSI-2 lanes, and can route the frames to up to 4 streams, depending on
the hardware implementation.

It can operate with an external D-PHY, an internal one or no D-PHY at all
in some configurations.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
Acked-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Signed-off-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/media/cdns,csi2rx.txt      | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/cdns,csi2rx.txt

diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.txt b/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
new file mode 100644
index 000000000000..6b02a0657ad9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
@@ -0,0 +1,100 @@
+Cadence MIPI-CSI2 RX controller
+===============================
+
+The Cadence MIPI-CSI2 RX controller is a CSI-2 bridge supporting up to 4 CSI
+lanes in input, and 4 different pixel streams in output.
+
+Required properties:
+  - compatible: must be set to "cdns,csi2rx" and an SoC-specific compatible
+  - reg: base address and size of the memory mapped region
+  - clocks: phandles to the clocks driving the controller
+  - clock-names: must contain:
+    * sys_clk: main clock
+    * p_clk: register bank clock
+    * pixel_if[0-3]_clk: pixel stream output clock, one for each stream
+                         implemented in hardware, between 0 and 3
+
+Optional properties:
+  - phys: phandle to the external D-PHY, phy-names must be provided
+  - phy-names: must contain "dphy", if the implementation uses an
+               external D-PHY
+
+Required subnodes:
+  - ports: A ports node with one port child node per device input and output
+           port, in accordance with the video interface bindings defined in
+           Documentation/devicetree/bindings/media/video-interfaces.txt. The
+           port nodes are numbered as follows:
+
+           Port Description
+           -----------------------------
+           0    CSI-2 input
+           1    Stream 0 output
+           2    Stream 1 output
+           3    Stream 2 output
+           4    Stream 3 output
+
+           The stream output port nodes are optional if they are not
+           connected to anything at the hardware level or implemented
+           in the design.Since there is only one endpoint per port,
+           the endpoints are not numbered.
+
+
+Example:
+
+csi2rx: csi-bridge@0d060000 {
+	compatible = "cdns,csi2rx";
+	reg = <0x0d060000 0x1000>;
+	clocks = <&byteclock>, <&byteclock>
+		 <&coreclock>, <&coreclock>,
+		 <&coreclock>, <&coreclock>;
+	clock-names = "sys_clk", "p_clk",
+		      "pixel_if0_clk", "pixel_if1_clk",
+		      "pixel_if2_clk", "pixel_if3_clk";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csi2rx_in_sensor: endpoint {
+				remote-endpoint = <&sensor_out_csi2rx>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			csi2rx_out_grabber0: endpoint {
+				remote-endpoint = <&grabber0_in_csi2rx>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			csi2rx_out_grabber1: endpoint {
+				remote-endpoint = <&grabber1_in_csi2rx>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			csi2rx_out_grabber2: endpoint {
+				remote-endpoint = <&grabber2_in_csi2rx>;
+			};
+		};
+
+		port@4 {
+			reg = <4>;
+
+			csi2rx_out_grabber3: endpoint {
+				remote-endpoint = <&grabber3_in_csi2rx>;
+			};
+		};
+	};
+};
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
