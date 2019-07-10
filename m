From: Tomasz Duszynski <tduszyns@gmail.com>
Subject: [PATCH 1/2] dt-bindings: iio: chemical: pms7003: convert bindings to yaml
Date: Wed, 10 Jul 2019 21:21:54 +0200
Message-ID: <20190710192155.11489-2-tduszyns@gmail.com>
References: <20190710192155.11489-1-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190710192155.11489-1-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jic23@kernel.org, robh+dt@kernel.org, Tomasz Duszynski <tduszyns@gmail.com>
List-Id: devicetree@vger.kernel.org

Convert existing device tree bindings to yaml.

Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
---
 .../iio/chemical/plantower,pms7003.txt        | 26 ----------
 .../iio/chemical/plantower,pms7003.yaml       | 51 +++++++++++++++++++
 2 files changed, 51 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.yaml

diff --git a/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt b/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
deleted file mode 100644
index c52ea2126eaa..000000000000
--- a/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-* Plantower PMS7003 particulate matter sensor
-
-Required properties:
-- compatible: must one of:
-   "plantower,pms1003"
-   "plantower,pms3003"
-   "plantower,pms5003"
-   "plantower,pms6003"
-   "plantower,pms7003"
-   "plantower,pmsa003"
-- vcc-supply: phandle to the regulator that provides power to the sensor
-
-Optional properties:
-- plantower,set-gpios: phandle to the GPIO connected to the SET line
-- reset-gpios: phandle to the GPIO connected to the RESET line
-
-Refer to serial/slave-device.txt for generic serial attached device bindings.
-
-Example:
-
-&uart0 {
-	air-pollution-sensor {
-		compatible = "plantower,pms7003";
-		vcc-supply = <&reg_vcc5v0>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.yaml b/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.yaml
new file mode 100644
index 000000000000..a551d3101f93
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/chemical/plantower,pms7003.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Plantower PMS7003 air pollution sensor
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
+      - plantower,pms1003
+      - plantower,pms3003
+      - plantower,pms5003
+      - plantower,pms6003
+      - plantower,pms7003
+      - plantower,pmsa003
+
+  vcc-supply:
+    description: regulator that provides power to the sensor
+    maxItems: 1
+
+  plantower,set-gpios:
+    description: GPIO connected to the SET line
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO connected to the RESET line
+    maxItems: 1
+
+required:
+  - compatible
+  - vcc-supply
+
+examples:
+  - |
+    serial {
+      air-pollution-sensor {
+        compatible = "plantower,pms7003";
+        vcc-supply = <&reg_vcc5v0>;
+      };
+    };
+
+...
-- 
2.22.0
