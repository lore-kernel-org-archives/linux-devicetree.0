From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v6 2/5] drm: bridge: add DT bindings for TI ths8135
Date: Mon, 12 Dec 2016 14:05:39 +0100
Message-ID: <1481547942-24775-3-git-send-email-bgolaszewski@baylibre.com>
References: <1481547942-24775-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481547942-24775-1-git-send-email-bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

THS8135 is a configurable video DAC. Add DT bindings for this chip.

Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
---
 .../bindings/display/bridge/ti,ths8135.txt         | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ths8135.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,ths8135.txt b/Documentation/devicetree/bindings/display/bridge/ti,ths8135.txt
new file mode 100644
index 0000000..87aff90
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,ths8135.txt
@@ -0,0 +1,52 @@
+THS8135 Video DAC
+-----------------
+
+This is the binding for Texas Instruments THS8135 Video DAC bridge.
+
+Required properties:
+
+- compatible: Must be "ti,ths8135"
+
+Required nodes:
+
+This device has two video ports. Their connections are modelled using the OF
+graph bindings specified in Documentation/devicetree/bindings/graph.txt.
+
+- Video port 0 for RGB input
+- Video port 1 for VGA output
+
+Example
+-------
+
+vga-bridge {
+	compatible = "ti,ths8135";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			vga_bridge_in: endpoint {
+				reg = <0>;
+				remote-endpoint = <&lcdc_out_vga>;
+			};
+		};
+
+		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			vga_bridge_out: endpoint {
+				reg = <0>;
+				remote-endpoint = <&vga_con_in>;
+			};
+		};
+	};
+};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
