From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 2/3] ARM: make of_device_ids const
Date: Wed, 10 Sep 2014 10:26:18 +0200
Message-ID: <1410337579-23466-3-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1410337579-23466-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410337579-23466-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

of_device_ids (i.e. compatible strings and the respective data) are not
supposed to change at runtime. All functions working with of_device_ids
provided by <linux/of.h> work with const of_device_ids. So mark the
non-const structs in arch/arm as const, too.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/kernel/perf_event_cpu.c         | 2 +-
 arch/arm/mach-at91/at91rm9200_time.c     | 2 +-
 arch/arm/mach-at91/at91sam9263_devices.c | 2 +-
 arch/arm/mach-at91/at91sam926x_time.c    | 2 +-
 arch/arm/mach-at91/clock.c               | 4 ++--
 arch/arm/mach-at91/setup.c               | 6 +++---
 arch/arm/mach-davinci/da8xx-dt.c         | 2 +-
 arch/arm/mach-imx/mmdc.c                 | 2 +-
 arch/arm/mach-keystone/pm_domain.c       | 2 +-
 arch/arm/mach-mmp/time.c                 | 2 +-
 arch/arm/mach-mvebu/coherency.c          | 2 +-
 arch/arm/mach-mvebu/pmsu.c               | 2 +-
 arch/arm/mach-prima2/platsmp.c           | 2 +-
 arch/arm/mach-sunxi/sunxi.c              | 2 +-
 14 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm/kernel/perf_event_cpu.c b/arch/arm/kernel/perf_ev=
