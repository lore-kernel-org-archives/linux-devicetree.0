From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 09/15] dt-bindings: display: Convert tfc,s9700rtwv43tr-01b panel to DT schema
Date: Mon, 24 Jun 2019 15:56:43 -0600
Message-ID: <20190624215649.8939-10-robh@kernel.org>
References: <20190624215649.8939-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624215649.8939-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Heiko Stuebner <heiko.stuebner@bq.com>
List-Id: devicetree@vger.kernel.org

Convert the tfc,s9700rtwv43tr-01b panel binding to DT schema.

Cc: Heiko Stuebner <heiko.stuebner@bq.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../display/panel/tfc,s9700rtwv43tr-01b.txt   | 15 ----------
 .../display/panel/tfc,s9700rtwv43tr-01b.yaml  | 30 +++++++++++++++++++
 2 files changed, 30 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tfc,s9700rtwv43tr-01b.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/tfc,s9700rtwv43tr-01b.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/tfc,s9700rtwv43tr-01b.txt b/Documentation/devicetree/bindings/display/panel/tfc,s9700rtwv43tr-01b.txt
deleted file mode 100644
index dfb572f085eb..000000000000
--- a/Documentation/devicetree/bindings/display/panel/tfc,s9700rtwv43tr-01b.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-TFC S9700RTWV43TR-01B 7" Three Five Corp 800x480 LCD panel with
-resistive touch
-
-The panel is found on TI AM335x-evm.
-
-Required properties:
-- compatible: should be "tfc,s9700rtwv43tr-01b"
-- power-supply: See panel-common.txt
-
-Optional properties:
-- enable-gpios: GPIO pin to enable or disable the panel, if there is one
-- backlight: phandle of the backlight device attached to the panel
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/tfc,s9700rtwv43tr-01b.yaml b/Documentation/devicetree/bindings/display/panel/tfc,s9700rtwv43tr-01b.yaml
new file mode 100644
index 000000000000..614f4a8d8403
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tfc,s9700rtwv43tr-01b.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/tfc,s9700rtwv43tr-01b.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TFC S9700RTWV43TR-01B 7" Three Five Corp 800x480 LCD panel with resistive touch
+
+maintainers:
+  - Jyri Sarha <jsarha@ti.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+description: |+
+  The panel is found on TI AM335x-evm.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: tfc,s9700rtwv43tr-01b
+
+  enable-gpios: true
+  backlight: true
+
+required:
+  - compatible
+  - power-supply
+
+...
-- 
2.20.1
