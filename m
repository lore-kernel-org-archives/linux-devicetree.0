From: <Andrei.Stefanescu@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: gpio: add SAMA5D2 PIOBU support
Date: Tue, 20 Nov 2018 08:08:36 +0000
Message-ID: <1542701330-23466-2-git-send-email-andrei.stefanescu@microchip.com>
References: <1542701330-23466-1-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542701330-23466-1-git-send-email-andrei.stefanescu@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Ludovic.Desroches@microchip.com, Cristian.Birsan@microchip.com, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Andrei.Stefanescu@microchip.com
List-Id: devicetree@vger.kernel.org

This patch describes the compatible and the device tree
bindings necessary for the SAMA5D2 PIOBU GPIO.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@microchip.com>
---
 .../bindings/gpio/gpio-sama5d2-piobu.txt           | 31 ++++++++++++++++++=
++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sama5d2-pio=
bu.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-sama5d2-piobu.txt =
b/Documentation/devicetree/bindings/gpio/gpio-sama5d2-piobu.txt
new file mode 100644
index 0000000..2e260e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-sama5d2-piobu.txt
@@ -0,0 +1,31 @@
+GPIO controller for SAMA5D2 PIOBU pins.
+
+These pins have the property of not losing their voltage
+during Backup/Self-refresh mode.
+
+These bindings should be set to a node in the dtsi file.
+
+Required properties:
+- compatible:		"syscon", "microchip,sama5d2-piobu"
+- #gpio-cells:		There are 2. The pin number is the
+			first, the second represents additional
+			parameters such as GPIO_ACTIVE_HIGH/LOW.
+- gpio-controller:	Marks the port as GPIO controller.
+
+Note that the driver uses syscon and should be the child of
+the syscon node.
+
+Example:
+
+	secumod@fc040000 {
+		compatible =3D "atmel,sama5d2-secumod", "syscon", "simple-mfd";
+		status =3D "okay";
+		reg =3D <0xfc040000 0x100>;
+
+		pioBU: piobu {
+			status =3D "okay";
+			compatible =3D "microchip,sama5d2-piobu";
+			gpio-controller;
+			#gpio-cells =3D <2>;
+		};
+	};
--=20
2.7.4
