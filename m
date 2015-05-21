From: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 6/7] clocksource: Add Pistachio clocksource-only driver
Date: Thu, 21 May 2015 18:41:46 -0300
Message-ID: <1432244506-15388-1-git-send-email-ezequiel.garcia@imgtec.com>
References: <1432244260-14908-1-git-send-email-ezequiel.garcia@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432244260-14908-1-git-send-email-ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, Govindraj.Raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Pistachio SoC provides four general purpose timers, and allow
to implement a clocksource driver.

This driver can be used as a replacement for the MIPS GIC and MIPS R4K
clocksources and sched clocks, which are clocked from the CPU clock.

Given the general purpose timers are clocked from an independent clock,
this new clocksource driver will be useful to introduce CPUFreq support
for Pistachio machines.

Signed-off-by: Govindraj Raja <Govindraj.Raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
---
 drivers/clocksource/Kconfig          |   4 +
 drivers/clocksource/Makefile         |   1 +
 drivers/clocksource/time-pistachio.c | 202 +++++++++++++++++++++++++++++++++++
 3 files changed, 207 insertions(+)
 create mode 100644 drivers/clocksource/time-pistachio.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 51d7865f..faa16ae 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -106,6 +106,10 @@ config CLKSRC_EFM32
 	  Support to use the timers of EFM32 SoCs as clock source and clock
 	  event device.
 
+config CLKSRC_PISTACHIO
+	bool
+	select CLKSRC_OF
+
 config ARM_ARCH_TIMER
 	bool
 	select CLKSRC_OF if OF
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 5b85f6a..9415def 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -42,6 +42,7 @@ obj-$(CONFIG_FSL_FTM_TIMER)	+= fsl_ftm_timer.o
 obj-$(CONFIG_VF_PIT_TIMER)	+= vf_pit_timer.o
 obj-$(CONFIG_CLKSRC_QCOM)	+= qcom-timer.o
 obj-$(CONFIG_MTK_TIMER)		+= mtk_timer.o
+obj-$(CONFIG_CLKSRC_PISTACHIO)	+= time-pistachio.o
 
 obj-$(CONFIG_ARM_ARCH_TIMER)		+= arm_arch_timer.o
 obj-$(CONFIG_ARM_GLOBAL_TIMER)		+= arm_global_timer.o
