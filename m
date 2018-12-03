From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 17/34] dt-bindings: arm: Convert TI davinci board/soc bindings to json-schema
Date: Mon,  3 Dec 2018 15:32:06 -0600
Message-ID: <20181203213223.16986-18-robh@kernel.org>
References: <20181203213223.16986-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203213223.16986-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Convert TI Davinci SoC bindings to DT schema format using json-schema.

Cc: Sekhar Nori <nsekhar@ti.com>
Cc: Kevin Hilman <khilman@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/davinci.txt       | 25 ------------------
 .../bindings/arm/ti/ti,davinci.yaml           | 26 +++++++++++++++++++
 2 files changed, 26 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/davinci.txt
 create mode 100644 Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml

diff --git a/Documentation/devicetree/bindings/arm/davinci.txt b/Documentation/devicetree/bindings/arm/davinci.txt
deleted file mode 100644
index 715622c36260..000000000000
--- a/Documentation/devicetree/bindings/arm/davinci.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Texas Instruments DaVinci Platforms Device Tree Bindings
---------------------------------------------------------
-
-DA850/OMAP-L138/AM18x Evaluation Module (EVM) board
-Required root node properties:
-    - compatible = "ti,da850-evm", "ti,da850";
-
-DA850/OMAP-L138/AM18x L138/C6748 Development Kit (LCDK) board
-Required root node properties:
-    - compatible = "ti,da850-lcdk", "ti,da850";
-
-EnBW AM1808 based CMC board
-Required root node properties:
-    - compatible = "enbw,cmc", "ti,da850;
-
-LEGO MINDSTORMS EV3 (AM1808 based)
-Required root node properties:
-    - compatible = "lego,ev3", "ti,da850";
-
-Generic DaVinci Boards
-----------------------
-
-DA850/OMAP-L138/AM18x generic board
-Required root node properties:
-    - compatible = "ti,da850";
diff --git a/Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml b/Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml
new file mode 100644
index 000000000000..4326d2cfa15d
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/ti/davinci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DaVinci Platforms Device Tree Bindings
+
+maintainers:
+  - Sekhar Nori <nsekhar@ti.com>
+
+description:
+  DA850/OMAP-L138/AM18x based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    items:
+      - enum:
+          - ti,da850-evm    # DA850/OMAP-L138/AM18x Evaluation Module (EVM) board
+          - ti,da850-lcdk   # DA850/OMAP-L138/AM18x L138/C6748 Development Kit (LCDK) board
+          - enbw,cmc        # EnBW AM1808 based CMC board
+          - lego,ev3        # LEGO MINDSTORMS EV3 (AM1808 based)
+      - const: ti,da850
+...
-- 
2.19.1
