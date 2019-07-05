From: Rob Herring <robh@kernel.org>
Subject: [PATCH v3 06/13] dt-bindings: display: Convert pda,91-00156-a0 panel to DT schema
Date: Fri,  5 Jul 2019 10:42:14 -0600
Message-ID: <20190705164221.4462-7-robh@kernel.org>
References: <20190705164221.4462-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705164221.4462-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

Convert the pda,91-00156-a0 panel binding to DT schema.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../display/panel/pda,91-00156-a0.txt         | 14 ---------
 .../display/panel/pda,91-00156-a0.yaml        | 31 +++++++++++++++++++
 2 files changed, 31 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.txt b/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.txt
deleted file mode 100644
index 1639fb17a9f0..000000000000
--- a/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-PDA 91-00156-A0 5.0" WVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "pda,91-00156-a0"
-- power-supply: this panel requires a single power supply. A phandle to a
-regulator needs to be specified here. Compatible with panel-common binding which
-is specified in the panel-common.txt in this directory.
-- backlight: this panel's backlight is controlled by an external backlight
-controller. A phandle to this controller needs to be specified here.
-Compatible with panel-common binding which is specified in the panel-common.txt
-in this directory.
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.yaml b/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.yaml
new file mode 100644
index 000000000000..ccd3623b4955
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/pda,91-00156-a0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PDA 91-00156-A0 5.0" WVGA TFT LCD panel
+
+maintainers:
+  - Cristian Birsan <cristian.birsan@microchip.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: pda,91-00156-a0
+
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+  - backlight
+
+...
-- 
2.20.1
