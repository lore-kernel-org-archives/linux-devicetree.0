From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2] clocksource: Provide timekeeping for efm32 SoCs
Date: Thu,  3 Oct 2013 21:56:29 +0200
Message-ID: <1380830189-21553-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

An efm32 features 4 16-bit timers with a 10-bit prescaler. This driver
provides clocksource and clock event device using one timer instance
each.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
Changes since (implicit) v1, sent with
Message-id:1379324644-20934-1-git-send-email-u.kleine-koenig@pengutroni=
x.de:
   =20
 - drop unused #defines
 - add __init to efm32_clocksource_init
 - fix indention
 - add a comment describing the reason for the construct in efm32_timer=
_init
 - add device tree binding document
   I created a new directory "timer" below the binding directory.

 .../devicetree/bindings/timer/efm32,timer.txt      |  23 ++
 drivers/clocksource/Kconfig                        |   8 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/time-efm32.c                   | 275 +++++++++++++=
++++++++
 4 files changed, 307 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/efm32,timer=
=2Etxt
 create mode 100644 drivers/clocksource/time-efm32.c

diff --git a/Documentation/devicetree/bindings/timer/efm32,timer.txt b/=
Documentation/devicetree/bindings/timer/efm32,timer.txt
new file mode 100644
index 0000000..97a568f
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/efm32,timer.txt
@@ -0,0 +1,23 @@
+* EFM32 timer hardware
+
+The efm32 Giant Gecko SoCs come with four 16 bit timers. Two counters =
can be
+connected to form a 32 bit counter. Each timer has three Compare/Captu=
re
+channels and can be used as PWM or Quadrature Decoder. Available clock=
 sources
+are the cpu's HFPERCLK (with a 10-bit prescaler) or an external pin.
+
+Required properties:
+- compatible : Should be efm32,timer
+- reg : Address and length of the register set
+- clocks : Should contain a reference to the HFPERCLK
+
+Optional properties:
+- interrupts : Reference to the timer interrupt
+
+Example:
+
+timer@40010c00 {
+	compatible =3D "efm32,timer";
+	reg =3D <0x40010c00 0x400>;
+	interrupts =3D <14>;
+	clocks =3D <&cmu clk_HFPERCLKTIMER3>;
+};
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 971d796..e634016 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -71,6 +71,14 @@ config CLKSRC_DBX500_PRCMU_SCHED_CLOCK
 	help
 	  Use the always on PRCMU Timer as sched_clock
=20
+config CLKSRC_EFM32
+	bool "Clocksource for Energy Micro's EFM32 SoCs" if !ARCH_EFM32
+	depends on OF && ARM && (ARCH_EFM32 || COMPILE_TEST)
+	default ARCH_EFM32
+	help
+	  Support to use the timers of EFM32 SoCs as clock source and clock
+	  event device.
+
 config ARM_ARCH_TIMER
 	bool
 	select CLKSRC_OF if OF
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefil=
e
index 704d6d3..33621ef 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_VT8500_TIMER)	+=3D vt8500_timer.o
 obj-$(CONFIG_ARCH_NSPIRE)	+=3D zevio-timer.o
 obj-$(CONFIG_ARCH_BCM)		+=3D bcm_kona_timer.o
 obj-$(CONFIG_CADENCE_TTC_TIMER)	+=3D cadence_ttc_timer.o
+obj-$(CONFIG_CLKSRC_EFM32)	+=3D time-efm32.o
 obj-$(CONFIG_CLKSRC_EXYNOS_MCT)	+=3D exynos_mct.o
 obj-$(CONFIG_CLKSRC_SAMSUNG_PWM)	+=3D samsung_pwm_timer.o
 obj-$(CONFIG_VF_PIT_TIMER)	+=3D vf_pit_timer.o
