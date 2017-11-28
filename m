From: Baolin Wang <baolin.wang@spreadtrum.com>
Subject: [PATCH v2 2/2] clocksource: sprd: Add timer driver for Spreadtrum SC9860 platform
Date: Tue, 28 Nov 2017 10:45:13 +0800
Message-ID: <041efd5927c0a1da924caaca44794062ddb3cbe7.1511836284.git.baolin.wang@spreadtrum.com>
References: <1b80566bd849d68b0fc8de54ecbbc7b4efbb1077.1511836284.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1b80566bd849d68b0fc8de54ecbbc7b4efbb1077.1511836284.git.baolin.wang@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org, baolin.wang@spreadtrum.com
List-Id: devicetree@vger.kernel.org

The Spreadtrum SC9860 platform will use the architected timers as local
clock events, but we also need a broadcast timer device to wakeup the
cpus when the cpus are in sleep mode.

Thus this patch registers the timer0 to be a broadcast timer supporting
periodic and oneshot events.

Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
---
Changes since v1:
 - Change to 32bit counter to avoid build warning.
---
 drivers/clocksource/Kconfig      |    8 ++
 drivers/clocksource/Makefile     |    1 +
 drivers/clocksource/sprd-timer.c |  211 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 220 insertions(+)
 create mode 100644 drivers/clocksource/sprd-timer.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index c729a88..48c8702 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -441,6 +441,14 @@ config MTK_TIMER
 	help
 	  Support for Mediatek timer driver.
 
+config SPRD_TIMER
+	bool "Spreadtrum timer driver"
+	depends on GENERIC_CLOCKEVENTS
+	depends on ARCH_SPRD || COMPILE_TEST
+	select TIMER_OF
+	help
+	  Enables the support for the Spreadtrum timer driver.
+
 config SYS_SUPPORTS_SH_MTU2
         bool
 
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 72711f1..62bf264 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -54,6 +54,7 @@ obj-$(CONFIG_CLKSRC_TI_32K)	+= timer-ti-32k.o
 obj-$(CONFIG_CLKSRC_NPS)	+= timer-nps.o
 obj-$(CONFIG_OXNAS_RPS_TIMER)	+= timer-oxnas-rps.o
 obj-$(CONFIG_OWL_TIMER)		+= owl-timer.o
+obj-$(CONFIG_SPRD_TIMER)	+= sprd-timer.o
 
 obj-$(CONFIG_ARC_TIMERS)		+= arc_timer.o
 obj-$(CONFIG_ARM_ARCH_TIMER)		+= arm_arch_timer.o
