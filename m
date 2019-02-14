From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH 3/8] ARM: at91: pm: initial PM support for SAM9X60
Date: Thu, 14 Feb 2019 15:54:41 +0000
Message-ID: <1550159642-26878-4-git-send-email-claudiu.beznea@microchip.com>
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

Add initial PM support for SAM9X60. This include idle, WFI and ULP0.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/mach-at91/at91sam9.c | 18 ++++++++++++++++++
 arch/arm/mach-at91/generic.h  |  2 ++
 arch/arm/mach-at91/pm.c       | 14 ++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/arch/arm/mach-at91/at91sam9.c b/arch/arm/mach-at91/at91sam9.c
index 3dbdef4d3cbf..c12563b09656 100644
--- a/arch/arm/mach-at91/at91sam9.c
+++ b/arch/arm/mach-at91/at91sam9.c
@@ -32,3 +32,21 @@ DT_MACHINE_START(at91sam_dt, "Atmel AT91SAM9")
 	.init_machine	=3D at91sam9_init,
 	.dt_compat	=3D at91_dt_board_compat,
 MACHINE_END
+
+static void __init sam9x60_init(void)
+{
+	of_platform_default_populate(NULL, NULL, NULL);
+
+	sam9x60_pm_init();
+}
+
+static const char *const sam9x60_dt_board_compat[] __initconst =3D {
+	"microchip,sam9x60",
+	NULL
+};
+
+DT_MACHINE_START(sam9x60_dt, "Microchip SAM9X60")
+	/* Maintainer: Microchip */
+	.init_machine	=3D sam9x60_init,
+	.dt_compat	=3D sam9x60_dt_board_compat,
+MACHINE_END
diff --git a/arch/arm/mach-at91/generic.h b/arch/arm/mach-at91/generic.h
index e2bd17237964..72b45accfa0f 100644
--- a/arch/arm/mach-at91/generic.h
+++ b/arch/arm/mach-at91/generic.h
@@ -14,11 +14,13 @@
 #ifdef CONFIG_PM
 extern void __init at91rm9200_pm_init(void);
 extern void __init at91sam9_pm_init(void);
+extern void __init sam9x60_pm_init(void);
 extern void __init sama5_pm_init(void);
 extern void __init sama5d2_pm_init(void);
 #else
 static inline void __init at91rm9200_pm_init(void) { }
 static inline void __init at91sam9_pm_init(void) { }
+static inline void __init sam9x60_pm_init(void) { }
 static inline void __init sama5_pm_init(void) { }
 static inline void __init sama5d2_pm_init(void) { }
 #endif
diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index ce2ff86968f6..e42db02eafe4 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -518,6 +518,11 @@ static void at91rm9200_idle(void)
 	writel(AT91_PMC_PCK, soc_pm.data.pmc + AT91_PMC_SCDR);
 }
=20
+static void at91sam9x60_idle(void)
+{
+	cpu_do_idle();
+}
+
 static void at91sam9_idle(void)
 {
 	writel(AT91_PMC_PCK, soc_pm.data.pmc + AT91_PMC_SCDR);
@@ -754,6 +759,15 @@ void __init at91rm9200_pm_init(void)
 	at91_pm_init(at91rm9200_idle);
 }
=20
+void __init sam9x60_pm_init(void)
+{
+	if (!IS_ENABLED(CONFIG_SOC_AT91SAM9))
+		return;
+
+	at91_dt_ramc();
+	at91_pm_init(at91sam9x60_idle);
+}
+
 void __init at91sam9_pm_init(void)
 {
 	if (!IS_ENABLED(CONFIG_SOC_AT91SAM9))
--=20
2.7.4
