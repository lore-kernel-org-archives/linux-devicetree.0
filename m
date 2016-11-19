From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 4/4] [media] dt-bindings: add TI VPIF documentation
Date: Fri, 18 Nov 2016 16:32:08 -0800
Message-ID: <20161119003208.10550-4-khilman@baylibre.com>
References: <20161119003208.10550-1-khilman@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161119003208.10550-1-khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, =?UTF-8?q?Bartosz=20Go=C5=82aszewski?= <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/media/ti,vpif-capture.txt  | 65 ++++++++++++++++++++++
 .../devicetree/bindings/media/ti,vpif.txt          |  8 +++
 2 files changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/ti,vpif-capture.txt
 create mode 100644 Documentation/devicetree/bindings/media/ti,vpif.txt

diff --git a/Documentation/devicetree/bindings/media/ti,vpif-capture.txt b/Documentation/devicetree/bindings/media/ti,vpif-capture.txt
new file mode 100644
index 000000000000..eaaaa46d3a5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/ti,vpif-capture.txt
@@ -0,0 +1,65 @@
+Texas Instruments VPIF Capture
+------------------------------
+
+The TI Video Port InterFace (VPIF) capture component is the primary
+component for video capture on some TI DaVinci family SoCs.
+
+TI Document number reference: SPRUH82C
+
+Required properties:
+- compatible: must be "ti,vpif-capture"
+- reg: physical base address and length of the registers set for the device;
+- interrupts: should contain IRQ line for the VPIF
+
+VPIF capture has a 16-bit parallel bus input, supporting 2 8-bit
+channels or a single 16-bit channel.  It should contain at least one
+port child node with child 'endpoint' node. Please refer to the
+bindings defined in
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Example using 2 8-bit input channels, one of which is connected to an
+I2C-connected TVP5147 decoder:
+
+	vpif_capture: video-capture@0x00217000 {
+		compatible = "ti,vpif-capture";
+		reg = <0x00217000 0x1000>;
+		interrupts = <92>;
+
+		port {
+			vpif_ch0: endpoint@0 {
+				  reg = <0>;
+				  bus-width = <8>;
+				  remote-endpoint = <&composite>;
+			};
+
+			vpif_ch1: endpoint@1 {
+				  reg = <1>;
+				  bus-width = <8>;
+				  data-shift = <8>;
+			};
+		};
+	};
+
+[ ... ]
+
+&i2c0 {
+
+	tvp5147@5d {
+		compatible = "ti,tvp5147";
+		reg = <0x5d>;
+		status = "okay";
+
+		port {
+			composite: endpoint {
+				hsync-active = <1>;
+				vsync-active = <1>;
+				pclk-sample = <0>;
+
+				/* VPIF channel 0 (lower 8-bits) */
+				remote-endpoint = <&vpif_ch0>;
+				bus-width = <8>;
+			};
+		};
+	};
+
+};
diff --git a/Documentation/devicetree/bindings/media/ti,vpif.txt b/Documentation/devicetree/bindings/media/ti,vpif.txt
new file mode 100644
index 000000000000..0d5c16531c0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/ti,vpif.txt
@@ -0,0 +1,8 @@
+Texas Instruments VPIF
+----------------------
+
+The Video Port InterFace (VPIF) is the core component for video output
+and capture on TI Davinci family SoCs.
+
+- compatible: must be "ti,vpif"
+- reg: physical base address and length of the registers set for the device;
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
