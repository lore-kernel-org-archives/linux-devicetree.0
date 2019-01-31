From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH v2 6/7] pinctrl: at91: add slewrate support for SAM9X60
Date: Thu, 31 Jan 2019 16:18:20 +0000
Message-ID: <1548951466-26297-7-git-send-email-claudiu.beznea@microchip.com>
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

Add slew rate support for SAM9X60 pin controller.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/pinctrl/pinctrl-at91.c     | 48 ++++++++++++++++++++++++++++++++++=
++++
 drivers/pinctrl/pinctrl-at91.h     |  1 +
 include/dt-bindings/pinctrl/at91.h |  4 ++++
 3 files changed, 53 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.=
c
index 5456a2692b8c..2c6d3b61951f 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -59,6 +59,9 @@ static int gpio_banks;
 #define OUTPUT		(1 << 7)
 #define OUTPUT_VAL_SHIFT	8
 #define OUTPUT_VAL	(0x1 << OUTPUT_VAL_SHIFT)
+#define SLEWRATE_SHIFT	9
+#define SLEWRATE_MASK	0x1
+#define SLEWRATE	(SLEWRATE_MASK << SLEWRATE_SHIFT)
 #define DEBOUNCE	(1 << 16)
 #define DEBOUNCE_VAL_SHIFT	17
 #define DEBOUNCE_VAL	(0x3fff << DEBOUNCE_VAL_SHIFT)
@@ -82,6 +85,13 @@ enum drive_strength_bit {
 #define DRIVE_STRENGTH_BIT_MSK(name)	(DRIVE_STRENGTH_BIT_##name << \
 					 DRIVE_STRENGTH_SHIFT)
=20
+enum slewrate_bit {
+	SLEWRATE_BIT_DIS,
+	SLEWRATE_BIT_ENA,
+};
+
+#define SLEWRATE_BIT_MSK(name)		(SLEWRATE_BIT_##name << SLEWRATE_SHIFT)
+
 /**
  * struct at91_pmx_func - describes AT91 pinmux functions
  * @name: the name of this specific function
@@ -171,6 +181,8 @@ struct at91_pinctrl_mux_ops {
 	unsigned (*get_drivestrength)(void __iomem *pio, unsigned pin);
 	void (*set_drivestrength)(void __iomem *pio, unsigned pin,
 					u32 strength);
+	unsigned (*get_slewrate)(void __iomem *pio, unsigned pin);
+	void (*set_slewrate)(void __iomem *pio, unsigned pin, u32 slewrate);
 	/* irq */
 	int (*irq_type)(struct irq_data *d, unsigned type);
 };
@@ -585,6 +597,16 @@ static unsigned at91_mux_sam9x60_get_drivestrength(voi=
d __iomem *pio,
 	return DRIVE_STRENGTH_BIT_LOW;
 }
