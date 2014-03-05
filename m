From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: =?UTF-8?q?=5BRESEND=20Patch=201/3=5D=20DT=3A=20I2C=3A=20Add=20trivial=20bindings=20used=20by=20kirkwood=20boards?=
Date: Wed,  5 Mar 2014 22:33:25 +0100
Message-ID: <1394055207-4639-2-git-send-email-andrew@lunn.ch>
References: <1394055207-4639-1-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394055207-4639-1-git-send-email-andrew-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a number of eeproms and temperature sensors/fan controllers used
by kirkwood boards.

Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
---
 .../devicetree/bindings/i2c/trivial-devices.txt         | 17 +++++++++=
++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt =
b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
index e11ed0fe770c..7faa3eab2549 100644
--- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
@@ -14,5 +14,20 @@ ad,adm9240		ADM9240:  Complete System Hardware Monit=
or for uProcessor-Based Syst
 adi,adt7461		+/-1C TDM Extended Temp Range I.C
 adt7461			+/-1C TDM Extended Temp Range I.C
+adi,adt7473		+/-1C TDM Extended Temp Range I.C
+adi,adt7475		+/-1C TDM Extended Temp Range I.C
+adi,adt7476		+/-1C TDM Extended Temp Range I.C
+adi,adt7490		+/-1C TDM Extended Temp Range I.C
+at,24c00		i2c serial eeprom  (24cxx)
+at,24c01		i2c serial eeprom  (24cxx)
+at,24c02		i2c serial eeprom  (24cxx)
+at,24c04		i2c serial eeprom  (24cxx)
 at,24c08		i2c serial eeprom  (24cxx)
+at,24c16		i2c serial eeprom  (24cxx)
+at,24c32		i2c serial eeprom  (24cxx)
+at,24c64		i2c serial eeprom  (24cxx)
+at,24c128		i2c serial eeprom  (24cxx)
+at,24c256		i2c serial eeprom  (24cxx)
+at,24c512		i2c serial eeprom  (24cxx)
+at,24c1024		i2c serial eeprom  (24cxx)
 atmel,24c02		i2c serial eeprom  (24cxx)
 atmel,at97sc3204t	i2c trusted platform module (TPM)
@@ -46,6 +61,8 @@ maxim,max1237		Low-Power, 4-/12-Channel, 2-Wire Seria=
l, 12-Bit ADCs
 maxim,max6625		9-Bit/12-Bit Temperature Sensors with I=C2=B2C-Compatib=
le Serial Interface
 mc,rv3029c2		Real Time Clock Module with I2C-Bus
+national,lm63		Temperature sensor with integrated fan control
 national,lm75		I2C TEMP SENSOR
 national,lm80		Serial Interface ACPI-Compatible Microprocessor System =
Hardware Monitor
+national,lm85		Temperature sensor with integrated fan control
 national,lm92		=C2=B10.33=C2=B0C Accurate, 12-Bit + Sign Temperature S=
ensor and Thermal Window Comparator with Two-Wire Interface
 nuvoton,npct501		i2c trusted platform module (TPM)
--=20
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
