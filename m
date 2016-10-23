From: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 3/3] clocksource: Add clockevent support to NPS400 driver
Date: Sun, 23 Oct 2016 15:12:28 +0300
Message-ID: <1477224748-25223-4-git-send-email-noamca@mellanox.com>
References: <1477224748-25223-1-git-send-email-noamca@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477224748-25223-1-git-send-email-noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>

Till now we used clockevent from generic ARC driver.
This was enough as long as we worked with simple multicore SoC.
When we are working with multithread SoC each HW thread can be
scheduled to receive timer interrupt using timer mask register.
This patch will provide a way to control clock events per HW thread.

The design idea is that for each core there is dedicated regirtser
(TSI) serving all 16 HW threads.
The register is a bitmask with one bit for each HW thread.
When HW thread wants that next expiration of timer interrupt will
hit it then the proper bit should be set in this dedicated register.
When timer expires all HW threads within this core which their bit
is set at the TSI register will be interrupted.

Driver can be used from device tree by:
compatible = "ezchip,nps400-timer0" <-- for clocksource
compatible = "ezchip,nps400-timer1" <-- for clockevent

Note that name convention for timer0/timer1 was taken from legacy
ARC design. This design is our base before adding HW threads.

Signed-off-by: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>

Change-Id: Ib351e6fc7a6b691293040ae655f202f3cc2c1298
---
 .../bindings/timer/ezchip,nps400-timer.txt         |   15 --
 .../bindings/timer/ezchip,nps400-timer0.txt        |   17 ++
 .../bindings/timer/ezchip,nps400-timer1.txt        |   15 ++
 drivers/clocksource/timer-nps.c                    |  220 +++++++++++++++++++-
 include/linux/cpuhotplug.h                         |    1 +
 5 files changed, 248 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer0.txt
 create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer1.txt

diff --git a/Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt b/Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
deleted file mode 100644
index c8c03d7..0000000
--- a/Documentation/devicetree/bindings/timer/ezchip,nps400-timer.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-NPS Network Processor
-
-Required properties:
-
-- compatible :	should be "ezchip,nps400-timer"
-
-Clocks required for compatible = "ezchip,nps400-timer":
-- clocks : Must contain a single entry describing the clock input
-
-Example:
-
-timer {
-	compatible = "ezchip,nps400-timer";
-	clocks = <&sysclk>;
-};
diff --git a/Documentation/devicetree/bindings/timer/ezchip,nps400-timer0.txt b/Documentation/devicetree/bindings/timer/ezchip,nps400-timer0.txt
new file mode 100644
index 0000000..e3cfce8
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/ezchip,nps400-timer0.txt
@@ -0,0 +1,17 @@
+NPS Network Processor
+
+Required properties:
+
+- compatible :	should be "ezchip,nps400-timer0"
+
+Clocks required for compatible = "ezchip,nps400-timer0":
+- interrupts : The interrupt of the first timer
+- clocks : Must contain a single entry describing the clock input
+
+Example:
+
+timer {
+	compatible = "ezchip,nps400-timer0";
+	interrupts = <3>;
+	clocks = <&sysclk>;
+};
diff --git a/Documentation/devicetree/bindings/timer/ezchip,nps400-timer1.txt b/Documentation/devicetree/bindings/timer/ezchip,nps400-timer1.txt
new file mode 100644
index 0000000..c0ab419
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/ezchip,nps400-timer1.txt
@@ -0,0 +1,15 @@
+NPS Network Processor
+
+Required properties:
+
+- compatible :	should be "ezchip,nps400-timer1"
+
+Clocks required for compatible = "ezchip,nps400-timer1":
+- clocks : Must contain a single entry describing the clock input
+
+Example:
+
+timer {
+	compatible = "ezchip,nps400-timer1";
+	clocks = <&sysclk>;
+};
diff --git a/drivers/clocksource/timer-nps.c b/drivers/clocksource/timer-nps.c
index 6156e54..0757328 100644
--- a/drivers/clocksource/timer-nps.c
+++ b/drivers/clocksource/timer-nps.c
@@ -46,7 +46,7 @@
 /* This array is per cluster of CPUs (Each NPS400 cluster got 256 CPUs) */
 static void *nps_msu_reg_low_addr[NPS_CLUSTER_NUM] __read_mostly;
 
-static unsigned long nps_timer_rate;
+static unsigned long nps_timer1_freq;
 static int nps_get_timer_clk(struct device_node *node,
 			     unsigned long *timer_freq,
 			     struct clk *clk)
@@ -87,10 +87,10 @@ static int __init nps_setup_clocksource(struct device_node *node)
 			nps_host_reg((cluster << NPS_CLUSTER_OFFSET),
 				 NPS_MSU_BLKID, NPS_MSU_TICK_LOW);
 
