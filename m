From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 01/11] clocksource: davinci-timer: new driver
Date: Tue, 26 Feb 2019 13:06:23 +0100
Message-ID: <20190226120633.18200-2-brgl@bgdev.pl>
References: <20190226120633.18200-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190226120633.18200-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, David Lechner <david@lechnology.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Currently the clocksource and clockevent support for davinci platforms
lives in mach-davinci. It hard-codes many things, uses global variables,
implements functionalities unused by any platform and has code fragments
scattered across many (often unrelated) files.

Implement a new, modern and simplified timer driver and put it into
drivers/clocksource. We still need to support legacy board files so
export a config structure and a function that allows machine code to
register the timer.

We don't bother freeing resources on errors in davinci_timer_register()
as the system won't boot without a timer anyway.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/clocksource/Kconfig         |   5 +
 drivers/clocksource/Makefile        |   1 +
 drivers/clocksource/timer-davinci.c | 438 ++++++++++++++++++++++++++++
 include/clocksource/timer-davinci.h |  44 +++
 4 files changed, 488 insertions(+)
 create mode 100644 drivers/clocksource/timer-davinci.c
 create mode 100644 include/clocksource/timer-davinci.h

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index a9e26f6a81a1..36d222c3fa4a 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -42,6 +42,11 @@ config BCM_KONA_TIMER
 	help
 	  Enables the support for the BCM Kona mobile timer driver.
 
+config DAVINCI_TIMER
+	bool "Texas Instruments DaVinci timer driver"
+	help
+	  Enables the support for the TI DaVinci timer driver.
+
 config DIGICOLOR_TIMER
 	bool "Digicolor timer driver" if COMPILE_TEST
 	select CLKSRC_MMIO
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index cdd210ff89ea..1be97aa7a699 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_SH_TIMER_TMU)	+= sh_tmu.o
 obj-$(CONFIG_EM_TIMER_STI)	+= em_sti.o
 obj-$(CONFIG_CLKBLD_I8253)	+= i8253.o
 obj-$(CONFIG_CLKSRC_MMIO)	+= mmio.o
+obj-$(CONFIG_DAVINCI_TIMER)	+= timer-davinci.o
 obj-$(CONFIG_DIGICOLOR_TIMER)	+= timer-digicolor.o
 obj-$(CONFIG_OMAP_DM_TIMER)	+= timer-ti-dm.o
 obj-$(CONFIG_DW_APB_TIMER)	+= dw_apb_timer.o