diff --git a/drivers/clocksource/time-pistachio.c b/drivers/clocksource/time-pistachio.c
new file mode 100644
index 0000000..952d8e6
--- /dev/null
+++ b/drivers/clocksource/time-pistachio.c
@@ -0,0 +1,202 @@
+/*
+ * Pistachio clocksource based on general-purpose timers
+ *
+ * Copyright (C) 2015 Imagination Technologies
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License. See the file "COPYING" in the main directory of this archive
+ * for more details.
+ */
+
+#define pr_fmt(fmt) "%s: " fmt, __func__
+
+#include <linux/clk.h>
+#include <linux/clocksource.h>
+#include <linux/clockchips.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/spinlock.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/sched_clock.h>
+#include <linux/time.h>
+
+/* Top level reg */
+#define	CR_TIMER_CTRL_CFG		0x00
+  #define TIMER_ME_GLOBAL		BIT(0)
+#define	CR_TIMER_REV			0x10
+
+/* Timer specific registers */
+#define TIMER_CFG			0x20
+  #define TIMER_ME_LOCAL		BIT(0)
+#define TIMER_RELOAD_VALUE		0x24
+#define TIMER_CURRENT_VALUE		0x28
+#define TIMER_CURRENT_OVERFLOW_VALUE	0x2C
+#define TIMER_IRQ_STATUS		0x30
+#define TIMER_IRQ_CLEAR			0x34
+#define TIMER_IRQ_MASK			0x38
+
+#define PERIP_TIMER_CONTROL		0x90
+
+/* Timer specific configuration Values */
+#define RELOAD_VALUE	0xffffffff
+
+static void __iomem *timer_base;
+static DEFINE_RAW_SPINLOCK(lock);
+
+static inline u32 gpt_readl(u32 offset, u32 gpt_id)
+{
+	return __raw_readl(timer_base + 0x20 * gpt_id + offset);
+}
+
+static inline void gpt_writel(u32 value, u32 offset, u32 gpt_id)
+{
+	__raw_writel(value, timer_base + 0x20 * gpt_id + offset);
+}
+
+static cycle_t clocksource_read_cycles(struct clocksource *cs)
+{
+	u32 counter, overflw;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&lock, flags);
+	overflw = gpt_readl(TIMER_CURRENT_OVERFLOW_VALUE, 0);
+	counter = gpt_readl(TIMER_CURRENT_VALUE, 0);
+	raw_spin_unlock_irqrestore(&lock, flags);
+
+	return ~(cycle_t)counter;
+}
+
+static u64 notrace pistachio_read_sched_clock(void)
+{
+	return clocksource_read_cycles(NULL);
+}
+
+static void pistachio_clksrc_enable(int timeridx)
+{
+	u32 val;
+
+	/* Disable GPT local before loading reload value */
+	val = gpt_readl(TIMER_CFG, timeridx);
+	val &= ~TIMER_ME_LOCAL;
+	gpt_writel(val, TIMER_CFG, timeridx);
+
+	gpt_writel(RELOAD_VALUE, TIMER_RELOAD_VALUE, timeridx);
+
+	val = gpt_readl(TIMER_CFG, timeridx);
+	val |= TIMER_ME_LOCAL;
+	gpt_writel(val, TIMER_CFG, timeridx);
+}
+
+static void pistachio_clksrc_disable(int timeridx)
+{
+	u32 val;
+
+	/* Disable GPT local */
+	val = gpt_readl(TIMER_CFG, timeridx);
+	val &= ~TIMER_ME_LOCAL;
+	gpt_writel(val, TIMER_CFG, timeridx);
+}
+
+static int clocksource_enable(struct clocksource *cs)
+{
+	pistachio_clksrc_enable(0);
+	return 0;
+}
+
+static void clocksource_disable(struct clocksource *cs)
+{
+	pistachio_clksrc_disable(0);
+}
+
+/* Desirable clock source for pistachio platform */
+static struct clocksource clocksource_gpt = {
+	.name		= "gptimer",
+	.rating		= 300,
+	.enable		= clocksource_enable,
+	.disable	= clocksource_disable,
+	.read		= clocksource_read_cycles,
+	.mask		= CLOCKSOURCE_MASK(32),
+	.flags		= CLOCK_SOURCE_IS_CONTINUOUS |
+			  CLOCK_SOURCE_SUSPEND_NONSTOP,
+};
+
+static void __init pistachio_clksrc_of_init(struct device_node *node)
+{
+	struct clk *sys_clk, *fast_clk;
+	struct regmap *periph_regs;
+	unsigned long rate;
+	int ret;
+
+	timer_base = of_iomap(node, 0);
+	if (!timer_base) {
+		pr_err("cannot iomap\n");
+		return;
+	}
+
+	/*
+	 * We need early syscon or late clocksource probe for this to work.
+	 */
+	periph_regs = syscon_regmap_lookup_by_phandle(node, "img,cr-periph");
+	if (IS_ERR(periph_regs)) {
+		pr_err("cannot get peripheral regmap (%lu)\n",
+		       PTR_ERR(periph_regs));
+		return;
+	}
+
+	/* Switch to using the fast counter clock */
+	ret = regmap_update_bits(periph_regs, PERIP_TIMER_CONTROL,
+				 0xf, 0x0);
+	if (ret)
+		return;
+
+	sys_clk = of_clk_get_by_name(node, "sys");
+	if (IS_ERR(sys_clk)) {
+		pr_err("clock get failed (%lu)\n", PTR_ERR(sys_clk));
+		return;
+	}
+
+	fast_clk = of_clk_get_by_name(node, "fast");
+	if (IS_ERR(fast_clk)) {
+		pr_err("clock get failed (%lu)\n", PTR_ERR(fast_clk));
+		return;
+	}
+
+	ret = clk_prepare_enable(sys_clk);
+	if (ret < 0) {
+		pr_err("failed to enable clock (%d)\n", ret);
+		return;
+	}
+
+	ret = clk_prepare_enable(fast_clk);
+	if (ret < 0) {
+		pr_err("failed to enable clock (%d)\n", ret);
+		clk_disable_unprepare(sys_clk);
+		return;
+	}
+
+	rate = clk_get_rate(fast_clk);
+
+	/* Disable irq's for clocksource usage */
+	gpt_writel(0, TIMER_IRQ_MASK, 0);
+	gpt_writel(0, TIMER_IRQ_MASK, 1);
+	gpt_writel(0, TIMER_IRQ_MASK, 2);
+	gpt_writel(0, TIMER_IRQ_MASK, 3);
+
+	/* Enable timer block */
+	__raw_writel(TIMER_ME_GLOBAL, timer_base);
+
+	sched_clock_register(pistachio_read_sched_clock, 32, rate);
+	clocksource_register_hz(&clocksource_gpt, rate);
+}
+
+static const struct of_device_id pistachio_clksrc_of_match[] __initconst = {
+	{ .compatible = "img,pistachio-gptimer" },
+	{ },
+};
+CLOCKSOURCE_OF_DECLARE(pistachio_gptimer, "img,pistachio-gptimer",
+		       pistachio_clksrc_of_init);
-- 
2.3.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