-	nps_get_timer_clk(node, &nps_timer_rate, clk);
+	nps_get_timer_clk(node, &nps_timer1_freq, clk);
 
-	ret = clocksource_mmio_init(nps_msu_reg_low_addr, "EZnps-tick",
-				    nps_timer_rate, 301, 32, nps_clksrc_read);
+	ret = clocksource_mmio_init(nps_msu_reg_low_addr, "nps-tick",
+				    nps_timer1_freq, 301, 32, nps_clksrc_read);
 	if (ret) {
 		pr_err("Couldn't register clock source.\n");
 		clk_disable_unprepare(clk);
@@ -99,5 +99,215 @@ static int __init nps_setup_clocksource(struct device_node *node)
 	return ret;
 }
 
-CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clksrc, "ezchip,nps400-timer",
+CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clksrc, "ezchip,nps400-timer1",
 		       nps_setup_clocksource);
+
+#ifdef CONFIG_EZNPS_MTM_EXT
+#include <soc/nps/mtm.h>
+
+/* Timer related Aux registers */
+#define AUX_REG_TIMER0_TSI	0xFFFFF850	/* timer 0 HW threads mask */
+#define NPS_REG_TIMER0_LIMIT	0x23		/* timer 0 limit */
+#define NPS_REG_TIMER0_CTRL	0x22		/* timer 0 control */
+#define NPS_REG_TIMER0_CNT	0x21		/* timer 0 count */
+
+#define TIMER0_CTRL_IE	(1 << 0) /* Interrupt when Count reaches limit */
+#define TIMER0_CTRL_NH	(1 << 1) /* Count only when CPU NOT halted */
+
+static unsigned long nps_timer0_freq;
+static unsigned long nps_timer0_irq;
+
+/*
+ * Arm the timer to interrupt after @cycles
+ */
+static void nps_clkevent_timer_event_setup(unsigned int cycles)
+{
+	write_aux_reg(NPS_REG_TIMER0_LIMIT, cycles);
+	write_aux_reg(NPS_REG_TIMER0_CNT, 0);   /* start from 0 */
+
+	write_aux_reg(NPS_REG_TIMER0_CTRL, TIMER0_CTRL_IE | TIMER0_CTRL_NH);
+}
+
+static void nps_clkevent_rm_thread(bool remove_thread)
+{
+	unsigned int cflags;
+	unsigned int enabled_threads;
+	unsigned long flags;
+	int thread;
+
+	local_irq_save(flags);
+	hw_schd_save(&cflags);
+
+	enabled_threads = read_aux_reg(AUX_REG_TIMER0_TSI);
+
+	/* remove thread from TSI1 */
+	if (remove_thread) {
+		thread = read_aux_reg(CTOP_AUX_THREAD_ID);
+		enabled_threads &= ~(1 << thread);
+		write_aux_reg(AUX_REG_TIMER0_TSI, enabled_threads);
+	}
+
+	/* Re-arm the timer if needed */
+	if (!enabled_threads)
+		write_aux_reg(NPS_REG_TIMER0_CTRL, TIMER0_CTRL_NH);
+	else
+		write_aux_reg(NPS_REG_TIMER0_CTRL,
+			      TIMER0_CTRL_IE | TIMER0_CTRL_NH);
+
+	hw_schd_restore(cflags);
+	local_irq_restore(flags);
+}
+
+static void nps_clkevent_add_thread(bool set_event)
+{
+	int thread;
+	unsigned int cflags, enabled_threads;
+	unsigned long flags;
+
+	local_irq_save(flags);
+	hw_schd_save(&cflags);
+
+	/* add thread to TSI1 */
+	thread = read_aux_reg(CTOP_AUX_THREAD_ID);
+	enabled_threads = read_aux_reg(AUX_REG_TIMER0_TSI);
+	enabled_threads |= (1 << thread);
+	write_aux_reg(AUX_REG_TIMER0_TSI, enabled_threads);
+
+	/* set next timer event */
+	if (set_event)
+		write_aux_reg(NPS_REG_TIMER0_CTRL,
+			      TIMER0_CTRL_IE | TIMER0_CTRL_NH);
+
+	hw_schd_restore(cflags);
+	local_irq_restore(flags);
+}
+
+static int nps_clkevent_set_next_event(unsigned long delta,
+				       struct clock_event_device *dev)
+{
+	struct irq_desc *desc = irq_to_desc(nps_timer0_irq);
+	struct irq_chip *chip = irq_data_get_irq_chip(&desc->irq_data);
+
+	nps_clkevent_add_thread(true);
+	chip->irq_unmask(&desc->irq_data);
+
+	return 0;
+}
+
+/*
+ * Whenever anyone tries to change modes, we just mask interrupts
+ * and wait for the next event to get set.
+ */
+static int nps_clkevent_timer_shutdown(struct clock_event_device *dev)
+{
+	struct irq_desc *desc = irq_to_desc(nps_timer0_irq);
+	struct irq_chip *chip = irq_data_get_irq_chip(&desc->irq_data);
+
+	chip->irq_mask(&desc->irq_data);
+
+	return 0;
+}
+
+static int nps_clkevent_set_periodic(struct clock_event_device *dev)
+{
+	nps_clkevent_add_thread(false);
+	if (read_aux_reg(CTOP_AUX_THREAD_ID) == 0)
+		nps_clkevent_timer_event_setup(nps_timer0_freq / HZ);
+
+	return 0;
+}
+
+static int nps_clkevent_set_oneshot(struct clock_event_device *dev)
+{
+	nps_clkevent_rm_thread(true);
+	nps_clkevent_timer_shutdown(dev);
+
+	return 0;
+}
+
+static DEFINE_PER_CPU(struct clock_event_device, nps_clockevent_device) = {
+	.name				=	"NPS Timer0",
+	.features			=	CLOCK_EVT_FEAT_ONESHOT |
+						CLOCK_EVT_FEAT_PERIODIC,
+	.rating				=	300,
+	.set_next_event			=	nps_clkevent_set_next_event,
+	.set_state_periodic		=	nps_clkevent_set_periodic,
+	.set_state_oneshot		=	nps_clkevent_set_oneshot,
+	.set_state_oneshot_stopped	=	nps_clkevent_timer_shutdown,
+	.set_state_shutdown		=	nps_clkevent_timer_shutdown,
+	.tick_resume			=	nps_clkevent_timer_shutdown,
+};
+
+static irqreturn_t timer_irq_handler(int irq, void *dev_id)
+{
+	/*
+	 * Note that generic IRQ core could have passed @evt for @dev_id if
+	 * irq_set_chip_and_handler() asked for handle_percpu_devid_irq()
+	 */
+	struct clock_event_device *evt = this_cpu_ptr(&nps_clockevent_device);
+	int irq_reenable = clockevent_state_periodic(evt);
+
+	nps_clkevent_rm_thread(!irq_reenable);
+
+	evt->event_handler(evt);
+
+	return IRQ_HANDLED;
+}
+
+static int nps_timer_starting_cpu(unsigned int cpu)
+{
+	struct clock_event_device *evt = this_cpu_ptr(&nps_clockevent_device);
+
+	evt->cpumask = cpumask_of(smp_processor_id());
+
+	clockevents_config_and_register(evt, nps_timer0_freq, 0, ULONG_MAX);
+	enable_percpu_irq(nps_timer0_irq, 0);
+
+	return 0;
+}
+
+static int nps_timer_dying_cpu(unsigned int cpu)
+{
+	disable_percpu_irq(nps_timer0_irq);
+	return 0;
+}
+
+static int __init nps_setup_clockevent(struct device_node *node)
+{
+	struct clock_event_device *evt = this_cpu_ptr(&nps_clockevent_device);
+	struct clk *clk;
+	int ret;
+
+	nps_timer0_irq = irq_of_parse_and_map(node, 0);
+	if (nps_timer0_irq <= 0) {
+		pr_err("clockevent: missing irq");
+		return -EINVAL;
+	}
+
+	nps_get_timer_clk(node, &nps_timer0_freq, clk);
+
+	/* Needs apriori irq_set_percpu_devid() done in intc map function */
+	ret = request_percpu_irq(nps_timer0_irq, timer_irq_handler,
+				 "Timer0 (per-cpu-tick)", evt);
+	if (ret) {
+		pr_err("Couldn't request irq\n");
+		clk_disable_unprepare(clk);
+		return ret;
+	}
+
+	ret = cpuhp_setup_state(CPUHP_AP_NPS_TIMER_STARTING,
+				"AP_NPS_TIMER_STARTING",
+				nps_timer_starting_cpu,
+				nps_timer_dying_cpu);
+	if (ret) {
+		pr_err("Failed to setup hotplug state");
+		clk_disable_unprepare(clk);
+		return ret;
+	}
+
+	return 0;
+}
+
+CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clkevt, "ezchip,nps400-timer0",
+		       nps_setup_clockevent);
+#endif /* CONFIG_EZNPS_MTM_EXT */
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 34bd805..9efc1a3 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -60,6 +60,7 @@ enum cpuhp_state {
 	CPUHP_AP_MARCO_TIMER_STARTING,
 	CPUHP_AP_MIPS_GIC_TIMER_STARTING,
 	CPUHP_AP_ARC_TIMER_STARTING,
+	CPUHP_AP_NPS_TIMER_STARTING,
 	CPUHP_AP_KVM_STARTING,
 	CPUHP_AP_KVM_ARM_VGIC_INIT_STARTING,
 	CPUHP_AP_KVM_ARM_VGIC_STARTING,
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
