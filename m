From: Constantine Shulyupin <const@MakeLinux.com>
Subject: [PATCH v6] Documentation: add Device tree bindings for hwmon/nct7802
Date: Sat,  3 Oct 2015 01:39:34 +0300
Message-ID: <1443825574-12779-1-git-send-email-const@MakeLinux.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, lm-sensors@lm-sensors.org, Arnd Bergmann <arnd@arndb.de>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: Constantine Shulyupin <const@MakeLinux.com>
List-Id: devicetree@vger.kernel.org

Introduced subnodes sensor, fan and peci with properties.

Signed-off-by: Constantine Shulyupin <const@MakeLinux.com>
---
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
 .../devicetree/bindings/hwmon/nct7802.txt          | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nct7802.txt

diff --git a/Documentation/devicetree/bindings/hwmon/nct7802.txt b/Documentation/devicetree/bindings/hwmon/nct7802.txt
new file mode 100644
index 0000000..88ee599
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nct7802.txt
@@ -0,0 +1,66 @@
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
+Subnode "sensor" properties:
+ - "reg": index in range 0..3
+ - "compatible", allowed values:
+	 - "nuvoton,nct7802-thermal-diode"
+	 - "nuvoton,nct7802-thermistor"
+	 - "nuvoton,nct7802-voltage"
+
+Sensor at address 2 can't be "nuvoton,nct7802-thermal-diode".
+
+Subnode "fan":
+Required properties:
+ - "reg" :index of in range 0 .. 2.
+ - "compatible", allowed values:
+	"nuvoton,nct7802-fan-pwm" :PWM powered fan
+	"nuvoton,nct7802-fan-dc" :direct current powered fan
+Optional boolean properties:
+ - "invert"  :inverted polarity
+ - "open-drain" :open-drain output instead push pull
+
+Subnode "peci" properties:
+ - "reg" :index in range 0..1
+ - "compatible", should be "nuvoton,nct7802-peci"
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
+		compatible = "nuvoton,nct7802-thermistor";
+	};
+	sensor@2 {
+		reg = <2>;
+		compatible = "nuvoton,nct7802-thermal-diode";
+	};
+	fan@0 {
+		reg = <0>;
+		compatible = "nuvoton,nct7802-fan-pwm";
+	};
+	fan@1 {
+		reg = <1>;
+		compatible = "nuvoton,nct7802-fan-dc";
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
