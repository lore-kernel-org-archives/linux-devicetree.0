From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 06/12] ARM: davinci: da830: switch to using the clocksource driver
Date: Mon,  4 Feb 2019 18:17:51 +0100
Message-ID: <20190204171757.32073-7-brgl@bgdev.pl>
References: <20190204171757.32073-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204171757.32073-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We now have a proper clocksource driver for davinci. Switch the platform
to using it.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/da830.c | 49 ++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/arch/arm/mach-davinci/da830.c b/arch/arm/mach-davinci/da830.c
index 9a4b749cbb6b..eb2d92a6ee18 100644
--- a/arch/arm/mach-davinci/da830.c
+++ b/arch/arm/mach-davinci/da830.c
@@ -20,7 +20,8 @@
 #include <mach/cputype.h>
 #include <mach/da8xx.h>
 #include <mach/irqs.h>
-#include <mach/time.h>
+
+#include <clocksource/timer-davinci.h>
 
 #include "mux.h"
 
@@ -769,32 +770,25 @@ int __init da830_register_gpio(void)
 	return da8xx_register_gpio(&da830_gpio_platform_data);
 }
 
-static struct davinci_timer_instance da830_timer_instance[2] = {
-	{
-		.base		= DA8XX_TIMER64P0_BASE,
-		.bottom_irq	= IRQ_DA8XX_TINT12_0,
-		.top_irq	= IRQ_DA8XX_TINT34_0,
-		.cmp_off	= DA830_CMP12_0,
-		.cmp_irq	= IRQ_DA830_T12CMPINT0_0,
+static const struct davinci_timer_cfg da830_timer_cfg = {
+	.reg = {
+		.start		= DA8XX_TIMER64P0_BASE,
+		.end		= DA8XX_TIMER64P0_BASE + SZ_4K,
+		.flags		= IORESOURCE_MEM,
 	},
-	{
-		.base		= DA8XX_TIMER64P1_BASE,
-		.bottom_irq	= IRQ_DA8XX_TINT12_1,
-		.top_irq	= IRQ_DA8XX_TINT34_1,
-		.cmp_off	= DA830_CMP12_0,
-		.cmp_irq	= IRQ_DA830_T12CMPINT0_1,
+	.irq = {
+		{
+			.start	= IRQ_DA830_T12CMPINT0_0,
+			.end	= IRQ_DA830_T12CMPINT0_0,
+			.flags	= IORESOURCE_IRQ,
+		},
+		{
+			.start	= IRQ_DA8XX_TINT12_0,
+			.end	= IRQ_DA8XX_TINT12_0,
+			.flags	= IORESOURCE_IRQ,
+		},
 	},
-};
-
-/*
- * T0_BOT: Timer 0, bottom		: Used for clock_event & clocksource
- * T0_TOP: Timer 0, top			: Used by DSP
- * T1_BOT, T1_TOP: Timer 1, bottom & top: Used for watchdog timer
- */
-static struct davinci_timer_info da830_timer_info = {
-	.timers		= da830_timer_instance,
-	.clockevent_id	= T0_BOT,
-	.clocksource_id	= T0_BOT,
+	.cmp_off		= DA830_CMP12_0,
 };
 
 static const struct davinci_soc_info davinci_soc_info_da830 = {
@@ -810,7 +804,6 @@ static const struct davinci_soc_info davinci_soc_info_da830 = {
 	.intc_type		= DAVINCI_INTC_TYPE_CP_INTC,
 	.intc_irq_prios		= da830_default_priorities,
 	.intc_irq_num		= DA830_N_CP_INTC_IRQ,
-	.timer_info		= &da830_timer_info,
 	.emac_pdata		= &da8xx_emac_pdata,
 };
 
@@ -826,6 +819,7 @@ void __init da830_init_time(void)
 {
 	void __iomem *pll;
 	struct clk *clk;
+	int rv;
 
 	clk_register_fixed_rate(NULL, "ref_clk", NULL, 0, DA830_REF_FREQ);
 
@@ -839,7 +833,8 @@ void __init da830_init_time(void)
 		return;
 	}
 
-	davinci_timer_init(clk);
+	rv = davinci_timer_register(clk, &da830_timer_cfg);
+	WARN(rv, "Unable to register the timer: %d\n", rv);
 }
 
 static struct resource da830_psc0_resources[] = {
-- 
2.20.1
