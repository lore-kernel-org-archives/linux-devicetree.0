From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] dt-bindings: display: Convert sharp,ld-d5116z01b panel to DT schema
Date: Thu, 10 Oct 2019 14:06:54 -0700
Message-ID: <20191010210654.37426-1-jeffrey.l.hugo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-Id: devicetree@vger.kernel.org

Convert the sharp,ld-d5116z01b panel binding to DT schema.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 .../display/panel/sharp,ld-d5116z01b.txt      | 26 ----------------
 .../display/panel/sharp,ld-d5116z01b.yaml     | 30 +++++++++++++++++++
 2 files changed, 30 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt b/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt
deleted file mode 100644
index fd9cf39bde77..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Sharp LD-D5116Z01B 12.3" WUXGA+ eDP panel
-
-Required properties:
-- compatible: should be "sharp,ld-d5116z01b"
-- power-supply: regulator to provide the VCC supply voltage (3.3 volts)
-
-This binding is compatible with the simple-panel binding.
-
-The device node can contain one 'port' child node with one child
-'endpoint' node, according to the bindings defined in [1]. This
-node should describe panel's video bus.
-
-[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
-
-Example:
-
-	panel: panel {
-		compatible = "sharp,ld-d5116z01b";
-		power-supply = <&vlcd_3v3>;
-
-		port {
-			panel_ep: endpoint {
-				remote-endpoint = <&bridge_out_ep>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.yaml b/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.yaml
new file mode 100644
index 000000000000..fbb647eb33c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,ld-d5116z01b.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp LD-D5116Z01B 12.3" WUXGA+ eDP panel
+
+maintainers:
+  - Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,ld-d5116z01b
+
+  power-supply: true
+  backlight: true
+  port: true
+  no-hpd: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
-- 
2.17.1
