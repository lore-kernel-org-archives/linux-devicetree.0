From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/6] ARM: bcm476x: Add system timer
Date: Sun, 07 Oct 2012 03:53:02 +0200
Message-ID: <20121007015406.470633343@gmail.com>
References: <20121007015300.828366635@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline; filename=arm-bcm476x-add-system-timer.patch
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>

System timer implementation for the BCM476x SoCs.

Signed-off-by: Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/timer/brcm,bcm476x-system-timer.txt |   22 +
 arch/arm/boot/dts/bcm476x.dtsi                                        |    8 +
 arch/arm/mach-bcm476x/bcm476x.c                                       |   10 -
 drivers/clocksource/Makefile                                          |    1 +
 drivers/clocksource/bcm476x_timer.c                                   |  188 ++++++++++
 include/linux/bcm476x_timer.h                                         |   24 +
 6 files changed, 244 insertions(+), 9 deletions(-)

Index: b/Documentation/devicetree/bindings/timer/brcm,bcm476x-system-timer.txt
===================================================================
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/brcm,bcm476x-system-timer.txt
@@ -0,0 +1,22 @@
+BCM476x System Timer
+
+The System Timer peripheral provides either two or four 32-bit timer
+channels.  BCM476x has three timers at 0xba000, 0xbb000 and 0xd1000. The
+first two provide four channels, the last (in the AON - Always ON power
+domain) provides only two.
+
+Required properties:
+
+- compatible : should be "brcm,bcm476x-system-timer"
+- reg : Specifies base physical address and size of the registers.
+- interrupts : A list of 2 or 4 interrupt sinks; one per timer channel.
+- clock-frequency : The frequency of the clock that drives the counter, in Hz.
+
+Example:
+
+timer {
+	compatible = "brcm,bcm476x-system-timer";
+	reg = <0xba000 0x1000>;
+	interrupts = <4>, <11>;
+	clock-frequency = <24000000>;
+};
Index: b/arch/arm/boot/dts/bcm476x.dtsi
===================================================================
--- a/arch/arm/boot/dts/bcm476x.dtsi
+++ b/arch/arm/boot/dts/bcm476x.dtsi
@@ -14,6 +14,14 @@
 		#size-cells = <1>;
 		ranges;
 
