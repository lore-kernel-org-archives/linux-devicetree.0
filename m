From: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
Subject: [PATCH 1/2] Documentation: dtb: lm87: Add hwmon binding documentation.
Date: Tue, 20 Sep 2016 16:55:38 +1200
Message-ID: <20160920045538.9548-1-mahoda.ratnayaka@alliedtelesis.co.nz>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Sender: linux-hwmon-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org
Cc: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

This patch adds lm87 hwmon device tree node documentation.

Signed-off-by: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
---
 Documentation/devicetree/bindings/hwmon/lm87.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lm87.txt

diff --git a/Documentation/devicetree/bindings/hwmon/lm87.txt b/Documentation/devicetree/bindings/hwmon/lm87.txt
new file mode 100644
index 0000000..fefcb48
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/lm87.txt
@@ -0,0 +1,14 @@
+*LM87 temprature sensor.
+
+Required properties:
+- compatible: Should be
+	"ti,lm87"
+
+- reg: I2C address
+
+Example:
+
+lm87@2e {
+	compatible = "ti,lm87";
+	reg = <0x2e>;
+};
-- 
2.9.3

