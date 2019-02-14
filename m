From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH 5/8] ARM: at91: pm: add support for per SoC wakeup source
 configuration
Date: Thu, 14 Feb 2019 15:54:51 +0000
Message-ID: <1550159642-26878-6-git-send-email-claudiu.beznea@microchip.com>
References: <1550159642-26878-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550159642-26878-1-git-send-email-claudiu.beznea@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com, linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

Add support for per SoC wakeup source configuration. In this way
we could have per SoC wakeup sources, shutdown controller and power
management controller configurations for ULP1 power management mode.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/mach-at91/pm.c | 42 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index c83f78000ab3..27264caa4ec6 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -40,6 +40,9 @@ extern void at91_pinctrl_gpio_resume(void);
 #endif
=20
 struct at91_soc_pm {
+	int (*config_shdwc_ws)(void __iomem *shdwc, u32 *mode, u32 *polarity);
+	int (*config_pmc_ws)(void __iomem *pmc, u32 mode, u32 polarity);
+	const struct of_device_id *ws_ids;
 	struct at91_pm_data data;
 };
=20
@@ -122,7 +125,7 @@ static int at91_pm_config_ws(unsigned int pm_mode, bool=
 set)
 	if (pm_mode !=3D AT91_PM_ULP1)
 		return 0;
=20
-	if (!soc_pm.data.pmc || !soc_pm.data.shdwc)
+	if (!soc_pm.data.pmc || !soc_pm.data.shdwc || !soc_pm.ws_ids)
 		return -EPERM;
=20
 	if (!set) {
@@ -130,16 +133,14 @@ static int at91_pm_config_ws(unsigned int pm_mode, bo=
ol set)
 		return 0;
 	}
=20
-	/* SHDWC.WUIR */
-	val =3D readl(soc_pm.data.shdwc + 0x0c);
-	mode |=3D (val & 0x3ff);
-	polarity |=3D ((val >> 16) & 0x3ff);
+	if (soc_pm.config_shdwc_ws)
+		soc_pm.config_shdwc_ws(soc_pm.data.shdwc, &mode, &polarity);
=20
 	/* SHDWC.MR */
 	val =3D readl(soc_pm.data.shdwc + 0x04);
=20
 	/* Loop through defined wakeup sources. */
-	for_each_matching_node_and_match(np, sama5d2_ws_ids, &match) {
+	for_each_matching_node_and_match(np, soc_pm.ws_ids, &match) {
 		pdev =3D of_find_device_by_node(np);
 		if (!pdev)
 			continue;
@@ -161,8 +162,8 @@ static int at91_pm_config_ws(unsigned int pm_mode, bool=
 set)
 	}
=20
 	if (mode) {
-		writel(mode, soc_pm.data.pmc + AT91_PMC_FSMR);
-		writel(polarity, soc_pm.data.pmc + AT91_PMC_FSPR);
+		if (soc_pm.config_pmc_ws)
+			soc_pm.config_pmc_ws(soc_pm.data.pmc, mode, polarity);
 	} else {
 		pr_err("AT91: PM: no ULP1 wakeup sources found!");
 	}
@@ -170,6 +171,27 @@ static int at91_pm_config_ws(unsigned int pm_mode, boo=
l set)
 	return mode ? 0 : -EPERM;
 }
=20
+static int at91_sama5d2_config_shdwc_ws(void __iomem *shdwc, u32 *mode,
+					u32 *polarity)
+{
+	u32 val;
+
+	/* SHDWC.WUIR */
+	val =3D readl(shdwc + 0x0c);
+	*mode |=3D (val & 0x3ff);
+	*polarity |=3D ((val >> 16) & 0x3ff);
+
+	return 0;
+}
+
+static int at91_sama5d2_config_pmc_ws(void __iomem *pmc, u32 mode, u32 pol=
arity)
+{
+	writel(mode, pmc + AT91_PMC_FSMR);
+	writel(polarity, pmc + AT91_PMC_FSPR);
+
+	return 0;
+}
+
 /*
  * Called after processes are frozen, but before we shutdown devices.
  */
@@ -796,6 +818,10 @@ void __init sama5d2_pm_init(void)
=20
 	at91_pm_modes_init();
 	sama5_pm_init();
+
+	soc_pm.ws_ids =3D sama5d2_ws_ids;
+	soc_pm.config_shdwc_ws =3D at91_sama5d2_config_shdwc_ws;
+	soc_pm.config_pmc_ws =3D at91_sama5d2_config_pmc_ws;
 }
=20
 static int __init at91_pm_modes_select(char *str)
--=20
2.7.4
