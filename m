From: Rob Herring <robh@kernel.org>
Subject: [PATCH 25/36] dt-bindings: arm: Convert Oxford Semi board/soc bindings to json-schema
Date: Fri,  5 Oct 2018 11:58:37 -0500
Message-ID: <20181005165848.3474-26-robh@kernel.org>
References: <20181005165848.3474-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181005165848.3474-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Cc: Grant Likely <glikely@secretlab.ca>, Kumar Gala <kumar.gala@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Tom Rini <trini@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Jonathan Cameron <jic23@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, linux-oxnas@groups.io
List-Id: devicetree@vger.kernel.org

Convert Oxford Semi SoC bindings to DT schema format using json-schema.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-oxnas@groups.io
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/oxnas.txt         | 14 -----------
 .../devicetree/bindings/arm/oxnas.yaml        | 25 +++++++++++++++++++
 2 files changed, 25 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/oxnas.txt
 create mode 100644 Documentation/devicetree/bindings/arm/oxnas.yaml

diff --git a/Documentation/devicetree/bindings/arm/oxnas.txt b/Documentation/devicetree/bindings/arm/oxnas.txt
deleted file mode 100644
index ac64e60f99f1..000000000000
--- a/Documentation/devicetree/bindings/arm/oxnas.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Oxford Semiconductor OXNAS SoCs Family device tree bindings
--------------------------------------------
-
-Boards with the OX810SE SoC shall have the following properties:
-  Required root node property:
-    compatible: "oxsemi,ox810se"
-
-Boards with the OX820 SoC shall have the following properties:
-  Required root node property:
-    compatible: "oxsemi,ox820"
-
-Board compatible values:
-  - "wd,mbwe" (OX810SE)
-  - "cloudengines,pogoplugv3" (OX820)
diff --git a/Documentation/devicetree/bindings/arm/oxnas.yaml b/Documentation/devicetree/bindings/arm/oxnas.yaml
new file mode 100644
index 000000000000..c847a5707417
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/oxnas.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: None
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/arm/oxnas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Oxford Semiconductor OXNAS SoCs Family device tree bindings
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+        - enum:
+            - wd,mbwe
+        - const: oxsemi,ox810se
+
+      - items:
+        - enum:
+            - cloudengines,pogoplugv3
+        - const: oxsemi,ox820
-- 
2.17.1
