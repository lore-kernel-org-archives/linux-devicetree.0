From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v5 2/2] clocksource: Add renesas-ostm timer driver
Date: Thu, 26 Jan 2017 11:44:31 -0500
Message-ID: <20170126164431.11995-3-chris.brandt@renesas.com>
References: <20170126164431.11995-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170126164431.11995-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch adds a OSTM driver for the Renesas architecture.
The OS Timer (OSTM) has independent channels that can be
used as a freerun or interval times.
This driver uses the first probed device as a clocksource
and then any additional devices as clock events.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v4:
* changed iowrite8/32 to writeb/l
v3:
* Added more details to commit log
* Kconfig: SYS_SUPPORTS_RENESAS_OSTM to just RENESAS_OSTM
* removed all MODULE code (this driver is builtin only)
* removed items from 'struct ostm_device'
* changed ioread8 to readb
* explain endless while loop
* removed un-needed vars like 'ret'
* removed WARN_ON(!clockevent_state_oneshot(ced));
* removed "failed to allocate memory" message
* remove pm_runtime calls
* remove "earlytimer" register (only for sh, not arm)
* convert from platform driver to CLOCKSOURCE_OF_DECLARE
* ostm_probe code is now in ostm_init
v2:
* changed implementation to be independent channel nodes
---
 arch/arm/mach-shmobile/Kconfig     |   1 +
 drivers/clocksource/Kconfig        |   7 +
 drivers/clocksource/Makefile       |   1 +
 drivers/clocksource/renesas-ostm.c | 262 +++++++++++++++++++++++++++++++++++++
 4 files changed, 271 insertions(+)
 create mode 100644 drivers/clocksource/renesas-ostm.c

diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index 2bb4b09..ad7d604 100644
--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@ -57,6 +57,7 @@ config ARCH_R7S72100
 	select PM
 	select PM_GENERIC_DOMAINS
 	select SYS_SUPPORTS_SH_MTU2
+	select RENESAS_OSTM
 
 config ARCH_R8A73A4
 	bool "R-Mobile APE6 (R8A73A40)"
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 4866f7a..a0786a6 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -467,6 +467,13 @@ config SH_TIMER_MTU2
 	  Timer Pulse Unit 2 (MTU2) hardware available on SoCs from Renesas.
 	  This hardware comes with 16 bit-timer registers.
 
