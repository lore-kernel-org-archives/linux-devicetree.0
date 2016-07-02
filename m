From: Guenter Roeck <linux@roeck-us.net>
Subject: [RFC PATCH] dt/bindings: Add bindings for JC-42.4 compatible temperature sensors
Date: Sat,  2 Jul 2016 10:05:42 -0700
Message-ID: <1467479142-8249-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

Provide generic bindings for all Jedec JC-42.4 compatible temperature
sensor chips.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
RFC to address:
- Is "jc-42-4" ok to use for JC-42.4 ?
- JC42.4 really specifies an SPD EEPROM with included temperature sensor.
  Is "jedec,jc42-4" appropriate, or should it rather be something like
  "jedec,jc-42-4-sensor" ?

 Documentation/devicetree/bindings/hwmon/jc42.txt | 42 ++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/jc42.txt

diff --git a/Documentation/devicetree/bindings/hwmon/jc42.txt b/Documentation/devicetree/bindings/hwmon/jc42.txt
new file mode 100644
index 000000000000..2bd604a93430
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/jc42.txt
@@ -0,0 +1,42 @@
+Properties for Jedec JC-42.4 compatible temperature sensors
+
+Required properties:
+- compatible: May include a device-specific string consisting of the
+	      manufacturer and the name of the chip. A list of supported
+	      chip names follows.
+	      Must include "jedec,jc-42-4" for any Jedec JC-42.4 compatible
+	      temperature sensor.
+
+	      Supported chip names:
+		adt7408
+		at30ts00
+		at30tse004
+		cat6095
+		cat34ts02
+		max6604
+		mcp9804
+		mcp9805
+		mcp9808
+		mcp98243
+		mcp98244
+		mcp9843
+		se97
+		se98
+		stts2002
+		stts2004
+		stts3000
+		stts424
+		stts424e
+		tse2002
+		tse2004
+		ts3000
+		ts3001
+
+- reg: I2C address
+
+Example:
+
+temp-sensor@1a {
+	compatible = "jedec,jc-42-4";
+	reg = <0x18>;
+};
-- 
2.5.0
