From: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Subject: [PATCH v4 2/2] clocksource: sprd: Add timer driver for Spreadtrum SC9860 platform
Date: Tue, 12 Dec 2017 19:28:25 +0800
Message-ID: <c5948e4bec5b281fd61d8168bad8d35eb254476d.1513075872.git.baolin.wang@spreadtrum.com>
References: <346a731ce967b56514b0838bbbd8b4f500cea040.1513075872.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <346a731ce967b56514b0838bbbd8b4f500cea040.1513075872.git.baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Spreadtrum SC9860 platform will use the architected timers as local
clock events, but we also need a broadcast timer device to wakeup the
cpus when the cpus are in sleep mode.

The Spreadtrum timer can support 32bit or 64bit counter, as well as
supporting period mode or one-shot mode.

Signed-off-by: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
---
Changes since v3:
 - Use standard clock APIs to get the clock rate.

Changes since v2:
 - Add more timer description in changelog.
 - Rename the driver file.
 - Remove GENERIC_CLOCKEVENTS and ARCH_SPRD dependency.
 - Remove some redundant headfiles.
 - Use timer-of APIs.
 - Change the license format according to Linus[1][2][3],
 Thomas[4] and Greg[5] comments on the topic.
 [1] https://lkml.org/lkml/2017/11/2/715
 [2] https://lkml.org/lkml/2017/11/25/125
 [3] https://lkml.org/lkml/2017/11/25/133
 [4] https://lkml.org/lkml/2017/11/2/805
 [5] https://lkml.org/lkml/2017/10/19/165

Changes since v1:
 - Change to 32bit counter to avoid build warning.
---
 drivers/clocksource/Kconfig      |    7 ++
 drivers/clocksource/Makefile     |    1 +
 drivers/clocksource/timer-sprd.c |  159 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 167 insertions(+)
 create mode 100644 drivers/clocksource/timer-sprd.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index c729a88..9a6b087 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -441,6 +441,13 @@ config MTK_TIMER
 	help
 	  Support for Mediatek timer driver.
 
+config SPRD_TIMER
+	bool "Spreadtrum timer driver" if COMPILE_TEST
+	depends on HAS_IOMEM
+	select TIMER_OF
+	help
+	  Enables the support for the Spreadtrum timer driver.
+
 config SYS_SUPPORTS_SH_MTU2
         bool
 
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 72711f1..d6dec44 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -54,6 +54,7 @@ obj-$(CONFIG_CLKSRC_TI_32K)	+= timer-ti-32k.o
 obj-$(CONFIG_CLKSRC_NPS)	+= timer-nps.o
 obj-$(CONFIG_OXNAS_RPS_TIMER)	+= timer-oxnas-rps.o
 obj-$(CONFIG_OWL_TIMER)		+= owl-timer.o
+obj-$(CONFIG_SPRD_TIMER)	+= timer-sprd.o
 
 obj-$(CONFIG_ARC_TIMERS)		+= arc_timer.o
 obj-$(CONFIG_ARM_ARCH_TIMER)		+= arm_arch_timer.o
diff --git a/drivers/clocksource/timer-sprd.c b/drivers/clocksource/timer-sprd.c
new file mode 100644
index 0000000..ef9ebea
--- /dev/null
+++ b/drivers/clocksource/timer-sprd.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2017 Spreadtrum Communications Inc.
+ */
+
+#include <linux/init.h>
+#include <linux/interrupt.h>
+
+#include "timer-of.h"
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
+static void sprd_timer_enable(void __iomem *base, u32 flag)
+{
+	u32 val = readl_relaxed(base + TIMER_CTL);
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
+	writel_relaxed(val, base + TIMER_CTL);
+}
+
+static void sprd_timer_disable(void __iomem *base)
+{
+	u32 val = readl_relaxed(base + TIMER_CTL);
+
+	val &= ~TIMER_CTL_ENABLE;
+	writel_relaxed(val, base + TIMER_CTL);
+}
+
+static void sprd_timer_update_counter(void __iomem *base, unsigned long cycles)
+{
+	writel_relaxed(cycles & TIMER_VALUE_LO_MASK, base + TIMER_LOAD_LO);
+	writel_relaxed(0, base + TIMER_LOAD_HI);
+}
+
+static void sprd_timer_enable_interrupt(void __iomem *base)
+{
+	writel_relaxed(TIMER_INT_EN, base + TIMER_INT);
+}
+
+static void sprd_timer_clear_interrupt(void __iomem *base)
+{
+	u32 val = readl_relaxed(base + TIMER_INT);
+
+	val |= TIMER_INT_CLR;
+	writel_relaxed(val, base + TIMER_INT);
+}
+
+static int sprd_timer_set_next_event(unsigned long cycles,
+				     struct clock_event_device *ce)
+{
+	struct timer_of *to = to_timer_of(ce);
+
+	sprd_timer_disable(timer_of_base(to));
+	sprd_timer_update_counter(timer_of_base(to), cycles);
+	sprd_timer_enable(timer_of_base(to), 0);
+
+	return 0;
+}
+
+static int sprd_timer_set_periodic(struct clock_event_device *ce)
+{
+	struct timer_of *to = to_timer_of(ce);
+
+	sprd_timer_disable(timer_of_base(to));
+	sprd_timer_update_counter(timer_of_base(to), timer_of_period(to));
+	sprd_timer_enable(timer_of_base(to), TIMER_CTL_PERIOD_MODE);
+
+	return 0;
+}
+
+static int sprd_timer_shutdown(struct clock_event_device *ce)
+{
+	struct timer_of *to = to_timer_of(ce);
+
+	sprd_timer_disable(timer_of_base(to));
+	return 0;
+}
+
+static irqreturn_t sprd_timer_interrupt(int irq, void *dev_id)
+{
+	struct clock_event_device *ce = (struct clock_event_device *)dev_id;
+	struct timer_of *to = to_timer_of(ce);
+
+	sprd_timer_clear_interrupt(timer_of_base(to));
+
+	if (clockevent_state_oneshot(ce))
+		sprd_timer_disable(timer_of_base(to));
+
+	ce->event_handler(ce);
+	return IRQ_HANDLED;
+}
+
+static struct timer_of to = {
+	.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK,
+
+	.clkevt = {
+		.name = TIMER_NAME,
+		.rating = 300,
+		.features = CLOCK_EVT_FEAT_DYNIRQ | CLOCK_EVT_FEAT_PERIODIC |
+			CLOCK_EVT_FEAT_ONESHOT,
+		.set_state_shutdown = sprd_timer_shutdown,
+		.set_state_periodic = sprd_timer_set_periodic,
+		.set_next_event = sprd_timer_set_next_event,
+		.cpumask = cpu_possible_mask,
+	},
+
+	.of_irq = {
+		.handler = sprd_timer_interrupt,
+		.flags = IRQF_TIMER | IRQF_IRQPOLL,
+	},
+};
+
+static int __init sprd_timer_init(struct device_node *np)
+{
+	int ret;
+
+	ret = timer_of_init(np, &to);
+	if (ret)
+		return ret;
+
+	sprd_timer_enable_interrupt(timer_of_base(&to));
+	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
+					1, UINT_MAX);
+
+	return 0;
+}
+
+TIMER_OF_DECLARE(sc9860_timer, "sprd,sc9860-timer", sprd_timer_init);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
