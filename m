From: Dan Robertson <dan@dlrobertson.com>
Subject: [PATCH v3 1/2] dt-bindings: iio: accel: bma400: add bindings
Date: Sat, 12 Oct 2019 19:25:24 +0000
Message-ID: <20191012192525.21040-2-dan@dlrobertson.com>
References: <20191012192525.21040-1-dan@dlrobertson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191012192525.21040-1-dan@dlrobertson.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, devicetree@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Dan Robertson <dan@dlrobertson.com>
List-Id: devicetree@vger.kernel.org

Add devicetree binding for the Bosch BMA400 3-axes ultra-low power
accelerometer sensor.

Signed-off-by: Dan Robertson <dan@dlrobertson.com>
---
 .../devicetree/bindings/iio/accel/bma400.yaml | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/bma400.yaml

diff --git a/Documentation/devicetree/bindings/iio/accel/bma400.yaml b/Documentation/devicetree/bindings/iio/accel/bma400.yaml
new file mode 100644
index 000000000000..31dceac89ace
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/accel/bma400.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/accel/bma400.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bosch BMA400 triaxial acceleration sensor
+
+maintainers:
+  - Dan Robertson <dan@dlrobertson.com>
+
+description: |
+  Acceleration and temerature iio sensors with an i2c interface
+
+  Specifications about the sensor can be found at:
+    https://ae-bst.resource.bosch.com/media/_tech/media/datasheets/BST-BMA400-DS000.pdf
+
+properties:
+  compatible:
+    enum:
+      - bosch,bma400
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
+    i2c0 {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      bma400@14 {
+        compatible = "bosch,bma400";
+        reg = <0x14>;
+      };
+    };
-- 
2.23.0
