From: Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH 2/3] dt-bindings: iio: light: add stk33xx
Date: Wed,  3 Jul 2019 20:05:58 +0200
Message-ID: <20190703180604.9840-2-luca@z3ntu.xyz>
References: <20190703180604.9840-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703180604.9840-1-luca@z3ntu.xyz>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Luca Weiss <luca@z3ntu.xyz>, Maxime Ripard <maxime.ripard@bootlin.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Vivek Unune <npcomplete13@gmail.com>, Hannes Schmelzer <hannes.schmelzer@br-automation.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>, Martijn Braam <martijn@brixit.nl>, devicetree@vger.kernel.or
List-Id: devicetree@vger.kernel.org

Add binding documentation for the stk33xx family of ambient light
sensors.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 .../bindings/iio/light/stk33xx.yaml           | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/stk33xx.yaml

diff --git a/Documentation/devicetree/bindings/iio/light/stk33xx.yaml b/Documentation/devicetree/bindings/iio/light/stk33xx.yaml
new file mode 100644
index 000000000000..aae8a6d627c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/stk33xx.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/light/stk33xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: |
+  Sensortek STK33xx I2C Ambient Light and Proximity sensor
+
+maintainers:
+  - Jonathan Cameron <jic23@kernel.org>
+
+description: |
+  Ambient light and proximity sensor over an i2c interface.
+
+properties:
+  compatible:
+    enum:
+      - sensortek,stk3310
+      - sensortek,stk3311
+      - sensortek,stk3335
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
+        stk3310@48 {
+                compatible = "sensortek,stk3310";
+                reg = <0x48>;
+                interrupt-parent = <&gpio1>;
+                interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+        };
+    };
+...
-- 
2.22.0
