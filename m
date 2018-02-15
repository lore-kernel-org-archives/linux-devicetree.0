From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 1/2] dt-bindings: media: Add Cadence MIPI-CSI2 TX Device Tree bindings
Date: Thu, 15 Feb 2018 14:31:56 +0100
Message-ID: <20180215133157.8043-2-maxime.ripard@bootlin.com>
References: <20180215133157.8043-1-maxime.ripard@bootlin.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180215133157.8043-1-maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Steve Creaney <screaney-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Boris Brezillon <boris.brezillon-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, nm-l0cyMroinI0@public.gmane.org, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Cadence MIPI-CSI2 TX controller is a CSI2 bridge that supports up to 4
video streams and can output on up to 4 CSI-2 lanes, depending on the
hardware implementation.

It can operate with an external D-PHY, an internal one or no D-PHY at all
in some configurations.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Signed-off-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/media/cdns,csi2tx.txt      | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/cdns,csi2tx.txt

diff --git a/Documentation/devicetree/bindings/media/cdns,csi2tx.txt b/Documentation/devicetree/bindings/media/cdns,csi2tx.txt
new file mode 100644
index 000000000000..459c6e332f52
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cdns,csi2tx.txt
@@ -0,0 +1,98 @@
+Cadence MIPI-CSI2 TX controller
+===============================
+
+The Cadence MIPI-CSI2 TX controller is a CSI-2 bridge supporting up to
+4 CSI lanes in output, and up to 4 different pixel streams in input.
+
+Required properties:
+  - compatible: must be set to "cdns,csi2tx"
+  - reg: base address and size of the memory mapped region
+  - clocks: phandles to the clocks driving the controller
+  - clock-names: must contain:
+    * esc_clk: escape mode clock
+    * p_clk: register bank clock
+    * pixel_if[0-3]_clk: pixel stream output clock, one for each stream
+                         implemented in hardware, between 0 and 3
+
+Optional properties
+  - phys: phandle to the D-PHY. If it is set, phy-names need to be set
+  - phy-names: must contain "dphy"
+
+Required subnodes:
+  - ports: A ports node with one port child node per device input and output
+           port, in accordance with the video interface bindings defined in
+           Documentation/devicetree/bindings/media/video-interfaces.txt. The
+           port nodes are numbered as follows.
+
+           Port Description
+           -----------------------------
+           0    CSI-2 output
+           1    Stream 0 input
+           2    Stream 1 input
+           3    Stream 2 input
+           4    Stream 3 input
+
+           The stream input port nodes are optional if they are not
+           connected to anything at the hardware level or implemented
+           in the design. Since there is only one endpoint per port,
+           the endpoints are not numbered.
+
+Example:
+
+csi2tx: csi-bridge@0d0e1000 {
+	compatible = "cdns,csi2tx";
+	reg = <0x0d0e1000 0x1000>;
+	clocks = <&byteclock>, <&byteclock>,
+		 <&coreclock>, <&coreclock>,
+		 <&coreclock>, <&coreclock>;
+	clock-names = "p_clk", "esc_clk",
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
+			csi2tx_out: endpoint {
+				remote-endpoint = <&remote_in>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			csi2tx_in_stream0: endpoint {
+				remote-endpoint = <&stream0_out>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			csi2tx_in_stream1: endpoint {
+				remote-endpoint = <&stream1_out>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			csi2tx_in_stream2: endpoint {
+				remote-endpoint = <&stream2_out>;
+			};
+		};
+
+		port@4 {
+			reg = <4>;
+
+			csi2tx_in_stream3: endpoint {
+				remote-endpoint = <&stream3_out>;
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
