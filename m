Return-Path: <SRS0=+tgD=QP=bgdev.pl=brgl@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 17/33] ARM: davinci: aintc: move timer-specific irq_set_handler() out of irq.c
Date: Fri,  8 Feb 2019 18:31:38 +0100
Message-Id: <20190208173154.4665-18-brgl@bgdev.pl>
In-Reply-To: <20190208173154.4665-1-brgl@bgdev.pl>
References: <20190208173154.4665-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner --to=David Lechner <tglx@linutronix.dedavid>, lechnology.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <devicetree@vger.kernel.org>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I've been unable to figure out exactly why, but it seems that the
IRQ_TINT1_TINT34 interrupt for timer 1 needs to be handled as a
level irq, not edge like all others.

Let's move the handler setup out of the aintc driver where it's lived
since the beginning and into the dm* SoC-specific files where it
belongs.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/dm355.c  | 8 ++++++++
 arch/arm/mach-davinci/dm365.c  | 8 ++++++++
 arch/arm/mach-davinci/dm644x.c | 8 ++++++++
 arch/arm/mach-davinci/dm646x.c | 8 ++++++++
 arch/arm/mach-davinci/irq.c    | 3 ---
 5 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-davinci/dm355.c b/arch/arm/mach-davinci/dm355.c
index c7cd765114af..a732f2ea1d9a 100644
--- a/arch/arm/mach-davinci/dm355.c
+++ b/arch/arm/mach-davinci/dm355.c
@@ -15,6 +15,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/init.h>
+#include <linux/irq.h>
 #include <linux/irqchip/irq-davinci-aintc.h>
 #include <linux/platform_data/edma.h>
 #include <linux/platform_data/gpio-davinci.h>
@@ -744,6 +745,13 @@ void __init dm355_init_time(void)
 	psc = ioremap(DAVINCI_PWR_SLEEP_CNTRL_BASE, SZ_4K);
 	dm355_psc_init(NULL, psc);
 
+	/*
+	 * Nobody knows why anymore, but this interrupt has been handled as
+	 * a level irq from the very beginning of davinci support in mainline
+	 * linux.
+	 */
+	irq_set_handler(DAVINCI_INTC_IRQ(IRQ_TINT1_TINT34), handle_level_irq);
+
 	clk = clk_get(NULL, "timer0");
 
 	davinci_timer_init(clk);
diff --git a/arch/arm/mach-davinci/dm365.c b/arch/arm/mach-davinci/dm365.c
index bde3c3b94cc9..79afde34cfbb 100644
--- a/arch/arm/mach-davinci/dm365.c
+++ b/arch/arm/mach-davinci/dm365.c
@@ -19,6 +19,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/init.h>
+#include <linux/irq.h>
 #include <linux/irqchip/irq-davinci-aintc.h>
 #include <linux/platform_data/edma.h>
 #include <linux/platform_data/gpio-davinci.h>
@@ -785,6 +786,13 @@ void __init dm365_init_time(void)
 	psc = ioremap(DAVINCI_PWR_SLEEP_CNTRL_BASE, SZ_4K);
 	dm365_psc_init(NULL, psc);
 
+	/*
+	 * Nobody knows why anymore, but this interrupt has been handled as
+	 * a level irq from the very beginning of davinci support in mainline
+	 * linux.
+	 */
+	irq_set_handler(DAVINCI_INTC_IRQ(IRQ_TINT1_TINT34), handle_level_irq);
+
 	clk = clk_get(NULL, "timer0");
 
 	davinci_timer_init(clk);
diff --git a/arch/arm/mach-davinci/dm644x.c b/arch/arm/mach-davinci/dm644x.c
index 6d3498058283..007d979d2d64 100644
--- a/arch/arm/mach-davinci/dm644x.c
+++ b/arch/arm/mach-davinci/dm644x.c
@@ -14,6 +14,7 @@
 #include <linux/clkdev.h>
 #include <linux/dmaengine.h>
 #include <linux/init.h>
+#include <linux/irq.h>
 #include <linux/irqchip/irq-davinci-aintc.h>
 #include <linux/platform_data/edma.h>
 #include <linux/platform_data/gpio-davinci.h>
@@ -680,6 +681,13 @@ void __init dm644x_init_time(void)
 	psc = ioremap(DAVINCI_PWR_SLEEP_CNTRL_BASE, SZ_4K);
 	dm644x_psc_init(NULL, psc);
 
+	/*
+	 * Nobody knows why anymore, but this interrupt has been handled as
+	 * a level irq from the very beginning of davinci support in mainline
+	 * linux.
+	 */
+	irq_set_handler(DAVINCI_INTC_IRQ(IRQ_TINT1_TINT34), handle_level_irq);
+
 	clk = clk_get(NULL, "timer0");
 
 	davinci_timer_init(clk);
diff --git a/arch/arm/mach-davinci/dm646x.c b/arch/arm/mach-davinci/dm646x.c
index a0a8b336c1a4..a643d78ad644 100644
--- a/arch/arm/mach-davinci/dm646x.c
+++ b/arch/arm/mach-davinci/dm646x.c
@@ -15,6 +15,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/init.h>
+#include <linux/irq.h>
 #include <linux/irqchip/irq-davinci-aintc.h>
 #include <linux/platform_data/edma.h>
 #include <linux/platform_data/gpio-davinci.h>
@@ -664,6 +665,13 @@ void __init dm646x_init_time(unsigned long ref_clk_rate,
 	psc = ioremap(DAVINCI_PWR_SLEEP_CNTRL_BASE, SZ_4K);
 	dm646x_psc_init(NULL, psc);
 
+	/*
+	 * Nobody knows why anymore, but this interrupt has been handled as
+	 * a level irq from the very beginning of davinci support in mainline
+	 * linux.
+	 */
+	irq_set_handler(DAVINCI_INTC_IRQ(IRQ_TINT1_TINT34), handle_level_irq);
+
 	clk = clk_get(NULL, "timer0");
 
 	davinci_timer_init(clk);
diff --git a/arch/arm/mach-davinci/irq.c b/arch/arm/mach-davinci/irq.c
index f5578abfc0aa..0f469c59acfb 100644
--- a/arch/arm/mach-davinci/irq.c
+++ b/arch/arm/mach-davinci/irq.c
@@ -18,8 +18,6 @@
 #include <asm/mach/irq.h>
 #include <asm/exception.h>
 
-#include "irqs.h"
-
 #define DAVINCI_AINTC_FIQ_REG0		0x00
 #define DAVINCI_AINTC_FIQ_REG1		0x04
 #define DAVINCI_AINTC_IRQ_REG0		0x08
@@ -146,6 +144,5 @@ void __init davinci_aintc_init(const struct davinci_aintc_config *config)
 		davinci_aintc_setup_gc(davinci_aintc_base + reg_off,
 				       irq_base + irq_off, 32);
 
-	irq_set_handler(DAVINCI_INTC_IRQ(IRQ_TINT1_TINT34), handle_level_irq);
 	set_handle_irq(davinci_aintc_handle_irq);
 }
-- 
2.20.1
