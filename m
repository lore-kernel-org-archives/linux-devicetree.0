From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 09/12] ARM: davinci: dm365: switch to using the clocksource driver
Date: Mon,  4 Feb 2019 18:17:54 +0100
Message-ID: <20190204171757.32073-10-brgl@bgdev.pl>
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
 arch/arm/mach-davinci/dm365.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-davinci/dm365.c b/arch/arm/mach-davinci/dm365.c
index 68bd78dac293..fa83dec162e6 100644
--- a/arch/arm/mach-davinci/dm365.c
+++ b/arch/arm/mach-davinci/dm365.c
@@ -34,7 +34,8 @@
 #include <mach/irqs.h>
 #include <mach/mux.h>
 #include <mach/serial.h>
-#include <mach/time.h>
+
+#include <clocksource/timer-davinci.h>
 
 #include "asp.h"
 #include "davinci.h"
@@ -658,10 +659,24 @@ static struct davinci_id dm365_ids[] = {
 	},
 };
 
-static struct davinci_timer_info dm365_timer_info = {
-	.timers		= davinci_timer_instance,
-	.clockevent_id	= T0_BOT,
-	.clocksource_id	= T0_TOP,
+static const struct davinci_timer_cfg dm365_timer_cfg = {
+	.reg = {
+		.start		= DAVINCI_TIMER0_BASE,
+		.end		= DAVINCI_TIMER0_BASE + SZ_4K,
+		.flags		= IORESOURCE_MEM,
+	},
+	.irq = {
+		{
+			.start	= IRQ_TINT0_TINT12,
+			.end	= IRQ_TINT0_TINT12,
+			.flags	= IORESOURCE_IRQ,
+		},
+		{
+			.start	= IRQ_TINT0_TINT34,
+			.end	= IRQ_TINT0_TINT34,
+			.flags	= IORESOURCE_IRQ,
+		}
+	}
 };
 
 #define DM365_UART1_BASE	(IO_PHYS + 0x106000)
@@ -725,7 +740,6 @@ static const struct davinci_soc_info davinci_soc_info_dm365 = {
 	.intc_type		= DAVINCI_INTC_TYPE_AINTC,
 	.intc_irq_prios		= dm365_default_priorities,
 	.intc_irq_num		= DAVINCI_N_AINTC_IRQ,
-	.timer_info		= &dm365_timer_info,
 	.emac_pdata		= &dm365_emac_pdata,
 	.sram_dma		= 0x00010000,
 	.sram_len		= SZ_32K,
@@ -773,6 +787,7 @@ void __init dm365_init_time(void)
 {
 	void __iomem *pll1, *pll2, *psc;
 	struct clk *clk;
+	int rv;
 
 	clk_register_fixed_rate(NULL, "ref_clk", NULL, 0, DM365_REF_FREQ);
 
@@ -791,7 +806,8 @@ void __init dm365_init_time(void)
 		return;
 	}
 
-	davinci_timer_init(clk);
+	rv = davinci_timer_register(clk, &dm365_timer_cfg);
+	WARN(rv, "Unable to register the timer: %d\n", rv);
 }
 
 void __init dm365_register_clocks(void)
-- 
2.20.1
