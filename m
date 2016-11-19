From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 1/9] drm: bridge: Add LVDS encoder DT bindings
Date: Sat, 19 Nov 2016 05:48:14 +0200
Message-ID: <1479527302-7674-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1479527302-7674-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1479527302-7674-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The DT bindings support parallel to LVDS encoders that don't require any
configuration, similarly to the dumb VGA DAC DT bindings.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/bridge/lvds-transmitter.txt   | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
new file mode 100644
index 000000000000..fd39ad34c383
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
@@ -0,0 +1,64 @@
+Parallel to LVDS Encoder
+------------------------
+
+This binding supports the parallel to LVDS encoders that don't require any
+configuration.
+
+LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. Multiple
+incompatible data link layers have been used over time to transmit image data
+to LVDS panels. This binding targets devices compatible with the following
+specifications only.
+
+[JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999, February
+1999 (Version 1.0), Japan Electronic Industry Development Association (JEIDA)
+[LDI] "Open LVDS Display Interface", May 1999 (Version 0.95), National
+Semiconductor
+[VESA] "VESA Notebook Panel Standard", October 2007 (Version 1.0), Video
+Electronics Standards Association (VESA)
+
+Those devices have been marketed under the FPD-Link and FlatLink brand names
+among others.
+
+
+Required properties:
+
+- compatible: Must be "lvds-encoder"
+
+Required nodes:
+
+This device has two video ports. Their connections are modeled using the OF
+graph bindings specified in Documentation/devicetree/bindings/graph.txt.
+
+- Video port 0 for parallel input
+- Video port 1 for LVDS output
+
+
+Example
+-------
+
+lvds-encoder {
+	compatible = "lvds-encoder";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			lvds_enc_in: endpoint {
+				remote-endpoint = <&display_out_rgb>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			lvds_enc_out: endpoint {
+				remote-endpoint = <&lvds_panel_in>;
+			};
+		};
+	};
+};
-- 
Regards,

Laurent Pinchart
