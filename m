From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH v2 2/7] pinctrl: at91: add drive strength support for SAM9X60
Date: Thu, 31 Jan 2019 16:18:07 +0000
Message-ID: <1548951466-26297-3-git-send-email-claudiu.beznea@microchip.com>
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

Add drive strength support for SAM9X60 pin controller.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/pinctrl/pinctrl-at91.c | 52 ++++++++++++++++++++++++++++++++++++++=
++++
 drivers/pinctrl/pinctrl-at91.h |  2 ++
 2 files changed, 54 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.=
c
index 31f06dafca2e..46443b97d811 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -574,6 +574,17 @@ static unsigned at91_mux_sam9x5_get_drivestrength(void=
 __iomem *pio,
 	return tmp;
 }
=20
+static unsigned at91_mux_sam9x60_get_drivestrength(void __iomem *pio,
+						   unsigned pin)
+{
+	unsigned tmp =3D readl_relaxed(pio + SAM9X60_PIO_DRIVER1);
+
+	if (tmp & BIT(pin))
+		return DRIVE_STRENGTH_BIT_HI;
+
+	return DRIVE_STRENGTH_BIT_LOW;
+}
+
 static void set_drive_strength(void __iomem *reg, unsigned pin, u32 streng=
th)
 {
 	unsigned tmp =3D readl_relaxed(reg);
@@ -611,6 +622,27 @@ static void at91_mux_sam9x5_set_drivestrength(void __i=
omem *pio, unsigned pin,
 				setting);
 }
=20
+static void at91_mux_sam9x60_set_drivestrength(void __iomem *pio, unsigned=
 pin,
+					       u32 setting)
+{
+	unsigned int tmp;
+
+	if (setting <=3D DRIVE_STRENGTH_BIT_DEF ||
+	    setting =3D=3D DRIVE_STRENGTH_BIT_MED ||
+	    setting > DRIVE_STRENGTH_BIT_HI)
+		return;
+
+	tmp =3D readl_relaxed(pio + SAM9X60_PIO_DRIVER1);
+
+	/* Strength is 0: low, 1: hi */
+	if (setting =3D=3D DRIVE_STRENGTH_BIT_LOW)
+		tmp &=3D ~BIT(pin);
+	else
+		tmp |=3D BIT(pin);
+
+	writel_relaxed(tmp, pio + SAM9X60_PIO_DRIVER1);
+}
+
 static struct at91_pinctrl_mux_ops at91rm9200_ops =3D {
 	.get_periph	=3D at91_mux_get_periph,
 	.mux_A_periph	=3D at91_mux_set_A_periph,
@@ -639,6 +671,26 @@ static struct at91_pinctrl_mux_ops at91sam9x5_ops =3D =
{
 	.irq_type	=3D alt_gpio_irq_type,
 };
=20
+static const struct at91_pinctrl_mux_ops sam9x60_ops =3D {
+	.get_periph	=3D at91_mux_pio3_get_periph,
+	.mux_A_periph	=3D at91_mux_pio3_set_A_periph,
+	.mux_B_periph	=3D at91_mux_pio3_set_B_periph,
+	.mux_C_periph	=3D at91_mux_pio3_set_C_periph,
+	.mux_D_periph	=3D at91_mux_pio3_set_D_periph,
+	.get_deglitch	=3D at91_mux_pio3_get_deglitch,
+	.set_deglitch	=3D at91_mux_pio3_set_deglitch,
+	.get_debounce	=3D at91_mux_pio3_get_debounce,
+	.set_debounce	=3D at91_mux_pio3_set_debounce,
+	.get_pulldown	=3D at91_mux_pio3_get_pulldown,
+	.set_pulldown	=3D at91_mux_pio3_set_pulldown,
+	.get_schmitt_trig =3D at91_mux_pio3_get_schmitt_trig,
+	.disable_schmitt_trig =3D at91_mux_pio3_disable_schmitt_trig,
+	.get_drivestrength =3D at91_mux_sam9x60_get_drivestrength,
+	.set_drivestrength =3D at91_mux_sam9x60_set_drivestrength,
+	.irq_type	=3D alt_gpio_irq_type,
+
+};
+
 static struct at91_pinctrl_mux_ops sama5d3_ops =3D {
 	.get_periph	=3D at91_mux_pio3_get_periph,
 	.mux_A_periph	=3D at91_mux_pio3_set_A_periph,
diff --git a/drivers/pinctrl/pinctrl-at91.h b/drivers/pinctrl/pinctrl-at91.=
h
index 79b957f1dfa2..19fc27e66bfd 100644
--- a/drivers/pinctrl/pinctrl-at91.h
+++ b/drivers/pinctrl/pinctrl-at91.h
@@ -69,4 +69,6 @@
 #define AT91SAM9X5_PIO_DRIVER1	0x114  /*PIO Driver 1 register offset*/
 #define AT91SAM9X5_PIO_DRIVER2	0x118  /*PIO Driver 2 register offset*/
=20
+#define SAM9X60_PIO_DRIVER1	0x118	/* PIO Driver 1 register offset */
+
 #endif
--=20
2.7.4
