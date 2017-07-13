From: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] dt-binding: mfd: Add Maxim/Dallas DS1374 MFD device binding
Date: Thu, 13 Jul 2017 12:54:24 -0700
Message-ID: <1499975665-14581-1-git-send-email-mdf@kernel.org>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds a binding for the Maxim/Dallas DS1374 MFD.

Signed-off-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes from RFC:
- dallas,ds1374-mode -> dallas,mode
- Clarified examples
- dallas,remap-reset property

On second thoughts the solution for the remapping found in the
discussion did not seem to be a good solution, since the INT
pin indicating watchdog reset does not necessarily have to be
connected to an interrupt line on the machine, it could equally
well be hooked up to a PMIC reset input or similar.
In that case using the presence of an 'interrupt' phandle is not
a good choice.

Cheers,

Moritz

---
 Documentation/devicetree/bindings/mfd/ds1374.txt   | 88 ++++++++++++++++++++++
 .../devicetree/bindings/trivial-devices.txt        |  1 -
 drivers/rtc/Kconfig                                |  2 +
 3 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/ds1374.txt

diff --git a/Documentation/devicetree/bindings/mfd/ds1374.txt b/Documentation/devicetree/bindings/mfd/ds1374.txt
new file mode 100644
index 0000000..d558b87
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ds1374.txt
@@ -0,0 +1,88 @@
+* Device tree bindings for Maxim/Dallas DS1374 Multi Function Device (MFD)
+
+The Maxim/Dallas DS1374 is a multi function device that combines rtc,
+watchdog or alarm, as well as trickle charger.
+
+The DS1374 is connected via I2C.
+
+Required properties:
+- compatible: "dallas,ds1374"
+- reg: I2C slave address
+- dallas,mode: Should be one of the following values:
+			<0> for RTC
+			<1> for RTC + Alarm (Interrupt)
+			<2> for RTC + Watchdog
+
+For convenience there's an include file with constants avaialable
+at include/dt-bindings/mfd/ds1374.h
+
+Required child:
+A single available child device of type matching the "dallas,mode"
+property.
+
+See ../watchdog/* for generic watchdog bindings.
+
+Optional properties (real time clock):
+- interrupt: phandle to interrupt cell for the rtc's alarm feature
+
+See ../rtc/* for generic rtc bindings.
+
+Optional properties (trickle-charger):
+- dallas,trickle-resistor-ohms : Selected resistor for trickle charger
+	Values usable for ds1374 are 250, 2000, 4000
+	Should be given if trickle charger should be enabled
+- dallas,trickle-diode-disable : Do not use internal trickle charger diode
+	Should be given if internal trickle charger diode should be disabled
+
+Optional properties (watchdog):
+- dallas,remap-reset : If present, the INT pin of the device will toggle on
+	watchdog timeout instead of the RST pin. This effectively muxes the
+	INT pin to the RST pin.
+
+Example for just rtc:
+
+i2c@12ca0000 {
+	rtc@68 {
+		compatible = "ds1374";
+		reg = <0x68>;
+		dallas,mode = <0>
+	};
+};
+
+Example for rtc with alarm mode and interrupt (and trickle charging):
+
+i2c@12ca0000 {
+	rtc@68 {
+		compatible = "ds1374";
+		reg = <0x68>;
+		interrupts = <&gpio0 62>;
+		dallas,mode = <1>
+
+		dallas,trickle-resistor-ohms = <250>;
+		dallas,trickle-diode-disable;
+	};
+};
+
+Example for rtc with watchdog and reset on timeout, with watchdog reset
+remapped to the INT pin (also no trickle charging):
+
+i2c@12ca0000 {
+	rtc@68 {
+		compatible = "ds1374";
+		reg = <0x68>;
+		dallas,mode = <2>
+		dallas,remap-reset;
+		reset-on-timeout;
+	};
+};
+
+Example for rtc with watchdog and reset on timeout, with reset not
+remapped to the INT pin (also no trickle charging):
+
+i2c@12ca0000 {
+	rtc@68 {
+		compatible = "ds1374";
+		reg = <0x68>;
+		dallas,mode = <2>
+	};
+};
diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/Documentation/devicetree/bindings/trivial-devices.txt
index ad10fbe..42d99d1 100644
--- a/Documentation/devicetree/bindings/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/trivial-devices.txt
@@ -29,7 +29,6 @@ cirrus,cs42l51		Cirrus Logic CS42L51 audio codec
 dallas,ds1307		64 x 8, Serial, I2C Real-Time Clock
 dallas,ds1338		I2C RTC with 56-Byte NV RAM
 dallas,ds1340		I2C RTC with Trickle Charger
-dallas,ds1374		I2C, 32-Bit Binary Counter Watchdog RTC with Trickle Charger and Reset Input/Output
 dallas,ds1631		High-Precision Digital Thermometer
 dallas,ds1682		Total-Elapsed-Time Recorder with Alarm
 dallas,ds1775		Tiny Digital Thermometer and Thermostat
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index ee1b0e9..20dde9b 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -250,6 +250,8 @@ config RTC_DRV_DS1307_CENTURY
 
 config RTC_DRV_DS1374
 	tristate "Dallas/Maxim DS1374"
+	depends on MFD_DS1374
+	depends on REGMAP_I2C
 	help
 	  If you say yes here you get support for Dallas Semiconductor
 	  DS1374 real-time clock chips. If an interrupt is associated
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
