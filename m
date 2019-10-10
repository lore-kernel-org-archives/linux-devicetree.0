From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v2 1/2] dt-bindings: ufs: ti,j721e-ufs.yaml: Add binding for TI UFS wrapper
Date: Thu, 10 Oct 2019 14:03:56 +0530
Message-ID: <20191010083357.28982-2-vigneshr@ti.com>
References: <20191010083357.28982-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191010083357.28982-1-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, jejb@linux.ibm.com, Martin K Petersen <martin.petersen@oracle.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, Janek Kotas <jank@cadence.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, nsekhar@ti.com
List-Id: devicetree@vger.kernel.org

Add binding documentation of TI wrapper for Cadence UFS Controller.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---

v2:
Define Cadence UFS controller as child node of the wrapper as suggested
by Rob H

 .../devicetree/bindings/ufs/ti,j721e-ufs.yaml | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml

diff --git a/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml b/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml
new file mode 100644
index 000000000000..c8a2a92074df
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ufs/ti,j721e-ufs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI J721e UFS Host Controller Glue Driver
+
+maintainers:
+  - Vignesh Raghavendra <vigneshr@ti.com>
+
+properties:
+  compatible:
+    items:
+      - const: ti,j721e-ufs
+
+  reg:
+    maxItems: 1
+    description: address of TI UFS glue registers
+
+  clocks:
+    maxItems: 1
+    description: phandle to the M-PHY clock
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+
+patternProperties:
+  "^ufs@[0-9a-f]+$":
+    type: object
+    description: |
+      Cadence UFS controller node must be the child node. Refer
+      Documentation/devicetree/bindings/ufs/cdns,ufshc.txt for binding
+      documentation of child node
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ufs_wrapper: ufs-wrapper@4e80000 {
+       compatible = "ti,j721e-ufs";
+       reg = <0x0 0x4e80000 0x0 0x100>;
+       power-domains = <&k3_pds 277>;
+       clocks = <&k3_clks 277 1>;
+       assigned-clocks = <&k3_clks 277 1>;
+       assigned-clock-parents = <&k3_clks 277 4>;
+       #address-cells = <2>;
+       #size-cells = <2>;
+
+       ufs@4e84000 {
+          compatible = "cdns,ufshc-m31-16nm", "jedec,ufs-2.0";
+          reg = <0x0 0x4e84000 0x0 0x10000>;
+          interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+          freq-table-hz = <19200000 19200000>;
+          power-domains = <&k3_pds 277>;
+          clocks = <&k3_clks 277 1>;
+          assigned-clocks = <&k3_clks 277 1>;
+          assigned-clock-parents = <&k3_clks 277 4>;
+          clock-names = "core_clk";
+       };
+    };
-- 
2.23.0
