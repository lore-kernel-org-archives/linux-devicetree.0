From: Andreas Brauchli <a.brauchli@elementarea.net>
Subject: [PATCH v3 3/3] iio: chemical: sgp30: add device tree support
Date: Thu, 13 Dec 2018 15:44:18 +0100
Message-ID: <20181213144418.24965-1-andreas.brauchli@sensirion.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Brauchli <andreas.brauchli@sensirion.com>
List-Id: devicetree@vger.kernel.org

Add device tree support for Sensirion SGP30/SGPC3 gas sensors.

Signed-off-by: Andreas Brauchli <andreas.brauchli@sensirion.com>
---
 .../bindings/iio/chemical/sensirion,sgp30.txt     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/sensirion,sgp30.txt

diff --git a/Documentation/devicetree/bindings/iio/chemical/sensirion,sgp30.txt b/Documentation/devicetree/bindings/iio/chemical/sensirion,sgp30.txt
new file mode 100644
index 000000000000..5844ed58173c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/chemical/sensirion,sgp30.txt
@@ -0,0 +1,15 @@
+* Sensirion SGP30/SGPC3 multi-pixel Gas Sensor
+
+Required properties:
+
+  - compatible: must be one of
+    "sensirion,sgp30"
+    "sensirion,sgpc3"
+  - reg: the I2C address of the sensor
+
+Example:
+
+gas@58 {
+	compatible = "sensirion,sgp30";
+	reg = <0x58>;
+};
-- 
2.17.1
