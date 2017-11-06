From: Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 1/2] clocksource: npcm: add NPCM7xx timer driver
Date: Mon,  6 Nov 2017 18:28:35 +0200
Message-ID: <1509985716-25759-2-git-send-email-tmaimon77@gmail.com>
References: <1509985716-25759-1-git-send-email-tmaimon77@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509985716-25759-1-git-send-email-tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add Nuvoton BMC NPCM7xx timer driver.

the clocksource Enable 24-bit TIMER0 and TIMER1 counters,
while TIMER0 serves as clockevent and TIMER1 serves as clocksource.

Signed-off-by: Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/clocksource/Kconfig         |   8 ++
 drivers/clocksource/Makefile        |   1 +
 drivers/clocksource/npcm7xx-timer.c | 239 ++++++++++++++++++++++++++++++++++++
 3 files changed, 248 insertions(+)
 create mode 100644 drivers/clocksource/npcm7xx-timer.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index cc6062049170..46184af75d6c 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -140,6 +140,14 @@ config VT8500_TIMER
 	help
 	  Enables support for the VT8500 driver.
 
+config NPCM7XX_TIMER
+	bool "NPCM7xx timer driver" if COMPILE_TEST
+	depends on HAS_IOMEM
+	select CLKSRC_MMIO
+	help
+	  Enable 24-bit TIMER0 and TIMER1 counters in the NPCM7xx arcithcture,
+	  While TIMER0 serves as clockevent and TIMER1 serves as clocksource.
+
 config CADENCE_TTC_TIMER
 	bool "Cadence TTC timer driver" if COMPILE_TEST
 	depends on COMMON_CLK
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 72711f1491e3..ff2b30b75b5b 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -54,6 +54,7 @@ obj-$(CONFIG_CLKSRC_TI_32K)	+= timer-ti-32k.o
 obj-$(CONFIG_CLKSRC_NPS)	+= timer-nps.o
 obj-$(CONFIG_OXNAS_RPS_TIMER)	+= timer-oxnas-rps.o
 obj-$(CONFIG_OWL_TIMER)		+= owl-timer.o
+obj-$(CONFIG_NPCM7XX_TIMER)	+= npcm7xx-timer.o
 
 obj-$(CONFIG_ARC_TIMERS)		+= arc_timer.o
 obj-$(CONFIG_ARM_ARCH_TIMER)		+= arm_arch_timer.o
