From: Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/2] clocksource: npcm: add NPCM7xx timer driver
Date: Wed,  1 Nov 2017 14:16:43 +0200
Message-ID: <1509538604-8218-2-git-send-email-tmaimon77@gmail.com>
References: <1509538604-8218-1-git-send-email-tmaimon77@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509538604-8218-1-git-send-email-tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
 drivers/clocksource/npcm7xx-timer.c | 224 ++++++++++++++++++++++++++++++++++++
 3 files changed, 233 insertions(+)
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
index dbc1ad14515e..f2a9318a1eec 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -53,6 +53,7 @@ obj-$(CONFIG_CLKSRC_TI_32K)	+= timer-ti-32k.o
 obj-$(CONFIG_CLKSRC_NPS)	+= timer-nps.o
 obj-$(CONFIG_OXNAS_RPS_TIMER)	+= timer-oxnas-rps.o
 obj-$(CONFIG_OWL_TIMER)		+= owl-timer.o
+obj-$(CONFIG_NPCM7XX_TIMER)	+= npcm7xx-timer.o
 
 obj-$(CONFIG_ARC_TIMERS)		+= arc_timer.o
 obj-$(CONFIG_ARM_ARCH_TIMER)		+= arm_arch_timer.o
diff --git a/drivers/clocksource/npcm7xx-timer.c b/drivers/clocksource/npcm7xx-timer.c
new file mode 100644
index 000000000000..d1ea5c183a69
--- /dev/null
+++ b/drivers/clocksource/npcm7xx-timer.c
@@ -0,0 +1,224 @@
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
+
+struct npcm7xx_clockevent_data {
+	struct clock_event_device cvd;
+	void __iomem *timer_base;
+	unsigned int rate;
+};
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
+#define NPCM7XX_START_Tx (NPCM7XX_Tx_COUNTEN | NPCM7XX_Tx_PERIOD | \
+				NPCM7XX_Tx_MIN_PRESCALE)
+
+static int npcm7xx_timer_oneshot(struct clock_event_device *evt)
+{
+	u32 val;
+	struct npcm7xx_clockevent_data *cevtd =
+		container_of(evt, struct npcm7xx_clockevent_data, cvd);
+
+	val = readl(cevtd->timer_base + NPCM7XX_REG_TCSR0);
+	val &= ~NPCM7XX_Tx_OPER;
+
+	val = readl(cevtd->timer_base + NPCM7XX_REG_TCSR0);
+	val |= NPCM7XX_START_ONESHOT_Tx;
+	writel(val, cevtd->timer_base + NPCM7XX_REG_TCSR0);
+
+	return 0;
+}
+
+static int npcm7xx_timer_periodic(struct clock_event_device *evt)
+{
+	struct npcm7xx_clockevent_data *cevtd =
+		container_of(evt, struct npcm7xx_clockevent_data, cvd);
+	u32 val;
+
+	val = readl(cevtd->timer_base + NPCM7XX_REG_TCSR0);
+	val &= ~NPCM7XX_Tx_OPER;
+
+	writel((cevtd->rate / HZ), cevtd->timer_base + NPCM7XX_REG_TICR0);
+	val |= NPCM7XX_START_PERIODIC_Tx;
+
+	writel(val, cevtd->timer_base + NPCM7XX_REG_TCSR0);
+
+	return 0;
+}
+
+static int npcm7xx_clockevent_setnextevent(unsigned long evt,
+		struct clock_event_device *clk)
+{
+	struct npcm7xx_clockevent_data *cevtd =
+		container_of(clk, struct npcm7xx_clockevent_data, cvd);
+	u32 val;
+
+	writel(evt, cevtd->timer_base + NPCM7XX_REG_TICR0);
+	val = readl(cevtd->timer_base + NPCM7XX_REG_TCSR0);
+	val |= NPCM7XX_START_Tx;
+	writel(val, cevtd->timer_base + NPCM7XX_REG_TCSR0);
+
+	return 0;
+}
+
+static struct npcm7xx_clockevent_data npcm7xx_clockevent_data = {
+	.cvd = {
+		.name		    = "npcm7xx-timer0",
+		.features	    = CLOCK_EVT_FEAT_PERIODIC |
+				      CLOCK_EVT_FEAT_ONESHOT,
+		.set_next_event	    = npcm7xx_clockevent_setnextevent,
+		.set_state_shutdown = npcm7xx_timer_oneshot,
+		.set_state_periodic = npcm7xx_timer_periodic,
+		.set_state_oneshot  = npcm7xx_timer_oneshot,
+		.tick_resume	    = npcm7xx_timer_oneshot,
+		.rating		    = 300
+	},
+};
+
+static irqreturn_t npcm7xx_timer0_interrupt(int irq, void *dev_id)
+{
+	struct npcm7xx_clockevent_data *cevtd = dev_id;
+	struct clock_event_device *evt = &cevtd->cvd;
+
+	writel(NPCM7XX_T0_CLR_INT, cevtd->timer_base + NPCM7XX_REG_TISR);
+
+	if (evt->event_handler) {
+		evt->event_handler(evt);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
+static struct irqaction npcm7xx_timer0_irq = {
+	.name		= "npcm7xx-timer0",
+	.flags		= IRQF_TIMER | IRQF_IRQPOLL,
+	.handler	= npcm7xx_timer0_interrupt,
+	.dev_id		= &npcm7xx_clockevent_data,
+};
+
+static void __init npcm7xx_clockevents_init(int irq, u32 rate)
+{
+	writel(NPCM7XX_Tx_CLR_CSR,
+		npcm7xx_clockevent_data.timer_base + NPCM7XX_REG_TCSR0);
+
+	writel(NPCM7XX_Tx_RESETINT,
+		npcm7xx_clockevent_data.timer_base + NPCM7XX_REG_TISR);
+	setup_irq(irq, &npcm7xx_timer0_irq);
+	npcm7xx_clockevent_data.cvd.cpumask = cpumask_of(0);
+
+	clockevents_config_and_register(&npcm7xx_clockevent_data.cvd, rate,
+					0x1, NPCM7XX_Tx_MAX_CNT);
+}
+
+static void __init npcm7xx_clocksource_init(u32 rate)
+{
+	u32 val;
+
+	writel(NPCM7XX_Tx_CLR_CSR,
+		npcm7xx_clockevent_data.timer_base + NPCM7XX_REG_TCSR1);
+	writel(NPCM7XX_Tx_MAX_CNT,
+		npcm7xx_clockevent_data.timer_base + NPCM7XX_REG_TICR1);
+
+	val = readl(npcm7xx_clockevent_data.timer_base + NPCM7XX_REG_TCSR1);
+	val |= NPCM7XX_START_Tx;
+	writel(val, npcm7xx_clockevent_data.timer_base + NPCM7XX_REG_TCSR1);
+
+	clocksource_mmio_init(npcm7xx_clockevent_data.timer_base +
+				NPCM7XX_REG_TDR1,
+				"npcm7xx-timer1", rate,
+				300, (unsigned int)NPCM7XX_Tx_TDR_MASK_BITS,
+				clocksource_mmio_readl_down);
+}
+
+static int __init npcm7xx_timer_init(struct device_node *np)
+{
+	struct clk *clk;
+	int irq, ret;
+	u32 rate;
+
+	irq = irq_of_parse_and_map(np, 0);
+	if (!irq)
+		return -EINVAL;
+
+	npcm7xx_clockevent_data.timer_base = of_iomap(np, 0);
+	if (!npcm7xx_clockevent_data.timer_base)
+		return -ENXIO;
+
+	clk = of_clk_get(np, 0);
+
+	if (IS_ERR(clk)) {
+		ret = of_property_read_u32(np, "clock-frequency", &rate);
+		if (ret)
+			goto err_iounmap;
+	} else {
+		clk_prepare_enable(clk);
+		rate = clk_get_rate(clk);
+	}
+
+	/* Clock input is divided by PRESCALE + 1 before it is fed */
+	/* to the counter */
+	rate = rate / (NPCM7XX_Tx_MIN_PRESCALE + 1);
+
+	npcm7xx_clockevent_data.rate = rate;
+
+	npcm7xx_clocksource_init(rate);
+	npcm7xx_clockevents_init(irq, rate);
+
+	pr_info("Enabling NPCM7xx clocksource timer base: %p, IRQ: %u\n",
+		npcm7xx_clockevent_data.timer_base, irq);
+
+	return 0;
+
+err_iounmap:
+	iounmap(npcm7xx_clockevent_data.timer_base);
+	return ret;
+
+}
+
+TIMER_OF_DECLARE(npcm7xx, "nuvoton,npcm7xx-timer", npcm7xx_timer_init);
+
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
