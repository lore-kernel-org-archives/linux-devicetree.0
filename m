From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH 1/8] ARM: at91: pm: introduce at91_soc_pm structure
Date: Thu, 14 Feb 2019 15:54:31 +0000
Message-ID: <1550159642-26878-2-git-send-email-claudiu.beznea@microchip.com>
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

To have per SoC PM information add a new structure which embed
a member of type struct at91_pm_data. This will allow easy addition
of new information without contaminate struct at91_pm_data that is
passed to the last phase suspend function (at91_suspend_sram_fn).

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/mach-at91/pm.c | 118 +++++++++++++++++++++++++-------------------=
----
 1 file changed, 62 insertions(+), 56 deletions(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index 51e808adb00c..ce2ff86968f6 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -39,6 +39,17 @@ extern void at91_pinctrl_gpio_suspend(void);
 extern void at91_pinctrl_gpio_resume(void);
 #endif
=20
+struct at91_soc_pm {
+	struct at91_pm_data data;
+};
+
+static struct at91_soc_pm soc_pm =3D {
+	.data =3D {
+		.standby_mode =3D AT91_PM_STANDBY,
+		.suspend_mode =3D AT91_PM_ULP0,
+	},
+};
+
 static const match_table_t pm_modes __initconst =3D {
 	{ AT91_PM_STANDBY, "standby" },
 	{ AT91_PM_ULP0, "ulp0" },
@@ -47,16 +58,11 @@ static const match_table_t pm_modes __initconst =3D {
 	{ -1, NULL },
 };
=20
-static struct at91_pm_data pm_data =3D {
-	.standby_mode =3D AT91_PM_STANDBY,
-	.suspend_mode =3D AT91_PM_ULP0,
-};
-
 #define at91_ramc_read(id, field) \
-	__raw_readl(pm_data.ramc[id] + field)
+	__raw_readl(soc_pm.data.ramc[id] + field)
=20
 #define at91_ramc_write(id, field, value) \
-	__raw_writel(value, pm_data.ramc[id] + field)
+	__raw_writel(value, soc_pm.data.ramc[id] + field)
=20
 static int at91_pm_valid_state(suspend_state_t state)
 {
@@ -116,21 +122,21 @@ static int at91_pm_config_ws(unsigned int pm_mode, bo=
ol set)
 	if (pm_mode !=3D AT91_PM_ULP1)
 		return 0;
=20
-	if (!pm_data.pmc || !pm_data.shdwc)
+	if (!soc_pm.data.pmc || !soc_pm.data.shdwc)
 		return -EPERM;
=20
 	if (!set) {
-		writel(mode, pm_data.pmc + AT91_PMC_FSMR);
+		writel(mode, soc_pm.data.pmc + AT91_PMC_FSMR);
 		return 0;
 	}
=20
 	/* SHDWC.WUIR */
-	val =3D readl(pm_data.shdwc + 0x0c);
+	val =3D readl(soc_pm.data.shdwc + 0x0c);
 	mode |=3D (val & 0x3ff);
 	polarity |=3D ((val >> 16) & 0x3ff);
=20
 	/* SHDWC.MR */
-	val =3D readl(pm_data.shdwc + 0x04);
+	val =3D readl(soc_pm.data.shdwc + 0x04);
=20
 	/* Loop through defined wakeup sources. */
 	for_each_matching_node_and_match(np, sama5d2_ws_ids, &match) {
@@ -155,8 +161,8 @@ static int at91_pm_config_ws(unsigned int pm_mode, bool=
 set)
 	}
=20
 	if (mode) {
-		writel(mode, pm_data.pmc + AT91_PMC_FSMR);
-		writel(polarity, pm_data.pmc + AT91_PMC_FSPR);
+		writel(mode, soc_pm.data.pmc + AT91_PMC_FSMR);
+		writel(polarity, soc_pm.data.pmc + AT91_PMC_FSPR);
 	} else {
 		pr_err("AT91: PM: no ULP1 wakeup sources found!");
 	}
@@ -171,18 +177,18 @@ static int at91_pm_begin(suspend_state_t state)
 {
 	switch (state) {
 	case PM_SUSPEND_MEM:
-		pm_data.mode =3D pm_data.suspend_mode;
+		soc_pm.data.mode =3D soc_pm.data.suspend_mode;
 		break;
=20
 	case PM_SUSPEND_STANDBY:
-		pm_data.mode =3D pm_data.standby_mode;
+		soc_pm.data.mode =3D soc_pm.data.standby_mode;
 		break;
=20
 	default:
-		pm_data.mode =3D -1;
+		soc_pm.data.mode =3D -1;
 	}
=20
-	return at91_pm_config_ws(pm_data.mode, true);
+	return at91_pm_config_ws(soc_pm.data.mode, true);
 }
=20
 /*
@@ -194,10 +200,10 @@ static int at91_pm_verify_clocks(void)
 	unsigned long scsr;
 	int i;
=20
-	scsr =3D readl(pm_data.pmc + AT91_PMC_SCSR);
+	scsr =3D readl(soc_pm.data.pmc + AT91_PMC_SCSR);
=20
 	/* USB must not be using PLLB */
-	if ((scsr & pm_data.uhp_udp_mask) !=3D 0) {
+	if ((scsr & soc_pm.data.uhp_udp_mask) !=3D 0) {
 		pr_err("AT91: PM - Suspend-to-RAM with USB still active\n");
 		return 0;
 	}
@@ -208,7 +214,7 @@ static int at91_pm_verify_clocks(void)
=20
 		if ((scsr & (AT91_PMC_PCK0 << i)) =3D=3D 0)
 			continue;
-		css =3D readl(pm_data.pmc + AT91_PMC_PCKR(i)) & AT91_PMC_CSS;
+		css =3D readl(soc_pm.data.pmc + AT91_PMC_PCKR(i)) & AT91_PMC_CSS;
 		if (css !=3D AT91_PMC_CSS_SLOW) {
 			pr_err("AT91: PM - Suspend-to-RAM with PCK%d src %d\n", i, css);
 			return 0;
@@ -230,7 +236,7 @@ static int at91_pm_verify_clocks(void)
  */
 int at91_suspend_entering_slow_clock(void)
 {
-	return (pm_data.mode >=3D AT91_PM_ULP0);
+	return (soc_pm.data.mode >=3D AT91_PM_ULP0);
 }
 EXPORT_SYMBOL(at91_suspend_entering_slow_clock);
=20
@@ -243,14 +249,14 @@ static int at91_suspend_finish(unsigned long val)
 	flush_cache_all();
 	outer_disable();
=20
-	at91_suspend_sram_fn(&pm_data);
+	at91_suspend_sram_fn(&soc_pm.data);
=20
 	return 0;
 }
=20
 static void at91_pm_suspend(suspend_state_t state)
 {
-	if (pm_data.mode =3D=3D AT91_PM_BACKUP) {
+	if (soc_pm.data.mode =3D=3D AT91_PM_BACKUP) {
 		pm_bu->suspended =3D 1;
=20
 		cpu_suspend(0, at91_suspend_finish);
@@ -289,7 +295,7 @@ static int at91_pm_enter(suspend_state_t state)
 		/*
 		 * Ensure that clocks are in a valid state.
 		 */
-		if (pm_data.mode >=3D AT91_PM_ULP0 &&
+		if (soc_pm.data.mode >=3D AT91_PM_ULP0 &&
 		    !at91_pm_verify_clocks())
 			goto error;
=20
@@ -318,7 +324,7 @@ static int at91_pm_enter(suspend_state_t state)
  */
 static void at91_pm_end(void)
 {
-	at91_pm_config_ws(pm_data.mode, false);
+	at91_pm_config_ws(soc_pm.data.mode, false);
 }
=20
=20
@@ -351,7 +357,7 @@ static void at91rm9200_standby(void)
 		"    str    %2, [%1, %3]\n\t"
 		"    mcr    p15, 0, %0, c7, c0, 4\n\t"
 		:
-		: "r" (0), "r" (pm_data.ramc[0]),
+		: "r" (0), "r" (soc_pm.data.ramc[0]),
 		  "r" (1), "r" (AT91_MC_SDRAMC_SRR));
 }
=20
@@ -374,7 +380,7 @@ static void at91_ddr_standby(void)
 		at91_ramc_write(0, AT91_DDRSDRC_MDR, mdr);
 	}
=20
-	if (pm_data.ramc[1]) {
+	if (soc_pm.data.ramc[1]) {
 		saved_lpr1 =3D at91_ramc_read(1, AT91_DDRSDRC_LPR);
 		lpr1 =3D saved_lpr1 & ~AT91_DDRSDRC_LPCB;
 		lpr1 |=3D AT91_DDRSDRC_LPCB_SELF_REFRESH;
@@ -392,14 +398,14 @@ static void at91_ddr_standby(void)
=20
 	/* self-refresh mode now */
 	at91_ramc_write(0, AT91_DDRSDRC_LPR, lpr0);
-	if (pm_data.ramc[1])
+	if (soc_pm.data.ramc[1])
 		at91_ramc_write(1, AT91_DDRSDRC_LPR, lpr1);
=20
 	cpu_do_idle();
=20
 	at91_ramc_write(0, AT91_DDRSDRC_MDR, saved_mdr0);
 	at91_ramc_write(0, AT91_DDRSDRC_LPR, saved_lpr0);
-	if (pm_data.ramc[1]) {
+	if (soc_pm.data.ramc[1]) {
 		at91_ramc_write(0, AT91_DDRSDRC_MDR, saved_mdr1);
 		at91_ramc_write(1, AT91_DDRSDRC_LPR, saved_lpr1);
 	}
@@ -429,7 +435,7 @@ static void at91sam9_sdram_standby(void)
 	u32 lpr0, lpr1 =3D 0;
 	u32 saved_lpr0, saved_lpr1 =3D 0;
=20
-	if (pm_data.ramc[1]) {
+	if (soc_pm.data.ramc[1]) {
 		saved_lpr1 =3D at91_ramc_read(1, AT91_SDRAMC_LPR);
 		lpr1 =3D saved_lpr1 & ~AT91_SDRAMC_LPCB;
 		lpr1 |=3D AT91_SDRAMC_LPCB_SELF_REFRESH;
@@ -441,13 +447,13 @@ static void at91sam9_sdram_standby(void)
=20
 	/* self-refresh mode now */
 	at91_ramc_write(0, AT91_SDRAMC_LPR, lpr0);
-	if (pm_data.ramc[1])
+	if (soc_pm.data.ramc[1])
 		at91_ramc_write(1, AT91_SDRAMC_LPR, lpr1);
=20
 	cpu_do_idle();
=20
 	at91_ramc_write(0, AT91_SDRAMC_LPR, saved_lpr0);
-	if (pm_data.ramc[1])
+	if (soc_pm.data.ramc[1])
 		at91_ramc_write(1, AT91_SDRAMC_LPR, saved_lpr1);
 }
=20
@@ -480,14 +486,14 @@ static __init void at91_dt_ramc(void)
 	const struct ramc_info *ramc;
=20
 	for_each_matching_node_and_match(np, ramc_ids, &of_id) {
-		pm_data.ramc[idx] =3D of_iomap(np, 0);
-		if (!pm_data.ramc[idx])
+		soc_pm.data.ramc[idx] =3D of_iomap(np, 0);
+		if (!soc_pm.data.ramc[idx])
 			panic(pr_fmt("unable to map ramc[%d] cpu registers\n"), idx);
=20
 		ramc =3D of_id->data;
 		if (!standby)
 			standby =3D ramc->idle;
-		pm_data.memctrl =3D ramc->memctrl;
+		soc_pm.data.memctrl =3D ramc->memctrl;
=20
 		idx++;
 	}
@@ -509,12 +515,12 @@ static void at91rm9200_idle(void)
 	 * Disable the processor clock.  The processor will be automatically
 	 * re-enabled by an interrupt or by a reset.
 	 */
-	writel(AT91_PMC_PCK, pm_data.pmc + AT91_PMC_SCDR);
+	writel(AT91_PMC_PCK, soc_pm.data.pmc + AT91_PMC_SCDR);
 }
=20
 static void at91sam9_idle(void)
 {
-	writel(AT91_PMC_PCK, pm_data.pmc + AT91_PMC_SCDR);
+	writel(AT91_PMC_PCK, soc_pm.data.pmc + AT91_PMC_SCDR);
 	cpu_do_idle();
 }
=20
@@ -566,8 +572,8 @@ static void __init at91_pm_sram_init(void)
=20
 static bool __init at91_is_pm_mode_active(int pm_mode)
 {
-	return (pm_data.standby_mode =3D=3D pm_mode ||
-		pm_data.suspend_mode =3D=3D pm_mode);
+	return (soc_pm.data.standby_mode =3D=3D pm_mode ||
+		soc_pm.data.suspend_mode =3D=3D pm_mode);
 }
=20
 static int __init at91_pm_backup_init(void)
@@ -586,7 +592,7 @@ static int __init at91_pm_backup_init(void)
 		return ret;
 	}
=20
-	pm_data.sfrbu =3D of_iomap(np, 0);
+	soc_pm.data.sfrbu =3D of_iomap(np, 0);
 	of_node_put(np);
=20
 	np =3D of_find_compatible_node(NULL, NULL, "atmel,sama5d2-securam");
@@ -620,8 +626,8 @@ static int __init at91_pm_backup_init(void)
 	return 0;
=20
 securam_fail:
-	iounmap(pm_data.sfrbu);
-	pm_data.sfrbu =3D NULL;
+	iounmap(soc_pm.data.sfrbu);
+	soc_pm.data.sfrbu =3D NULL;
 	return ret;
 }
=20
@@ -630,10 +636,10 @@ static void __init at91_pm_use_default_mode(int pm_mo=
de)
 	if (pm_mode !=3D AT91_PM_ULP1 && pm_mode !=3D AT91_PM_BACKUP)
 		return;
=20
-	if (pm_data.standby_mode =3D=3D pm_mode)
-		pm_data.standby_mode =3D AT91_PM_ULP0;
-	if (pm_data.suspend_mode =3D=3D pm_mode)
-		pm_data.suspend_mode =3D AT91_PM_ULP0;
+	if (soc_pm.data.standby_mode =3D=3D pm_mode)
+		soc_pm.data.standby_mode =3D AT91_PM_ULP0;
+	if (soc_pm.data.suspend_mode =3D=3D pm_mode)
+		soc_pm.data.suspend_mode =3D AT91_PM_ULP0;
 }
=20
 static void __init at91_pm_modes_init(void)
@@ -651,7 +657,7 @@ static void __init at91_pm_modes_init(void)
 		goto ulp1_default;
 	}
=20
-	pm_data.shdwc =3D of_iomap(np, 0);
+	soc_pm.data.shdwc =3D of_iomap(np, 0);
 	of_node_put(np);
=20
 	ret =3D at91_pm_backup_init();
@@ -665,8 +671,8 @@ static void __init at91_pm_modes_init(void)
 	return;
=20
 unmap:
-	iounmap(pm_data.shdwc);
-	pm_data.shdwc =3D NULL;
+	iounmap(soc_pm.data.shdwc);
+	soc_pm.data.shdwc =3D NULL;
 ulp1_default:
 	at91_pm_use_default_mode(AT91_PM_ULP1);
 backup_default:
@@ -709,14 +715,14 @@ static void __init at91_pm_init(void (*pm_idle)(void)=
)
 		platform_device_register(&at91_cpuidle_device);
=20
 	pmc_np =3D of_find_matching_node_and_match(NULL, atmel_pmc_ids, &of_id);
-	pm_data.pmc =3D of_iomap(pmc_np, 0);
-	if (!pm_data.pmc) {
+	soc_pm.data.pmc =3D of_iomap(pmc_np, 0);
+	if (!soc_pm.data.pmc) {
 		pr_err("AT91: PM not supported, PMC not found\n");
 		return;
 	}
=20
 	pmc =3D of_id->data;
-	pm_data.uhp_udp_mask =3D pmc->uhp_udp_mask;
+	soc_pm.data.uhp_udp_mask =3D pmc->uhp_udp_mask;
=20
 	if (pm_idle)
 		arm_pm_idle =3D pm_idle;
@@ -726,8 +732,8 @@ static void __init at91_pm_init(void (*pm_idle)(void))
 	if (at91_suspend_sram_fn) {
 		suspend_set_ops(&at91_pm_ops);
 		pr_info("AT91: PM: standby: %s, suspend: %s\n",
-			pm_modes[pm_data.standby_mode].pattern,
-			pm_modes[pm_data.suspend_mode].pattern);
+			pm_modes[soc_pm.data.standby_mode].pattern,
+			pm_modes[soc_pm.data.suspend_mode].pattern);
 	} else {
 		pr_info("AT91: PM not supported, due to no SRAM allocated\n");
 	}
@@ -793,8 +799,8 @@ static int __init at91_pm_modes_select(char *str)
 	if (suspend < 0)
 		return 0;
=20
-	pm_data.standby_mode =3D standby;
-	pm_data.suspend_mode =3D suspend;
+	soc_pm.data.standby_mode =3D standby;
+	soc_pm.data.suspend_mode =3D suspend;
=20
 	return 0;
 }
--=20
2.7.4
