From: Jacky Bai <ping.bai@nxp.com>
Subject: [PATCH v2 2/2] driver: clocksource: Add nxp system counter timer
 driver support
Date: Wed, 12 Dec 2018 05:28:29 +0000
Message-ID: <1544592770-19996-2-git-send-email-ping.bai@nxp.com>
References: <1544592770-19996-1-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544592770-19996-1-git-send-email-ping.bai@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

The system counter (sys_ctr) is a programmable system counter
which provides a shared time base to the Cortex A15, A7, A53 etc cores.
It is intended for use in applications where the counter is always
powered on and supports multiple, unrelated clocks. The sys_ctr hardware
supports:
 - 56-bit counter width (roll-over time greater than 40 years)
 - compare frame(64-bit compare value) contains programmable interrupt
   generation

Signed-off-by: Bai Ping <ping.bai@nxp.com>
---
change v1->v2:
 - no change=20
---
 drivers/clocksource/Kconfig            |   8 ++
 drivers/clocksource/Makefile           |   1 +
 drivers/clocksource/timer-imx-sysctr.c | 204 +++++++++++++++++++++++++++++=
++++
 3 files changed, 213 insertions(+)
 create mode 100644 drivers/clocksource/timer-imx-sysctr.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index c57b156..7e5f2de 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -579,6 +579,14 @@ config CLKSRC_IMX_TPM
 	  Enable this option to use IMX Timer/PWM Module (TPM) timer as
 	  clocksource.
=20
+config CLKSRC_IMX_SYS_CTR
+	bool "Clocksource using i.MX system counter" if COMPILE_TEST
+	depends on (ARM || ARM64) && CLKDEV_LOOKUP
+	select CLKSRC_MMIO
+	help
+	  Enable this option to use IMX system counter timer as
+	  clocksource.
+
 config CLKSRC_ST_LPC
 	bool "Low power clocksource found in the LPC" if COMPILE_TEST
 	select TIMER_OF if OF
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index dd91381..372bf4e 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_CLKSRC_MIPS_GIC)		+=3D mips-gic-timer.o
 obj-$(CONFIG_CLKSRC_TANGO_XTAL)		+=3D tango_xtal.o
 obj-$(CONFIG_CLKSRC_IMX_GPT)		+=3D timer-imx-gpt.o
 obj-$(CONFIG_CLKSRC_IMX_TPM)		+=3D timer-imx-tpm.o
+obj-$(CONFIG_CLKSRC_IMX_SYS_CTR)	+=3D timer-imx-sysctr.o
 obj-$(CONFIG_ASM9260_TIMER)		+=3D asm9260_timer.o
 obj-$(CONFIG_H8300_TMR8)		+=3D h8300_timer8.o
 obj-$(CONFIG_H8300_TMR16)		+=3D h8300_timer16.o
