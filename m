From: Tomasz Duszynski <tduszyns@gmail.com>
Subject: [PATCH 1/2] dt-bindings: iio: light: bh1750: convert bindings to yaml
Date: Mon, 16 Sep 2019 21:00:23 +0200
Message-ID: <20190916190024.9955-2-tduszyns@gmail.com>
References: <20190916190024.9955-1-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190916190024.9955-1-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jic23@kernel.org, robh+dt@kernel.org, Tomasz Duszynski <tduszyns@gmail.com>
List-Id: devicetree@vger.kernel.org

Convert existing device tree bindings to yaml.

Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
---
 .../devicetree/bindings/iio/light/bh1750.txt  | 18 --------
 .../devicetree/bindings/iio/light/bh1750.yaml | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/light/bh1750.txt
 create mode 100644 Documentation/devicetree/bindings/iio/light/bh1750.yaml

diff --git a/Documentation/devicetree/bindings/iio/light/bh1750.txt b/Documentation/devicetree/bindings/iio/light/bh1750.txt
deleted file mode 100644
index 1e7685797d7a..000000000000
--- a/Documentation/devicetree/bindings/iio/light/bh1750.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-ROHM BH1750 - ALS, Ambient light sensor
-
-Required properties:
-
-- compatible: Must be one of:
-    "rohm,bh1710"
-    "rohm,bh1715"
-    "rohm,bh1721"
-    "rohm,bh1750"
-    "rohm,bh1751"
-- reg: the I2C address of the sensor
-
-Example:
-
-light-sensor@23 {
-	compatible = "rohm,bh1750";
-	reg = <0x23>;
-};
diff --git a/Documentation/devicetree/bindings/iio/light/bh1750.yaml b/Documentation/devicetree/bindings/iio/light/bh1750.yaml
new file mode 100644
index 000000000000..1cc60d7ecfa0
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/bh1750.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/light/bh1750.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BH1750 ambient light sensor
+
+maintainers:
+  - Tomasz Duszynski <tduszyns@gmail.com>
+
+description: |
+  Ambient light sensor with an i2c interface.
+
+properties:
+  compatible:
+    enum:
+      - rohm,bh1710
+      - rohm,bh1715
+      - rohm,bh1721
+      - rohm,bh1750
+      - rohm,bh1751
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      light-sensor@23 {
+        compatible = "rohm,bh1750";
+        reg = <0x23>;
+      };
+    };
+
+...
-- 
2.23.0
