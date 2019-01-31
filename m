From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH v2 3/7] pinctrl: at91: add compatibles for SAM9X60 pin
 controller
Date: Thu, 31 Jan 2019 16:18:11 +0000
Message-ID: <1548951466-26297-4-git-send-email-claudiu.beznea@microchip.com>
References: <1548951466-26297-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548951466-26297-1-git-send-email-claudiu.beznea@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

Add compatibles for SAM9X60 pin controller.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/pinctrl/pinctrl-at91.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.=
c
index 46443b97d811..5456a2692b8c 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1215,6 +1215,7 @@ static const struct of_device_id at91_pinctrl_of_matc=
h[] =3D {
 	{ .compatible =3D "atmel,sama5d3-pinctrl", .data =3D &sama5d3_ops },
 	{ .compatible =3D "atmel,at91sam9x5-pinctrl", .data =3D &at91sam9x5_ops }=
,
 	{ .compatible =3D "atmel,at91rm9200-pinctrl", .data =3D &at91rm9200_ops }=
,
+	{ .compatible =3D "microchip,sam9x60-pinctrl", .data =3D &sam9x60_ops },
 	{ /* sentinel */ }
 };
=20
@@ -1757,6 +1758,7 @@ static const struct gpio_chip at91_gpio_template =3D =
{
 static const struct of_device_id at91_gpio_of_match[] =3D {
 	{ .compatible =3D "atmel,at91sam9x5-gpio", .data =3D &at91sam9x5_ops, },
 	{ .compatible =3D "atmel,at91rm9200-gpio", .data =3D &at91rm9200_ops },
+	{ .compatible =3D "microchip,sam9x60-gpio", .data =3D &sam9x60_ops },
 	{ /* sentinel */ }
 };
=20
--=20
2.7.4