diff --git a/drivers/clocksource/sprd-timer.c b/drivers/clocksource/sprd-timer.c
new file mode 100644
index 0000000..e90f948
--- /dev/null
+++ b/drivers/clocksource/sprd-timer.c
@@ -0,0 +1,211 @@
+/*
+ * Copyright (C) 2017 Spreadtrum Communications Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#include <linux/clocksource.h>
+#include <linux/clockchips.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/sched_clock.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+
+#define TIMER_NAME		"sprd_timer"
+
+#define TIMER_LOAD_LO		0x0
+#define TIMER_LOAD_HI		0x4
+#define TIMER_VALUE_LO		0x8
+#define TIMER_VALUE_HI		0xc
+
+#define TIMER_CTL		0x10
+#define TIMER_CTL_PERIOD_MODE	BIT(0)
+#define TIMER_CTL_ENABLE	BIT(1)
+#define TIMER_CTL_64BIT_WIDTH	BIT(16)
+
+#define TIMER_INT		0x14
+#define TIMER_INT_EN		BIT(0)
+#define TIMER_INT_RAW_STS	BIT(1)
+#define TIMER_INT_MASK_STS	BIT(2)
+#define TIMER_INT_CLR		BIT(3)
+
+#define TIMER_VALUE_SHDW_LO	0x18
+#define TIMER_VALUE_SHDW_HI	0x1c
+
+#define TIMER_VALUE_LO_MASK	GENMASK(31, 0)
+
+struct sprd_timer_device {
+	struct clock_event_device ce;
+	void __iomem *base;
+	u32 freq;
+	int irq;
+};
+
+static inline struct sprd_timer_device *
+to_sprd_timer(struct clock_event_device *c)
+{
+	return container_of(c, struct sprd_timer_device, ce);
+}
+
+static void sprd_timer_enable(struct sprd_timer_device *timer, u32 flag)
+{
+	u32 val = readl_relaxed(timer->base + TIMER_CTL);
+
+	val |= TIMER_CTL_ENABLE;
+	if (flag & TIMER_CTL_64BIT_WIDTH)
+		val |= TIMER_CTL_64BIT_WIDTH;
+	else
+		val &= ~TIMER_CTL_64BIT_WIDTH;
+
+	if (flag & TIMER_CTL_PERIOD_MODE)
+		val |= TIMER_CTL_PERIOD_MODE;
+	else
+		val &= ~TIMER_CTL_PERIOD_MODE;
+
+	writel_relaxed(val, timer->base + TIMER_CTL);
+}
+
+static void sprd_timer_disable(struct sprd_timer_device *timer)
+{
+	u32 val = readl_relaxed(timer->base + TIMER_CTL);
+
+	val &= ~TIMER_CTL_ENABLE;
+	writel_relaxed(val, timer->base + TIMER_CTL);
+}
+
+static void sprd_timer_update_counter(struct sprd_timer_device *timer,
+				      unsigned long cycles)
+{
+	writel_relaxed(cycles & TIMER_VALUE_LO_MASK,
+		       timer->base + TIMER_LOAD_LO);
+	writel_relaxed(0, timer->base + TIMER_LOAD_HI);
+}
+
+static void sprd_timer_enable_interrupt(struct sprd_timer_device *timer)
+{
+	writel_relaxed(TIMER_INT_EN, timer->base + TIMER_INT);
+}
+
+static void sprd_timer_clear_interrupt(struct sprd_timer_device *timer)
+{
+	u32 val = readl_relaxed(timer->base + TIMER_INT);
+
+	val |= TIMER_INT_CLR;
+	writel_relaxed(val, timer->base + TIMER_INT);
+}
+
+static int sprd_timer_set_next_event(unsigned long cycles,
+				     struct clock_event_device *ce)
+{
+	struct sprd_timer_device *timer = to_sprd_timer(ce);
+
+	sprd_timer_disable(timer);
+	sprd_timer_update_counter(timer, cycles);
+	sprd_timer_enable(timer, 0);
+
+	return 0;
+}
+
+static int sprd_timer_set_periodic(struct clock_event_device *ce)
+{
+	struct sprd_timer_device *timer = to_sprd_timer(ce);
+	unsigned long cycles = DIV_ROUND_UP(timer->freq, HZ);
+
+	sprd_timer_disable(timer);
+	sprd_timer_update_counter(timer, cycles);
+	sprd_timer_enable(timer, TIMER_CTL_PERIOD_MODE);
+
+	return 0;
+}
+
+static int sprd_timer_shutdown(struct clock_event_device *ce)
+{
+	struct sprd_timer_device *timer = to_sprd_timer(ce);
+
+	sprd_timer_disable(timer);
+	return 0;
+}
+
+static irqreturn_t sprd_timer_interrupt(int irq, void *dev_id)
+{
+	struct sprd_timer_device *timer = dev_id;
+
+	sprd_timer_clear_interrupt(timer);
+
+	if (clockevent_state_oneshot(&timer->ce))
+		sprd_timer_disable(timer);
+
+	timer->ce.event_handler(&timer->ce);
+	return IRQ_HANDLED;
+}
+
+static void __init sprd_timer_clkevt_init(struct sprd_timer_device *timer)
+{
+	timer->ce.features = CLOCK_EVT_FEAT_DYNIRQ | CLOCK_EVT_FEAT_PERIODIC |
+				CLOCK_EVT_FEAT_ONESHOT;
+	timer->ce.set_next_event = sprd_timer_set_next_event;
+	timer->ce.set_state_periodic = sprd_timer_set_periodic;
+	timer->ce.set_state_shutdown = sprd_timer_shutdown;
+	timer->ce.name = TIMER_NAME;
+	timer->ce.rating = 300;
+	timer->ce.irq = timer->irq;
+	timer->ce.cpumask = cpu_possible_mask;
+
+	sprd_timer_enable_interrupt(timer);
+	clockevents_config_and_register(&timer->ce, timer->freq, 1, UINT_MAX);
+}
+
+static int __init sprd_timer_init(struct device_node *np)
+{
+	struct sprd_timer_device *timer;
+	int ret;
+
+	timer = kzalloc(sizeof(*timer), GFP_KERNEL);
+	if (!timer)
+		return -ENOMEM;
+
+	ret = of_property_read_u32(np, "clock-frequency", &timer->freq);
+	if (ret) {
+		pr_err("failed to get clock frequency\n");
+		goto err_freq;
+	}
+
+	timer->base = of_iomap(np, 0);
+	if (!timer->base) {
+		pr_err("%s: unable to map resource\n", np->name);
+		ret = -ENXIO;
+		goto err_freq;
+	}
+
+	timer->irq = irq_of_parse_and_map(np, 0);
+	if (timer->irq < 0) {
+		pr_crit("%s: unable to parse timer irq\n", np->name);
+		ret = timer->irq;
+		goto err_map_irq;
+	}
+
+	ret = request_irq(timer->irq, sprd_timer_interrupt, IRQF_TIMER,
+			  TIMER_NAME, timer);
+	if (ret) {
+		pr_err("failed to setup irq %d\n", timer->irq);
+		goto err_request_irq;
+	}
+
+	sprd_timer_clkevt_init(timer);
+
+	return 0;
+
+err_request_irq:
+	irq_dispose_mapping(timer->irq);
+err_map_irq:
+	iounmap(timer->base);
+err_freq:
+	kfree(timer);
+
+	return ret;
+}
+
+TIMER_OF_DECLARE(sc9860_timer, "sprd,sc9860-timer", sprd_timer_init);
-- 
1.7.9.5
