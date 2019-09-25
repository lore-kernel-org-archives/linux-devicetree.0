From: Adam Ford <aford173@gmail.com>
Subject: [PATCH V3 2/3] dt-bindings: Add Logic PD Type 28 display panel
Date: Wed, 25 Sep 2019 13:42:37 -0500
Message-ID: <20190925184239.22330-2-aford173@gmail.com>
References: <20190925184239.22330-1-aford173@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190925184239.22330-1-aford173@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: adam.ford@logicpd.com, Adam Ford <aford173@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds documentation of device tree bindings for the WVGA panel
Logic PD Type 28 display.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V3:  Correct build errors from 'make dt_binding_check'
V2:  Use YAML instead of TXT for binding

diff --git a/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml b/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
new file mode 100644
index 000000000000..74ba650ea7a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR X11)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/logicpd,type28.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Logic PD Type 28 4.3" WQVGA TFT LCD panel
+
+maintainers:
+  - Adam Ford <aford173@gmail.com>
+
+properties:
+  compatible:
+    const: logicpd,type28
+
+  power-supply:
+    description: Regulator to provide the supply voltage
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO pin to enable or disable the panel
+    maxItems: 1
+
+  backlight:
+    description: Backlight used by the panel
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+required:
+  - compatible
+
+additionalProperties: false
-- 
2.17.1
