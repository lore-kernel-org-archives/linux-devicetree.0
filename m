From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 05/15] dt-bindings: display: Convert bananapi,s070wv20-ct16 panel to DT schema
Date: Mon, 24 Jun 2019 15:56:39 -0600
Message-ID: <20190624215649.8939-6-robh@kernel.org>
References: <20190624215649.8939-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624215649.8939-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

Convert the bananapi,s070wv20-ct16 panel binding to DT schema.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../display/panel/bananapi,s070wv20-ct16.txt  | 12 ----------
 .../display/panel/bananapi,s070wv20-ct16.yaml | 24 +++++++++++++++++++
 2 files changed, 24 insertions(+), 12 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt
deleted file mode 100644
index 35bc0c839f49..000000000000
--- a/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-Banana Pi 7" (S070WV20-CT16) TFT LCD Panel
-
-Required properties:
-- compatible: should be "bananapi,s070wv20-ct16"
-- power-supply: see ./panel-common.txt
-
-Optional properties:
-- enable-gpios: see ./simple-panel.txt
-- backlight: see ./simple-panel.txt
-
-This binding is compatible with the simple-panel binding, which is specified
-in ./simple-panel.txt.
diff --git a/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.yaml b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.yaml
new file mode 100644
index 000000000000..2c1d3bf2baa0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.yaml
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/bananapi,s070wv20-ct16.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Banana Pi 7" (S070WV20-CT16) TFT LCD Panel
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: bananapi,s070wv20-ct16
+
+required:
+  - compatible
+  - power-supply
+
+...
-- 
2.20.1