diff --git a/drivers/clocksource/timer-imx-sysctr.c b/drivers/clocksource/t=
imer-imx-sysctr.c
new file mode 100644
index 0000000..ad3c27f
--- /dev/null
+++ b/drivers/clocksource/timer-imx-sysctr.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright 2017-2018 NXP
+
+#include <linux/interrupt.h>
+#include <linux/clockchips.h>
+#include <linux/clocksource.h>
+#include <linux/delay.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/sched_clock.h>
+
+#define CNTCV_LO	0x8
+#define CNTCV_HI	0xc
+#define CMPCV_LO	0x20
+#define CMPCV_HI	0x24
+#define CMPCR		0x2c
+
+#define SYS_CTR_EN		0x1
+#define SYS_CTR_IRQ_MASK	0x2
+
+static void __iomem *sys_ctr_rd_base;
+static void __iomem *sys_ctr_cmp_base;
+static struct clock_event_device clockevent_sysctr;
+
+static inline void sysctr_timer_enable(bool enable)
+{
+	u32 val;
+
+	val =3D readl(sys_ctr_cmp_base + CMPCR);
+	val &=3D ~SYS_CTR_EN;
+	if (enable)
+		val |=3D SYS_CTR_EN;
+
+	writel(val, sys_ctr_cmp_base + CMPCR);
+}
+
+static void sysctr_irq_acknowledge(void)
+{
+	u32 val;
+
+	/* clear th enable bit(EN=3D0) to clear the ISTAT */
+	val =3D readl(sys_ctr_cmp_base + CMPCR);
+	val &=3D ~SYS_CTR_EN;
+	writel(val, sys_ctr_cmp_base + CMPCR);
+}
+
+static inline u64 sysctr_read_counter(void)
+{
+	u32 cnt_hi, tmp_hi, cnt_lo;
+
+	do {
+		cnt_hi =3D readl_relaxed(sys_ctr_rd_base + CNTCV_HI);
+		cnt_lo =3D readl_relaxed(sys_ctr_rd_base + CNTCV_LO);
+		tmp_hi =3D readl_relaxed(sys_ctr_rd_base + CNTCV_HI);
+	} while (tmp_hi !=3D cnt_hi);
+
+	return  ((u64) cnt_hi << 32) | cnt_lo;
+}
+
+static u64 notrace sysctr_read_sched_clock(void)
+{
+	return sysctr_read_counter();
+}
+
+static u64 sysctr_clocksource_read(struct clocksource *cs)
+{
+	return sysctr_read_counter();
+}
+
+static int __init sysctr_clocksource_init(unsigned int rate)
+{
+	sched_clock_register(sysctr_read_sched_clock, 56, rate);
+	return clocksource_mmio_init(sys_ctr_rd_base, "i.MX sys_ctr",
+				     rate, 200, 56, sysctr_clocksource_read);
+}
+
+static int sysctr_set_next_event(unsigned long delta,
+				 struct clock_event_device *evt)
+{
+	u32 cmp_hi, cmp_lo;
+	u64 next;
+
+	sysctr_timer_enable(false);
+
+	next =3D sysctr_read_counter();
+
+	next +=3D delta;
+
+	cmp_hi =3D (next >> 32) & 0x00fffff;
+	cmp_lo =3D next & 0xffffffff;
+
+	writel_relaxed(cmp_hi, sys_ctr_cmp_base + CMPCV_HI);
+	writel_relaxed(cmp_lo, sys_ctr_cmp_base + CMPCV_LO);
+
+	sysctr_timer_enable(true);
+
+	return 0;
+}
+
+static int sysctr_set_state_oneshot(struct clock_event_device *evt)
+{
+	/* enable timer */
+	sysctr_timer_enable(true);
+
+	return 0;
+}
+
+static int sysctr_set_state_shutdown(struct clock_event_device *evt)
+{
+	/* disable the timer */
+	sysctr_timer_enable(false);
+
+	return 0;
+}
+
+static irqreturn_t sysctr_timer_interrupt(int irq, void *dev_id)
+{
+	struct clock_event_device *evt =3D &clockevent_sysctr;
+
+	sysctr_irq_acknowledge();
+
+	evt->event_handler(evt);
+
+	return IRQ_HANDLED;
+}
+
+static struct clock_event_device clockevent_sysctr =3D {
+	.name			=3D "i.MX system counter timer",
+	.features		=3D CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_DYNIRQ,
+	.set_state_oneshot	=3D sysctr_set_state_oneshot,
+	.set_next_event		=3D sysctr_set_next_event,
+	.set_state_shutdown	=3D sysctr_set_state_shutdown,
+	.rating			=3D 200,
+};
+
+static int __init sysctr_clockevent_init(unsigned long rate, int irq)
+{
+	int ret;
+
+	ret =3D request_irq(irq, sysctr_timer_interrupt, IRQF_TIMER | IRQF_IRQPOL=
L,
+		    "i.MX system counter timer", &clockevent_sysctr);
+	if (ret) {
+		pr_err("Failed to request i.MX sysctr timer irq\n");
+		return ret;
+	}
+
+	clockevent_sysctr.cpumask =3D cpumask_of(0);
+	clockevent_sysctr.irq =3D irq;
+	clockevents_config_and_register(&clockevent_sysctr,
+			rate, 0xff, 0x7fffffff);
+
+	return 0;
+}
+
+static int __init sysctr_timer_init(struct device_node *np)
+{
+	u32 rate;
+	int irq, ret =3D 0;
+
+	/* map the system counter's CNTreadbase */
+	sys_ctr_rd_base =3D of_iomap(np, 0);
+	if (!sys_ctr_rd_base) {
+		pr_err("Failed to map sys_ctr rd base%pOF\n", np);
+		return -ENXIO;
+	}
+
+	/* map the system counter's CNTcomparebase */
+	sys_ctr_cmp_base =3D of_iomap(np, 1);
+	if (!sys_ctr_cmp_base) {
+		pr_err("Failed to map sys_ctr compare base%pOF\n", np);
+		ret =3D -ENXIO;
+		goto out_free2;
+	}
+
+	/*
+	 * the purpose of this driver is to provide a global timer,
+	 * So only use one compare frame, request frame0's irq only.
+	 */
+	irq =3D irq_of_parse_and_map(np, 0);
+	if (!irq) {
+		pr_err("Failed to map interrupt for %pOF\n", np);
+		ret =3D -EINVAL;
+		goto out_free1;
+	}
+
+	if (of_property_read_u32(np, "clock-frequency", &rate)) {
+		pr_err("Failed to get clock frequency %pOF\n", np);
+		ret =3D -EINVAL;
+		goto out_free1;
+	}
+
+	sysctr_clocksource_init(rate);
+	sysctr_clockevent_init(rate, irq);
+
+	return 0;
+
+out_free1:
+	iounmap(sys_ctr_cmp_base);
+out_free2:
+	iounmap(sys_ctr_rd_base);
+	return ret;
+}
+TIMER_OF_DECLARE(sysctr_timer, "nxp,sysctr-timer", sysctr_timer_init);
--=20
1.9.1
