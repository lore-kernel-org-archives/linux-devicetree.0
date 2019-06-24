From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 12/15] dt-bindings: display: Convert innolux,ee101ia-01 panel to DT schema
Date: Mon, 24 Jun 2019 15:56:46 -0600
Message-ID: <20190624215649.8939-13-robh@kernel.org>
References: <20190624215649.8939-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624215649.8939-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

Convert the innolux,ee101ia-01 LVDS panel binding to DT schema.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../display/panel/innolux,ee101ia-01d.txt     |  7 ------
 .../display/panel/innolux,ee101ia-01d.yaml    | 22 +++++++++++++++++++
 2 files changed, 22 insertions(+), 7 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.txt b/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.txt
deleted file mode 100644
index e5ca4ccd55ed..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Innolux Corporation 10.1" EE101IA-01D WXGA (1280x800) LVDS panel
-
-Required properties:
-- compatible: should be "innolux,ee101ia-01d"
-
-This binding is compatible with the lvds-panel binding, which is specified
-in panel-lvds.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml b/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
new file mode 100644
index 000000000000..5cc97cbe17fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,ee101ia-01d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Innolux Corporation 10.1" EE101IA-01D WXGA (1280x800) LVDS panel
+
+maintainers:
+  - Heiko Stuebner <heiko.stuebner@bq.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+allOf:
+  - $ref: lvds.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: innolux,ee101ia-01d
+      - {} # panel-lvds, but not listed here to avoid false select
+
+...
-- 
2.20.1
