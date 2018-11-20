From: Peter Rosin <peda@axentia.se>
Subject: [PATCH] ARM: dts: at91: nattis: initialize the BLON pin as output-low
 early
Date: Tue, 20 Nov 2018 21:20:43 +0000
Message-ID: <20181120212036.22497-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Peter Rosin <peda@axentia.se>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

The pwm-backlight driver initializes BLON (the enable gpio) to
output-high if the gpio is input on probe. Initializing the gpio
to output-low before the driver probes prevents this action by
the pwm-backlight driver and gets rid of a nasty blink of full
backlight with an uninitialized panel.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 arch/arm/boot/dts/at91-nattis-2-natte-2.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts b/arch/arm/boot/dt=
s/at91-nattis-2-natte-2.dts
index 911d2c7c1500..0f6d335125e2 100644
--- a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
+++ b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
@@ -60,6 +60,8 @@
=20
 		power-supply =3D <&bl_reg>;
 		enable-gpios =3D <&pioA 20 GPIO_ACTIVE_HIGH>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_blon>;
 	};
=20
 	panel: panel {
@@ -164,6 +166,12 @@
 				      (AT91_PINCTRL_OUTPUT |
 				       AT91_PINCTRL_OUTPUT_VAL(0))>;
 		};
+
+		pinctrl_blon: blon {
+			atmel,pins =3D <AT91_PIOA 20 AT91_PERIPH_GPIO
+				      (AT91_PINCTRL_OUTPUT |
+				       AT91_PINCTRL_OUTPUT_VAL(0))>;
+		};
 	};
 };
=20
--=20
2.11.0
