From: Tomasz Duszynski <tduszyns@gmail.com>
Subject: [PATCH 1/2] dt-bindings: iio: chemical: sps30: convert bindings to yaml
Date: Thu, 20 Jun 2019 21:50:10 +0200
Message-ID: <20190620195011.30942-2-tduszyns@gmail.com>
References: <20190620195011.30942-1-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190620195011.30942-1-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jic23@kernel.org, robh+dt@kernel.org, Tomasz Duszynski <tduszyns@gmail.com>
List-Id: devicetree@vger.kernel.org

Convert existing device tree bindings to yaml.

Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
---
 .../bindings/iio/chemical/sensirion,sps30.txt | 12 ------
 .../iio/chemical/sensirion,sps30.yaml         | 39 +++++++++++++++++++
 2 files changed, 39 insertions(+), 12 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.txt
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.yaml

diff --git a/Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.txt b/Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.txt
deleted file mode 100644
index 6eee2709b5b6..000000000000
--- a/Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-* Sensirion SPS30 particulate matter sensor
-
-Required properties:
-- compatible: must be "sensirion,sps30"
-- reg: the I2C address of the sensor
-
-Example:
-
-sps30@69 {
-	compatible = "sensirion,sps30";
-	reg = <0x69>;
-};
diff --git a/Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.yaml b/Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.yaml
new file mode 100644
index 000000000000..50a50a0d7070
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/chemical/sensirion,sps30.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sensirion SPS30 particulate matter sensor
+
+maintainers:
+  - Tomasz Duszynski <tduszyns@gmail.com>
+
+description: |
+  Air pollution sensor capable of measuring mass concentration of dust
+  particles.
+
+properties:
+  compatible:
+    enum:
+      - sensirion,sps30
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
+      air-pollution-sensor@69 {
+        compatible = "sensirion,sps30";
+        reg = <0x69>;
+      };
+    };
+
+...
--
2.22.0
