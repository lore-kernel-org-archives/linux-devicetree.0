From: Ben Whitten <ben.whitten@gmail.com>
Subject: [PATCH lora-next 1/4] dt-bindings: lora: sx130x: add basic documentation
Date: Tue,  8 Jan 2019 17:41:29 +0900
Message-ID: <20190108084132.10214-1-ben.whitten@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-lpwan@lists.infradead.org, afaerber@suse.de
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Ben Whitten <ben.whitten@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add basic documentation in YAML format for the sx130x series concentrators
from Semtech.
Required is; the location on the SPI bus, the reset gpio and the node for
downstream IQ radios, typically sx125x.

Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
---
 .../bindings/lora/semtech,sx130x.yaml         | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/lora/semtech,sx130x.yaml

diff --git a/Documentation/devicetree/bindings/lora/semtech,sx130x.yaml b/Documentation/devicetree/bindings/lora/semtech,sx130x.yaml
new file mode 100644
index 000000000000..ad263bc4e60d
--- /dev/null
+++ b/Documentation/devicetree/bindings/lora/semtech,sx130x.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/lora/semtech,sx130x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Semtech LoRa concentrator
+
+maintainers:
+  - Andreas Färber <afaerber@suse.de>
+  - Ben Whitten <ben.whitten@gmail.com>
+
+description: |
+  Semtech LoRa concentrator sx130x digital baseband chip is capable of
+  demodulating LoRa signals on 8 channels simultaneously.
+
+  It is typically paired with two sx125x IQ radios controlled over an
+  SPI directly from the concentrator.
+
+  The concentrator itself it controlled over SPI.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - semtech,sx1301
+        - semtech,sx1308
+
+  reg:
+    maxItems: 1
+    description: The chip select on the SPI bus.
+
+  reset-gpios:
+    maxItems: 1
+    description: A connection of the reset gpio line.
+
+  spi-max-frequency:
+    maximum: 10000000
+    default: 8000000
+    description: The frequency of the SPI communication to the concentrator,
+      in Hz. Maximum SPI frequency is 10MHz although 8MHz is typically used
+      on a number of cards.
+
+  radio-spi:
+    description: The concentrator has two radios connected which are contained
+      within the following node.
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    required:
+      - '#address-cells'
+      - '#size-cells'
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - radio-spi
+
+examples:
+  - |
+    concentrator0: lora@0 {
+      compatible = "semtech,sx1301";
+      reg = <0>;
+      reset-gpios = <&pioB 27 GPIO_ACTIVE_HIGH>;
+      spi-max-frequency = <8000000>;
+
+      radio-spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        radio0: lora@0 {
+          compatible = "semtech,sx1257";
+          reg = <0>;
+        };
+
+        radio1: lora@1 {
+          compatible = "semtech,sx1257";
+          reg = <1>;
+        };
+      };
+    };
-- 
2.17.1
