From: Sugaya Taichi <sugaya.taichi@socionext.com>
Subject: [PATCH v4 03/10] dt-bindings: Add documentation for Milbeaut SoCs
Date: Wed, 27 Feb 2019 13:52:25 +0900
Message-ID: <1551243145-10635-1-git-send-email-sugaya.taichi@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, soc@kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Sugaya Taichi <sugaya.taichi@socionext.com>
List-Id: devicetree@vger.kernel.org

This adds a DT binding documentation for the M10V and its evaluation
board.

Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
---
 .../bindings/arm/socionext/milbeaut.yaml           | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml

diff --git a/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml b/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml
new file mode 100644
index 0000000..aae53fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/milbeaut.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Milbeaut platforms device tree bindings
+
+maintainers:
+  - Taichi Sugaya <sugaya.taichi@socionext.com>
+  - Takao Orito <orito.takao@socionext.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - socionext,milbeaut-m10v-evb
+          - const: socionext,sc2000a
+...
-- 
1.9.1