=20
+static unsigned at91_mux_sam9x60_get_slewrate(void __iomem *pio, unsigned =
pin)
+{
+	unsigned tmp =3D readl_relaxed(pio + SAM9X60_PIO_SLEWR);
+
+	if ((tmp & BIT(pin)))
+		return SLEWRATE_BIT_ENA;
+
+	return SLEWRATE_BIT_DIS;
+}
+
 static void set_drive_strength(void __iomem *reg, unsigned pin, u32 streng=
th)
 {
 	unsigned tmp =3D readl_relaxed(reg);
@@ -643,6 +665,24 @@ static void at91_mux_sam9x60_set_drivestrength(void __=
iomem *pio, unsigned pin,
 	writel_relaxed(tmp, pio + SAM9X60_PIO_DRIVER1);
 }
=20
+static void at91_mux_sam9x60_set_slewrate(void __iomem *pio, unsigned pin,
+					  u32 setting)
+{
+	unsigned int tmp;
+
+	if (setting < SLEWRATE_BIT_DIS || setting > SLEWRATE_BIT_ENA)
+		return;
+
+	tmp =3D readl_relaxed(pio + SAM9X60_PIO_SLEWR);
+
+	if (setting =3D=3D SLEWRATE_BIT_DIS)
+		tmp &=3D ~BIT(pin);
+	else
+		tmp |=3D BIT(pin);
+
+	writel_relaxed(tmp, pio + SAM9X60_PIO_SLEWR);
+}
+
 static struct at91_pinctrl_mux_ops at91rm9200_ops =3D {
 	.get_periph	=3D at91_mux_get_periph,
 	.mux_A_periph	=3D at91_mux_set_A_periph,
@@ -687,6 +727,8 @@ static const struct at91_pinctrl_mux_ops sam9x60_ops =
=3D {
 	.disable_schmitt_trig =3D at91_mux_pio3_disable_schmitt_trig,
 	.get_drivestrength =3D at91_mux_sam9x60_get_drivestrength,
 	.set_drivestrength =3D at91_mux_sam9x60_set_drivestrength,
+	.get_slewrate   =3D at91_mux_sam9x60_get_slewrate,
+	.set_slewrate   =3D at91_mux_sam9x60_set_slewrate,
 	.irq_type	=3D alt_gpio_irq_type,
=20
 };
@@ -950,6 +992,8 @@ static int at91_pinconf_get(struct pinctrl_dev *pctldev=
,
 	if (info->ops->get_drivestrength)
 		*config |=3D (info->ops->get_drivestrength(pio, pin)
 				<< DRIVE_STRENGTH_SHIFT);
+	if (info->ops->get_slewrate)
+		*config |=3D (info->ops->get_slewrate(pio, pin) << SLEWRATE_SHIFT);
 	if (at91_mux_get_output(pio, pin, &out))
 		*config |=3D OUTPUT | (out << OUTPUT_VAL_SHIFT);
=20
@@ -1001,6 +1045,9 @@ static int at91_pinconf_set(struct pinctrl_dev *pctld=
ev,
 			info->ops->set_drivestrength(pio, pin,
 				(config & DRIVE_STRENGTH)
 					>> DRIVE_STRENGTH_SHIFT);
+		if (info->ops->set_slewrate)
+			info->ops->set_slewrate(pio, pin,
+				(config & SLEWRATE) >> SLEWRATE_SHIFT);
=20
 	} /* for each config */
=20
@@ -1044,6 +1091,7 @@ static void at91_pinconf_dbg_show(struct pinctrl_dev =
*pctldev,
 			     DRIVE_STRENGTH_MED);
 	DBG_SHOW_FLAG_MASKED(DRIVE_STRENGTH, DRIVE_STRENGTH_BIT_MSK(HI),
 			     DRIVE_STRENGTH_HI);
+	DBG_SHOW_FLAG(SLEWRATE);
 	DBG_SHOW_FLAG(DEBOUNCE);
 	if (config & DEBOUNCE) {
 		val =3D config >> DEBOUNCE_VAL_SHIFT;
diff --git a/drivers/pinctrl/pinctrl-at91.h b/drivers/pinctrl/pinctrl-at91.=
h
index 19fc27e66bfd..223620f14b05 100644
--- a/drivers/pinctrl/pinctrl-at91.h
+++ b/drivers/pinctrl/pinctrl-at91.h
@@ -69,6 +69,7 @@
 #define AT91SAM9X5_PIO_DRIVER1	0x114  /*PIO Driver 1 register offset*/
 #define AT91SAM9X5_PIO_DRIVER2	0x118  /*PIO Driver 2 register offset*/
=20
+#define SAM9X60_PIO_SLEWR	0x110	/* PIO Slew Rate Control Register */
 #define SAM9X60_PIO_DRIVER1	0x118	/* PIO Driver 1 register offset */
=20
 #endif
diff --git a/include/dt-bindings/pinctrl/at91.h b/include/dt-bindings/pinct=
rl/at91.h
index eb81867eac77..8dc10e00c627 100644
--- a/include/dt-bindings/pinctrl/at91.h
+++ b/include/dt-bindings/pinctrl/at91.h
@@ -17,6 +17,7 @@
 #define AT91_PINCTRL_DIS_SCHMIT		(1 << 4)
 #define AT91_PINCTRL_OUTPUT		(1 << 7)
 #define AT91_PINCTRL_OUTPUT_VAL(x)	((x & 0x1) << 8)
+#define AT91_PINCTRL_SLEWRATE		(1 << 9)
 #define AT91_PINCTRL_DEBOUNCE		(1 << 16)
 #define AT91_PINCTRL_DEBOUNCE_VAL(x)	(x << 17)
=20
@@ -27,6 +28,9 @@
 #define AT91_PINCTRL_DRIVE_STRENGTH_MED			(0x2 << 5)
 #define AT91_PINCTRL_DRIVE_STRENGTH_HI			(0x3 << 5)
=20
+#define AT91_PINCTRL_SLEWRATE_DIS	(0x0 << 9)
+#define AT91_PINCTRL_SLEWRATE_ENA	(0x1 << 9)
+
 #define AT91_PIOA	0
 #define AT91_PIOB	1
 #define AT91_PIOC	2
--=20
2.7.4
