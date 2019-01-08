From: Ben Whitten <ben.whitten@gmail.com>
Subject: [PATCH lora-next 2/4] dt-bindings: lora: sx125x: add basic documentation
Date: Tue,  8 Jan 2019 17:41:30 +0900
Message-ID: <20190108084132.10214-2-ben.whitten@gmail.com>
References: <20190108084132.10214-1-ben.whitten@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108084132.10214-1-ben.whitten@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-lpwan@lists.infradead.org, afaerber@suse.de
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Ben Whitten <ben.whitten@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

The sx125x family are IQ radio transceivers from Semtech configured over
SPI, they are typically connected to an sx130x series concentrator however
may be connected to a host directly.

Required properties include the radio number of the host or concentrator
bus.

Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
---
 .../bindings/lora/semtech,sx125x.yaml         | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/lora/semtech,sx125x.yaml

diff --git a/Documentation/devicetree/bindings/lora/semtech,sx125x.yaml b/Documentation/devicetree/bindings/lora/semtech,sx125x.yaml
new file mode 100644
index 000000000000..5eadec860b70
--- /dev/null
+++ b/Documentation/devicetree/bindings/lora/semtech,sx125x.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/lora/semtech,sx125x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Semtech IQ modulator/de-modulator transeiver
+
+maintainers:
+  - Andreas Färber <afaerber@suse.de>
+  - Ben Whitten <ben.whitten@gmail.com>
+
+description: |
+  The sx125x family are highly integrated RF front-end to digital I and Q
+  modulator/demodulator Multi-PHY mode transceiver capable of supporting
+  multiple constant and non-constant envelope modulation schemes.
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
+    description: The chip select on the SPI bus or radio number in concentrator.
+
+  spi-max-frequency:
+    maximum: 10000000
+    default: 8000000
+    description: The frequency of the SPI communication to the radio,
+      in Hz. Maximum SPI frequency is 10MHz.
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    radio0: lora@0 {
+      compatible = "semtech,sx1257";
+      reg = <0>;
+    };
-- 
2.17.1
