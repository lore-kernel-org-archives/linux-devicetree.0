From: Constantine Shulyupin <const@makelinux.com>
Subject: [PATCH v8] Documentation: add Device tree bindings for hwmon/nct7802
Date: Mon, 26 Oct 2015 22:24:17 +0200
Message-ID: <1445891057-1554-1-git-send-email-const@makelinux.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, lm-sensors@lm-sensors.org, Arnd Bergmann <arnd@arndb.de>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: Constantine Shulyupin <const@MakeLinux.com>
List-Id: devicetree@vger.kernel.org

From: Constantine Shulyupin <const@MakeLinux.com>

Introduced subnodes sensor, fan and peci with properties.

Signed-off-by: Constantine Shulyupin <const@MakeLinux.com>
---
Changed in v8:
- added senor type "local"
- Compatible nodes converted to senor types "vcore", "vcc"

Changed in v7:
- sensors type (thermistor, thermistor, voltage) and pwm type
selected with type property instead of compatible property.

Changed in v6:
- Removed previous definition.
- Introduced subnodes sensor, fan and peci with properties.

Changed in v5:
- Fixed typos

Changed in v4:
- Removed registers initialization by names
- Added properties nuvoton,sensor*-type

Changed in v3:
- Fixed vendor prefix
- Added short registers description,
  full registers description is available at
https://www.nuvoton.com/hq/products/cloud-computing/hardware-monitors/desktop-server-series/nct7802y/

Changed in v2:
- Removed nct7802,reg-init
- Added registers initialization by names

Introduced in v1:
 - nct7802,reg-init
---
 .../devicetree/bindings/hwmon/nct7802.txt          | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nct7802.txt

diff --git a/Documentation/devicetree/bindings/hwmon/nct7802.txt b/Documentation/devicetree/bindings/hwmon/nct7802.txt
new file mode 100644
index 0000000..8647783
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nct7802.txt
@@ -0,0 +1,102 @@
+Nuvoton NCT7802Y Hardware Monitoring IC
+
+Required node properties:
+
+ - "compatible": must be "nuvoton,nct7802"
+ - "reg": I2C bus address of the device
+ - #address-cells=<1>;
+ - #size-cells=<0>;
+
+Optional subnodes:
+
+Sensor subnodes properties:
+ - "compatible", allowed values:
+	 - "nuvoton,nct7802"
+ - "sensor-type", allowed values:
+	"thermal-diode"
+	"thermistor"
+	"voltage"
+	"local"
+	"vcore"
+	"vcc"
+For sensors of types "thermal-diode", "thermistor" and "voltage" required
+ - "reg": index in range 0 .. 2
+
+Except sensor at address 2 can't be "thermal-diode".
+
+Fan subnode:
+
+Required properties:
+ - "reg" :index of in range 0 .. 2.
+ - "compatible", should be "nuvoton,nct7802-fan"
+Optional boolean properties:
+ - "direct-current" :direct current powered fan instead default PWM
+ - "invert" :inverted polarity
+ - "open-drain" :open-drain output instead push pull
+
+Subnode "peci" properties:
+ - "reg" :index in range 0 .. 1
+ - "compatible", should be "nuvoton,nct7802-peci"
+
+Not defined sensors, fans and PECI modules will be disabled.
+
+Example nct7802 node:
+
+nct7802-example@28 {
+	compatible = "nuvoton,nct7802";
+	reg = <0x28>;
+	#address-cells=<1>;
+	#size-cells=<0>;
+	local-sensor {
+		compatible = "nuvoton,nct7802-sensor";
+		sensor-type = "local";
+	};
+	sensor@0 {
+		compatible = "nuvoton,nct7802-sensor";
+		reg = <0>;
+		sensor-type = "thermal-diode";
+	};
+	sensor@1 {
+		compatible = "nuvoton,nct7802-sensor";
+		reg = <1>;
+		sensor-type = "thermistor";
+	};
+	sensor@2 {
+		compatible = "nuvoton,nct7802-sensor";
+		reg = <2>;
+		sensor-type = "voltage";
+	};
+	vcc {
+		compatible = "nuvoton,nct7802-sensor";
+		sensor-type = "vcc";
+	};
+	vcore {
+		compatible = "nuvoton,nct7802-sensor";
+		sensor-type = "vcore";
+	};
+	pwm-fan@0 {
+		compatible = "nuvoton,nct7802-fan";
+		reg = <0>;
+	};
+	dc-fan@1 {
+		compatible = "nuvoton,nct7802-fan";
+		reg = <1>;
+		direct-current;
+		open-drain;
+		invert;
+	};
+	fan@2 {
+		compatible = "nuvoton,nct7802-fan";
+		reg = <2>;
+		open-drain;
+		invert;
+	};
+	peci@0 {
+		compatible = "nuvoton,nct7802-peci";
+		reg = <0>;
+	};
+	peci@1 {
+		compatible = "nuvoton,nct7802-peci";
+		reg = <1>;
+	};
+};
-- 
1.9.1
