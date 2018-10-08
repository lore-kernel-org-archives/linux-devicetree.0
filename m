From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 1/2] dt-bindings: himax,hx8837: add HiMax HX8837 bindings
Date: Mon,  8 Oct 2018 22:23:20 +0200
Message-ID: <20181008202321.128937-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

HiMax HX8837 is a display controller used on OLPC platforms.
It controlls backlight and is able to capture and freeze a frame when
the LCD controller (and the rest of the plaform) is powered off.

What is missing here is the description of connections to the LCD
controller and the panel. Maybe it would be a good idea to plug in it
betweend the two in a manner described in
<Documentation/devicetree/bindings/graph.txt>.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
Changes since v1:
- s/load-gpio/load-gpios/
- Use interrupt bindings instead of gpio for the IRQ

 .../devicetree/bindings/misc/himax,hx8837.txt  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/himax,hx8837.t=
xt

diff --git a/Documentation/devicetree/bindings/misc/himax,hx8837.txt b/Do=
cumentation/devicetree/bindings/misc/himax,hx8837.txt
new file mode 100644
index 000000000000..d0822c679ae8
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/himax,hx8837.txt
@@ -0,0 +1,18 @@
+HX8837 Display Controller
+
+Required properties:
+- compatible: Should be "himax,hx8837".
+- reg: I2C address, must be 0x0d
+- stat-gpios: gpio specifier of DCON_STAT0 and DCON_STAT1 pins (active h=
igh)
+- load-gpios: gpio specifier of DCON_LOAD pin (active high)
+- interrupt: interrupt specifier of DCON_IRQ pin (edge falling)
+
+Example:
+	dcon@d {
+		compatible =3D "himax,hx8837";
+		reg =3D <0x0d>;
+		stat-gpios =3D <&gpio 100 GPIO_ACTIVE_HIGH
+			      &gpio 101 GPIO_ACTIVE_HIGH>;
+		load-gpios =3D <&gpio 142 GPIO_ACTIVE_HIGH>;
+		interrupts =3D <&gpio 124 IRQ_TYPE_EDGE_FALLING>;
+	};
--=20
2.19.0
