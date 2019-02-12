From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2] dt-bindings: hwmon: Add missing documentation for lm75
Date: Tue, 12 Feb 2019 17:08:08 +0530
Message-ID: <20190212113808.3040-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Add missing dt-binding documentation for lm75 hwmon sensor.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
-  Add all compatible nodes available in lm75.

 .../devicetree/bindings/hwmon/lm75.txt        | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lm75.txt

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.txt b/Documentation/devicetree/bindings/hwmon/lm75.txt
new file mode 100644
index 000000000000..12d8cf7cf592
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/lm75.txt
@@ -0,0 +1,37 @@
+*LM75 hwmon sensor.
+
+Required properties:
+- compatible: manufacturer and chip name, one of
+		"adi,adt75",
+		"dallas,ds1775",
+		"dallas,ds75",
+		"dallas,ds7505",
+		"gmt,g751",
+		"national,lm75",
+		"national,lm75a",
+		"national,lm75b",
+		"maxim,max6625",
+		"maxim,max6626",
+		"maxim,max31725",
+		"maxim,max31726",
+		"maxim,mcp980x",
+		"st,stds75",
+		"st,stlm75",
+		"microchip,tcn75",
+		"ti,tmp100",
+		"ti,tmp101",
+		"ti,tmp105",
+		"ti,tmp112",
+		"ti,tmp175",
+		"ti,tmp275",
+		"ti,tmp75",
+		"ti,tmp75c",
+
+- reg: I2C bus address of the device
+
+Example:
+
+sensor@48 {
+	compatible = "st,stlm75";
+	reg = <0x48>;
+};
-- 
2.18.0.321.gffc6fa0e3
