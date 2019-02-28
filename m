From: Robert Yang <decatf@gmail.com>
Subject: [PATCH 2/3] dt-bindings: iio: accel: kxcjk1013: Add device tree binding documentation
Date: Thu, 28 Feb 2019 15:18:10 -0500
Message-ID: <20190228201811.7582-3-decatf@gmail.com>
References: <20190228201811.7582-1-decatf@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228201811.7582-1-decatf@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Yang <decatf@gmail.com>
List-Id: devicetree@vger.kernel.org

Document device tree bindings for Kionix KXCJK-1013 Accelerometer driver.

Signed-off-by: Robert Yang <decatf@gmail.com>
---
 .../bindings/iio/accel/kionix,kxcjk1013.txt    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/kionix,kxcjk1013.txt

diff --git a/Documentation/devicetree/bindings/iio/accel/kionix,kxcjk1013.txt b/Documentation/devicetree/bindings/iio/accel/kionix,kxcjk1013.txt
new file mode 100644
index 000000000000..521c53799bc5
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/accel/kionix,kxcjk1013.txt
@@ -0,0 +1,18 @@
+Kionix KXCJK-1013 Accelerometer device tree bindings
+
+Required properties:
+
+- compatible: Must be one of:
+    "kionix,kxcjk1013"
+    "kionix,kxcj91008"
+    "kionix,kxtj21009"
+    "kionix,kxtf9"
+    "kionix,SMO8500"
+ - reg: i2c slave address
+
+Example:
+
+kxtf9@f {
+	compatible = "kionix,kxtf9";
+	reg = <0x0F>;
+};
-- 
2.17.1
