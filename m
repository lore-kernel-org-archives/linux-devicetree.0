From: Rob Herring <robh@kernel.org>
Subject: [PATCH v3 05/13] dt-bindings: display: Convert dlc,dlc0700yzg-1 panel to DT schema
Date: Fri,  5 Jul 2019 10:42:13 -0600
Message-ID: <20190705164221.4462-6-robh@kernel.org>
References: <20190705164221.4462-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705164221.4462-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Convert the dlc,dlc0700yzg-1 panel binding to DT schema.

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../display/panel/dlc,dlc0700yzg-1.txt        | 13 --------
 .../display/panel/dlc,dlc0700yzg-1.yaml       | 31 +++++++++++++++++++
 2 files changed, 31 insertions(+), 13 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.txt b/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.txt
deleted file mode 100644
index bf06bb025b08..000000000000
--- a/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.txt
+++ /dev/null
@@ -1,13 +0,0 @@
-DLC Display Co. DLC0700YZG-1 7.0" WSVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "dlc,dlc0700yzg-1"
-- power-supply: See simple-panel.txt
-
-Optional properties:
-- reset-gpios: See panel-common.txt
-- enable-gpios: See simple-panel.txt
-- backlight: See simple-panel.txt
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml b/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml
new file mode 100644
index 000000000000..287e2feb6533
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/dlc,dlc0700yzg-1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DLC Display Co. DLC0700YZG-1 7.0" WSVGA TFT LCD panel
+
+maintainers:
+  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: dlc,dlc0700yzg-1
+
+  reset-gpios: true
+  enable-gpios: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+
+...
-- 
2.20.1
