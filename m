From: arno@natisbad.org (Arnaud Ebalard)
Subject: [PATCH] hwmon: add support for GMT G751 chip in lm75 driver
Date: Sat, 09 Nov 2013 18:39:14 +0100
Message-ID: <87bo1th3ul.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <khali@linux-fr.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, lm-sensors@lm-sensors.org
List-Id: devicetree@vger.kernel.org


This was tested on a NETGEAR ReadyNAS 2120 device (Marvell Armada XP
based board, via DT).

Signed-off-by: Arnaud Ebalard <arno@natisbad.org>
---
Hi Guenter,

As a side note, I removed the hunk that was present in previous patch t=
o
add gmt to the list of DT vendor prefixes because I noticed someone had
taken care: https://lkml.org/lkml/2013/9/12/365

=46or the records, here is what I get on my NAS with the attached patch=
:

root@thin:/sys# sensors
g762-i2c-0-3e
Adapter: mv64xxx_i2c adapter
fan1:        5461 RPM  (div =3D 1)

g762-i2c-0-48
Adapter: mv64xxx_i2c adapter
fan1:        5461 RPM  (div =3D 1)

g762-i2c-0-49
Adapter: mv64xxx_i2c adapter
fan1:        5461 RPM  (div =3D 1)

g751-i2c-0-4c
Adapter: mv64xxx_i2c adapter
temp1:        +30.5=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +75.0=C2=B0=
C)

armada_thermal-virtual-0
Adapter: Virtual device
temp1:        +34.2=C2=B0C

root@thin:/sys/bus/i2c/drivers/lm75/0-004c# ls
driver  modalias  subsystem    temp1_max       uevent
hwmon   name      temp1_input  temp1_max_hyst

root@thin:/sys/bus/i2c/drivers/lm75/0-004c# dmesg | grep lm
[  120.960471] lm75 0-004c: hwmon3: sensor 'g751'


just by adding the following to the .dts:

	g751: g751@4c {
		compatible =3D "gmt,g751";
		reg =3D <0x4c>;
	};

Do not hesitate to tell me if I missed something.

Cheers,

a+

 Documentation/devicetree/bindings/i2c/trivial-devices.txt | 1 +
 drivers/hwmon/Kconfig                                     | 1 +
 drivers/hwmon/lm75.c                                      | 3 +++
 3 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt =
b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
index ad6a738..c98e5a2 100644
--- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
@@ -35,6 +35,7 @@ fsl,mc13892		MC13892: Power Management Integrated Cir=
cuit (PMIC) for i.MX35/51
 fsl,mma8450		MMA8450Q: Xtrinsic Low-power, 3-axis Xtrinsic Acceleromet=
er
 fsl,mpr121		MPR121: Proximity Capacitive Touch Sensor Controller
 fsl,sgtl5000		SGTL5000: Ultra Low-Power Audio Codec
+gmt,g751		G751: Digital Temperature Sensor and Thermal Watchdog with T=
wo-Wire Interface
 infineon,slb9635tt	Infineon SLB9635 (Soft-) I2C TPM (old protocol, max=
 100khz)
 infineon,slb9645tt	Infineon SLB9645 I2C TPM (new protocol, max 400khz)
 maxim,ds1050		5 Bit Programmable, Pulse-Width Modulator
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index b3ab9d4..52d548f 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -656,6 +656,7 @@ config SENSORS_LM75
=20
 		- Analog Devices ADT75
 		- Dallas Semiconductor DS75, DS1775 and DS7505
+		- Global Mixed-mode Technology (GMT) G751
 		- Maxim MAX6625 and MAX6626
 		- Microchip MCP980x
 		- National Semiconductor LM75, LM75A
diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index c03b490..7e3ef13 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -39,6 +39,7 @@ enum lm75_type {		/* keep sorted in alphabetical orde=
r */
 	ds1775,
 	ds75,
 	ds7505,
+	g751,
 	lm75,
 	lm75a,
 	max6625,
@@ -208,6 +209,7 @@ lm75_probe(struct i2c_client *client, const struct =
i2c_device_id *id)
 		data->resolution =3D 12;
 		data->sample_time =3D HZ / 4;
 		break;
+	case g751:
 	case lm75:
 	case lm75a:
 		data->resolution =3D 9;
@@ -296,6 +298,7 @@ static const struct i2c_device_id lm75_ids[] =3D {
 	{ "ds1775", ds1775, },
 	{ "ds75", ds75, },
 	{ "ds7505", ds7505, },
+	{ "g751", g751, },
 	{ "lm75", lm75, },
 	{ "lm75a", lm75a, },
 	{ "max6625", max6625, },
--=20
1.8.4.rc3

