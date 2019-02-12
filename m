Return-Path: <SRS0=4Lph=QT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr680127.outbound.protection.outlook.com ([40.107.68.127]:17120
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727265AbfBLCeQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 11 Feb 2019 21:34:16 -0500
From: Trent Piepho <tpiepho@impinj.com>
Subject: [PATCH v3 4/4] dt-bindings: rtc: Update for new chip in isl1208
 series
Date: Tue, 12 Feb 2019 02:34:05 +0000
Message-ID: <20190212023225.2710-4-tpiepho@impinj.com>
References: <20190212023225.2710-1-tpiepho@impinj.com>
In-Reply-To: <20190212023225.2710-1-tpiepho@impinj.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Cc: Trent Piepho <tpiepho@impinj.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Since this documents multiple chips controlled by the isl1208 driver,
name it isil,isl1208.txt, as the convention is to use the base driver
name in the bindings document for drivers with multiple devices.

Include all chips supported by this driver in the docs.  Make it
clear which properties apply to which chips.

Expand documentation for existing isil,evienb property to explain
operation in more detail.  Existing docs just describe it in terms of
setting a bit in a register.

CC: Alessandro Zummo <a.zummo@towertech.it>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: devicetree@vger.kernel.org
Signed-off-by: Trent Piepho <tpiepho@impinj.com>
---
 .../devicetree/bindings/rtc/isil,isl1208.txt       | 38 ++++++++++++++++++=
++++
 .../devicetree/bindings/rtc/isil,isl1219.txt       | 29 -----------------
 2 files changed, 38 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/isil,isl1208.txt
 delete mode 100644 Documentation/devicetree/bindings/rtc/isil,isl1219.txt

diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1208.txt b/Docum=
entation/devicetree/bindings/rtc/isil,isl1208.txt
new file mode 100644
index 000000000000..51f003006f04
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/isil,isl1208.txt
@@ -0,0 +1,38 @@
+Intersil ISL1209/19 I2C RTC/Alarm chip with event in
+
+ISL12X9 have additional pins EVIN and #EVDET for tamper detection, while t=
he
+ISL1208 and ISL1218 do not.  They are all use the same driver with the bin=
dings
+described here, with chip specific properties as noted.
+
+Required properties supported by the device:
+ - "compatible": Should be one of the following:
+		- "isil,isl1208"
+		- "isil,isl1209"
+		- "isil,isl1218"
+		- "isil,isl1219"
+ - "reg": I2C bus address of the device
+
+Optional properties:
+ - "interrupt-names": list which may contains "irq" and "evdet"
+	evdet applies to isl1209 and isl1219 only
+ - "interrupts": list of interrupts for "irq" and "evdet"
+	evdet applies to isl1209 and isl1219 only
+ - "isil,ev-evienb": Enable or disable internal pull on EVIN pin
+	Applies to isl1209 and isl1219 only
+	Possible values are 0 and 1
+	Value 0 enables internal pull-up on evin pin, 1 disables it.
+	Default will leave the non-volatile configuration of the pullup
+	as is.
+
+Example isl1219 node with #IRQ pin connected to SoC gpio1 pin12 and #EVDET=
 pin
+connected to SoC gpio2 pin 24 and internal pull-up enabled in EVIN pin.
+
+	isl1219: rtc@68 {
+		compatible =3D "isil,isl1219";
+		reg =3D <0x68>;
+		interrupt-names =3D "irq", "evdet";
+		interrupts-extended =3D <&gpio1 12 IRQ_TYPE_EDGE_FALLING>,
+			<&gpio2 24 IRQ_TYPE_EDGE_FALLING>;
+		isil,ev-evienb =3D <1>;
+	};
+
diff --git a/Documentation/devicetree/bindings/rtc/isil,isl1219.txt b/Docum=
entation/devicetree/bindings/rtc/isil,isl1219.txt
deleted file mode 100644
index c3efd48e91c2..000000000000
--- a/Documentation/devicetree/bindings/rtc/isil,isl1219.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Intersil ISL1219 I2C RTC/Alarm chip with event in
-
-ISL1219 has additional pins EVIN and #EVDET for tamper detection.
-
-Required properties supported by the device:
-
- - "compatible": must be "isil,isl1219"
- - "reg": I2C bus address of the device
-
-Optional properties:
-
- - "interrupt-names": list which may contains "irq" and "evdet"
- - "interrupts": list of interrupts for "irq" and "evdet"
- - "isil,ev-evienb": if present EV.EVIENB bit is set to the specified
-                     value for proper operation.
-
-
-Example isl1219 node with #IRQ pin connected to SoC gpio1 pin12
- and #EVDET pin connected to SoC gpio2 pin 24:
-
-	isl1219: rtc@68 {
-		compatible =3D "isil,isl1219";
-		reg =3D <0x68>;
-		interrupt-names =3D "irq", "evdet";
-		interrupts-extended =3D <&gpio1 12 IRQ_TYPE_EDGE_FALLING>,
-			<&gpio2 24 IRQ_TYPE_EDGE_FALLING>;
-		isil,ev-evienb =3D <1>;
-	};
-
--=20
2.14.4
