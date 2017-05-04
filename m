From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3 1/2] [media] dt-bindings: Add bindings for video-multiplexer device
Date: Thu,  4 May 2017 15:38:56 +0200
Message-ID: <1493905137-27051-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add bindings documentation for the video multiplexer device.

Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Acked-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Acked-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
No changes since v2 [1].

This was previously sent as part of Steve's i.MX media series [2].

[1] https://patchwork.kernel.org/patch/9708235/
[2] https://patchwork.kernel.org/patch/9647951/
---
 .../devicetree/bindings/media/video-mux.txt        | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/video-mux.txt

diff --git a/Documentation/devicetree/bindings/media/video-mux.txt b/Documentation/devicetree/bindings/media/video-mux.txt
new file mode 100644
index 0000000000000..63b9dc913e456
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/video-mux.txt
@@ -0,0 +1,60 @@
+Video Multiplexer
+=================
+
+Video multiplexers allow to select between multiple input ports. Video received
+on the active input port is passed through to the output port. Muxes described
+by this binding are controlled by a multiplexer controller that is described by
+the bindings in Documentation/devicetree/bindings/mux/mux-controller.txt
+
+Required properties:
+- compatible : should be "video-mux"
+- mux-controls : mux controller node to use for operating the mux
+- #address-cells: should be <1>
+- #size-cells: should be <0>
+- port@*: at least three port nodes containing endpoints connecting to the
+  source and sink devices according to of_graph bindings. The last port is
+  the output port, all others are inputs.
+
+Optionally, #address-cells, #size-cells, and port nodes can be grouped under a
+ports node as described in Documentation/devicetree/bindings/graph.txt.
+
+Example:
+
+	mux: mux-controller {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+
+		mux-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+	};
+
+	video-mux {
+		compatible = "video-mux";
+		mux-controls = <&mux>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mux_in0: endpoint {
+				remote-endpoint = <&video_source0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			mux_in1: endpoint {
+				remote-endpoint = <&video_source1_out>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			mux_out: endpoint {
+				remote-endpoint = <&capture_interface_in>;
+			};
+		};
+	};
+};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
