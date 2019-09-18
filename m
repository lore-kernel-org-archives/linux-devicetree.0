From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 1/2] dt-bindings: ufs: ti,j721e-ufs.yaml: Add binding for TI UFS wrapper
Date: Wed, 18 Sep 2019 19:09:20 +0530
Message-ID: <20190918133921.25844-2-vigneshr@ti.com>
References: <20190918133921.25844-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190918133921.25844-1-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, jejb@linux.ibm.com, Martin K Petersen <martin.petersen@oracle.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, Janek Kotas <jank@cadence.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, nsekhar@ti.com
List-Id: devicetree@vger.kernel.org

Add binding documentation of TI wrapper for Cadence UFS Controller.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 .../devicetree/bindings/ufs/ti,j721e-ufs.yaml | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml

diff --git a/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml b/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml
new file mode 100644
index 000000000000..dabd7c795fbe
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml
@@ -0,0 +1,45 @@
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
+examples:
+  - |
+    ufs_wrapper: ufs-wrapper@4e80000 {
+       compatible = "ti,j721e-ufs";
+       reg = <0x0 0x4e80000 0x0 0x100>;
+       power-domains = <&k3_pds 277>;
+       clocks = <&k3_clks 277 1>;
+       assigned-clocks = <&k3_clks 277 1>;
+       assigned-clock-parents = <&k3_clks 277 4>;
+       #address-cells = <2>;
+       #size-cells = <2>;
+    };
-- 
2.23.0
