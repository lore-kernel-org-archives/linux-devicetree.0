From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/2] dt-bindings: hwmon: add binding documentation for adt7475
Date: Wed,  7 Nov 2018 17:00:09 +1300
Message-ID: <20181107040010.27436-2-chris.packham@alliedtelesis.co.nz>
References: <20181107040010.27436-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181107040010.27436-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@roeck-us.net, robh+dt@kernel.org, jdelvare@suse.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

With the addition of the invert-pwm property the adt7475 needs its own
binding documentation rather being captured under trivial-devices.txt.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
=20.../devicetree/bindings/hwmon/adt7475.txt     | 22 +++++++++++++++++++=

=20.../devicetree/bindings/trivial-devices.txt   |  4 ----
=202 files changed, 22 insertions(+), 4 deletions(-)
=20create mode 100644 Documentation/devicetree/bindings/hwmon/adt7475.txt=


diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.txt b/Docume=
ntation/devicetree/bindings/hwmon/adt7475.txt
new file mode 100644
index 000000000000..79255439e157
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adt7475.txt
@@ -0,0 +1,22 @@
+*ADT7475 hwmon sensor.
+
+Required properties:
+- compatible: One of
+	"adi,adt7473"
+	"adi,adt7475"
+	"adi,adt7476"
+	"adi,adt7490"
+
+- reg: I2C address
+
+optional properties:
+
+- invert-pwm: This configures the PWM to use logic low for 100% duty cyc=
le.
+
+Example:
+
+hwmon@2e {
+	compatible =3D ;
+	reg =3D <0x2e>;
+	invert-pwm;
+};
diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/Docu=
mentation/devicetree/bindings/trivial-devices.txt
index 69c934aec13b..4f29100d6bbf 100644
--- a/Documentation/devicetree/bindings/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/trivial-devices.txt
@@ -14,10 +14,6 @@ ad,ad7414		SMBus/I2C Digital Temperature Sensor in 6-P=
in SOT with SMBus Alert an
=20ad,adm9240		ADM9240:  Complete System Hardware Monitor for uProcessor-=
Based Systems
=20adi,adt7461		+/-1C TDM Extended Temp Range I.C
=20adt7461			+/-1C TDM Extended Temp Range I.C
-adi,adt7473		+/-1C TDM Extended Temp Range I.C
-adi,adt7475		+/-1C TDM Extended Temp Range I.C
-adi,adt7476		+/-1C TDM Extended Temp Range I.C
-adi,adt7490		+/-1C TDM Extended Temp Range I.C
=20adi,adxl345		Three-Axis Digital Accelerometer
=20adi,adxl346		Three-Axis Digital Accelerometer (backward-compatibility =
value "adi,adxl345" must be listed too)
=20ams,iaq-core		AMS iAQ-Core VOC Sensor
--=20
2.19.1
