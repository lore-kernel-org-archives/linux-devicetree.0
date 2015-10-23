From: Constantine Shulyupin <const@makelinux.com>
Subject: [PATCH v7] Documentation: add Device tree bindings for hwmon/nct7802
Date: Sat, 24 Oct 2015 02:03:33 +0300
Message-ID: <1445641413-18662-1-git-send-email-const@makelinux.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, lm-sensors@lm-sensors.org, Arnd Bergmann <arnd@arndb.de>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: Constantine Shulyupin <const@MakeLinux.com>
List-Id: devicetree@vger.kernel.org

Introduced subnodes sensor, fan and peci with properties.

Signed-off-by: Constantine Shulyupin <const@MakeLinux.com>
---
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
 .../devicetree/bindings/hwmon/nct7802.txt          | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nct7802.txt

diff --git a/Documentation/devicetree/bindings/hwmon/nct7802.txt b/Documentation/devicetree/bindings/hwmon/nct7802.txt
new file mode 100644
index 0000000..1619202
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nct7802.txt
@@ -0,0 +1,77 @@
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
+ - "reg": index in range 0..2
+ - "compatible", allowed values:
+	 - "nuvoton,nct7802"
+ - "sensor-type", allowed values:
+	"thermal-diode"
+	"thermistor"
+	"voltage"
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
+ - "reg" :index in range 0..1
+ - "compatible", should be "nuvoton,nct7802-peci"
+
+Subnode vcc properties:
+ - "compatible", should be "nuvoton,nct7802-vcc"
+
+Subnode vcore properties:
+ - "compatible", should be "nuvoton,nct7802-vcore"
+
+Not defined sensors, fans and PECI modules will be disabled.
+
+Example nct7802 node:
+
+nct7802 {
+	compatible = "nuvoton,nct7802";
+	reg = <0x2a>;
+	#address-cells=<1>;
+	#size-cells=<0>;
+	sensor@0 {
+		reg = <0>;
+		compatible = "nuvoton,nct7802";
+		sensor-type = "thermistor"
+	};
+	sensor@1 {
+		reg = <1>;
+		compatible = "nuvoton,nct7802";
+		sensor-type = "thermal-diode";
+	};
+	pwm-fan@0 {
+		reg = <0>;
+		compatible = "nuvoton,nct7802-fan";
+	};
+	dc-fan@1 {
+		reg = <1>;
+		compatible = "nuvoton,nct7802-fan";
+		dc;
+		invert;
+		open-drain;
+	};
+	peci@0 {
+		reg = <0>;
+		compatible = "nuvoton,nct7802-peci";
+	};
+};
-- 
1.9.1
