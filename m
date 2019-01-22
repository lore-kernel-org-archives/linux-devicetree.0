From: Ben Whitten <ben.whitten@gmail.com>
Subject: [PATCH v2 lora-next 1/4] dt-bindings: lora: sx130x: add basic documentation
Date: Tue, 22 Jan 2019 18:07:26 +0000
Message-ID: <20190122180729.1834-2-ben.whitten@lairdtech.com>
References: <20190122180729.1834-1-ben.whitten@lairdtech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122180729.1834-1-ben.whitten@lairdtech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, linux-lpwan@lists.infradead.org, robh@kernel.org, Ben Whitten <ben.whitten@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Ben Whitten <ben.whitten@gmail.com>

Add basic documentation in YAML format for the SX130x series concentrators
from Semtech.
Required is; the location on the SPI bus and the compatible string.

Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
---
v1 -> v2:
* Dropped reset-gpios, radio-spi from required.
* Dropped spi-max-frequency from binding.
* Changed compatible to allow fallback from SX1308 to SX1301.
* Wording changes in commit and descriptions.
* Dual licence
* Incorperate Robs comments on child node and spi wrapper
---
 .../bindings/net/lora/semtech,sx130x.yaml     | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml

diff --git a/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml b/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
new file mode 100644
index 000000000000..41919fb67ec4
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/lora/semtech,sx130x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Semtech LoRa concentrator
+
+maintainers:
+  - Andreas Färber <afaerber@suse.de>
+  - Ben Whitten <ben.whitten@gmail.com>
+
+description: |
+  Semtech LoRa concentrator SX130x digital baseband chip is capable of
+  demodulating LoRa signals on 8 channels simultaneously.
+
+  It is typically paired with two SX125x IQ radios controlled over an
+  SPI directly from the concentrator.
+
+  The concentrator itself is controlled over SPI.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - semtech,sx1308
+      - enum:
+        - semtech,sx1301
+
+  reg:
+    maxItems: 1
+    description: The chip select on the SPI bus.
+
+  reset-gpios:
+    maxItems: 1
+    description: A connection of the reset gpio line.
+
+  radio-spi:
+    type: object
+    description: The concentrator can have two radios connected which are
+      contained within the following node.
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^[a-zA-Z0-9]@[0-1]$":
+        properties:
+          reg:
+            maxItems: 1
+        required:
+          - reg
+
+    required:
+      - '#address-cells'
+      - '#size-cells'
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      concentrator0: lora@0 {
+        compatible = "semtech,sx1301";
+        reg = <0>;
+        reset-gpios = <&pioB 27 GPIO_ACTIVE_HIGH>;
+        spi-max-frequency = <8000000>;
+
+        radio-spi {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          radio0: lora@0 {
+            compatible = "semtech,sx1257";
+            reg = <0>;
+          };
+
+          radio1: lora@1 {
+            compatible = "semtech,sx1257";
+            reg = <1>;
+          };
+        };
+      };
+    };
-- 
2.17.1
