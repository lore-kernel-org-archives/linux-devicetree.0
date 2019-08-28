From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v3 2/8] dt-bindings: display: Add idk-2121wr binding
Date: Wed, 28 Aug 2019 19:36:36 +0100
Message-ID: <1567017402-5895-3-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>
List-Id: devicetree@vger.kernel.org

Add binding for the idk-2121wr LVDS panel from Advantech.

Some panel-specific documentation can be found here:
https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v2->v3:
* new patch
---
 .../display/panel/advantech,idk-2121wr.yaml        | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
new file mode 100644
index 0000000..b2ccdc8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/advantech,idk-2121wr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Advantech IDK-2121WR 21.5" Full-HD dual-LVDS panel
+
+maintainers:
+  - Fabrizio Castro <fabrizio.castro@bp.renesas.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+description: |
+  The IDK-2121WR from Advantech is a Full-HD dual-LVDS panel.
+
+  The panels expects odd pixels from the first port, and even pixels from
+  the second port, therefore the ports must be marked accordingly.
+
+allOf:
+  - $ref: lvds.yaml#
+  - $ref: ../bus-timings/lvds.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: advantech,idk-2121wr
+      - {} # panel-lvds, but not listed here to avoid false select
+
+  data-mapping:
+    const: vesa-24
+
+  width-mm:
+    const: 476
+
+  height-mm:
+    const: 268
+
+  panel-timing: true
+  ports: true
+
+additionalProperties: false
+
+required:
+  - compatible
+
+examples:
+  - |+
+    panel-lvds {
+      compatible = "advantech,idk-2121wr", "panel-lvds";
+
+      width-mm = <476>;
+      height-mm = <268>;
+
+      data-mapping = "vesa-24";
+
+      panel-timing {
+        clock-frequency = <148500000>;
+        hactive = <1920>;
+        vactive = <1080>;
+        hsync-len = <44>;
+        hfront-porch = <88>;
+        hback-porch = <148>;
+        vfront-porch = <4>;
+        vback-porch = <36>;
+        vsync-len = <5>;
+      };
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          dual-lvds-odd-pixels;
+          panel_in0: endpoint {
+            remote-endpoint = <&lvds0_out>;
+          };
+        };
+
+        port@1 {
+          reg = <1>;
+          dual-lvds-even-pixels;
+          panel_in1: endpoint {
+            remote-endpoint = <&lvds1_out>;
+          };
+        };
+      };
+    };
+
+...
-- 
2.7.4
