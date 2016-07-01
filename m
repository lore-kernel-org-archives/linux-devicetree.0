From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH] gpio: document how to order GPIO controllers
Date: Fri,  1 Jul 2016 08:42:13 +0200
Message-ID: <1467355333-8813-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: kernel@pengutronix.de, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This uses the same approach that is already used for spi, i2c and
several other controllers to ensure a consistent numbering independent
of probe order. This is in use for several gpio drivers that already no=
w
use of_alias_get_id(np, "gpio").

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
Hello,

Linus requested such a patch as part of a change that introduces
this mechanism to the gpio-omap driver[1]. IMHO this is better done in =
a
separate patch, so here it comes.

Best regards
Uwe

[1] http://thread.gmane.org/gmane.linux.kernel.gpio/17399/focus=3D17629

 Documentation/devicetree/bindings/gpio/gpio.txt | 18 +++++++++++++++++=
+
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Document=
ation/devicetree/bindings/gpio/gpio.txt
index 68d28f62a6f4..5dbacc8f094a 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -227,6 +227,24 @@ Example of two SOC GPIO banks defined as gpio-cont=
roller nodes:
 		#gpio-cells =3D <2>;
 	};
=20
+Usually the GPIO banks in SoCs are ordered, that is there is a dedicat=
ed "first
+gpio bank". To fix this ordering in the device tree use aliases starti=
ng at 0
+(even if the first bank is called "GPIO1" in the hardware reference).
+This is necessary/handy to ensure deterministical numbering of GPIOs a=
nd GPIO
+controllers.
+
+Example of a machine having 4 GPIO banks.
+
+	/ {
+		aliases {
+			...
+			gpio0 =3D &gpio1;
+			gpio1 =3D &gpio2;
+			gpio2 =3D &gpio3;
+			gpio3 =3D &gpio4;
+		};
+	};
+
 2.1) gpio- and pin-controller interaction
 -----------------------------------------
=20
--=20
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
