From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH 6/8] ARM: at91: pm: add ULP1 support for SAM9X60
Date: Thu, 14 Feb 2019 15:54:57 +0000
Message-ID: <1550159642-26878-7-git-send-email-claudiu.beznea@microchip.com>
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

Add ULP1 support for SAM9X60. In pm_suspend.S enable RC oscillator in
PMC if it is not enabled. At resume the state before suspend is
restored.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/mach-at91/pm.c         | 24 ++++++++++++++++++++++++
 arch/arm/mach-at91/pm_suspend.S | 41 +++++++++++++++++++++++++++++++++++++=
+++-
 include/linux/clk/at91_pmc.h    |  1 +
 3 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index 27264caa4ec6..5571658b3c46 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -100,6 +100,8 @@ static const struct wakeup_source_info ws_info[] =3D {
 	{ .pmc_fsmr_bit =3D AT91_PMC_RTCAL,	.shdwc_mr_bit =3D BIT(17) },
 	{ .pmc_fsmr_bit =3D AT91_PMC_USBAL },
 	{ .pmc_fsmr_bit =3D AT91_PMC_SDMMC_CD },
+	{ .pmc_fsmr_bit =3D AT91_PMC_RTTAL },
+	{ .pmc_fsmr_bit =3D AT91_PMC_RXLP_MCE },
 };
=20
 static const struct of_device_id sama5d2_ws_ids[] =3D {
@@ -114,6 +116,17 @@ static const struct of_device_id sama5d2_ws_ids[] =3D =
{
 	{ /* sentinel */ }
 };
=20
+static const struct of_device_id sam9x60_ws_ids[] =3D {
+	{ .compatible =3D "atmel,at91sam9x5-rtc",		.data =3D &ws_info[1] },
+	{ .compatible =3D "atmel,at91rm9200-ohci",	.data =3D &ws_info[2] },
+	{ .compatible =3D "usb-ohci",			.data =3D &ws_info[2] },
+	{ .compatible =3D "atmel,at91sam9g45-ehci",	.data =3D &ws_info[2] },
+	{ .compatible =3D "usb-ehci",			.data =3D &ws_info[2] },
+	{ .compatible =3D "atmel,at91sam9260-rtt",	.data =3D &ws_info[4] },
+	{ .compatible =3D "cdns,sam9x60-macb",		.data =3D &ws_info[5] },
+	{ /* sentinel */ }
+};
+
 static int at91_pm_config_ws(unsigned int pm_mode, bool set)
 {
 	const struct wakeup_source_info *wsi;
@@ -192,6 +205,13 @@ static int at91_sama5d2_config_pmc_ws(void __iomem *pm=
c, u32 mode, u32 polarity)
 	return 0;
 }
=20
+static int at91_sam9x60_config_pmc_ws(void __iomem *pmc, u32 mode, u32 pol=
arity)
+{
+	writel(mode, pmc + AT91_PMC_FSMR);
+
+	return 0;
+}
+
 /*
  * Called after processes are frozen, but before we shutdown devices.
  */
@@ -789,8 +809,12 @@ void __init sam9x60_pm_init(void)
 	if (!IS_ENABLED(CONFIG_SOC_AT91SAM9))
 		return;
=20
+	at91_pm_modes_init();
 	at91_dt_ramc();
 	at91_pm_init(at91sam9x60_idle);
+
+	soc_pm.ws_ids =3D sam9x60_ws_ids;
+	soc_pm.config_pmc_ws =3D at91_sam9x60_config_pmc_ws;
 }
=20
 void __init at91sam9_pm_init(void)
diff --git a/arch/arm/mach-at91/pm_suspend.S b/arch/arm/mach-at91/pm_suspen=
d.S
index bfe1c4d06901..8b18cad1dcf5 100644
--- a/arch/arm/mach-at91/pm_suspend.S
+++ b/arch/arm/mach-at91/pm_suspend.S
@@ -197,8 +197,26 @@ ENDPROC(at91_backup_mode)
 .macro at91_pm_ulp1_mode
 	ldr	pmc, .pmc_base
=20
-	/* Switch the main clock source to 12-MHz RC oscillator */
+	/* Save RC oscillator state and check if it is enabled. */
+	ldr	tmp1, [pmc, #AT91_PMC_SR]
+	str	tmp1, .saved_osc_status
+	tst	tmp1, #AT91_PMC_MOSCRCS
+	bne	2f
+
+	/* Enable RC oscillator */
 	ldr	tmp1, [pmc, #AT91_CKGR_MOR]
+	orr	tmp1, tmp1, #AT91_PMC_MOSCRCEN
+	bic	tmp1, tmp1, #AT91_PMC_KEY_MASK
+	orr	tmp1, tmp1, #AT91_PMC_KEY
+	str	tmp1, [pmc, #AT91_CKGR_MOR]
+
+	/* Wait main RC stabilization */
+1:	ldr	tmp1, [pmc, #AT91_PMC_SR]
+	tst	tmp1, #AT91_PMC_MOSCRCS
+	beq	1b
+
+	/* Switch the main clock source to 12-MHz RC oscillator */
+2:	ldr	tmp1, [pmc, #AT91_CKGR_MOR]
 	bic	tmp1, tmp1, #AT91_PMC_MOSCSEL
 	bic	tmp1, tmp1, #AT91_PMC_KEY_MASK
 	orr	tmp1, tmp1, #AT91_PMC_KEY
@@ -262,6 +280,25 @@ ENDPROC(at91_backup_mode)
 	str	tmp1, [pmc, #AT91_PMC_MCKR]
=20
 	wait_mckrdy
+
+	/* Restore RC oscillator state */
+	ldr	tmp1, .saved_osc_status
+	tst	tmp1, #AT91_PMC_MOSCRCS
+	bne	3f
+
+	/* Disable RC oscillator */
+	ldr	tmp1, [pmc, #AT91_CKGR_MOR]
+	bic	tmp1, tmp1, #AT91_PMC_MOSCRCEN
+	bic	tmp1, tmp1, #AT91_PMC_KEY_MASK
+	orr	tmp1, tmp1, #AT91_PMC_KEY
+	str	tmp1, [pmc, #AT91_CKGR_MOR]
+
+	/* Wait RC oscillator disable done */
+4:	ldr	tmp1, [pmc, #AT91_PMC_SR]
+	tst	tmp1, #AT91_PMC_MOSCRCS
+	bne	4b
+
+3:
 .endm
=20
 ENTRY(at91_ulp_mode)
@@ -475,6 +512,8 @@ ENDPROC(at91_sramc_self_refresh)
 	.word 0
 .saved_sam9_mdr1:
 	.word 0
+.saved_osc_status:
+	.word 0
=20
 ENTRY(at91_pm_suspend_in_sram_sz)
 	.word .-at91_pm_suspend_in_sram
diff --git a/include/linux/clk/at91_pmc.h b/include/linux/clk/at91_pmc.h
index 931ab05f771d..bd3a65c0bad3 100644
--- a/include/linux/clk/at91_pmc.h
+++ b/include/linux/clk/at91_pmc.h
@@ -159,6 +159,7 @@
=20
 #define AT91_PMC_FSMR		0x70		/* Fast Startup Mode Register */
 #define AT91_PMC_FSTT(n)	BIT(n)
+#define AT91_PMC_RTTAL		BIT(16)
 #define AT91_PMC_RTCAL		BIT(17)		/* RTC Alarm Enable */
 #define AT91_PMC_USBAL		BIT(18)		/* USB Resume Enable */
 #define AT91_PMC_SDMMC_CD	BIT(19)		/* SDMMC Card Detect Enable */
--=20
2.7.4
