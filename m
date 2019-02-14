From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH 1/2] clk: at91: sckc: adapt sckc driver to work for SAM9X60
Date: Thu, 14 Feb 2019 10:39:41 +0000
Message-ID: <1550140748-21714-2-git-send-email-claudiu.beznea@microchip.com>
References: <1550140748-21714-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550140748-21714-1-git-send-email-claudiu.beznea@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

SAM9X60 uses different bit offsets in registers. Adapt the driver to work
also for SAM9X60.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/clk/at91/sckc.c | 142 ++++++++++++++++++++++++++++++++++++--------=
----
 1 file changed, 107 insertions(+), 35 deletions(-)

diff --git a/drivers/clk/at91/sckc.c b/drivers/clk/at91/sckc.c
index ab6ecefc49ad..aaef29dacbb5 100644
--- a/drivers/clk/at91/sckc.c
+++ b/drivers/clk/at91/sckc.c
@@ -22,15 +22,25 @@
 #define SLOWCK_SW_TIME_USEC	((SLOWCK_SW_CYCLES * USEC_PER_SEC) / \
 				 SLOW_CLOCK_FREQ)
=20
-#define	AT91_SCKC_CR			0x00
-#define		AT91_SCKC_RCEN		(1 << 0)
-#define		AT91_SCKC_OSC32EN	(1 << 1)
-#define		AT91_SCKC_OSC32BYP	(1 << 2)
-#define		AT91_SCKC_OSCSEL	(1 << 3)
+#define	AT91_SCKC_CR		0x00
+#define		AT91_SCKC_RCEN(off)	(1 << (off)->cr_rcen)
+#define		AT91_SCKC_OSC32EN(off)	(1 << (off)->cr_osc32en)
+#define		AT91_SCKC_OSC32BYP(off)	(1 << (off)->cr_osc32byp)
+#define		AT91_SCKC_OSCSEL(off)	(1 << (off)->cr_oscsel)
+
+#define AT91_SCKC_OFFSET_INVALID        (32)
+
+struct clk_slow_offsets {
+	u8 cr_rcen;
+	u8 cr_osc32en;
+	u8 cr_osc32byp;
+	u8 cr_oscsel;
+};
=20
 struct clk_slow_osc {
 	struct clk_hw hw;
 	void __iomem *sckcr;
+	const struct clk_slow_offsets *offsets;
 	unsigned long startup_usec;
 };
