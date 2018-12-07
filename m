From: <Andrei.Stefanescu@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: atmel: describe SECUMOD usage as a
 GPIO controller
Date: Fri, 7 Dec 2018 06:46:30 +0000
Message-ID: <1544165160-13653-2-git-send-email-andrei.stefanescu@microchip.com>
References: <1544165160-13653-1-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544165160-13653-1-git-send-email-andrei.stefanescu@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Ludovic.Desroches@microchip.com, Cristian.Birsan@microchip.com, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Andrei.Stefanescu@microchip.com
List-Id: devicetree@vger.kernel.org

This patch describes the Security Module's usage as a GPIO
controller for its PIOBU pins. These pins have the special
property of maintaining their voltage during suspend-to-mem.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@microchip.com>
---
 Documentation/devicetree/bindings/arm/atmel-sysregs.txt | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Docu=
mentation/devicetree/bindings/arm/atmel-sysregs.txt
index 4b96608..c89db84 100644
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
@@ -158,14 +158,24 @@ Security Module (SECUMOD)
=20
 The Security Module macrocell provides all necessary secure functions to a=
void
 voltage, temperature, frequency and mechanical attacks on the chip. It als=
o
-embeds secure memories that can be scrambled
+embeds secure memories that can be scrambled.
+
+The Security Module also offers the PIOBU pins which can be used as GPIO p=
ins.
+Note that they maintain their voltage during Backup/Self-refresh.=20
=20
 required properties:
 - compatible: Should be "atmel,<chip>-secumod", "syscon".
   <chip> can be "sama5d2".
 - reg: Should contain registers location and length
+- gpio-controller:	Marks the port as GPIO controller.
+- #gpio-cells:		There are 2. The pin number is the
+			first, the second represents additional
+			parameters such as GPIO_ACTIVE_HIGH/LOW.
+
=20
 	secumod@fc040000 {
 		compatible =3D "atmel,sama5d2-secumod", "syscon";
 		reg =3D <0xfc040000 0x100>;
+		gpio-controller;
+		#gpio-cells =3D <2>;
 	};
--=20
2.7.4