diff --git a/drivers/clocksource/npcm7xx-timer.c b/drivers/clocksource/npcm7xx-timer.c
new file mode 100644
index 000000000000..b9b468da4560
--- /dev/null
+++ b/drivers/clocksource/npcm7xx-timer.c
@@ -0,0 +1,239 @@
+
+/*
+ * Copyright (c) 2017 Nuvoton Technology corporation.
+ * Copyright 2017 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation;version 2 of the License.
+ */
+
+#include <linux/kernel.h>
+#include <linux/sched.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/err.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/clockchips.h>
+#include <linux/of_irq.h>
+#include <linux/of_address.h>
+#include "timer-of.h"
+
+/* Timers registers */
+#define NPCM7XX_REG_TCSR0	0x0 /* Timer 0 Control and Status Register */
+#define NPCM7XX_REG_TICR0	0x8 /* Timer 0 Initial Count Register */
+#define NPCM7XX_REG_TCSR1	0x4 /* Timer 1 Control and Status Register */
+#define NPCM7XX_REG_TICR1	0xc /* Timer 1 Initial Count Register */
+#define NPCM7XX_REG_TDR1	0x14 /* Timer 1 Data Register */
+#define NPCM7XX_REG_TISR	0x18 /* Timer Interrupt Status Register */
+
+/* Timers control */
+#define NPCM7XX_Tx_RESETINT		0x1f
+#define NPCM7XX_Tx_PERIOD		BIT(27)
+#define NPCM7XX_Tx_INTEN		BIT(29)
+#define NPCM7XX_Tx_COUNTEN		BIT(30)
+#define NPCM7XX_Tx_ONESHOT		0x0
+#define NPCM7XX_Tx_OPER			GENMASK(3, 27)
+#define NPCM7XX_Tx_MIN_PRESCALE		0x1
+#define NPCM7XX_Tx_TDR_MASK_BITS	24
+#define NPCM7XX_Tx_MAX_CNT		0xFFFFFF
+#define NPCM7XX_T0_CLR_INT		0x1
+#define NPCM7XX_Tx_CLR_CSR		0x0
+
+/* Timers operating mode */
+#define NPCM7XX_START_PERIODIC_Tx (NPCM7XX_Tx_PERIOD | NPCM7XX_Tx_COUNTEN | \
+					NPCM7XX_Tx_INTEN | \
+					NPCM7XX_Tx_MIN_PRESCALE)
+
+#define NPCM7XX_START_ONESHOT_Tx (NPCM7XX_Tx_ONESHOT | NPCM7XX_Tx_COUNTEN | \
+					NPCM7XX_Tx_INTEN | \
+					NPCM7XX_Tx_MIN_PRESCALE)
+
+#define NPCM7XX_START_Tx (NPCM7XX_Tx_COUNTEN | NPCM7XX_Tx_PERIOD | \
+				NPCM7XX_Tx_MIN_PRESCALE)
+
+#define NPCM7XX_DEFAULT_CSR (NPCM7XX_Tx_CLR_CSR | NPCM7XX_Tx_MIN_PRESCALE)
+
+static int npcm7xx_timer_resume(struct clock_event_device *evt)
+{
+	struct timer_of *to = to_timer_of(evt);
+	u32 val;
+
+	val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
+	val |= NPCM7XX_Tx_COUNTEN;
+	writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
+
+	return 0;
+}
+
+static int npcm7xx_timer_shutdown(struct clock_event_device *evt)
+{
+	struct timer_of *to = to_timer_of(evt);
+	u32 val;
+
+	val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
+	val &= ~NPCM7XX_Tx_COUNTEN;
+	writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
+
+	return 0;
+}
+
+static int npcm7xx_timer_oneshot(struct clock_event_device *evt)
+{
+	struct timer_of *to = to_timer_of(evt);
+	u32 val;
+
+	val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
+	val &= ~NPCM7XX_Tx_OPER;
+
+	val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
+	val |= NPCM7XX_START_ONESHOT_Tx;
+	writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
+
+	return 0;
+}
+
+static int npcm7xx_timer_periodic(struct clock_event_device *evt)
+{
+	struct timer_of *to = to_timer_of(evt);
+	u32 val;
+
+	val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
+	val &= ~NPCM7XX_Tx_OPER;
+
+	writel((timer_of_rate(to) / HZ),
+		timer_of_base(to) + NPCM7XX_REG_TICR0);
+	val |= NPCM7XX_START_PERIODIC_Tx;
+
+	writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
+
+	return 0;
+}
+
+static int npcm7xx_clockevent_setnextevent(unsigned long evt,
+		struct clock_event_device *clk)
+{
+	struct timer_of *to = to_timer_of(clk);
+	u32 val;
+
+	writel(evt, timer_of_base(to) + NPCM7XX_REG_TICR0);
+	val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
+	val |= NPCM7XX_START_Tx;
+	writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
+
+	return 0;
+}
+
+static irqreturn_t npcm7xx_timer0_interrupt(int irq, void *dev_id)
+{
+	struct clock_event_device *evt = (struct clock_event_device *)dev_id;
+	struct timer_of *to = to_timer_of(evt);
+
+	writel(NPCM7XX_T0_CLR_INT, timer_of_base(to) + NPCM7XX_REG_TISR);
+
+	evt->event_handler(evt);
+
+	return IRQ_HANDLED;
+}
+
+static struct timer_of to_npcm7xx = {
+	.flags = TIMER_OF_IRQ | TIMER_OF_BASE,
+
+	.clkevt = {
+		.name		    = "npcm7xx-timer0",
+		.features	    = CLOCK_EVT_FEAT_PERIODIC |
+				      CLOCK_EVT_FEAT_ONESHOT,
+		.set_next_event	    = npcm7xx_clockevent_setnextevent,
+		.set_state_shutdown = npcm7xx_timer_shutdown,
+		.set_state_periodic = npcm7xx_timer_periodic,
+		.set_state_oneshot  = npcm7xx_timer_oneshot,
+		.tick_resume	    = npcm7xx_timer_resume,
+		.rating		    = 300,
+	},
+
+	.of_irq = {
+		.handler = npcm7xx_timer0_interrupt,
+		.flags = IRQF_TIMER | IRQF_IRQPOLL,
+	},
+};
+
+static void __init npcm7xx_clockevents_init(u32 rate)
+{
+	writel(NPCM7XX_DEFAULT_CSR,
+		timer_of_base(&to_npcm7xx) + NPCM7XX_REG_TCSR0);
+
+	writel(NPCM7XX_Tx_RESETINT,
+		timer_of_base(&to_npcm7xx) + NPCM7XX_REG_TISR);
+
+	to_npcm7xx.clkevt.cpumask = cpumask_of(0);
+	clockevents_config_and_register(&to_npcm7xx.clkevt, rate,
+					0x1, NPCM7XX_Tx_MAX_CNT);
+}
+
+static void __init npcm7xx_clocksource_init(u32 rate)
+{
+	u32 val;
+
+	writel(NPCM7XX_DEFAULT_CSR,
+		timer_of_base(&to_npcm7xx) + NPCM7XX_REG_TCSR1);
+	writel(NPCM7XX_Tx_MAX_CNT,
+		timer_of_base(&to_npcm7xx) + NPCM7XX_REG_TICR1);
+
+	val = readl(timer_of_base(&to_npcm7xx) + NPCM7XX_REG_TCSR1);
+	val |= NPCM7XX_START_Tx;
+	writel(val, timer_of_base(&to_npcm7xx) + NPCM7XX_REG_TCSR1);
+
+	clocksource_mmio_init(timer_of_base(&to_npcm7xx) +
+				NPCM7XX_REG_TDR1,
+				"npcm7xx-timer1", rate,
+				300, (unsigned int)NPCM7XX_Tx_TDR_MASK_BITS,
+				clocksource_mmio_readl_down);
+}
+
+static int __init npcm7xx_timer_init(struct device_node *np)
+{
+	struct clk *clk;
+	int ret;
+	u32 rate;
+
+	clk = of_clk_get(np, 0);
+
+	if (IS_ERR(clk)) {
+		ret = of_property_read_u32(np, "clock-frequency", &rate);
+		if (ret)
+			return ret;
+	} else {
+		clk_prepare_enable(clk);
+		rate = clk_get_rate(clk);
+		to_npcm7xx.of_clk.clk = clk;
+	}
+
+	ret = timer_of_init(np, &to_npcm7xx);
+	if (ret)
+		goto err_timer_of_init;
+
+	/* Clock input is divided by PRESCALE + 1 before it is fed */
+	/* to the counter */
+	rate = rate / (NPCM7XX_Tx_MIN_PRESCALE + 1);
+	to_npcm7xx.of_clk.rate = rate;
+
+	npcm7xx_clocksource_init(rate);
+	npcm7xx_clockevents_init(rate);
+
+	pr_info("Enabling NPCM7xx clocksource timer base: %p, IRQ: %d\n",
+		 timer_of_base(&to_npcm7xx), timer_of_irq(&to_npcm7xx));
+
+	return 0;
+
+err_timer_of_init:
+	if (!IS_ERR(clk)) {
+		clk_disable_unprepare(clk);
+		clk_put(clk);
+	}
+
+	return ret;
+}
+
+TIMER_OF_DECLARE(npcm7xx, "nuvoton,npcm750-timer", npcm7xx_timer_init);
+
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
