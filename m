From: Peter Rosin <peda@lysator.liu.se>
Subject: [PATCH v2 1/3] dt-bindings: display: bridge: fork out ti,ds90c185 from lvds-transmitter
Date: Wed, 19 Dec 2018 14:04:47 +0100
Message-ID: <20181219130449.31641-2-peda@lysator.liu.se>
References: <20181219130449.31641-1-peda@lysator.liu.se>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181219130449.31641-1-peda@lysator.liu.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Peter Rosin <peda@axentia.se>

DS90C185 has a shutdown pin which does not fit in the lvds-transmitter
binding, which is meant to be generic.

The sister chip DS90C187 is similar to DS90C185, describe it here as well.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 .../bindings/display/bridge/lvds-transmitter.txt   |  8 +---
 .../bindings/display/bridge/ti,ds90c185.txt        | 55 ++++++++++++++++++++++
 2 files changed, 56 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
index 50220190c203..fd39ad34c383 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
@@ -22,13 +22,7 @@ among others.
 
 Required properties:
 
-- compatible: Must be one or more of the following
-  - "ti,ds90c185" for the TI DS90C185 FPD-Link Serializer
-  - "lvds-encoder" for a generic LVDS encoder device
-
-  When compatible with the generic version, nodes must list the
-  device-specific version corresponding to the device first
-  followed by the generic version.
+- compatible: Must be "lvds-encoder"
 
 Required nodes:
 
diff --git a/Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt b/Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt
new file mode 100644
index 000000000000..a13e778503e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt
@@ -0,0 +1,55 @@
+Texas Instruments FPD-Link (LVDS) Serializer
+--------------------------------------------
+
+The DS90C185 and DS90C187 are low-power serializers for portable
+battery-powered applications that reduces the size of the RGB
+interface between the host GPU and the display.
+
+Required properties:
+
+- compatible: Should be
+  "ti,ds90c185", "lvds-encoder"  for the TI DS90C185 FPD-Link Serializer
+  "ti,ds90c187", "lvds-encoder"  for the TI DS90C187 FPD-Link Serializer
+
+Optional properties:
+
+- pwdn-gpios: Power down control GPIO (the PDB pin, active-low)
+
+Required nodes:
+
+The devices have two video ports. Their connections are modeled using the OF
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
+	compatible = "ti,ds90c185", "lvds-encoder";
+
+	pwdn-gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			lvds_enc_in: endpoint {
+				remote-endpoint = <&lcdc_out_rgb>;
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
2.11.0
