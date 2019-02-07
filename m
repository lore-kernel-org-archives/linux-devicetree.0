From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH v3 4/7] dt-bindings: add documentation for banks
Date: Thu, 7 Feb 2019 09:24:57 +0000
Message-ID: <1549531468-1676-5-git-send-email-claudiu.beznea@microchip.com>
References: <1549531468-1676-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549531468-1676-1-git-send-email-claudiu.beznea@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

Add documentation for at91 pin controller banks.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
 .../bindings/pinctrl/atmel,at91-pinctrl.txt        | 23 ++++++++++++++++++=
++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.t=
xt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
index 3e23fece99da..40e33dfc36fd 100644
--- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
@@ -116,6 +116,18 @@ Some requirements for using atmel,at91rm9200-pinctrl b=
inding:
    configurations by referring to the phandle of that pin configuration no=
de.
 4. The gpio controller must be describe in the pinctrl simple-bus.
=20
+For each bank the required properties are:
+- compatible: "atmel,at91sam9x5-gpio" or "atmel,at91rm9200-gpio"
+- reg: physical base address and length of the controller's registers
+- interrupts: interrupt outputs from the controller
+- interrupt-controller: marks the device node as an interrupt controller
+- #interrupt-cells: should be 2; refer to ../interrupt-controller/interrup=
ts.txt
+  for more details.
+- gpio-controller
+- #gpio-cells: should be 2; the first cell is the GPIO number and the seco=
nd
+  cell specifies GPIO flags as defined in <dt-bindings/gpio/gpio.h>.
+- clocks: bank clock
+
 Examples:
=20
 pinctrl@fffff400 {
@@ -125,6 +137,17 @@ pinctrl@fffff400 {
 	compatible =3D "atmel,at91rm9200-pinctrl", "simple-bus";
 	reg =3D <0xfffff400 0x600>;
=20
+	pioA: gpio@fffff400 {
+		compatible =3D "atmel,at91sam9x5-gpio";
+		reg =3D <0xfffff400 0x200>;
+		interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH 1>;
+		#gpio-cells =3D <2>;
+		gpio-controller;
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+		clocks =3D <&pmc PMC_TYPE_PERIPHERAL 2>;
+	};
+
 	atmel,mux-mask =3D <
 	      /*    A         B     */
 	       0xffffffff 0xffc00c3b  /* pioA */
--=20
2.7.4
