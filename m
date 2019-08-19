From: "Ramuthevar,Vadivel MuruganX"
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: [PATCH v1 1/2] dt-bindings: phy: intel-emmc-phy: Add new compatible for LGM eMMC PHY
Date: Mon, 19 Aug 2019 11:44:15 +0800
Message-ID: <20190819034416.45192-1-vadivel.muruganx.ramuthevar@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: andriy.shevchenko@intel.com, cheol.yong.kim@intel.com, qi-ming.wu@intel.com, peter.harliman.liem@intel.com, vadivel.muruganx.ramuthevar@linux.intel.com
List-Id: devicetree@vger.kernel.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

Add a new compatible to use the host controller driver with the
eMMC PHY on Intel's Lightning Mountain SoC.

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
---
 .../bindings/phy/intel-lgm-emmc-phy.yaml           | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/intel-lgm-emmc-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/intel-lgm-emmc-phy.yaml b/Documentation/devicetree/bindings/phy/intel-lgm-emmc-phy.yaml
new file mode 100644
index 000000000000..52156ff091ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/intel-lgm-emmc-phy.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/intel-lgm-emmc-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel LGM e-MMC PHY Device Tree Bindings
+
+maintainers:
+  - Rob Herring <robh+dt@kernel.org>
+  - Mark Rutland <mark.rutland@arm.com>
+
+intel,syscon:
+   $ref: /schemas/types.yaml#definitions/phandle
+   description:
+    - |
+      e-MMC phy module connected through chiptop. Phandle to a node that can
+      contain the following properties
+        * reg, Access the e-MMC, get the base address from syscon.
+        * reset, reset the e-MMC module.
+
+properties:
+  "#phy-cells":
+    const: 0
+
+  compatible:
+    const: intel,lgm-emmc-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: e-MMC phy module clock
+
+  clock-names:
+    items:
+      - const: emmcclk
+
+  resets:
+    maxItems: 1
+
+required:
+  - "#phy-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    sysconf: chiptop@e0020000 {
+        compatible = "intel,chiptop-lgm", "syscon";
+        reg = <0xe0020000 0x100>;
+        #reset-cells = <1>;
+     };
+
+  - |
+    emmc_phy: emmc_phy {
+        compatible = "intel,lgm-emmc-phy";
+        intel,syscon = <&sysconf>;
+        clocks = <&emmc>;
+        clock-names = "emmcclk";
+        #phy-cells = <0>;
+    };
+
+...
-- 
2.11.0