ent_cpu.c
index e6a6edbec613..8e13236f184c 100644
--- a/arch/arm/kernel/perf_event_cpu.c
+++ b/arch/arm/kernel/perf_event_cpu.c
@@ -224,7 +224,7 @@ static struct notifier_block cpu_pmu_hotplug_notifi=
er =3D {
 /*
  * PMU platform driver and devicetree bindings.
  */
-static struct of_device_id cpu_pmu_of_device_ids[] =3D {
+static const struct of_device_id cpu_pmu_of_device_ids[] =3D {
 	{.compatible =3D "arm,cortex-a17-pmu",	.data =3D armv7_a17_pmu_init},
 	{.compatible =3D "arm,cortex-a15-pmu",	.data =3D armv7_a15_pmu_init},
 	{.compatible =3D "arm,cortex-a12-pmu",	.data =3D armv7_a12_pmu_init},
diff --git a/arch/arm/mach-at91/at91rm9200_time.c b/arch/arm/mach-at91/=
at91rm9200_time.c
index 7fd13aef9827..ec978cc892bf 100644
--- a/arch/arm/mach-at91/at91rm9200_time.c
+++ b/arch/arm/mach-at91/at91rm9200_time.c
@@ -184,7 +184,7 @@ void __iomem *at91_st_base;
 EXPORT_SYMBOL_GPL(at91_st_base);
=20
 #ifdef CONFIG_OF
-static struct of_device_id at91rm9200_st_timer_ids[] =3D {
+static const struct of_device_id at91rm9200_st_timer_ids[] =3D {
 	{ .compatible =3D "atmel,at91rm9200-st" },
 	{ /* sentinel */ }
 };
diff --git a/arch/arm/mach-at91/at91sam9263_devices.c b/arch/arm/mach-a=
t91/at91sam9263_devices.c
index cef0e2f57068..4f717a53aa0e 100644
--- a/arch/arm/mach-at91/at91sam9263_devices.c
+++ b/arch/arm/mach-at91/at91sam9263_devices.c
@@ -981,7 +981,7 @@ static struct platform_device at91sam9263_tcb_devic=
e =3D {
 };
=20
 #if defined(CONFIG_OF)
-static struct of_device_id tcb_ids[] =3D {
+static const struct of_device_id tcb_ids[] =3D {
 	{ .compatible =3D "atmel,at91rm9200-tcb" },
 	{ /*sentinel*/ }
 };
diff --git a/arch/arm/mach-at91/at91sam926x_time.c b/arch/arm/mach-at91=
/at91sam926x_time.c
index 0a9e2fc8f796..137c2ca634b0 100644
--- a/arch/arm/mach-at91/at91sam926x_time.c
+++ b/arch/arm/mach-at91/at91sam926x_time.c
@@ -179,7 +179,7 @@ static struct irqaction at91sam926x_pit_irq =3D {
 };
=20
 #ifdef CONFIG_OF
-static struct of_device_id pit_timer_ids[] =3D {
+static const struct of_device_id pit_timer_ids[] =3D {
 	{ .compatible =3D "atmel,at91sam9260-pit" },
 	{ /* sentinel */ }
 };
diff --git a/arch/arm/mach-at91/clock.c b/arch/arm/mach-at91/clock.c
index 034529d801b2..b579988dd877 100644
--- a/arch/arm/mach-at91/clock.c
+++ b/arch/arm/mach-at91/clock.c
@@ -876,7 +876,7 @@ static int __init at91_pmc_init(unsigned long main_=
clock)
 }
=20
 #if defined(CONFIG_OF)
-static struct of_device_id pmc_ids[] =3D {
+static const struct of_device_id pmc_ids[] =3D {
 	{ .compatible =3D "atmel,at91rm9200-pmc" },
 	{ .compatible =3D "atmel,at91sam9260-pmc" },
 	{ .compatible =3D "atmel,at91sam9g45-pmc" },
@@ -886,7 +886,7 @@ static struct of_device_id pmc_ids[] =3D {
 	{ /*sentinel*/ }
 };
=20
-static struct of_device_id osc_ids[] =3D {
+static const struct of_device_id osc_ids[] =3D {
 	{ .compatible =3D "atmel,osc" },
 	{ /*sentinel*/ }
 };
diff --git a/arch/arm/mach-at91/setup.c b/arch/arm/mach-at91/setup.c
index f7a07a58ebb6..d3ca2b96f0e5 100644
--- a/arch/arm/mach-at91/setup.c
+++ b/arch/arm/mach-at91/setup.c
@@ -352,7 +352,7 @@ void __init at91_ioremap_matrix(u32 base_addr)
 }
=20
 #if defined(CONFIG_OF) && !defined(CONFIG_ARCH_AT91X40)
-static struct of_device_id rstc_ids[] =3D {
+static const struct of_device_id rstc_ids[] =3D {
 	{ .compatible =3D "atmel,at91sam9260-rstc", .data =3D at91sam9_alt_re=
start },
 	{ .compatible =3D "atmel,at91sam9g45-rstc", .data =3D at91sam9g45_res=
tart },
 	{ /*sentinel*/ }
@@ -380,7 +380,7 @@ static void at91_dt_rstc(void)
 	of_node_put(np);
 }
=20
-static struct of_device_id ramc_ids[] =3D {
+static const struct of_device_id ramc_ids[] =3D {
 	{ .compatible =3D "atmel,at91rm9200-sdramc", .data =3D at91rm9200_sta=
ndby },
 	{ .compatible =3D "atmel,at91sam9260-sdramc", .data =3D at91sam9_sdra=
m_standby },
 	{ .compatible =3D "atmel,at91sam9g45-ddramc", .data =3D at91_ddr_stan=
dby },
@@ -411,7 +411,7 @@ static void at91_dt_ramc(void)
 	of_node_put(np);
 }
=20
-static struct of_device_id shdwc_ids[] =3D {
+static const struct of_device_id shdwc_ids[] =3D {
 	{ .compatible =3D "atmel,at91sam9260-shdwc", },
 	{ .compatible =3D "atmel,at91sam9rl-shdwc", },
 	{ .compatible =3D "atmel,at91sam9x5-shdwc", },
diff --git a/arch/arm/mach-davinci/da8xx-dt.c b/arch/arm/mach-davinci/d=
a8xx-dt.c
index ed1928740b5f..cd4853a070bd 100644
--- a/arch/arm/mach-davinci/da8xx-dt.c
+++ b/arch/arm/mach-davinci/da8xx-dt.c
@@ -20,7 +20,7 @@
=20
 #define DA8XX_NUM_UARTS	3
=20
-static struct of_device_id da8xx_irq_match[] __initdata =3D {
+static const struct of_device_id da8xx_irq_match[] __initconst =3D {
 	{ .compatible =3D "ti,cp-intc", .data =3D cp_intc_of_init, },
 	{ }
 };
diff --git a/arch/arm/mach-imx/mmdc.c b/arch/arm/mach-imx/mmdc.c
index 7a9686ad994c..f3996d45f28e 100644
--- a/arch/arm/mach-imx/mmdc.c
+++ b/arch/arm/mach-imx/mmdc.c
@@ -51,7 +51,7 @@ static int imx_mmdc_probe(struct platform_device *pde=
v)
 	return 0;
 }
=20
-static struct of_device_id imx_mmdc_dt_ids[] =3D {
+static const struct of_device_id imx_mmdc_dt_ids[] =3D {
 	{ .compatible =3D "fsl,imx6q-mmdc", },
 	{ /* sentinel */ }
 };
diff --git a/arch/arm/mach-keystone/pm_domain.c b/arch/arm/mach-keyston=
e/pm_domain.c
index ca79ddac38bc..61c94457279b 100644
--- a/arch/arm/mach-keystone/pm_domain.c
+++ b/arch/arm/mach-keystone/pm_domain.c
@@ -61,7 +61,7 @@ static struct pm_clk_notifier_block platform_domain_n=
otifier =3D {
 	.pm_domain =3D &keystone_pm_domain,
 };
=20
-static struct of_device_id of_keystone_table[] =3D {
+static const struct of_device_id of_keystone_table[] =3D {
 	{.compatible =3D "ti,keystone"},
 	{ /* end of list */ },
 };
diff --git a/arch/arm/mach-mmp/time.c b/arch/arm/mach-mmp/time.c
index 2756351dbb35..10bfa03e58d4 100644
--- a/arch/arm/mach-mmp/time.c
+++ b/arch/arm/mach-mmp/time.c
@@ -213,7 +213,7 @@ void __init timer_init(int irq)
 }
=20
 #ifdef CONFIG_OF
-static struct of_device_id mmp_timer_dt_ids[] =3D {
+static const struct of_device_id mmp_timer_dt_ids[] =3D {
 	{ .compatible =3D "mrvl,mmp-timer", },
 	{}
 };
diff --git a/arch/arm/mach-mvebu/coherency.c b/arch/arm/mach-mvebu/cohe=
rency.c
index 2bdc3233abe2..67f84cecdfb3 100644
--- a/arch/arm/mach-mvebu/coherency.c
+++ b/arch/arm/mach-mvebu/coherency.c
@@ -53,7 +53,7 @@ enum {
 	COHERENCY_FABRIC_TYPE_ARMADA_380,
 };
=20
-static struct of_device_id of_coherency_table[] =3D {
+static const struct of_device_id of_coherency_table[] =3D {
 	{.compatible =3D "marvell,coherency-fabric",
 	 .data =3D (void *) COHERENCY_FABRIC_TYPE_ARMADA_370_XP },
 	{.compatible =3D "marvell,armada-375-coherency-fabric",
diff --git a/arch/arm/mach-mvebu/pmsu.c b/arch/arm/mach-mvebu/pmsu.c
index 8a70a51533fd..d35d01531183 100644
--- a/arch/arm/mach-mvebu/pmsu.c
+++ b/arch/arm/mach-mvebu/pmsu.c
@@ -104,7 +104,7 @@ static void __iomem *pmsu_mp_base;
=20
 static void *mvebu_cpu_resume;
=20
-static struct of_device_id of_pmsu_table[] =3D {
+static const struct of_device_id of_pmsu_table[] =3D {
 	{ .compatible =3D "marvell,armada-370-pmsu", },
 	{ .compatible =3D "marvell,armada-370-xp-pmsu", },
 	{ .compatible =3D "marvell,armada-380-pmsu", },
diff --git a/arch/arm/mach-prima2/platsmp.c b/arch/arm/mach-prima2/plat=
smp.c
index 335c12e92262..59a96daee929 100644
--- a/arch/arm/mach-prima2/platsmp.c
+++ b/arch/arm/mach-prima2/platsmp.c
@@ -60,7 +60,7 @@ static void sirfsoc_secondary_init(unsigned int cpu)
 	spin_unlock(&boot_lock);
 }
=20
-static struct of_device_id rsc_ids[]  =3D {
+static const struct of_device_id rsc_ids[]  =3D {
 	{ .compatible =3D "sirf,marco-rsc" },
 	{},
 };
diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
index 42d4753683ce..efbcbde296b4 100644
--- a/arch/arm/mach-sunxi/sunxi.c
+++ b/arch/arm/mach-sunxi/sunxi.c
@@ -64,7 +64,7 @@ static void sun4i_restart(enum reboot_mode mode, cons=
t char *cmd)
 	}
 }
=20
-static struct of_device_id sunxi_restart_ids[] =3D {
+static const struct of_device_id sunxi_restart_ids[] =3D {
 	{ .compatible =3D "allwinner,sun4i-a10-wdt" },
 	{ /*sentinel*/ }
 };
--=20
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