=20
@@ -39,6 +49,7 @@ struct clk_slow_osc {
 struct clk_sama5d4_slow_osc {
 	struct clk_hw hw;
 	void __iomem *sckcr;
+	const struct clk_slow_offsets *offsets;
 	unsigned long startup_usec;
 	bool prepared;
 };
@@ -48,6 +59,7 @@ struct clk_sama5d4_slow_osc {
 struct clk_slow_rc_osc {
 	struct clk_hw hw;
 	void __iomem *sckcr;
+	const struct clk_slow_offsets *offsets;
 	unsigned long frequency;
 	unsigned long accuracy;
 	unsigned long startup_usec;
@@ -58,6 +70,7 @@ struct clk_slow_rc_osc {
 struct clk_sam9x5_slow {
 	struct clk_hw hw;
 	void __iomem *sckcr;
+	const struct clk_slow_offsets *offsets;
 	u8 parent;
 };
=20
@@ -69,10 +82,11 @@ static int clk_slow_osc_prepare(struct clk_hw *hw)
 	void __iomem *sckcr =3D osc->sckcr;
 	u32 tmp =3D readl(sckcr);
=20
-	if (tmp & (AT91_SCKC_OSC32BYP | AT91_SCKC_OSC32EN))
+	if (tmp & (AT91_SCKC_OSC32BYP(osc->offsets) |
+		   AT91_SCKC_OSC32EN(osc->offsets)))
 		return 0;
=20
-	writel(tmp | AT91_SCKC_OSC32EN, sckcr);
+	writel(tmp | AT91_SCKC_OSC32EN(osc->offsets), sckcr);
=20
 	usleep_range(osc->startup_usec, osc->startup_usec + 1);
=20
@@ -85,10 +99,10 @@ static void clk_slow_osc_unprepare(struct clk_hw *hw)
 	void __iomem *sckcr =3D osc->sckcr;
 	u32 tmp =3D readl(sckcr);
=20
-	if (tmp & AT91_SCKC_OSC32BYP)
+	if (tmp & AT91_SCKC_OSC32BYP(osc->offsets))
 		return;
=20
-	writel(tmp & ~AT91_SCKC_OSC32EN, sckcr);
+	writel(tmp & ~AT91_SCKC_OSC32EN(osc->offsets), sckcr);
 }
=20
 static int clk_slow_osc_is_prepared(struct clk_hw *hw)
@@ -97,10 +111,10 @@ static int clk_slow_osc_is_prepared(struct clk_hw *hw)
 	void __iomem *sckcr =3D osc->sckcr;
 	u32 tmp =3D readl(sckcr);
=20
-	if (tmp & AT91_SCKC_OSC32BYP)
+	if (tmp & AT91_SCKC_OSC32BYP(osc->offsets))
 		return 1;
=20
-	return !!(tmp & AT91_SCKC_OSC32EN);
+	return !!(tmp & AT91_SCKC_OSC32EN(osc->offsets));
 }
=20
 static const struct clk_ops slow_osc_ops =3D {
@@ -114,7 +128,8 @@ at91_clk_register_slow_osc(void __iomem *sckcr,
 			   const char *name,
 			   const char *parent_name,
 			   unsigned long startup,
-			   bool bypass)
+			   bool bypass,
+			   const struct clk_slow_offsets *offsets)
 {
 	struct clk_slow_osc *osc;
 	struct clk_hw *hw;
@@ -137,9 +152,11 @@ at91_clk_register_slow_osc(void __iomem *sckcr,
 	osc->hw.init =3D &init;
 	osc->sckcr =3D sckcr;
 	osc->startup_usec =3D startup;
+	osc->offsets =3D offsets;
=20
 	if (bypass)
-		writel((readl(sckcr) & ~AT91_SCKC_OSC32EN) | AT91_SCKC_OSC32BYP,
+		writel((readl(sckcr) & ~AT91_SCKC_OSC32EN(osc->offsets)) |
+					AT91_SCKC_OSC32BYP(osc->offsets),
 		       sckcr);
=20
 	hw =3D &osc->hw;
@@ -153,7 +170,8 @@ at91_clk_register_slow_osc(void __iomem *sckcr,
 }
=20
 static void __init
-of_at91sam9x5_clk_slow_osc_setup(struct device_node *np, void __iomem *sck=
cr)
+of_at91sam9x5_clk_slow_osc_setup(struct device_node *np, void __iomem *sck=
cr,
+				 const struct clk_slow_offsets *offsets)
 {
 	struct clk_hw *hw;
 	const char *parent_name;
@@ -167,7 +185,7 @@ of_at91sam9x5_clk_slow_osc_setup(struct device_node *np=
, void __iomem *sckcr)
 	bypass =3D of_property_read_bool(np, "atmel,osc-bypass");
=20
 	hw =3D at91_clk_register_slow_osc(sckcr, name, parent_name, startup,
-					 bypass);
+					bypass, offsets);
 	if (IS_ERR(hw))
 		return;
=20
@@ -195,7 +213,7 @@ static int clk_slow_rc_osc_prepare(struct clk_hw *hw)
 	struct clk_slow_rc_osc *osc =3D to_clk_slow_rc_osc(hw);
 	void __iomem *sckcr =3D osc->sckcr;
=20
-	writel(readl(sckcr) | AT91_SCKC_RCEN, sckcr);
+	writel(readl(sckcr) | AT91_SCKC_RCEN(osc->offsets), sckcr);
=20
 	usleep_range(osc->startup_usec, osc->startup_usec + 1);
=20
@@ -207,14 +225,14 @@ static void clk_slow_rc_osc_unprepare(struct clk_hw *=
hw)
 	struct clk_slow_rc_osc *osc =3D to_clk_slow_rc_osc(hw);
 	void __iomem *sckcr =3D osc->sckcr;
=20
-	writel(readl(sckcr) & ~AT91_SCKC_RCEN, sckcr);
+	writel(readl(sckcr) & ~AT91_SCKC_RCEN(osc->offsets), sckcr);
 }
=20
 static int clk_slow_rc_osc_is_prepared(struct clk_hw *hw)
 {
 	struct clk_slow_rc_osc *osc =3D to_clk_slow_rc_osc(hw);
=20
-	return !!(readl(osc->sckcr) & AT91_SCKC_RCEN);
+	return !!(readl(osc->sckcr) & AT91_SCKC_RCEN(osc->offsets));
 }
=20
 static const struct clk_ops slow_rc_osc_ops =3D {
@@ -230,7 +248,8 @@ at91_clk_register_slow_rc_osc(void __iomem *sckcr,
 			      const char *name,
 			      unsigned long frequency,
 			      unsigned long accuracy,
-			      unsigned long startup)
+			      unsigned long startup,
+			      const struct clk_slow_offsets *offsets)
 {
 	struct clk_slow_rc_osc *osc;
 	struct clk_hw *hw;
@@ -252,6 +271,7 @@ at91_clk_register_slow_rc_osc(void __iomem *sckcr,
=20
 	osc->hw.init =3D &init;
 	osc->sckcr =3D sckcr;
+	osc->offsets =3D offsets;
 	osc->frequency =3D frequency;
 	osc->accuracy =3D accuracy;
 	osc->startup_usec =3D startup;
@@ -267,7 +287,8 @@ at91_clk_register_slow_rc_osc(void __iomem *sckcr,
 }
=20
 static void __init
-of_at91sam9x5_clk_slow_rc_osc_setup(struct device_node *np, void __iomem *=
sckcr)
+of_at91sam9x5_clk_slow_rc_osc_setup(struct device_node *np, void __iomem *=
sckcr,
+				    const struct clk_slow_offsets *offsets)
 {
 	struct clk_hw *hw;
 	u32 frequency =3D 0;
@@ -281,7 +302,7 @@ of_at91sam9x5_clk_slow_rc_osc_setup(struct device_node =
*np, void __iomem *sckcr)
 	of_property_read_u32(np, "atmel,startup-time-usec", &startup);
=20
 	hw =3D at91_clk_register_slow_rc_osc(sckcr, name, frequency, accuracy,
-					    startup);
+					   startup, offsets);
 	if (IS_ERR(hw))
 		return;
=20
@@ -299,14 +320,14 @@ static int clk_sam9x5_slow_set_parent(struct clk_hw *=
hw, u8 index)
=20
 	tmp =3D readl(sckcr);
=20
-	if ((!index && !(tmp & AT91_SCKC_OSCSEL)) ||
-	    (index && (tmp & AT91_SCKC_OSCSEL)))
+	if ((!index && !(tmp & AT91_SCKC_OSCSEL(slowck->offsets))) ||
+	    (index && (tmp & AT91_SCKC_OSCSEL(slowck->offsets))))
 		return 0;
=20
 	if (index)
-		tmp |=3D AT91_SCKC_OSCSEL;
+		tmp |=3D AT91_SCKC_OSCSEL(slowck->offsets);
 	else
-		tmp &=3D ~AT91_SCKC_OSCSEL;
+		tmp &=3D ~AT91_SCKC_OSCSEL(slowck->offsets);
=20
 	writel(tmp, sckcr);
=20
@@ -319,7 +340,7 @@ static u8 clk_sam9x5_slow_get_parent(struct clk_hw *hw)
 {
 	struct clk_sam9x5_slow *slowck =3D to_clk_sam9x5_slow(hw);
=20
-	return !!(readl(slowck->sckcr) & AT91_SCKC_OSCSEL);
+	return !!(readl(slowck->sckcr) & AT91_SCKC_OSCSEL(slowck->offsets));
 }
=20
 static const struct clk_ops sam9x5_slow_ops =3D {
@@ -331,7 +352,8 @@ static struct clk_hw * __init
 at91_clk_register_sam9x5_slow(void __iomem *sckcr,
 			      const char *name,
 			      const char **parent_names,
-			      int num_parents)
+			      int num_parents,
+			      const struct clk_slow_offsets *offsets)
 {
 	struct clk_sam9x5_slow *slowck;
 	struct clk_hw *hw;
@@ -353,7 +375,8 @@ at91_clk_register_sam9x5_slow(void __iomem *sckcr,
=20
 	slowck->hw.init =3D &init;
 	slowck->sckcr =3D sckcr;
-	slowck->parent =3D !!(readl(sckcr) & AT91_SCKC_OSCSEL);
+	slowck->offsets =3D offsets;
+	slowck->parent =3D !!(readl(sckcr) & AT91_SCKC_OSCSEL(slowck->offsets));
=20
 	hw =3D &slowck->hw;
 	ret =3D clk_hw_register(NULL, &slowck->hw);
@@ -366,7 +389,8 @@ at91_clk_register_sam9x5_slow(void __iomem *sckcr,
 }
=20
 static void __init
-of_at91sam9x5_clk_slow_setup(struct device_node *np, void __iomem *sckcr)
+of_at91sam9x5_clk_slow_setup(struct device_node *np, void __iomem *sckcr,
+			     const struct clk_slow_offsets *offsets)
 {
 	struct clk_hw *hw;
 	const char *parent_names[2];
@@ -382,7 +406,7 @@ of_at91sam9x5_clk_slow_setup(struct device_node *np, vo=
id __iomem *sckcr)
 	of_property_read_string(np, "clock-output-names", &name);
=20
 	hw =3D at91_clk_register_sam9x5_slow(sckcr, name, parent_names,
-					    num_parents);
+					   num_parents, offsets);
 	if (IS_ERR(hw))
 		return;
=20
@@ -406,10 +430,18 @@ static const struct of_device_id sckc_clk_ids[] __ini=
tconst =3D {
 	{ /*sentinel*/ }
 };
=20
+static const struct clk_slow_offsets at91sam9x5_offsets =3D {
+	.cr_rcen =3D 0,
+	.cr_osc32en =3D 1,
+	.cr_osc32byp =3D 2,
+	.cr_oscsel =3D 3,
+};
+
 static void __init of_at91sam9x5_sckc_setup(struct device_node *np)
 {
 	struct device_node *childnp;
-	void (*clk_setup)(struct device_node *, void __iomem *);
+	void (*clk_setup)(struct device_node *np, void __iomem *io,
+			  const struct clk_slow_offsets *offsets);
 	const struct of_device_id *clk_id;
 	void __iomem *regbase =3D of_iomap(np, 0);
=20
@@ -421,12 +453,42 @@ static void __init of_at91sam9x5_sckc_setup(struct de=
vice_node *np)
 		if (!clk_id)
 			continue;
 		clk_setup =3D clk_id->data;
-		clk_setup(childnp, regbase);
+		clk_setup(childnp, regbase, &at91sam9x5_offsets);
 	}
 }
 CLK_OF_DECLARE(at91sam9x5_clk_sckc, "atmel,at91sam9x5-sckc",
 	       of_at91sam9x5_sckc_setup);
=20
+static const struct clk_slow_offsets at91sam9x60_offsets =3D {
+	.cr_rcen =3D AT91_SCKC_OFFSET_INVALID,
+	.cr_osc32en =3D 1,
+	.cr_osc32byp =3D 2,
+	.cr_oscsel =3D 24,
+};
+
+static void __init of_at91sam9x60_sckc_setup(struct device_node *np)
+{
+	struct device_node *childnp;
+	void (*clk_setup)(struct device_node *np, void __iomem *io,
+			  const struct clk_slow_offsets *offsets);
+	const struct of_device_id *clk_id;
+	void __iomem *regbase =3D of_iomap(np, 0);
+
+	if (!regbase)
+		return;
+
+	for_each_child_of_node(np, childnp) {
+		clk_id =3D of_match_node(sckc_clk_ids, childnp);
+		if (!clk_id)
+			continue;
+		clk_setup =3D clk_id->data;
+		clk_setup(childnp, regbase, &at91sam9x60_offsets);
+	}
+}
+
+CLK_OF_DECLARE(at91sam9x60_clk_sckc, "microchip,at91sam9x60-sckc",
+	       of_at91sam9x60_sckc_setup);
+
 static int clk_sama5d4_slow_osc_prepare(struct clk_hw *hw)
 {
 	struct clk_sama5d4_slow_osc *osc =3D to_clk_sama5d4_slow_osc(hw);
@@ -438,7 +500,7 @@ static int clk_sama5d4_slow_osc_prepare(struct clk_hw *=
hw)
 	 * Assume that if it has already been selected (for example by the
 	 * bootloader), enough time has aready passed.
 	 */
-	if ((readl(osc->sckcr) & AT91_SCKC_OSCSEL)) {
+	if ((readl(osc->sckcr) & AT91_SCKC_OSCSEL(osc->offsets))) {
 		osc->prepared =3D true;
 		return 0;
 	}
@@ -461,6 +523,13 @@ static const struct clk_ops sama5d4_slow_osc_ops =3D {
 	.is_prepared =3D clk_sama5d4_slow_osc_is_prepared,
 };
=20
+static const struct clk_slow_offsets at91sama5d4_offsets =3D {
+	.cr_rcen =3D AT91_SCKC_OFFSET_INVALID,
+	.cr_osc32en =3D AT91_SCKC_OFFSET_INVALID,
+	.cr_osc32byp =3D AT91_SCKC_OFFSET_INVALID,
+	.cr_oscsel =3D 3,
+};
+
 static void __init of_sama5d4_sckc_setup(struct device_node *np)
 {
 	void __iomem *regbase =3D of_iomap(np, 0);
@@ -498,9 +567,11 @@ static void __init of_sama5d4_sckc_setup(struct device=
_node *np)
 	osc->hw.init =3D &init;
 	osc->sckcr =3D regbase;
 	osc->startup_usec =3D 1200000;
+	osc->offsets =3D &at91sama5d4_offsets;
=20
 	if (bypass)
-		writel((readl(regbase) | AT91_SCKC_OSC32BYP), regbase);
+		writel((readl(regbase) | AT91_SCKC_OSC32BYP(osc->offsets)),
+		       regbase);
=20
 	hw =3D &osc->hw;
 	ret =3D clk_hw_register(NULL, &osc->hw);
@@ -509,7 +580,8 @@ static void __init of_sama5d4_sckc_setup(struct device_=
node *np)
 		return;
 	}
=20
-	hw =3D at91_clk_register_sam9x5_slow(regbase, "slowck", parent_names, 2);
+	hw =3D at91_clk_register_sam9x5_slow(regbase, "slowck", parent_names, 2,
+					   &at91sama5d4_offsets);
 	if (IS_ERR(hw))
 		return;
=20
--=20
2.7.4
