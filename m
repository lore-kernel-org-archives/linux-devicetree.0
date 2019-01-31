From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH v2 1/7] pinctrl: at91: add option to use drive strength bits
Date: Thu, 31 Jan 2019 16:18:04 +0000
Message-ID: <1548951466-26297-2-git-send-email-claudiu.beznea@microchip.com>
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

SAM9X60 uses high and low drive strengths. To implement this, in
at91_pinctrl_mux_ops::set_drivestrength and
at91_pinctrl_mux_ops::get_drivestrength we need bit numbers of
drive strengths (1 for low, 2 for high), thus change the code to
allow the usage of drive strength bit numbers.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/pinctrl/pinctrl-at91.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.=
c
index 3d49bbbcdbc7..31f06dafca2e 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -72,10 +72,15 @@ static int gpio_banks;
  * DRIVE_STRENGTH_DEFAULT is just a placeholder to avoid changing the driv=
e
  * strength when there is no dt config for it.
  */
-#define DRIVE_STRENGTH_DEFAULT		(0 << DRIVE_STRENGTH_SHIFT)
-#define DRIVE_STRENGTH_LOW          (1 << DRIVE_STRENGTH_SHIFT)
-#define DRIVE_STRENGTH_MED          (2 << DRIVE_STRENGTH_SHIFT)
-#define DRIVE_STRENGTH_HI           (3 << DRIVE_STRENGTH_SHIFT)
+enum drive_strength_bit {
+	DRIVE_STRENGTH_BIT_DEF,
+	DRIVE_STRENGTH_BIT_LOW,
+	DRIVE_STRENGTH_BIT_MED,
+	DRIVE_STRENGTH_BIT_HI,
+};
+
+#define DRIVE_STRENGTH_BIT_MSK(name)	(DRIVE_STRENGTH_BIT_##name << \
+					 DRIVE_STRENGTH_SHIFT)
=20
 /**
  * struct at91_pmx_func - describes AT91 pinmux functions
@@ -551,7 +556,7 @@ static unsigned at91_mux_sama5d3_get_drivestrength(void=
 __iomem *pio,
 	/* SAMA5 strength is 1:1 with our defines,
 	 * except 0 is equivalent to low per datasheet */
 	if (!tmp)
-		tmp =3D DRIVE_STRENGTH_LOW;
+		tmp =3D DRIVE_STRENGTH_BIT_MSK(LOW);
=20
 	return tmp;
 }
@@ -564,7 +569,7 @@ static unsigned at91_mux_sam9x5_get_drivestrength(void =
__iomem *pio,
=20
 	/* strength is inverse in SAM9x5s hardware with the pinctrl defines
 	 * hardware: 0 =3D hi, 1 =3D med, 2 =3D low, 3 =3D rsvd */
-	tmp =3D DRIVE_STRENGTH_HI - tmp;
+	tmp =3D DRIVE_STRENGTH_BIT_MSK(HI) - tmp;
=20
 	return tmp;
 }
@@ -600,7 +605,7 @@ static void at91_mux_sam9x5_set_drivestrength(void __io=
mem *pio, unsigned pin,
=20
 	/* strength is inverse on SAM9x5s with our defines
 	 * 0 =3D hi, 1 =3D med, 2 =3D low, 3 =3D rsvd */
-	setting =3D DRIVE_STRENGTH_HI - setting;
+	setting =3D DRIVE_STRENGTH_BIT_MSK(HI) - setting;
=20
 	set_drive_strength(pio + at91sam9x5_get_drive_register(pin), pin,
 				setting);
@@ -959,11 +964,11 @@ static int at91_pinconf_set(struct pinctrl_dev *pctld=
ev,
 	}					\
 } while (0)
=20
-#define DBG_SHOW_FLAG_MASKED(mask,flag) do {	\
+#define DBG_SHOW_FLAG_MASKED(mask,flag,name) do {	\
 	if ((config & mask) =3D=3D flag) {		\
 		if (num_conf)			\
 			seq_puts(s, "|");	\
-		seq_puts(s, #flag);		\
+		seq_puts(s, #name);		\
 		num_conf++;			\
 	}					\
 } while (0)
@@ -981,9 +986,12 @@ static void at91_pinconf_dbg_show(struct pinctrl_dev *=
pctldev,
 	DBG_SHOW_FLAG(PULL_DOWN);
 	DBG_SHOW_FLAG(DIS_SCHMIT);
 	DBG_SHOW_FLAG(DEGLITCH);
-	DBG_SHOW_FLAG_MASKED(DRIVE_STRENGTH, DRIVE_STRENGTH_LOW);
-	DBG_SHOW_FLAG_MASKED(DRIVE_STRENGTH, DRIVE_STRENGTH_MED);
-	DBG_SHOW_FLAG_MASKED(DRIVE_STRENGTH, DRIVE_STRENGTH_HI);
+	DBG_SHOW_FLAG_MASKED(DRIVE_STRENGTH, DRIVE_STRENGTH_BIT_MSK(LOW),
+			     DRIVE_STRENGTH_LOW);
+	DBG_SHOW_FLAG_MASKED(DRIVE_STRENGTH, DRIVE_STRENGTH_BIT_MSK(MED),
+			     DRIVE_STRENGTH_MED);
+	DBG_SHOW_FLAG_MASKED(DRIVE_STRENGTH, DRIVE_STRENGTH_BIT_MSK(HI),
+			     DRIVE_STRENGTH_HI);
 	DBG_SHOW_FLAG(DEBOUNCE);
 	if (config & DEBOUNCE) {
 		val =3D config >> DEBOUNCE_VAL_SHIFT;
--=20
2.7.4