diff --git a/drivers/clocksource/timer-davinci.c b/drivers/clocksource/timer-davinci.c
new file mode 100644
index 000000000000..ba2b21c94c2f
--- /dev/null
+++ b/drivers/clocksource/timer-davinci.c
@@ -0,0 +1,438 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// TI DaVinci clocksource driver
+//
+// Copyright (C) 2019 Texas Instruments
+// Author: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+// (with some parts adopted from code by Kevin Hilman <khilman@baylibre.com>)
+
+#include <linux/clk.h>
+#include <linux/clockchips.h>
+#include <linux/clocksource.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/sched_clock.h>
+
+#include <clocksource/timer-davinci.h>
+
+#undef pr_fmt
+#define pr_fmt(fmt) "%s: " fmt "\n", __func__
+
+#define DAVINCI_TIMER_REG_TIM12			0x10
+#define DAVINCI_TIMER_REG_TIM34			0x14
+#define DAVINCI_TIMER_REG_PRD12			0x18
+#define DAVINCI_TIMER_REG_PRD34			0x1c
+#define DAVINCI_TIMER_REG_TCR			0x20
+#define DAVINCI_TIMER_REG_TGCR			0x24
+
+#define DAVINCI_TIMER_TIMMODE_MASK		GENMASK(3, 2)
+#define DAVINCI_TIMER_RESET_MASK		GENMASK(1, 0)
+#define DAVINCI_TIMER_TIMMODE_32BIT_UNCHAINED	BIT(2)
+#define DAVINCI_TIMER_UNRESET			GENMASK(1, 0)
+
+/* Shift depends on timer. */
+#define DAVINCI_TIMER_ENAMODE_MASK		GENMASK(1, 0)
+#define DAVINCI_TIMER_ENAMODE_DISABLED		0x00
+#define DAVINCI_TIMER_ENAMODE_ONESHOT		BIT(0)
+#define DAVINCI_TIMER_ENAMODE_PERIODIC		BIT(1)
+
+#define DAVINCI_TIMER_ENAMODE_SHIFT_TIM12	6
+#define DAVINCI_TIMER_ENAMODE_SHIFT_TIM34	22
+
+#define DAVINCI_TIMER_MIN_DELTA			0x01
+#define DAVINCI_TIMER_MAX_DELTA			0xfffffffe
+
+#define DAVINCI_TIMER_CLKSRC_BITS		32
+
+#define DAVINCI_TIMER_TGCR_DEFAULT \
+		(DAVINCI_TIMER_TIMMODE_32BIT_UNCHAINED | DAVINCI_TIMER_UNRESET)
+
+enum {
+	DAVINCI_TIMER_MODE_DISABLED = 0,
+	DAVINCI_TIMER_MODE_ONESHOT,
+	DAVINCI_TIMER_MODE_PERIODIC,
+};
+
+struct davinci_timer_data;
+
+typedef void (*davinci_timer_set_period_func)(struct davinci_timer_data *,
+					      unsigned int period);
+
+/**
+ * struct davinci_timer_regs - timer-specific register offsets
+ *
+ * tim_off - timer counter register
+ * prd_off - timer period register
+ * enamode_shift - left bit-shift of the enable register associated
+ *                 with this timer in the TCR register
+ */
+struct davinci_timer_regs {
+	unsigned int tim_off;
+	unsigned int prd_off;
+	unsigned int enamode_shift;
+};
+
+struct davinci_timer_data {
+	void __iomem *base;
+	const struct davinci_timer_regs *regs;
+	unsigned int mode;
+	davinci_timer_set_period_func set_period;
+	unsigned int cmp_off;
+};
+
+struct davinci_timer_clockevent {
+	struct clock_event_device dev;
+	unsigned int tick_rate;
+	struct davinci_timer_data timer;
+};
+
+struct davinci_timer_clocksource {
+	struct clocksource dev;
+	struct davinci_timer_data timer;
+};
+
+static const struct davinci_timer_regs davinci_timer_tim12_regs = {
+	.tim_off		= DAVINCI_TIMER_REG_TIM12,
+	.prd_off		= DAVINCI_TIMER_REG_PRD12,
+	.enamode_shift		= DAVINCI_TIMER_ENAMODE_SHIFT_TIM12,
+};
+
+static const struct davinci_timer_regs davinci_timer_tim34_regs = {
+	.tim_off		= DAVINCI_TIMER_REG_TIM34,
+	.prd_off		= DAVINCI_TIMER_REG_PRD34,
+	.enamode_shift		= DAVINCI_TIMER_ENAMODE_SHIFT_TIM34,
+};
+
+/* Must be global for davinci_timer_read_sched_clock(). */
+static struct davinci_timer_data *davinci_timer_clksrc_timer;
+
+static struct davinci_timer_clockevent *
+to_davinci_timer_clockevent(struct clock_event_device *clockevent)
+{
+	return container_of(clockevent, struct davinci_timer_clockevent, dev);
+}
+
+static struct davinci_timer_clocksource *
+to_davinci_timer_clocksource(struct clocksource *clocksource)
+{
+	return container_of(clocksource, struct davinci_timer_clocksource, dev);
+}
+
+static unsigned int davinci_timer_read(struct davinci_timer_data *timer,
+				       unsigned int reg)
+{
+	return readl_relaxed(timer->base + reg);
+}
+
+static void davinci_timer_write(struct davinci_timer_data *timer,
+				unsigned int reg, unsigned int val)
+{
+	writel_relaxed(val, timer->base + reg);
+}
+
+static void davinci_timer_update(struct davinci_timer_data *timer,
+				 unsigned int reg, unsigned int mask,
+				 unsigned int val)
+{
+	unsigned int new, orig;
+
+	orig = davinci_timer_read(timer, reg);
+	new = orig & ~mask;
+	new |= val & mask;
+
+	davinci_timer_write(timer, reg, new);
+}
+
+static void davinci_timer_set_period(struct davinci_timer_data *timer,
+				     unsigned int period)
+{
+	timer->set_period(timer, period);
+}
+
+static void davinci_timer_set_period_std(struct davinci_timer_data *timer,
+					 unsigned int period)
+{
+	const struct davinci_timer_regs *regs = timer->regs;
+	unsigned int enamode;
+
+	enamode = davinci_timer_read(timer, DAVINCI_TIMER_REG_TCR);
+
+	davinci_timer_update(timer, DAVINCI_TIMER_REG_TCR,
+			DAVINCI_TIMER_ENAMODE_MASK << regs->enamode_shift,
+			DAVINCI_TIMER_ENAMODE_DISABLED << regs->enamode_shift);
+
+	davinci_timer_write(timer, regs->tim_off, 0x0);
+	davinci_timer_write(timer, regs->prd_off, period);
+
+	if (timer->mode == DAVINCI_TIMER_MODE_ONESHOT)
+		enamode = DAVINCI_TIMER_ENAMODE_ONESHOT;
+	else if (timer->mode == DAVINCI_TIMER_MODE_PERIODIC)
+		enamode = DAVINCI_TIMER_ENAMODE_PERIODIC;
+
+	davinci_timer_update(timer, DAVINCI_TIMER_REG_TCR,
+			     DAVINCI_TIMER_ENAMODE_MASK << regs->enamode_shift,
+			     enamode << regs->enamode_shift);
+}
+
+static void davinci_timer_set_period_cmp(struct davinci_timer_data *timer,
+					 unsigned int period)
+{
+	const struct davinci_timer_regs *regs = timer->regs;
+	unsigned int curr_time;
+
+	curr_time = davinci_timer_read(timer, regs->tim_off);
+	davinci_timer_write(timer, timer->cmp_off, curr_time + period);
+}
+
+static irqreturn_t davinci_timer_irq_timer(int irq, void *data)
+{
+	struct davinci_timer_clockevent *clockevent = data;
+
+	clockevent->dev.event_handler(&clockevent->dev);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t davinci_timer_irq_freerun(int irq, void *data)
+{
+	return IRQ_HANDLED;
+}
+
+static u64 notrace davinci_timer_read_sched_clock(void)
+{
+	struct davinci_timer_data *timer;
+	unsigned int val;
+
+	timer = davinci_timer_clksrc_timer;
+	val = davinci_timer_read(timer, timer->regs->tim_off);
+
+	return val;
+}
+
+static u64 davinci_timer_clksrc_read(struct clocksource *dev)
+{
+	struct davinci_timer_clocksource *clocksource;
+	const struct davinci_timer_regs *regs;
+	unsigned int val;
+
+	clocksource = to_davinci_timer_clocksource(dev);
+	regs = clocksource->timer.regs;
+
+	val = davinci_timer_read(&clocksource->timer, regs->tim_off);
+
+	return val;
+}
+
+static int davinci_timer_set_next_event(unsigned long cycles,
+					struct clock_event_device *dev)
+{
+	struct davinci_timer_clockevent *clockevent;
+
+	clockevent = to_davinci_timer_clockevent(dev);
+	davinci_timer_set_period(&clockevent->timer, cycles);
+
+	return 0;
+}
+
+static int davinci_timer_set_state_shutdown(struct clock_event_device *dev)
+{
+	struct davinci_timer_clockevent *clockevent;
+
+	clockevent = to_davinci_timer_clockevent(dev);
+	clockevent->timer.mode = DAVINCI_TIMER_MODE_DISABLED;
+
+	return 0;
+}
+
+static int davinci_timer_set_state_periodic(struct clock_event_device *dev)
+{
+	struct davinci_timer_clockevent *clockevent;
+	unsigned int period;
+
+	clockevent = to_davinci_timer_clockevent(dev);
+	period = clockevent->tick_rate / HZ;
+
+	clockevent->timer.mode = DAVINCI_TIMER_MODE_PERIODIC;
+	davinci_timer_set_period(&clockevent->timer, period);
+
+	return 0;
+}
+
+static int davinci_timer_set_state_oneshot(struct clock_event_device *dev)
+{
+	struct davinci_timer_clockevent *clockevent;
+
+	clockevent = to_davinci_timer_clockevent(dev);
+	clockevent->timer.mode = DAVINCI_TIMER_MODE_ONESHOT;
+
+	return 0;
+}
+
+static void davinci_timer_init(void __iomem *base)
+{
+	/* Set clock to internal mode and disable it. */
+	writel_relaxed(0x0, base + DAVINCI_TIMER_REG_TCR);
+	/*
+	 * Reset both 32-bit timers, set no prescaler for timer 34, set the
+	 * timer to dual 32-bit unchained mode, unreset both 32-bit timers.
+	 */
+	writel_relaxed(DAVINCI_TIMER_TGCR_DEFAULT,
+		       base + DAVINCI_TIMER_REG_TGCR);
+	/* Init both counters to zero. */
+	writel_relaxed(0x0, base + DAVINCI_TIMER_REG_TIM12);
+	writel_relaxed(0x0, base + DAVINCI_TIMER_REG_TIM34);
+}
+
+int __init davinci_timer_register(struct clk *clk,
+				  const struct davinci_timer_cfg *timer_cfg)
+{
+	struct davinci_timer_clocksource *clocksource;
+	struct davinci_timer_clockevent *clockevent;
+	void __iomem *base;
+	int rv;
+
+	rv = clk_prepare_enable(clk);
+	if (rv) {
+		pr_err("Unable to prepare and enable the timer clock\n");
+		return rv;
+	}
+
+	base = request_mem_region(timer_cfg->reg.start,
+				  resource_size(&timer_cfg->reg),
+				  "davinci-timer");
+	if (!base) {
+		pr_err("Unable to request memory region\n");
+		return -EBUSY;
+	}
+
+	base = ioremap(timer_cfg->reg.start, resource_size(&timer_cfg->reg));
+	if (!base) {
+		pr_err("Unable to map the register range\n");
+		return -ENOMEM;
+	}
+
+	davinci_timer_init(base);
+
+	clockevent = kzalloc(sizeof(*clockevent), GFP_KERNEL);
+	if (!clockevent) {
+		pr_err("Error allocating memory for clockevent data\n");
+		return -ENOMEM;
+	}
+
+	clockevent->dev.name = "tim12";
+	clockevent->dev.features = CLOCK_EVT_FEAT_ONESHOT;
+	clockevent->dev.set_next_event = davinci_timer_set_next_event;
+	clockevent->dev.set_state_shutdown = davinci_timer_set_state_shutdown;
+	clockevent->dev.set_state_periodic = davinci_timer_set_state_periodic;
+	clockevent->dev.set_state_oneshot = davinci_timer_set_state_oneshot;
+	clockevent->dev.cpumask = cpumask_of(0);
+	clockevent->tick_rate = clk_get_rate(clk);
+	clockevent->timer.mode = DAVINCI_TIMER_MODE_DISABLED;
+	clockevent->timer.base = base;
+	clockevent->timer.regs = &davinci_timer_tim12_regs;
+
+	if (timer_cfg->cmp_off) {
+		clockevent->timer.cmp_off = timer_cfg->cmp_off;
+		clockevent->timer.set_period = davinci_timer_set_period_cmp;
+	} else {
+		clockevent->dev.features |= CLOCK_EVT_FEAT_PERIODIC;
+		clockevent->timer.set_period = davinci_timer_set_period_std;
+	}
+
+	rv = request_irq(timer_cfg->irq[DAVINCI_TIMER_CLOCKEVENT_IRQ].start,
+			 davinci_timer_irq_timer, IRQF_TIMER,
+			 "clockevent", clockevent);
+	if (rv) {
+		pr_err("Unable to request the clockevent interrupt\n");
+		return rv;
+	}
+
+	clockevents_config_and_register(&clockevent->dev,
+					clockevent->tick_rate,
+					DAVINCI_TIMER_MIN_DELTA,
+					DAVINCI_TIMER_MAX_DELTA);
+
+	clocksource = kzalloc(sizeof(*clocksource), GFP_KERNEL);
+	if (!clocksource) {
+		pr_err("Error allocating memory for clocksource data\n");
+		return -ENOMEM;
+	}
+
+	clocksource->dev.rating = 300;
+	clocksource->dev.read = davinci_timer_clksrc_read;
+	clocksource->dev.mask = CLOCKSOURCE_MASK(DAVINCI_TIMER_CLKSRC_BITS);
+	clocksource->dev.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	clocksource->timer.set_period = davinci_timer_set_period_std;
+	clocksource->timer.mode = DAVINCI_TIMER_MODE_PERIODIC;
+	clocksource->timer.base = base;
+
+	if (timer_cfg->cmp_off) {
+		clocksource->timer.regs = &davinci_timer_tim12_regs;
+		clocksource->dev.name = "tim12";
+	} else {
+		clocksource->timer.regs = &davinci_timer_tim34_regs;
+		clocksource->dev.name = "tim34";
+	}
+
+	rv = request_irq(timer_cfg->irq[DAVINCI_TIMER_CLOCKSOURCE_IRQ].start,
+			 davinci_timer_irq_freerun, IRQF_TIMER,
+			 "free-run counter", clocksource);
+	if (rv) {
+		pr_err("Unable to request the clocksource interrupt\n");
+		return rv;
+	}
+
+	rv = clocksource_register_hz(&clocksource->dev, clockevent->tick_rate);
+	if (rv) {
+		pr_err("Unable to register clocksource\n");
+		return rv;
+	}
+
+	davinci_timer_clksrc_timer = &clocksource->timer;
+
+	sched_clock_register(davinci_timer_read_sched_clock,
+			     DAVINCI_TIMER_CLKSRC_BITS,
+			     clockevent->tick_rate);
+
+	davinci_timer_set_period(&clockevent->timer,
+				 clockevent->tick_rate / HZ);
+	davinci_timer_set_period(&clocksource->timer, UINT_MAX);
+
+	return 0;
+}
+
+static int __init of_davinci_timer_register(struct device_node *np)
+{
+	struct davinci_timer_cfg timer_cfg = { };
+	struct clk *clk;
+	int rv;
+
+	rv = of_address_to_resource(np, 0, &timer_cfg.reg);
+	if (rv) {
+		pr_err("Unable to get the register range for timer\n");
+		return rv;
+	}
+
+	rv = of_irq_to_resource_table(np, timer_cfg.irq,
+				      DAVINCI_TIMER_NUM_IRQS);
+	if (rv != DAVINCI_TIMER_NUM_IRQS) {
+		pr_err("Unable to get the interrupts for timer\n");
+		return rv;
+	}
+
+	clk = of_clk_get(np, 0);
+	if (IS_ERR(clk)) {
+		pr_err("Unable to get the timer clock\n");
+		return PTR_ERR(clk);
+	}
+
+	rv = davinci_timer_register(clk, &timer_cfg);
+	if (rv)
+		clk_put(clk);
+
+	return rv;
+}
+TIMER_OF_DECLARE(davinci_timer, "ti,da830-timer", of_davinci_timer_register);
diff --git a/include/clocksource/timer-davinci.h b/include/clocksource/timer-davinci.h
new file mode 100644
index 000000000000..1dcc1333fbc8
--- /dev/null
+++ b/include/clocksource/timer-davinci.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * TI DaVinci clocksource driver
+ *
+ * Copyright (C) 2019 Texas Instruments
+ * Author: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+ */
+
+#ifndef __TIMER_DAVINCI_H__
+#define __TIMER_DAVINCI_H__
+
+#include <linux/clk.h>
+#include <linux/ioport.h>
+
+enum {
+	DAVINCI_TIMER_CLOCKEVENT_IRQ,
+	DAVINCI_TIMER_CLOCKSOURCE_IRQ,
+	DAVINCI_TIMER_NUM_IRQS,
+};
+
+/**
+ * struct davinci_timer_cfg - davinci clocksource driver configuration struct
+ * @reg:        register range resource
+ * @irq:        clockevent and clocksource interrupt resources
+ * @cmp_off:    if set - it specifies the compare register used for clockevent
+ *
+ * Note: if the compare register is specified, the driver will use the bottom
+ * clock half for both clocksource and clockevent and the compare register
+ * to generate event irqs. The user must supply the correct compare register
+ * interrupt number.
+ *
+ * This is only used by da830 the DSP of which uses the top half. The timer
+ * driver still configures the top half to run in free-run mode.
+ */
+struct davinci_timer_cfg {
+	struct resource reg;
+	struct resource irq[DAVINCI_TIMER_NUM_IRQS];
+	unsigned int cmp_off;
+};
+
+int __init davinci_timer_register(struct clk *clk,
+				  const struct davinci_timer_cfg *data);
+
+#endif /* __TIMER_DAVINCI_H__ */
-- 
2.20.1