+config RENESAS_OSTM
+	bool "Renesas OSTM timer driver" if COMPILE_TEST
+	depends on GENERIC_CLOCKEVENTS
+	select CLKSRC_MMIO
+	help
+	  Enables the support for the Renesas OSTM.
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
index 0000000..2570e3f
--- /dev/null
+++ b/drivers/clocksource/renesas-ostm.c
@@ -0,0 +1,262 @@
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
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/clk.h>
+#include <linux/clockchips.h>
+#include <linux/interrupt.h>
+#include <linux/sched_clock.h>
+#include <linux/slab.h>
+
+/*
+ * The OSTM contains independent channels.
+ * The first OSTM channel probed will be set up as a free running
+ * clocksource. Additionally we will use this clocksource for the system
+ * schedule timer sched_clock().
+ *
+ * The second (or more) channel probed will be set up as an interrupt
+ * driven clock event.
+ */
+
+struct ostm_device {
+	void __iomem *base;
+	unsigned long ticks_per_jiffy;
+	struct clock_event_device ced;
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
+static struct ostm_device *ced_to_ostm(struct clock_event_device *ced)
+{
+	return container_of(ced, struct ostm_device, ced);
+}
+
+static void ostm_timer_stop(struct ostm_device *ostm)
+{
+	if (readb(ostm->base + OSTM_TE) & TE) {
+		writeb(TT, ostm->base + OSTM_TT);
+
+		/*
+		 * Read back the register simply to confirm the write operation
+		 * has completed since I/O writes can sometimes get queued by
+		 * the bus architecture.
+		 */
+		while (readb(ostm->base + OSTM_TE) & TE)
+			;
+	}
+}
+
+static int __init ostm_init_clksrc(struct ostm_device *ostm, unsigned long rate)
+{
+	/*
+	 * irq not used (clock sources don't use interrupts)
+	 */
+
+	ostm_timer_stop(ostm);
+
+	writel(0, ostm->base + OSTM_CMP);
+	writeb(CTL_FREERUN, ostm->base + OSTM_CTL);
+	writeb(TS, ostm->base + OSTM_TS);
+
+	return clocksource_mmio_init(ostm->base + OSTM_CNT,
+			"ostm", rate,
+			300, 32, clocksource_mmio_readl_up);
+}
+
+static u64 notrace ostm_read_sched_clock(void)
+{
+	return readl(system_clock);
+}
+
+static void __init ostm_init_sched_clock(struct ostm_device *ostm,
+			unsigned long rate)
+{
+	system_clock = ostm->base + OSTM_CNT;
+	sched_clock_register(ostm_read_sched_clock, 32, rate);
+}
+
+static int ostm_clock_event_next(unsigned long delta,
+				     struct clock_event_device *ced)
+{
+	struct ostm_device *ostm = ced_to_ostm(ced);
+
+	ostm_timer_stop(ostm);
+
+	writel(delta, ostm->base + OSTM_CMP);
+	writeb(CTL_ONESHOT, ostm->base + OSTM_CTL);
+	writeb(TS, ostm->base + OSTM_TS);
+
+	return 0;
+}
+
+static int ostm_shutdown(struct clock_event_device *ced)
+{
+	struct ostm_device *ostm = ced_to_ostm(ced);
+
+	ostm_timer_stop(ostm);
+
+	return 0;
+}
+static int ostm_set_periodic(struct clock_event_device *ced)
+{
+	struct ostm_device *ostm = ced_to_ostm(ced);
+
+	if (clockevent_state_oneshot(ced) || clockevent_state_periodic(ced))
+		ostm_timer_stop(ostm);
+
+	writel(ostm->ticks_per_jiffy - 1, ostm->base + OSTM_CMP);
+	writeb(CTL_PERIODIC, ostm->base + OSTM_CTL);
+	writeb(TS, ostm->base + OSTM_TS);
+
+	return 0;
+}
+
+static int ostm_set_oneshot(struct clock_event_device *ced)
+{
+	struct ostm_device *ostm = ced_to_ostm(ced);
+
+	ostm_timer_stop(ostm);
+
+	return 0;
+}
+
+static irqreturn_t ostm_timer_interrupt(int irq, void *dev_id)
+{
+	struct ostm_device *ostm = dev_id;
+
+	if (clockevent_state_oneshot(&ostm->ced))
+		ostm_timer_stop(ostm);
+
+	/* notify clockevent layer */
+	if (ostm->ced.event_handler)
+		ostm->ced.event_handler(&ostm->ced);
+
+	return IRQ_HANDLED;
+}
+
+static int __init ostm_init_clkevt(struct ostm_device *ostm, int irq,
+			unsigned long rate)
+{
+	struct clock_event_device *ced = &ostm->ced;
+	int ret = -ENXIO;
+
+	ret = request_irq(irq, ostm_timer_interrupt,
+			  IRQF_TIMER | IRQF_IRQPOLL,
+			  "ostm", ostm);
+	if (ret) {
+		pr_err("ostm: failed to request irq\n");
+		return ret;
+	}
+
+	ced->name = "ostm";
+	ced->features = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_PERIODIC;
+	ced->set_state_shutdown = ostm_shutdown;
+	ced->set_state_periodic = ostm_set_periodic;
+	ced->set_state_oneshot = ostm_set_oneshot;
+	ced->set_next_event = ostm_clock_event_next;
+	ced->shift = 32;
+	ced->rating = 300;
+	ced->cpumask = cpumask_of(0);
+	clockevents_config_and_register(ced, rate, 0xf, 0xffffffff);
+
+	return 0;
+}
+
+static int __init ostm_init(struct device_node *np)
+{
+	struct ostm_device *ostm;
+	int ret = -EFAULT;
+	struct clk *ostm_clk;
+	int irq;
+	unsigned long rate;
+
+	ostm = kzalloc(sizeof(*ostm), GFP_KERNEL);
+	if (!ostm)
+		return -ENOMEM;
+
+	ostm->base = of_iomap(np, 0);
+	if (!ostm->base) {
+		pr_err("ostm: failed to remap I/O memory\n");
+		goto err;
+	}
+
+	irq = irq_of_parse_and_map(np, 0);
+	if (irq < 0) {
+		pr_err("ostm: Failed to get irq\n");
+		goto err;
+	}
+
+	ostm_clk = of_clk_get(np, 0);
+	if (IS_ERR(ostm_clk)) {
+		pr_err("ostm: Failed to get clock\n");
+		ostm_clk = NULL;
+		goto err;
+	}
+
+	ret = clk_prepare_enable(ostm_clk);
+	if (ret) {
+		pr_err("ostm: Failed to enable clock\n");
+		goto err;
+	}
+
+	rate = clk_get_rate(ostm_clk);
+	ostm->ticks_per_jiffy = (rate + HZ / 2) / HZ;
+
+	/*
+	 * First probed device will be used as system clocksource. Any
+	 * additional devices will be used as clock events.
+	 */
+	if (!system_clock) {
+		ret = ostm_init_clksrc(ostm, rate);
+
+		if (!ret) {
+			ostm_init_sched_clock(ostm, rate);
+			pr_info("ostm: used for clocksource\n");
+		}
+
+	} else {
+		ret = ostm_init_clkevt(ostm, irq, rate);
+
+		if (!ret)
+			pr_info("ostm: used for clock events\n");
+	}
+
+err:
+	if (ret) {
+		clk_disable_unprepare(ostm_clk);
+		iounmap(ostm->base);
+		kfree(ostm);
+		return ret;
+	}
+
+	return 0;
+}
+
+CLOCKSOURCE_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
-- 
2.10.1
