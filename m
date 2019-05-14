From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 1/2] dt-bindings: hwmon: Add DT bindings for TI ads1000/ads1100 ADCs
Date: Wed, 15 May 2019 01:58:08 +0300
Message-ID: <20190514225810.12591-2-fancer.lancer@gmail.com>
References: <20190514225810.12591-1-fancer.lancer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514225810.12591-1-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Serge Semin <fancer.lancer@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Serge Semin <Sergey.Semin@t-platforms.ru>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add dt-binding documentation for the Texas Instruments ads1000/ads1100 ADCs
driver.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 .../devicetree/bindings/hwmon/ads1000.txt     | 61 ++++++++++++++++
 Documentation/hwmon/ads1000.rst               | 72 +++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ads1000.txt
 create mode 100644 Documentation/hwmon/ads1000.rst

diff --git a/Documentation/devicetree/bindings/hwmon/ads1000.txt b/Documentation/devicetree/bindings/hwmon/ads1000.txt
new file mode 100644
index 000000000000..3907b7da9b33
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ads1000.txt
@@ -0,0 +1,61 @@
+ADS1000/ADS1100 (I2C)
+
+This device is a 12-16 bit A-D converter with 1 input.
+
+The inputs can be used either as a differential pair of Vin+ Vin- or as a single
+ended sensor for Vin+ GND. The inputs mode is platform-dependent and isn't
+configured by software in any case.
+
+Device A-D converter sensitivity can be configured using two parameters:
+ - pga is the programmable gain amplifier
+    0: x1 (default) 
+    1: x2
+    2: x4
+    3: x8
+ - data_rate in samples per second also affecting the output code accuracy
+    0: 128SPS - +/- Vdd*0.488mV (default, ads1000 accepts this rate only)
+    1: 32SPS  - +/- Vdd*0.122mV
+    2: 16SPS  - +/- Vdd*0.061mV
+    3: 8SPS   - +/- Vdd*0.030mV
+   Since this parameter also affects the output accuracy, be aware the greater
+   SPS the worse accuracy.
+
+As a result the output value is calculated by the next formulae:
+dVin = Cod * Vdd / (PGA * max(|Cod|)), where
+max(|Cod|) - maximum possible value of the output code, which depends on the SPS
+setting from the table above.
+
+The ADS1000/ADS1100 dts-node:
+
+  Required properties:
+   - compatible : must be "ti,ads1000" or "ti,ads1100"
+   - reg : I2C bus address of the device
+   - #address-cells : must be <1>
+   - #size-cells : must be <0>
+   - vdd-supply : regulator for reference supply voltage (usually fixed)
+
+  Optional properties:
+   - ti,gain : the programmable gain amplifier setting
+   - ti,datarate : the converter data rate
+   - ti,voltage-divider : <R1 R2> Ohms inbound voltage dividers,
+     so dVin = (R1 + R2)/R2 * dVin
+
+Example:
+
+vdd_5v0: fixedregulator@0 {
+	compatible = "regulator-fixed";
+	regulator-name = "vdd-ref";
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+	regulator-always-on;
+};
+
+tiadc: ads1000@48 {
+	compatible = "ti,ads1000";
+	reg = <0x48>;
+
+	vdd-supply = <&vdd_5v0>;
+	ti,gain = <0>;
+	ti,voltage-divider = <31600 3600>;
+};
+
diff --git a/Documentation/hwmon/ads1000.rst b/Documentation/hwmon/ads1000.rst
new file mode 100644
index 000000000000..fcfe52d5d64d
--- /dev/null
+++ b/Documentation/hwmon/ads1000.rst
@@ -0,0 +1,72 @@
+Kernel driver ads1000
+=====================
+
+Supported chips:
+
+  * Texas Instruments ADS1000
+
+    Prefix: 'ads1000'
+
+    Datasheet: Publicly available at the Texas Instruments website:
+
+               http://www.ti.com/lit/ds/symlink/ads1000.pdf
+
+  * Texas Instruments ADS1100
+
+    Prefix: 'ads1100'
+
+    Datasheet: Publicly available at the Texas Instruments website:
+
+               http://www.ti.com/lit/ds/symlink/ads1100.pdf
+
+Authors:
+	Serge Semin <fancer.lancer@gmail.com>
+
+Description
+-----------
+
+This driver implements support for the Texas Instruments ADS1000/ADS1100 ADCs.
+
+This device is a 12-16 bit A-D converter with 1 input.
+
+The inputs can be used either as a differential pair of Vin+ Vin- or as a single
+ended sensor for Vin+ GND. The inputs mode is platform-dependent and isn't
+configured by software in any case.
+
+Platform Data
+-------------
+
+In linux/platform_data/ads1000.h platform data is defined to be of
+the following fields:
+
+ - pga is the programmable gain amplifier.
+
+    - 0: x1
+    - 1: x2
+    - 2: x4
+    - 3: x8
+
+ - data_rate in samples per second also affecting the output code accuracy.
+
+    - 0: 128SPS - +/- Vdd*0.488mV (ads1000 accepts this rate only)
+    - 1: 32SPS  - +/- Vdd*0.122mV
+    - 2: 16SPS  - +/- Vdd*0.061mV
+    - 3: 8SPS   - +/- Vdd*0.030mV
+   Since this parameter also affects the output accuracy, be aware the greater
+   SPS the worse accuracy.
+
+ - vdd is a pointer to the voltage regulator with reference voltage source.
+
+ - divider is an array of inbound voltage dividers in <R1 R2> Ohms, if each of
+   them is non-zero then the output voltage will be modified as follows:
+   dVin = (R1 + R2)/R2 * dVin.
+
+As a result the output value is calculated by the next formulae:
+dVin = Cod * Vdd / (PGA * max(|Cod|)), where max(|Cod|) - maximum possible
+value of the output code, which depends on the SPS setting from data_rate.
+
+Devicetree
+----------
+
+Configuration is also possible via devicetree:
+Documentation/devicetree/bindings/hwmon/ads1000.txt
-- 
2.21.0
