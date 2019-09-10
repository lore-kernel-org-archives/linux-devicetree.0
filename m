From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 1/3] dt-bindings: dma: Add documentation for DMA domains
Date: Tue, 10 Sep 2019 14:50:35 +0300
Message-ID: <20190910115037.23539-2-peter.ujfalusi@ti.com>
References: <20190910115037.23539-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190910115037.23539-1-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, robh+dt@kernel.org
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, dan.j.williams@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On systems where multiple DMA controllers available, non Slave (for example
memcpy operation) users can not be described in DT as there is no device
involved from the DMA controller's point of view, DMA binding is not usable.
However in these systems still a peripheral might need to be serviced by or
it is better to serviced by specific DMA controller.
When a memcpy is used to/from a memory mapped region for example a DMA in the
same domain can perform better.
For generic software modules doing mem 2 mem operations it also matter that
they will get a channel from a controller which is faster in DDR to DDR mode
rather then from the first controller happen to be loaded.

This property is inherited, so it may be specified in a device node or in any
of its parent nodes.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 .../devicetree/bindings/dma/dma-domain.yaml   | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/dma-domain.yaml

diff --git a/Documentation/devicetree/bindings/dma/dma-domain.yaml b/Documentation/devicetree/bindings/dma/dma-domain.yaml
new file mode 100644
index 000000000000..da59bb129c58
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/dma-domain.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/dma-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DMA Domain Controller Definition
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+allOf:
+  - $ref: "dma-controller.yaml#"
+
+description:
+  On systems where multiple DMA controllers available, none Slave (for example
+  memcpy operation) users can not be described in DT as there is no device
+  involved from the DMA controller's point of view, DMA binding is not usable.
+  However in these systems still a peripheral might need to be serviced by or
+  it is better to serviced by specific DMA controller.
+  When a memcpy is used to/from a memory mapped region for example a DMA in the
+  same domain can perform better.
+  For generic software modules doing mem 2 mem operations it also matter that
+  they will get a channel from a controller which is faster in DDR to DDR mode
+  rather then from the first controller happen to be loaded.
+
+  This property is inherited, so it may be specified in a device node or in any
+  of its parent nodes.
+
+properties:
+  $dma-domain-controller:
+    $ref: /schemas/types.yaml#definitions/phandle
+    description:
+      phande to the DMA controller node which should be used for the device or
+      domain.
+
+examples:
+  - |
+    / {
+        model = "Texas Instruments K3 AM654 SoC";
+        compatible = "ti,am654";
+        interrupt-parent = <&gic500>;
+        /* For modules without device, DDR to DDR is faster on main UDMAP */
+        dma-domain-controller = <&main_udmap>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ...
+    };
+
+    &cbass_main {
+        /* For modules within MAIN domain, use main UDMAP */
+        dma-domain-controller = <&main_udmap>;
+
+        cbass_main_navss: interconnect0 {
+            ...
+            main_udmap: dma-controller@31150000 {
+                compatible = "ti,am654-navss-main-udmap";
+                ...
+            };
+        };
+    };
+
+    &cbass_mcu {
+        /* For modules within MCU domain, use mcu UDMAP */
+        dma-domain-controller = <&mcu_udmap>;
+
+        cbass_mcu_navss: interconnect1 {
+            ...
+            mcu_udmap: dma-controller@285c0000 {
+                compatible = "ti,am654-navss-mcu-udmap";
+                ...
+            };
+        };
+
+        fss: fss@47000000 {
+            compatible = "simple-bus";
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            ospi0: spi@47040000 {
+                compatible = "ti,am654-ospi", "cdns,qspi-nor";
+                ...
+                /* memcpy channel will be request from mcu_udmap */
+            };
+        };
+    };
+...
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
