From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 34/34] dt-bindings: arm: Convert ZTE board/soc bindings to json-schema
Date: Mon,  3 Dec 2018 15:32:23 -0600
Message-ID: <20181203213223.16986-35-robh@kernel.org>
References: <20181203213223.16986-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203213223.16986-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Jun Nie <jun.nie@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

Convert ZTE SoC bindings to DT schema format using json-schema.

Cc: Jun Nie <jun.nie@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Acked-by: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/zte.txt | 14 ----------
 .../devicetree/bindings/arm/zte.yaml          | 26 +++++++++++++++++++
 2 files changed, 26 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/zte.txt
 create mode 100644 Documentation/devicetree/bindings/arm/zte.yaml

diff --git a/Documentation/devicetree/bindings/arm/zte.txt b/Documentation/devicetree/bindings/arm/zte.txt
deleted file mode 100644
index 340612794a37..000000000000
--- a/Documentation/devicetree/bindings/arm/zte.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-ZTE platforms device tree bindings
-
----------------------------------------
--  ZX296702 board:
-    Required root node properties:
-      - compatible = "zte,zx296702-ad1", "zte,zx296702"
-
----------------------------------------
--  ZX296718 SoC:
-    Required root node properties:
-      - compatible = "zte,zx296718"
-
-ZX296718 EVB board:
-      - "zte,zx296718-evb"
diff --git a/Documentation/devicetree/bindings/arm/zte.yaml b/Documentation/devicetree/bindings/arm/zte.yaml
new file mode 100644
index 000000000000..2d3fefdccdff
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/zte.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/zte.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE platforms device tree bindings
+
+maintainers:
+  - Jun Nie <jun.nie@linaro.org>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - zte,zx296702-ad1
+          - const: zte,zx296702
+      - items:
+          - enum:
+              - zte,zx296718-evb
+          - const: zte,zx296718
+
+...
-- 
2.19.1
