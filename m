From: Kun Yi <kunyi@google.com>
Subject: [PATCH v3 2/2] dt-bindings: hwmon: Add adm127x documentation
Date: Wed, 17 Oct 2018 15:27:09 -0700
Message-ID: <20181017222710.254994-1-kunyi@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: openbmc@lists.ozlabs.org, kunyi@google.com, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

adm127x are hot-swap controllers that allow a circuit board to be removed from
or inserted into a live backplane. This patch adds the device tree
bindings documentation.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 .../devicetree/bindings/hwmon/adm1275.txt     | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adm1275.txt

diff --git a/Documentation/devicetree/bindings/hwmon/adm1275.txt b/Documentation/devicetree/bindings/hwmon/adm1275.txt
new file mode 100644
index 000000000000..1ecd03f3da4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adm1275.txt
@@ -0,0 +1,25 @@
+adm1275 properties
+
+Required properties:
+- compatible: Must be one of the supported compatible strings:
+	- "adi,adm1075" for adm1075
+	- "adi,adm1272" for adm1272
+	- "adi,adm1275" for adm1275
+	- "adi,adm1276" for adm1276
+	- "adi,adm1278" for adm1278
+	- "adi,adm1293" for adm1293
+	- "adi,adm1294" for adm1294
+- reg: I2C address
+
+Optional properties:
+
+- shunt-resistor-micro-ohms
+	Shunt resistor value in micro-Ohm
+
+Example:
+
+adm1272@10 {
+	compatible = "adi,adm1272";
+	reg = <0x10>;
+	shunt-resistor-micro-ohms = <500>;
+};
-- 
2.19.1.331.ge82ca0e54c-goog
