From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: iio: light: Add binding for ADUX1020
Date: Mon,  7 Oct 2019 21:09:16 +0530
Message-ID: <20191007153917.13611-2-manivannan.sadhasivam@linaro.org>
References: <20191007153917.13611-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007153917.13611-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, robh+dt@kernel.org
Cc: alexandru.Ardelean@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add devicetree binding for Analog Devices ADUX1020 Photometric
sensor.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../bindings/iio/light/adux1020.yaml          | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/adux1020.yaml

diff --git a/Documentation/devicetree/bindings/iio/light/adux1020.yaml b/Documentation/devicetree/bindings/iio/light/adux1020.yaml
new file mode 100644
index 000000000000..69bd5c06319d
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/adux1020.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/light/adux1020.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADUX1020 Photometric sensor
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description: |
+  Photometric sensor over an i2c interface.
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ADUX1020.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,adux1020
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adux1020@64 {
+                compatible = "adi,adux1020";
+                reg = <0x64>;
+                interrupt-parent = <&msmgpio>;
+                interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
+...
-- 
2.17.1
