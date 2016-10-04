From: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
Subject: [PATCH v2] Documentation: dtb: lm87: Add hwmon binding documentation.
Date: Tue,  4 Oct 2016 13:51:23 +1300
Message-ID: <20161004005123.2004-1-mahoda.ratnayaka@alliedtelesis.co.nz>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Sender: linux-hwmon-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org
Cc: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

This patch adds lm87 hwmon device tree node documentation.

Signed-off-by: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
---

Notes:
    Changes since v1:
     As suggested include all the changes are moved in
     to the same patch and the all the optional properties
     are now defined instead of using a single variable to
     indicate those properties.

 Documentation/devicetree/bindings/hwmon/lm87.txt | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lm87.txt

diff --git a/Documentation/devicetree/bindings/hwmon/lm87.txt b/Documentation/devicetree/bindings/hwmon/lm87.txt
new file mode 100644
index 0000000..ac578fff
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/lm87.txt
@@ -0,0 +1,29 @@
+*LM87 hwmon sensor.
+
+Required properties:
+- compatible: Should be
+	"ti,lm87"
+
+- reg: I2C address
+
+optional properties:
+- has-temp3: This configures pins 18 and 19 to be used as a second
+             remote temperature sensing channel. By default the pins
+             are configured as voltage input pins in0 and in5.
+
+- has-in6: When set, pin 5 is configured to be used as voltage input
+           in6. Otherwise the pin is set as FAN1 input.
+
+- has-in7: When set, pin 6 is configured to be used as voltage input
+           in6. Otherwise the pin is set as FAN2 input.
+
+- has-vcc-5v: sets the nominal voltage for internal VCC measurement to 5V.
+              Default is 3.3V.
+
+Example:
+
+lm87@2e {
+	compatible = "ti,lm87";
+	reg = <0x2e>;
+	has-temp3;
+};
-- 
2.10.0

