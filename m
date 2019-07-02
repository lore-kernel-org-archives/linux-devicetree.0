From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/4] dt-bindings: phy: add binding for the Lantiq VRX200 and ARX300 PCIe PHYs
Date: Tue,  2 Jul 2019 22:35:20 +0200
Message-ID: <20190702203523.2412-2-martin.blumenstingl@googlemail.com>
References: <20190702203523.2412-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190702203523.2412-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, john@phrozen.org, kishon@ti.com, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, hauke@hauke-m.de, paul.burton@mips.com, ralf@linux-mips.org, mark.rutland@arm.com, ms@dev.tdt.de, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Add the bindings for the PCIe PHY on Lantiq VRX200 and ARX300 SoCs.
The IP block contains settings for the PHY and a PLL.
The PLL mode is configurable through a dedicated #phy-cell in .dts.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../bindings/phy/lantiq,vrx200-pcie-phy.yaml  | 87 +++++++++++++++++++
 .../dt-bindings/phy/phy-lantiq-vrx200-pcie.h  | 11 +++
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
 create mode 100644 include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h

diff --git a/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
new file mode 100644
index 000000000000..b7b222e772d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/lantiq,vrx200-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq VRX200 and ARX300 PCIe PHY Device Tree Bindings
+
+maintainers:
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+properties:
+  "#phy-cells":
+    const: 1
+    description: selects the PHY mode as defined in <dt-bindings/phy/phy-lantiq-vrx200-pcie.h>
+
+  compatible:
+    enum:
+      - lantiq,vrx200-pcie-phy
+      - lantiq,arx300-pcie-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PHY module clock
+      - description: PDI register clock
+
+  clock-names:
+    items:
+      - const: phy
+      - const: pdi
+
+  resets:
+    items:
+      - description: exclusive PHY reset line
+      - description: shared reset line between the PCIe PHY and PCIe controller
+
+  resets-names:
+    items:
+      - const: phy
+      - const: pcie
+
+  lantiq,rcu:
+    maxItems: 1
+    description: phandle to the RCU syscon
+
+  lantiq,rcu-endian-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: the offset of the endian registers for this PHY instance in the RCU syscon
+
+  lantiq,rcu-big-endian-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: the mask to set the PDI (PHY) registers for this PHY instance to big endian
+
+required:
+  - "#phy-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - lantiq,rcu
+  - lantiq,rcu-endian-offset
+  - lantiq,rcu-big-endian-mask
+
+additionalProperties: false
+
+examples:
+  - |
+    pcie0_phy: phy@106800 {
+        compatible = "lantiq,vrx200-pcie-phy";
+        reg = <0x106800 0x100>;
+        lantiq,rcu = <&rcu0>;
+        lantiq,rcu-endian-offset = <0x4c>;
+        lantiq,rcu-big-endian-mask = <0x80>; /* bit 7 */
+        big-endian;
+        clocks = <&pmu PCIE_PHY>, <&pmu PCIE_PHY_PDI>;
+        clock-names = "phy", "pdi";
+        resets = <&reset0 12 24>, <&reset0 22 22>;
+        reset-names = "phy", "pcie";
+        #phy-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h b/include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h
new file mode 100644
index 000000000000..95a7896356d6
--- /dev/null
+++ b/include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2019 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+ */
+
+#define LANTIQ_PCIE_PHY_MODE_25MHZ		0
+#define LANTIQ_PCIE_PHY_MODE_25MHZ_SSC		1
+#define LANTIQ_PCIE_PHY_MODE_36MHZ		2
+#define LANTIQ_PCIE_PHY_MODE_36MHZ_SSC		3
+#define LANTIQ_PCIE_PHY_MODE_100MHZ		4
+#define LANTIQ_PCIE_PHY_MODE_100MHZ_SSC		5
-- 
2.22.0
