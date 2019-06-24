From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 14/15] dt-bindings: display: Convert mitsubishi,aa121td01 panel to DT schema
Date: Mon, 24 Jun 2019 15:56:48 -0600
Message-ID: <20190624215649.8939-15-robh@kernel.org>
References: <20190624215649.8939-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624215649.8939-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

Convert the mitsubishi,aa121td01 LVDS panel binding to DT schema.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../display/panel/mitsubishi,aa121td01.txt    | 47 -------------
 .../display/panel/mitsubishi,aa121td01.yaml   | 69 +++++++++++++++++++
 2 files changed, 69 insertions(+), 47 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.txt b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.txt
deleted file mode 100644
index d6e1097504fe..000000000000
--- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-Mitsubishi AA121TD01 LVDS Display Panel
-=======================================
-
-The AA121TD01 is a 12.1" WXGA TFT-LCD display panel.
-
-These DT bindings follow the LVDS panel bindings defined in panel-lvds.txt
-with the following device-specific properties.
-
-
-Required properties:
-
-- compatible: Shall contain "mitsubishi,aa121td01" and "panel-lvds", in that
-  order.
-- vcc-supply: Reference to the regulator powering the panel VCC pins.
-
-
-Example
--------
-
-panel {
-	compatible = "mitsubishi,aa121td01", "panel-lvds";
-	vcc-supply = <&vcc_3v3>;
-
-	width-mm = <261>;
-	height-mm = <163>;
-
-	data-mapping = "jeida-24";
-
-	panel-timing {
-		/* 1280x800 @60Hz */
-		clock-frequency = <71000000>;
-		hactive = <1280>;
-		vactive = <800>;
-		hsync-len = <70>;
-		hfront-porch = <20>;
-		hback-porch = <70>;
-		vsync-len = <5>;
-		vfront-porch = <3>;
-		vback-porch = <15>;
-	};
-
-	port {
-		panel_in: endpoint {
-			remote-endpoint = <&lvds_encoder>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
new file mode 100644
index 000000000000..68750d8f0aef
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/mitsubishi,aa121td01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mitsubishi AA121TD01 12.1" WXGA LVDS Display Panel
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+allOf:
+  - $ref: lvds.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: mitsubishi,aa121td01
+      - {} # panel-lvds, but not listed here to avoid false select
+
+  vcc-supply:
+    description: Reference to the regulator powering the panel VCC pins.
+
+  data-mapping:
+    const: jeida-24
+
+  width-mm:
+    const: 261
+
+  height-mm:
+    const: 163
+
+required:
+  - compatible
+  - vcc-supply
+
+examples:
+  - |+
+    panel {
+      compatible = "mitsubishi,aa121td01", "panel-lvds";
+      vcc-supply = <&vcc_3v3>;
+
+      width-mm = <261>;
+      height-mm = <163>;
+
+      data-mapping = "jeida-24";
+
+      panel-timing {
+        /* 1280x800 @60Hz */
+        clock-frequency = <71000000>;
+        hactive = <1280>;
+        vactive = <800>;
+        hsync-len = <70>;
+        hfront-porch = <20>;
+        hback-porch = <70>;
+        vsync-len = <5>;
+        vfront-porch = <3>;
+        vback-porch = <15>;
+      };
+
+      port {
+        panel_in: endpoint {
+          remote-endpoint = <&lvds_encoder>;
+        };
+      };
+    };
+
+...
-- 
2.20.1