diff --git a/drivers/clocksource/time-efm32.c b/drivers/clocksource/tim=
e-efm32.c
new file mode 100644
index 0000000..1a6205b
--- /dev/null
+++ b/drivers/clocksource/time-efm32.c
@@ -0,0 +1,275 @@
+/*
+ * Copyright (C) 2013 Pengutronix
+ * Uwe Kleine-Koenig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modif=
y it under
+ * the terms of the GNU General Public License version 2 as published =
by the
+ * Free Software Foundation.
+ */
+
+#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+
+#include <linux/kernel.h>
+#include <linux/clocksource.h>
+#include <linux/clockchips.h>
+#include <linux/irq.h>
+#include <linux/interrupt.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/clk.h>
+
+#define TIMERn_CTRL			0x00
+#define TIMERn_CTRL_PRESC(val)			(((val) & 0xf) << 24)
+#define TIMERn_CTRL_PRESC_1024			TIMERn_CTRL_PRESC(10)
+#define TIMERn_CTRL_CLKSEL(val)			(((val) & 0x3) << 16)
+#define TIMERn_CTRL_CLKSEL_PRESCHFPERCLK	TIMERn_CTRL_CLKSEL(0)
+#define TIMERn_CTRL_OSMEN			0x00000010
+#define TIMERn_CTRL_MODE(val)			(((val) & 0x3) <<  0)
+#define TIMERn_CTRL_MODE_UP			TIMERn_CTRL_MODE(0)
+#define TIMERn_CTRL_MODE_DOWN			TIMERn_CTRL_MODE(1)
+
+#define TIMERn_CMD			0x04
+#define TIMERn_CMD_START			0x00000001
+#define TIMERn_CMD_STOP				0x00000002
+
+#define TIMERn_IEN			0x0c
+#define TIMERn_IF			0x10
+#define TIMERn_IFS			0x14
+#define TIMERn_IFC			0x18
+#define TIMERn_IRQ_UF				0x00000002
+
+#define TIMERn_TOP			0x1c
+#define TIMERn_CNT			0x24
+
+struct efm32_clock_event_ddata {
+	struct clock_event_device evtdev;
+	void __iomem *base;
+	unsigned periodic_top;
+};
+
+static void efm32_clock_event_set_mode(enum clock_event_mode mode,
+				       struct clock_event_device *evtdev)
+{
+	struct efm32_clock_event_ddata *ddata =3D
+		container_of(evtdev, struct efm32_clock_event_ddata, evtdev);
+
+	switch (mode) {
+	case CLOCK_EVT_MODE_PERIODIC:
+		writel_relaxed(TIMERn_CMD_STOP, ddata->base + TIMERn_CMD);
+		writel_relaxed(ddata->periodic_top, ddata->base + TIMERn_TOP);
+		writel_relaxed(TIMERn_CTRL_PRESC_1024 |
+			       TIMERn_CTRL_CLKSEL_PRESCHFPERCLK |
+			       TIMERn_CTRL_MODE_DOWN,
+			       ddata->base + TIMERn_CTRL);
+		writel_relaxed(TIMERn_CMD_START, ddata->base + TIMERn_CMD);
+		break;
+
+	case CLOCK_EVT_MODE_ONESHOT:
+		writel_relaxed(TIMERn_CMD_STOP, ddata->base + TIMERn_CMD);
+		writel_relaxed(TIMERn_CTRL_PRESC_1024 |
+			       TIMERn_CTRL_CLKSEL_PRESCHFPERCLK |
+			       TIMERn_CTRL_OSMEN |
+			       TIMERn_CTRL_MODE_DOWN,
+			       ddata->base + TIMERn_CTRL);
+		break;
+
+	case CLOCK_EVT_MODE_UNUSED:
+	case CLOCK_EVT_MODE_SHUTDOWN:
+		writel_relaxed(TIMERn_CMD_STOP, ddata->base + TIMERn_CMD);
+		break;
+
+	case CLOCK_EVT_MODE_RESUME:
+		break;
+	}
+}
+
+static int efm32_clock_event_set_next_event(unsigned long evt,
+					    struct clock_event_device *evtdev)
+{
+	struct efm32_clock_event_ddata *ddata =3D
+		container_of(evtdev, struct efm32_clock_event_ddata, evtdev);
+
+	writel_relaxed(TIMERn_CMD_STOP, ddata->base + TIMERn_CMD);
+	writel_relaxed(evt, ddata->base + TIMERn_CNT);
+	writel_relaxed(TIMERn_CMD_START, ddata->base + TIMERn_CMD);
+
+	return 0;
+}
+
+static irqreturn_t efm32_clock_event_handler(int irq, void *dev_id)
+{
+	struct efm32_clock_event_ddata *ddata =3D dev_id;
+
+	writel_relaxed(TIMERn_IRQ_UF, ddata->base + TIMERn_IFC);
+
+	ddata->evtdev.event_handler(&ddata->evtdev);
+
+	return IRQ_HANDLED;
+}
+
+static struct efm32_clock_event_ddata clock_event_ddata =3D {
+	.evtdev =3D {
+		.name =3D "efm32 clockevent",
+		.features =3D CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_MODE_PERIODIC,
+		.set_mode =3D efm32_clock_event_set_mode,
+		.set_next_event =3D efm32_clock_event_set_next_event,
+		.rating =3D 200,
+	},
+};
+
+static struct irqaction efm32_clock_event_irq =3D {
+	.name =3D "efm32 clockevent",
+	.flags =3D IRQF_TIMER,
+	.handler =3D efm32_clock_event_handler,
+	.dev_id =3D &clock_event_ddata,
+};
+
+static int __init efm32_clocksource_init(struct device_node *np)
+{
+	struct clk *clk;
+	void __iomem *base;
+	unsigned long rate;
+	int ret;
+
+	clk =3D of_clk_get(np, 0);
+	if (IS_ERR(clk)) {
+		ret =3D PTR_ERR(clk);
+		pr_err("failed to get clock for clocksource (%d)\n", ret);
+		goto err_clk_get;
+	}
+
+	ret =3D clk_prepare_enable(clk);
+	if (ret) {
+		pr_err("failed to enable timer clock for clocksource (%d)\n",
+		       ret);
+		goto err_clk_enable;
+	}
+	rate =3D clk_get_rate(clk);
+
+	base =3D of_iomap(np, 0);
+	if (!base) {
+		ret =3D -EADDRNOTAVAIL;
+		pr_err("failed to map registers for clocksource\n");
+		goto err_iomap;
+	}
+
+	writel_relaxed(TIMERn_CTRL_PRESC_1024 |
+		       TIMERn_CTRL_CLKSEL_PRESCHFPERCLK |
+		       TIMERn_CTRL_MODE_UP, base + TIMERn_CTRL);
+	writel_relaxed(TIMERn_CMD_START, base + TIMERn_CMD);
+
+	ret =3D clocksource_mmio_init(base + TIMERn_CNT, "efm32 timer",
+				    DIV_ROUND_CLOSEST(rate, 1024), 200, 16,
+				    clocksource_mmio_readl_up);
+	if (ret) {
+		pr_err("failed to init clocksource (%d)\n", ret);
+		goto err_clocksource_init;
+	}
+
+	return 0;
+
+err_clocksource_init:
+
+	iounmap(base);
+err_iomap:
+
+	clk_disable_unprepare(clk);
+err_clk_enable:
+
+	clk_put(clk);
+err_clk_get:
+
+	return ret;
+}
+
+static int __init efm32_clockevent_init(struct device_node *np)
+{
+	struct clk *clk;
+	void __iomem *base;
+	unsigned long rate;
+	int irq;
+	int ret;
+
+	clk =3D of_clk_get(np, 0);
+	if (IS_ERR(clk)) {
+		ret =3D PTR_ERR(clk);
+		pr_err("failed to get clock for clockevent (%d)\n", ret);
+		goto err_clk_get;
+	}
+
+	ret =3D clk_prepare_enable(clk);
+	if (ret) {
+		pr_err("failed to enable timer clock for clockevent (%d)\n",
+		       ret);
+		goto err_clk_enable;
+	}
+	rate =3D clk_get_rate(clk);
+
+	base =3D of_iomap(np, 0);
+	if (!base) {
+		ret =3D -EADDRNOTAVAIL;
+		pr_err("failed to map registers for clockevent\n");
+		goto err_iomap;
+	}
+
+	irq =3D irq_of_parse_and_map(np, 0);
+	if (!irq) {
+		ret =3D -ENOENT;
+		pr_err("failed to get irq for clockevent\n");
+		goto err_get_irq;
+	}
+
+	writel_relaxed(TIMERn_IRQ_UF, base + TIMERn_IEN);
+
+	clock_event_ddata.base =3D base;
+	clock_event_ddata.periodic_top =3D DIV_ROUND_CLOSEST(rate, 1024 * HZ)=
;
+
+	setup_irq(irq, &efm32_clock_event_irq);
+
+	clockevents_config_and_register(&clock_event_ddata.evtdev,
+					DIV_ROUND_CLOSEST(rate, 1024),
+					0xf, 0xffff);
+
+	return 0;
+
+err_get_irq:
+
+	iounmap(base);
+err_iomap:
+
+	clk_disable_unprepare(clk);
+err_clk_enable:
+
+	clk_put(clk);
+err_clk_get:
+
+	return ret;
+}
+
+/*
+ * This function asserts that we have exactly one clocksource and one
+ * clock_event_device in the end.
+ */
+static void __init efm32_timer_init(struct device_node *np)
+{
+	static int has_clocksource, has_clockevent;
+	int ret;
+
+	if (!has_clocksource) {
+		ret =3D efm32_clocksource_init(np);
+		if (!ret) {
+			has_clocksource =3D 1;
+			return;
+		}
+	}
+
+	if (!has_clockevent) {
+		ret =3D efm32_clockevent_init(np);
+		if (!ret) {
+			has_clockevent =3D 1;
+			return;
+		}
+	}
+}
+CLOCKSOURCE_OF_DECLARE(efm32, "efm32,timer", efm32_timer_init);
--=20
1.8.4.rc3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
