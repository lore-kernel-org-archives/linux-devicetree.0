From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH] dt-bindings: hwmon: Add lm75 documentation
Date: Tue, 29 Jan 2019 12:26:23 +0530
Message-ID: <20190129065623.6771-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Add dt-binding documentation for lm75 hwmon sensor.

Currently documented for national,lm75 and st,stlm75 and
rest might add when required.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 Documentation/devicetree/bindings/hwmon/lm75.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lm75.txt

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.txt b/Documentation/devicetree/bindings/hwmon/lm75.txt
new file mode 100644
index 000000000000..e384a3765f10
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/lm75.txt
@@ -0,0 +1,15 @@
+*LM75 hwmon sensor.
+
+Required properties:
+- compatible: one of
+	"national,lm75"
+	"st,stlm75"
+
+- reg: I2C address
+
+Example:
+
+sensor@48 {
+	compatible = "st,stlm75";
+	reg = <0x48>;
+};
-- 
2.18.0.321.gffc6fa0e3
