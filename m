Return-Path: <SRS0=VUGH=WS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:59989 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727401AbfHVHcU (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 22 Aug 2019 03:32:20 -0400
From: Dilip Kota <eswara.kota@linux.intel.com>
Subject: [PATCH 1/2] dt-bindings: reset: Add YAML schemas for the Intel Reset controller
Date: Thu, 22 Aug 2019 15:32:10 +0800
Message-Id: <c909a3a19a1c06ac3ed9e1c42da3193ff8e43b7a.1566454535.git.eswara.kota@linux.intel.com>
Sender: devicetree-owner@vger.kernel.org
To: p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: cheol.yong.kim@intel.com, chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com, Dilip Kota <eswara.kota@linux.intel.com>
List-ID: <devicetree@vger.kernel.org>

Add YAML schemas for the reset controller on Intel
Lightening Mountain (LGM) SoC.

Signed-off-by: Dilip Kota <eswara.kota@linux.intel.com>
---
 .../bindings/reset/intel,syscon-reset.yaml         | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/intel,syscon-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/intel,syscon-reset.yaml b/Documentation/devicetree/bindings/reset/intel,syscon-reset.yaml
new file mode 100644
index 000000000000..298c60085486
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/intel,syscon-reset.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/intel,syscon-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel Lightening Mountain SoC System Reset Controller
+
+maintainers:
+  - Dilip Kota <eswara.kota@linux.intel.com>
+
+properties:
+  compatible:
+    allOf:
+      - items:
+          - enum:
+              - intel,rcu-lgm
+              - syscon
+
+  reg:
+    description: Reset controller register base address and size
+
+  intel,global-reset:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Global reset register offset and bit offset.
+
+  "#reset-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - intel,global-reset
+  - "#reset-cells"
+
+examples:
+  - |
+    rcu0: reset-controller@00000000 {
+        compatible = "intel,rcu-lgm", "syscon";
+        reg = <0x000000 0x80000>;
+        intel,global-reset = <0x10 30>;
+        #reset-cells = <2>;
+    };
+
+    pcie_phy0: pciephy@... {
+        ...
+        /* address offset: 0x10, bit offset: 12 */
+        resets = <&rcu0 0x10 12>;
+        ...
+    };
-- 
2.11.0
