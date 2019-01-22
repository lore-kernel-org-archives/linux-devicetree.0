From: Ben Whitten <ben.whitten@gmail.com>
Subject: [PATCH v2 lora-next 2/4] dt-bindings: lora: sx125x: add basic documentation
Date: Tue, 22 Jan 2019 18:07:27 +0000
Message-ID: <20190122180729.1834-3-ben.whitten@lairdtech.com>
References: <20190122180729.1834-1-ben.whitten@lairdtech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190122180729.1834-1-ben.whitten@lairdtech.com>
Sender: netdev-owner@vger.kernel.org
To: afaerber@suse.de
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, linux-lpwan@lists.infradead.org, robh@kernel.org, Ben Whitten <ben.whitten@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Ben Whitten <ben.whitten@gmail.com>

The SX125x family are IQ radio transceivers from Semtech configured over
SPI, they are typically connected to an SX130x series concentrator however
may be connected to a host directly.

Required properties include the radio number of the host or concentrator
bus.

Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
---
v1 -> v2:
* Dropped spi-max-frequency binding
* Wording changes to commit and descriptions
* Added spi wrapper suggested by Rob H
* Dual licence
---
 .../bindings/net/lora/semtech,sx125x.yaml     | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml

diff --git a/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml b/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
new file mode 100644
index 000000000000..4a51a251d97f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/lora/semtech,sx125x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Semtech IQ modulator/de-modulator transeiver
+
+maintainers:
+  - Andreas Färber <afaerber@suse.de>
+  - Ben Whitten <ben.whitten@gmail.com>
+
+description: |
+  The SX125x family are transceivers capable of supporting multiple constant
+  and non-constant envelope modulation schemes.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - semtech,sx1255
+        - semtech,sx1257
+        - semtech,sx1258
+
+  reg:
+    maxItems: 1
+    description: The chip select on the SPI bus or radio number in concentrator
+      , with radio A = 0 and radio B = 1.
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      radio0: lora@0 {
+        compatible = "semtech,sx1257";
+        reg = <0>;
+      };
+    };
-- 
2.17.1
