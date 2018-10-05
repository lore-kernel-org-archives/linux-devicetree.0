From: Rob Herring <robh@kernel.org>
Subject: [PATCH 17/36] dt-bindings: arm: Convert Altera board/soc bindings to json-schema
Date: Fri,  5 Oct 2018 11:58:29 -0500
Message-ID: <20181005165848.3474-18-robh@kernel.org>
References: <20181005165848.3474-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181005165848.3474-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Cc: Grant Likely <glikely@secretlab.ca>, Kumar Gala <kumar.gala@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Tom Rini <trini@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Jonathan Cameron <jic23@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Dinh Nguyen <dinguyen@kernel.org>
List-Id: devicetree@vger.kernel.org

Convert Altera SoC bindings to DT schema format using json-schema.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/altera.txt        | 14 -------------
 .../devicetree/bindings/arm/altera.yaml       | 20 +++++++++++++++++++
 2 files changed, 20 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/altera.txt
 create mode 100644 Documentation/devicetree/bindings/arm/altera.yaml

diff --git a/Documentation/devicetree/bindings/arm/altera.txt b/Documentation/devicetree/bindings/arm/altera.txt
deleted file mode 100644
index 558735aacca8..000000000000
--- a/Documentation/devicetree/bindings/arm/altera.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Altera's SoCFPGA platform device tree bindings
----------------------------------------------
-
-Boards with Cyclone 5 SoC:
-Required root node properties:
-compatible = "altr,socfpga-cyclone5", "altr,socfpga";
-
-Boards with Arria 5 SoC:
-Required root node properties:
-compatible = "altr,socfpga-arria5", "altr,socfpga";
-
-Boards with Arria 10 SoC:
-Required root node properties:
-compatible = "altr,socfpga-arria10", "altr,socfpga";
diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
new file mode 100644
index 000000000000..0fc6564badc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: None
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/arm/altera.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Altera's SoCFPGA platform device tree bindings
+
+maintainers:
+  - Dinh Nguyen <dinguyen@opensource.altera.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - altr,socfpga-cyclone5
+        - altr,socfpga-arria5
+        - altr,socfpga-arria10
+      - const: altr,socfpga
+...
-- 
2.17.1
