From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 27/34] dt-bindings: arm: Convert CSR SiRF board/soc bindings to json-schema
Date: Mon,  3 Dec 2018 15:32:16 -0600
Message-ID: <20181203213223.16986-28-robh@kernel.org>
References: <20181203213223.16986-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203213223.16986-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Mark Rutland <mark.rutland@arm.com>, Barry Song <baohua@kernel.org>
List-Id: devicetree@vger.kernel.org

Convert CSR SiRF SoC bindings to DT schema format using json-schema.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/sirf.txt          | 11 --------
 .../devicetree/bindings/arm/sirf.yaml         | 27 +++++++++++++++++++
 2 files changed, 27 insertions(+), 11 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/sirf.txt
 create mode 100644 Documentation/devicetree/bindings/arm/sirf.yaml

diff --git a/Documentation/devicetree/bindings/arm/sirf.txt b/Documentation/devicetree/bindings/arm/sirf.txt
deleted file mode 100644
index 7b28ee6fee91..000000000000
--- a/Documentation/devicetree/bindings/arm/sirf.txt
+++ /dev/null
@@ -1,11 +0,0 @@
-CSR SiRFprimaII and SiRFmarco device tree bindings.
-========================================
-
-Required root node properties:
-    - compatible:
-    - "sirf,atlas6-cb" : atlas6 "cb" evaluation board
-    - "sirf,atlas6" : atlas6 device based board
-    - "sirf,atlas7-cb" : atlas7 "cb" evaluation board
-    - "sirf,atlas7" : atlas7 device based board
-    - "sirf,prima2-cb" : prima2 "cb" evaluation board
-    - "sirf,prima2" : prima2 device based board
diff --git a/Documentation/devicetree/bindings/arm/sirf.yaml b/Documentation/devicetree/bindings/arm/sirf.yaml
new file mode 100644
index 000000000000..0b597032c923
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/sirf.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/sirf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CSR SiRFprimaII and SiRFmarco device tree bindings.
+
+maintainers:
+  - Binghua Duan <binghua.duan@csr.com>
+  - Barry Song <Baohua.Song@csr.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - const: sirf,atlas6-cb
+          - const: sirf,atlas6
+      - items:
+          - const: sirf,atlas7-cb
+          - const: sirf,atlas7
+      - items:
+          - const: sirf,prima2-cb
+          - const: sirf,prima2
+...
-- 
2.19.1
