From: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [RFC PATCH v2 2/3] Documentation: dt-bindings: spi: add generic YAML SPI slave binding
Date: Mon, 21 Sep 2015 23:59:17 -0400
Message-ID: <1442894358-15606-3-git-send-email-mporter@konsulko.com>
References: <1442894358-15606-1-git-send-email-mporter@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442894358-15606-1-git-send-email-mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Convert the SPI slave portion of the spi-bus.txt binding to the
standard YAML DT binding format.

Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/spi/spi-slave.yaml         | 108 +++++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-slave.yaml

diff --git a/Documentation/devicetree/bindings/spi/spi-slave.yaml b/Documentation/devicetree/bindings/spi/spi-slave.yaml
new file mode 100644
index 0000000..8447bb9
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-slave.yaml
@@ -0,0 +1,108 @@
+%YAML 1.2
+---
+version: 1
+
+id: spi-slave
+
+title: SPI Slave Devices
+
+maintainer:
+    -   name: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
+
+description: >
+    SPI (Serial Peripheral Interface) slave bus devices are children of
+    of a SPI master bus device.
+properties:
+    -   name: "reg"
+        category: required
+        type: int
+        description: chip select address of device
+
+    -   name: "compatible"
+        category: required
+        type: string
+        description: compatible strings
+
+    -   name: "spi-max-frequency"
+        category: required
+        type: int
+        description: Maximum SPI clocking speed of device in Hz
+
+    -   name: "spi-cpol"
+        category: optional
+        type: empty
+        description: >
+            Empty property indicating device requires
+            inverse clock polarity (CPOL) mode
+
+    -   name: "spi-cpha"
+        category: optional
+        type: empty
+        description: >
+            Empty property indicating device requires
+            shifted clock phase (CPHA) mode
+
+    -   name: "spi-cs-high"
+        category: optional
+        type: empty
+        description: >
+            Empty property indicating device requires
+            chip select active high
+
+    -   name: "spi-3wire"
+        category: optional
+        type: empty
+        description: >
+            Empty property indicating device requires
+            3-wire mode.
+
+    -   name: "spi-lsb-first"
+        category: optional
+        type: empty
+        description: >
+            Empty property indicating device requires
+            LSB first mode.
+
+    -   name: "spi-tx-bus-width"
+        category: optional
+        type: int
+        constraint: 1 || 2 || 4
+        description: >
+            The bus width(number of data wires) that
+            used for MOSI. Defaults to 1 if not present.
+
+    -   name: "spi-rx-bus-width"
+        category: optional
+        type: int
+        constraint: 1 || 2 || 4
+        description: >
+            The bus width(number of data wires) that
+            used for MISO. Defaults to 1 if not present.
+
+notes: >
+    Some SPI controllers and devices support Dual and Quad SPI transfer mode.
+    It allows data in the SPI system to be transferred in 2 wires(DUAL) or
+    4 wires(QUAD).
+    Now the value that spi-tx-bus-width and spi-rx-bus-width can receive is
+    only 1(SINGLE), 2(DUAL) and 4(QUAD). Dual/Quad mode is not allowed when
+    3-wire mode is used.
+    If a gpio chipselect is used for the SPI slave the gpio number will be
+    passed via the SPI master node cs-gpios property.
+
+examples:
+    -   dts: |
+            spi@f00 {
+                ...
+                ethernet-switch@0 {
+                    compatible = "micrel,ks8995m";
+                    spi-max-frequency = <1000000>;
+                    reg = <0>;
+                };
+
+                codec@1 {
+                    compatible = "ti,tlv320aic26";
+                    spi-max-frequency = <100000>;
+                    reg = <1>;
+                };
+            };
+...
-- 
2.5.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