+		timer {
+			compatible = "brcm,bcm476x-system-timer";
+			reg = <0xba000 0x1000>;
+			interrupt-parent = <&vic0>;
+			interrupts = <4>, <11>;
+			clock-frequency = <24000000>;
+		};
+
 		vic0: interrupt-controller@80000 {
 			compatible = "brcm,bcm476x-pl192", "arm,pl192-vic", "arm,primecell";
 			reg = <0x80000 0x1000>;
Index: b/arch/arm/mach-bcm476x/bcm476x.c
===================================================================
--- a/arch/arm/mach-bcm476x/bcm476x.c
+++ b/arch/arm/mach-bcm476x/bcm476x.c
@@ -17,11 +17,11 @@
 #include <linux/init.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/bcm476x_timer.h>
 
 #include <asm/hardware/vic.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
-#include <asm/mach/time.h>
 
 #define BCM476X_PERIPH_PHYS   0x00080000
 #define BCM476X_PERIPH_VIRT   0xd0080000
@@ -60,14 +60,6 @@ static void __init bcm476x_init_irq(void
 	of_irq_init(vic_of_match);
 }
 
-static void __init bcm476x_timer_init(void)
-{
-}
-
-struct sys_timer bcm476x_timer = {
-	.init = bcm476x_timer_init
-};
-
 static const char * const bcm476x_compat[] = {
 	"brcm,bcm476x",
 	NULL
Index: b/drivers/clocksource/Makefile
===================================================================
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -14,5 +14,6 @@ obj-$(CONFIG_DW_APB_TIMER_OF)	+= dw_apb_
 obj-$(CONFIG_CLKSRC_DBX500_PRCMU)	+= clksrc-dbx500-prcmu.o
 obj-$(CONFIG_ARMADA_370_XP_TIMER)	+= time-armada-370-xp.o
 obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835_timer.o
+obj-$(CONFIG_ARCH_BCM476X)	+= bcm476x_timer.o
 
 obj-$(CONFIG_CLKSRC_ARM_GENERIC)	+= arm_generic.o
Index: b/drivers/clocksource/bcm476x_timer.c
===================================================================
--- /dev/null
+++ b/drivers/clocksource/bcm476x_timer.c
@@ -0,0 +1,188 @@
+/*
+ * Broadcom BCM476x SoCs system timer
+ *
+ * Copyright (C) 2012 Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/bcm476x_timer.h>
+#include <linux/bitops.h>
+#include <linux/clockchips.h>
+#include <linux/clocksource.h>
+#include <linux/interrupt.h>
+#include <linux/irqreturn.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include <asm/sched_clock.h>
+#include <asm/irq.h>
+
+#define TIMER_LOAD_OFFSET          0x00          /* load */
+#define TIMER_VALUE_OFFSET         0x04          /* value */
+#define TIMER_CONTROL_OFFSET       0x08          /* control */
+#define TIMER_INTCLR_OFFSET        0x0c          /* interrupt clear */
+#define TIMER_RIS_OFFSET           0x10          /* raw interrupt */
+#define TIMER_MIS_OFFSET           0x14          /* masked interrupt status */
+#define TIMER_BGLOAD_OFFSET        0x18          /* background load */
+
+#define TIMER_CTRL_ONESHOTMODE     BIT(0)        /* One shot mode */
+#define TIMER_CTRL_32BIT           BIT(1)        /* 32-bit counter mode */
+#define TIMER_CTRL_IE              BIT(5)        /* Interrupt enable */
+#define TIMER_CTRL_PERIODIC        BIT(6)        /* Periodic mode */
+#define TIMER_CTRL_EN              BIT(7)        /* Timer enable */
+#define TIMER_CTRL_CLK2            BIT(9)        /* Clock 2 selected */
+#define TIMER_CTRL_PREBY16         (1 << 2)      /* prescale divide by 16 */
+#define TIMER_CTRL_PREBY256        (2 << 2)      /* prescale divide by 256 */
+
+struct bcm476x_timer {
+	void __iomem *base;
+	struct clock_event_device evt;
+	struct irqaction act;
+};
+
+static inline void __iomem *to_load(struct bcm476x_timer *timer)
+{
+	return timer->base + TIMER_LOAD_OFFSET;
+}
+
+static inline void __iomem *to_control(struct bcm476x_timer *timer)
+{
+	return timer->base + TIMER_CONTROL_OFFSET;
+}
+
+static inline void __iomem *to_intclr(struct bcm476x_timer *timer)
+{
+	return timer->base + TIMER_INTCLR_OFFSET;
+}
+
+static inline void __iomem *to_ris(struct bcm476x_timer *timer)
+{
+	return timer->base + TIMER_RIS_OFFSET;
+}
+
+static inline void __iomem *to_mis(struct bcm476x_timer *timer)
+{
+	return timer->base + TIMER_MIS_OFFSET;
+}
+
+static void bcm476x_timer_set_mode(enum clock_event_mode mode,
+	struct clock_event_device *evt_dev)
+{
+	struct bcm476x_timer *timer;
+	u32 val;
+
+	timer = container_of(evt_dev, struct bcm476x_timer, evt);
+	val = TIMER_CTRL_CLK2 | TIMER_CTRL_32BIT |
+	      TIMER_CTRL_IE | TIMER_CTRL_EN;
+
+	switch (mode) {
+	case CLOCK_EVT_MODE_ONESHOT:
+		writel(val | TIMER_CTRL_ONESHOTMODE, to_control(timer));
+		break;
+	case CLOCK_EVT_MODE_RESUME:
+	case CLOCK_EVT_MODE_SHUTDOWN:
+		break;
+	default:
+		WARN(1, "%s: unhandled event mode %d\n", __func__, mode);
+		break;
+	}
+}
+
+static int bcm476x_timer_set_next_event(unsigned long event,
+	struct clock_event_device *evt_dev)
+{
+	struct bcm476x_timer *timer;
+
+	timer = container_of(evt_dev, struct bcm476x_timer, evt);
+	writel(event, to_load(timer));
+	return 0;
+}
+
+static irqreturn_t bcm476x_timer_interrupt(int irq, void *dev_id)
+{
+	struct bcm476x_timer *timer = dev_id;
+	void (*event_handler)(struct clock_event_device *);
+
+	/* check the (masked) interrupt status */
+	if (!readl_relaxed(to_mis(timer)))
+		return IRQ_NONE;
+
+	/* clear the timer interrupt */
+	writel_relaxed(1, to_intclr(timer));
+
+	event_handler = ACCESS_ONCE(timer->evt.event_handler);
+	if (event_handler)
+		event_handler(&timer->evt);
+
+	return IRQ_HANDLED;
+}
+
+static struct of_device_id bcm476x_timer_match[] __initconst = {
+	{ .compatible = "brcm,bcm476x-system-timer" },
+	{}
+};
+
+static void __init bcm476x_timer_init(void)
+{
+	struct device_node *node;
+	void __iomem *base;
+	u32 freq;
+	int irq;
+	struct bcm476x_timer *timer;
+
+	node = of_find_matching_node(NULL, bcm476x_timer_match);
+	if (!node)
+		panic("No bcm476x timer node");
+
+	base = of_iomap(node, 0);
+	if (!base)
+		panic("Can't remap timer registers");
+
+	if (of_property_read_u32(node, "clock-frequency", &freq))
+		panic("Can't read timer frequency");
+	if (freq != 32000 && freq != 24000000)
+		panic("Invalid timer frequency");
+
+	timer = kzalloc(sizeof(*timer), GFP_KERNEL);
+	if (!timer)
+		panic("Can't allocate timer struct\n");
+
+	irq = irq_of_parse_and_map(node, 0);
+	if (irq <= 0)
+		panic("Can't parse timer IRQ");
+
+	timer->base = base;
+	timer->evt.name = node->name;
+	timer->evt.rating = 300;
+	timer->evt.features = CLOCK_EVT_FEAT_ONESHOT;
+	timer->evt.set_mode = bcm476x_timer_set_mode;
+	timer->evt.set_next_event = bcm476x_timer_set_next_event;
+	timer->evt.cpumask = cpumask_of(0);
+	timer->act.name = node->name;
+	timer->act.flags = IRQF_TIMER | IRQF_SHARED;
+	timer->act.dev_id = timer;
+	timer->act.handler = bcm476x_timer_interrupt;
+
+	if (setup_irq(irq, &timer->act))
+		panic("Can't set up timer IRQ\n");
+
+	clockevents_config_and_register(&timer->evt, freq, 0xf, 0xffffffff);
+}
+
+struct sys_timer bcm476x_timer = {
+	.init = bcm476x_timer_init,
+};
Index: b/include/linux/bcm476x_timer.h
===================================================================
--- /dev/null
+++ b/include/linux/bcm476x_timer.h
@@ -0,0 +1,24 @@
+/*
+ * Broadcom BCM476x SoCs system timer
+ *
+ * Copyright (C) 2012 Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __BCM476X_TIMER_H
+#define __BCM476X_TIMER_H
+
+#include <asm/mach/time.h>
+
+extern struct sys_timer bcm476x_timer;
+
+#endif
