From: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/2] clocksource: Add renesas-ostm timer driver
Date: Thu, 12 Jan 2017 13:59:52 -0500
Message-ID: <20170112185952.2780-3-chris.brandt@renesas.com>
References: <20170112185952.2780-1-chris.brandt@renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170112185952.2780-1-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds a OSTM driver for the Renesas architecture.

Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-shmobile/Kconfig     |   1 +
 drivers/clocksource/Kconfig        |  12 ++
 drivers/clocksource/Makefile       |   1 +
 drivers/clocksource/renesas-ostm.c | 389 +++++++++++++++++++++++++++++++++++++
 4 files changed, 403 insertions(+)
 create mode 100644 drivers/clocksource/renesas-ostm.c

diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index 2bb4b09..b928634 100644
--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@ -57,6 +57,7 @@ config ARCH_R7S72100
 	select PM
 	select PM_GENERIC_DOMAINS
 	select SYS_SUPPORTS_SH_MTU2
+	select SYS_SUPPORTS_RENESAS_OSTM
 
 config ARCH_R8A73A4
 	bool "R-Mobile APE6 (R8A73A40)"
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 4866f7a..95c8d56 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -431,6 +431,9 @@ config MTK_TIMER
 config SYS_SUPPORTS_SH_MTU2
         bool
 
+config SYS_SUPPORTS_RENESAS_OSTM
+        bool
+
 config SYS_SUPPORTS_SH_TMU
         bool
 
@@ -467,6 +470,15 @@ config SH_TIMER_MTU2
 	  Timer Pulse Unit 2 (MTU2) hardware available on SoCs from Renesas.
 	  This hardware comes with 16 bit-timer registers.
 
+config RENESAS_OSTM
+	bool "Renesas OSTM timer driver" if COMPILE_TEST
+	depends on GENERIC_CLOCKEVENTS
+	select CLKSRC_MMIO
+	default SYS_SUPPORTS_RENESAS_OSTM
+	help
+	  This enables the build of the OSTM timer driver.
+	  It creates a clock source and clock event device.
+
 config SH_TIMER_TMU
 	bool "Renesas TMU timer driver" if COMPILE_TEST
 	depends on GENERIC_CLOCKEVENTS
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index a14111e..bbd163b 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_CS5535_CLOCK_EVENT_SRC)	+= cs5535-clockevt.o
 obj-$(CONFIG_CLKSRC_JCORE_PIT)		+= jcore-pit.o
 obj-$(CONFIG_SH_TIMER_CMT)	+= sh_cmt.o
 obj-$(CONFIG_SH_TIMER_MTU2)	+= sh_mtu2.o
+obj-$(CONFIG_RENESAS_OSTM)	+= renesas-ostm.o
 obj-$(CONFIG_SH_TIMER_TMU)	+= sh_tmu.o
 obj-$(CONFIG_EM_TIMER_STI)	+= em_sti.o
 obj-$(CONFIG_CLKBLD_I8253)	+= i8253.o
diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
new file mode 100644
index 0000000..3b417b9
--- /dev/null
+++ b/drivers/clocksource/renesas-ostm.c
@@ -0,0 +1,389 @@
+/*
+ * Renesas Timer Support - OSTM
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/clockchips.h>
+#include <linux/interrupt.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/sched_clock.h>
+
+/*
+ * The OSTM comes with 2 independent channels.
+ * We will use the first channel (OSTM0) as a free running clocksource and the
+ * second channel (OSTM1) as a interrupt driven clock event.
+ *
+ * Additionally we will use the clocksource channel (OTSM0) for the system
+ * schedule timer sched_clock().
+ */
+
+struct ostm_channel {
+	int irq;
+	struct clk *clk;
+	unsigned long rate;
+	void __iomem *base;
+	unsigned long ticks_per_jiffy;
+	struct clock_event_device ced;
+	struct clocksource cs;
+};
+
+struct ostm_device {
+	struct platform_device *pdev;
+	struct ostm_channel clksrc;	/* clock source ostm0 */
+	struct ostm_channel clkevt;	/* clock event ostm1 */
+};
+
+static void __iomem *system_clock;	/* For sched_clock() */
+
+/* OSTM REGISTERS */
+#define	OSTM_CMP		0x000	/* RW,32 */
+#define	OSTM_CNT		0x004	/* R,32 */
+#define	OSTM_TE			0x010	/* R,8 */
+#define	OSTM_TS			0x014	/* W,8 */
+#define	OSTM_TT			0x018	/* W,8 */
+#define	OSTM_CTL		0x020	/* RW,8 */
+
+#define	TE			0x01
+#define	TS			0x01
+#define	TT			0x01
+#define	CTL_PERIODIC		0x00
+#define	CTL_ONESHOT		0x02
+#define	CTL_FREERUN		0x02
+
+static struct ostm_channel *ced_to_ostm_ch(struct clock_event_device *ced)
+{
+	return container_of(ced, struct ostm_channel, ced);
+}
+
+static int __init ostm_init_clksrc(struct ostm_device *ostm)
+{
+	struct ostm_channel *cs = &ostm->clksrc;
+	struct resource *res;
+	int ret = -ENXIO;
+
+	res = platform_get_resource(ostm->pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&ostm->pdev->dev, "failed to get I/O memory\n");
+		goto err;
+	}
+	cs->base = ioremap_nocache(res->start, resource_size(res));
+	if (!cs->base) {
+		dev_err(&ostm->pdev->dev, "failed to remap I/O memory\n");
+		goto err;
+	}
+
+	/* irq not used (clock sources don't use interrupts) */
+	cs->irq = platform_get_irq(ostm->pdev, 0);
+	if (cs->irq < 0) {
+		dev_err(&ostm->pdev->dev, "failed to get irq\n");
+		goto err_iounmap;
+	}
+
+	cs->clk = of_clk_get(ostm->pdev->dev.of_node, 0);
+	if (IS_ERR(cs->clk)) {
+		dev_err(&ostm->pdev->dev, "failed to get clock\n");
+		goto err_iounmap;
+	}
+
+	ret = clk_prepare_enable(cs->clk);
+	if (ret) {
+		dev_err(&ostm->pdev->dev, "failed to enable clock\n");
+		goto err_iounmap;
+	}
+	cs->rate = clk_get_rate(cs->clk);
+
+	/* stop counter */
+	iowrite8(TT, cs->base + OSTM_TT);
+	while (ioread8(cs->base + OSTM_TE) & TE)
+		;
+
+	/* setup as freerun */
+	iowrite32(0, cs->base + OSTM_CMP);
+	iowrite8(CTL_FREERUN, cs->base + OSTM_CTL);
+	iowrite8(TS, cs->base + OSTM_TS);
+
+	/* register */
+	clocksource_mmio_init(cs->base + OSTM_CNT,
+			"ostm", cs->rate,
+			300, 32, clocksource_mmio_readl_up);
+
+	return 0;
+
+err_iounmap:
+	iounmap(cs->base);
+err:
+	return ret;
+}
+
+static u64 notrace ostm_read_sched_clock(void)
+{
+	return ioread32(system_clock);
+}
+
+/*
+ * Setup sched_clock using clocksource device (uses ostm.0)
+ */
+static int __init ostm_init_sched_clock(struct ostm_channel *cs)
+{
+	unsigned long flags;
+
+	system_clock = cs->base + OSTM_CNT;	/* ostm0 */
+	local_irq_save(flags);
+	local_irq_disable();
+	sched_clock_register(ostm_read_sched_clock, 32, cs->rate);
+	local_irq_restore(flags);
+	return 0;
+}
+
+static void ostm_clkevt_timer_stop(struct ostm_channel *ch)
+{
+	if (ioread8(ch->base + OSTM_TE) & TE) {
+		iowrite8(TT, ch->base + OSTM_TT);
+		while (ioread8(ch->base + OSTM_TE) & TE)
+			;
+	}
+}
+
+static int ostm_clock_event_next(unsigned long delta,
+				     struct clock_event_device *ced)
+{
+	struct ostm_channel *ch = ced_to_ostm_ch(ced);
+
+	WARN_ON(!clockevent_state_oneshot(ced));
+
+	ostm_clkevt_timer_stop(ch);
+
+	iowrite32(delta, ch->base + OSTM_CMP);
+	iowrite8(CTL_ONESHOT, ch->base + OSTM_CTL);
+	iowrite8(TS, ch->base + OSTM_TS);
+
+	return 0;
+}
+
+static int ostm_shutdown(struct clock_event_device *ced)
+{
+	struct ostm_channel *ch = ced_to_ostm_ch(ced);
+
+	ostm_clkevt_timer_stop(ch);
+	return 0;
+}
+static int ostm_set_periodic(struct clock_event_device *ced)
+{
+	struct ostm_channel *ch = ced_to_ostm_ch(ced);
+
+	if (clockevent_state_oneshot(ced) || clockevent_state_periodic(ced))
+		ostm_clkevt_timer_stop(ch);
+
+	iowrite32(ch->ticks_per_jiffy - 1, ch->base + OSTM_CMP);
+	iowrite8(CTL_PERIODIC, ch->base + OSTM_CTL);
+	iowrite8(TS, ch->base + OSTM_TS);
+
+	return 0;
+}
+
+static int ostm_set_oneshot(struct clock_event_device *ced)
+{
+	struct ostm_channel *ch = ced_to_ostm_ch(ced);
+
+	ostm_clkevt_timer_stop(ch);
+
+	return 0;
+}
+
+static irqreturn_t ostm_timer_interrupt(int irq, void *dev_id)
+{
+	struct ostm_channel *ch = dev_id;
+
+	if (clockevent_state_oneshot(&ch->ced))
+		ostm_clkevt_timer_stop(ch);
+
+	/* notify clockevent layer */
+	if (ch->ced.event_handler)
+		ch->ced.event_handler(&ch->ced);
+
+	return IRQ_HANDLED;
+}
+
+static int __init ostm_init_clkevt(struct ostm_device *ostm)
+{
+	struct ostm_channel *ce = &ostm->clkevt;
+	struct resource *res;
+	struct clock_event_device *ced;
+	int ret = -ENXIO;
+
+	res = platform_get_resource(ostm->pdev, IORESOURCE_MEM, 1);
+	if (!res) {
+		dev_err(&ostm->pdev->dev, "failed to get I/O memory\n");
+		goto err;
+	}
+
+	ce->base = ioremap_nocache(res->start, resource_size(res));
+	if (!ce->base) {
+		dev_err(&ostm->pdev->dev, "failed to remap I/O memory\n");
+		goto err;
+	}
+
+	ce->irq = platform_get_irq(ostm->pdev, 1);
+	if (ce->irq < 0) {
+		dev_err(&ostm->pdev->dev, "failed to get irq\n");
+		goto err_iounmap;
+	}
+
+	ce->clk = of_clk_get(ostm->pdev->dev.of_node, 1);
+	if (IS_ERR(ce->clk)) {
+		PTR_ERR(ce->clk);
+		dev_err(&ostm->pdev->dev, "failed to get clock\n");
+		goto err_iounmap;
+	}
+	ret = clk_prepare_enable(ce->clk);
+	if (ret) {
+		dev_err(&ostm->pdev->dev, "failed to enable clock\n");
+		goto err_iounmap;
+	}
+	ce->rate = clk_get_rate(ce->clk);
+
+	ce->ticks_per_jiffy = (ce->rate + HZ / 2) / HZ;
+
+	ret = request_irq(ce->irq, ostm_timer_interrupt,
+			  IRQF_TIMER | IRQF_IRQPOLL | IRQF_NOBALANCING,
+			  "ostm.1", ce);
+
+
+	if (ret) {
+		dev_err(&ostm->pdev->dev, "failed to request irq\n");
+		goto err_iounmap;
+	}
+
+	ced = &ce->ced;
+	ced->name = "ostm";
+	ced->features = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_PERIODIC;
+	ced->set_state_shutdown = ostm_shutdown;
+	ced->set_state_periodic = ostm_set_periodic;
+	ced->set_state_oneshot = ostm_set_oneshot;
+	ced->set_next_event = ostm_clock_event_next;
+	ced->shift = 32;
+	ced->rating = 300;
+	ced->cpumask = cpumask_of(0);
+	clockevents_config_and_register(ced, ce->rate, 0xf, 0xffffffff);
+
+	ret = 0;
+	return ret;
+
+err_iounmap:
+	iounmap(ce->base);
+err:
+	return ret;
+}
+
+static int __init ostm_timer_init(struct ostm_device *ostm)
+{
+	int ret = 0;
+
+	/* ostm0 will be clock source */
+	ret = ostm_init_clksrc(ostm);
+	if (ret)
+		goto err;
+
+	/* use ostm0 as system scheduling clock */
+	ret = ostm_init_sched_clock(&ostm->clksrc);
+	if (ret)
+		goto err;
+
+	/* ostm1 will be clock event */
+	ret = ostm_init_clkevt(ostm);
+err:
+	return ret;
+}
+
+static int __init ostm_probe(struct platform_device *pdev)
+{
+	struct ostm_device *ostm;
+	int ret = 0;
+
+	if (!is_early_platform_device(pdev)) {
+		pm_runtime_set_active(&pdev->dev);
+		pm_runtime_enable(&pdev->dev);
+	}
+
+	ostm = platform_get_drvdata(pdev);
+	if (ostm) {
+		dev_info(&pdev->dev, "kept as earlytimer\n");
+		goto out;
+	}
+
+	ostm = kzalloc(sizeof(*ostm), GFP_KERNEL);
+	if (!ostm) {
+		dev_info(&pdev->dev, "failed to allocate memory\n");
+		return -ENOMEM;
+	}
+
+	ostm->pdev = pdev;
+	platform_set_drvdata(ostm->pdev, ostm);
+
+	ret = ostm_timer_init(ostm);
+	if (ret) {
+		kfree(ostm);
+		platform_set_drvdata(pdev, NULL);
+		pm_runtime_idle(&pdev->dev);
+		return ret;
+	}
+
+	if (is_early_platform_device(pdev))
+		return ret;
+
+out:
+	pm_runtime_irq_safe(&pdev->dev);
+
+	return ret;
+}
+
+static int ostm_remove(struct platform_device *pdev)
+{
+	return -EBUSY;	/* cannot unregister clockevent */
+}
+
+static const struct of_device_id ostm_of_table[] __maybe_unused = {
+	{ .compatible = "renesas,ostm" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ostm_of_table);
+
+static struct platform_driver ostm_timer = {
+	.probe		= ostm_probe,
+	.remove		= ostm_remove,
+	.driver	= {
+		.name	= "ostm",
+		.of_match_table = of_match_ptr(ostm_of_table),
+	},
+};
+
+static int __init ostm_init(void)
+{
+	return platform_driver_register(&ostm_timer);
+}
+
+static void __exit ostm_exit(void)
+{
+	platform_driver_unregister(&ostm_timer);
+}
+
+early_platform_init("earlytimer", &ostm_timer);
+subsys_initcall(ostm_init);
+module_exit(ostm_exit);
+
+MODULE_AUTHOR("Chris Brandt");
+MODULE_DESCRIPTION("Renesas OSTM Timer Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.10.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
