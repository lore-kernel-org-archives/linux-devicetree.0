From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 10/15] dt-bindings: display: Convert tpo,tpg110 panel to DT schema
Date: Mon, 24 Jun 2019 15:56:44 -0600
Message-ID: <20190624215649.8939-11-robh@kernel.org>
References: <20190624215649.8939-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624215649.8939-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

Convert the tpo,tpg110 panel binding to DT schema.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/panel/tpo,tpg110.txt     |  70 ------------
 .../bindings/display/panel/tpo,tpg110.yaml    | 101 ++++++++++++++++++
 2 files changed, 101 insertions(+), 70 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tpo,tpg110.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/tpo,tpg110.txt b/Documentation/devicetree/bindings/display/panel/tpo,tpg110.txt
deleted file mode 100644
index 40f3d7c713bb..000000000000
--- a/Documentation/devicetree/bindings/display/panel/tpo,tpg110.txt
+++ /dev/null
@@ -1,70 +0,0 @@
-TPO TPG110 Panel
-================
-
-This panel driver is a component that acts as an intermediary
-between an RGB output and a variety of panels. The panel
-driver is strapped up in electronics to the desired resolution
-and other properties, and has a control interface over 3WIRE
-SPI. By talking to the TPG110 over SPI, the strapped properties
-can be discovered and the hardware is therefore mostly
-self-describing.
-
-       +--------+
-SPI -> |  TPO   | -> physical display
-RGB -> | TPG110 |
-       +--------+
-
-If some electrical strap or alternate resolution is desired,
-this can be set up by taking software control of the display
-over the SPI interface. The interface can also adjust
-for properties of the display such as gamma correction and
-certain electrical driving levels.
-
-The TPG110 does not know the physical dimensions of the panel
-connected, so this needs to be specified in the device tree.
-
-It requires a GPIO line for control of its reset line.
-
-The serial protocol has line names that resemble I2C but the
-protocol is not I2C but 3WIRE SPI.
-
-Required properties:
-- compatible : one of:
-  "ste,nomadik-nhk15-display", "tpo,tpg110"
-  "tpo,tpg110"
-- grestb-gpios : panel reset GPIO
-- width-mm : see display/panel/panel-common.txt
-- height-mm : see display/panel/panel-common.txt
-
-The device needs to be a child of an SPI bus, see
-spi/spi-bus.txt. The SPI child must set the following
-properties:
-- spi-3wire
-- spi-max-frequency = <3000000>;
-as these are characteristics of this device.
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in
-media/video-interfaces.txt. This node should describe panel's video bus.
-
-Example
--------
-
-panel: display@0 {
-	compatible = "tpo,tpg110";
-	reg = <0>;
-	spi-3wire;
-	/* 320 ns min period ~= 3 MHz */
-	spi-max-frequency = <3000000>;
-	/* Width and height from data sheet */
-	width-mm = <116>;
-	height-mm = <87>;
-	grestb-gpios = <&foo_gpio 5 GPIO_ACTIVE_LOW>;
-	backlight = <&bl>;
-
-	port {
-		nomadik_clcd_panel: endpoint {
-			remote-endpoint = <&foo>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml b/Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
new file mode 100644
index 000000000000..a51660b73f28
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/tpo,tpg110.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TPO TPG110 Panel
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+description: |+
+  This panel driver is a component that acts as an intermediary
+  between an RGB output and a variety of panels. The panel
+  driver is strapped up in electronics to the desired resolution
+  and other properties, and has a control interface over 3WIRE
+  SPI. By talking to the TPG110 over SPI, the strapped properties
+  can be discovered and the hardware is therefore mostly
+  self-describing.
+
+         +--------+
+  SPI -> |  TPO   | -> physical display
+  RGB -> | TPG110 |
+         +--------+
+
+  If some electrical strap or alternate resolution is desired,
+  this can be set up by taking software control of the display
+  over the SPI interface. The interface can also adjust
+  for properties of the display such as gamma correction and
+  certain electrical driving levels.
+
+  The TPG110 does not know the physical dimensions of the panel
+  connected, so this needs to be specified in the device tree.
+
+  It requires a GPIO line for control of its reset line.
+
+  The serial protocol has line names that resemble I2C but the
+  protocol is not I2C but 3WIRE SPI.
+
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - ste,nomadik-nhk15-display
+          - const: tpo,tpg110
+      - const: tpo,tpg110
+
+  reg: true
+
+  grestb-gpios:
+    maxItems: 1
+    description: panel reset GPIO
+
+  spi-3wire: true
+
+  spi-max-frequency:
+    const: 3000000
+
+required:
+  - compatible
+  - reg
+  - grestb-gpios
+  - width-mm
+  - height-mm
+  - spi-3wire
+  - spi-max-frequency
+  - port
+
+examples:
+  - |+
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      panel: display@0 {
+        compatible = "tpo,tpg110";
+        reg = <0>;
+        spi-3wire;
+        /* 320 ns min period ~= 3 MHz */
+        spi-max-frequency = <3000000>;
+        /* Width and height from data sheet */
+        width-mm = <116>;
+        height-mm = <87>;
+        grestb-gpios = <&foo_gpio 5 1>;
+        backlight = <&bl>;
+
+        port {
+          nomadik_clcd_panel: endpoint {
+            remote-endpoint = <&foo>;
+          };
+        };
+      };
+    };
+
+...
-- 
2.20.1
