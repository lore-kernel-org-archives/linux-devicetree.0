From: Noam Camus <noamca@mellanox.com>
Subject: [PATCH v6 3/3] clocksource: Add clockevent support to NPS400 driver
Date: Mon, 14 Nov 2016 11:40:47 +0200
Message-ID: <1479116447-29483-4-git-send-email-noamca@mellanox.com>
References: <1479116447-29483-1-git-send-email-noamca@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479116447-29483-1-git-send-email-noamca@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org
Cc: tglx@linutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Noam Camus <noamca@mellanox.com>
List-Id: devicetree@vger.kernel.org

From: Noam Camus <noamca@mellanox.com>

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
For backward compatibility we keep "ezchip,nps400-timer" for clocksource

Signed-off-by: Noam Camus <noamca@mellanox.com>
---
 .../bindings/timer/ezchip,nps400-timer.txt         |   15 --
 .../bindings/timer/ezchip,nps400-timer0.txt        |   17 ++
 .../bindings/timer/ezchip,nps400-timer1.txt        |   15 ++
 drivers/clocksource/timer-nps.c                    |  213 ++++++++++++++++++++
 4 files changed, 245 insertions(+), 15 deletions(-)
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
index 0c8e21f..04bb66c 100644
--- a/drivers/clocksource/timer-nps.c
+++ b/drivers/clocksource/timer-nps.c
@@ -111,3 +111,216 @@ static int __init nps_setup_clocksource(struct device_node *node)
 
 CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clksrc, "ezchip,nps400-timer",
 		       nps_setup_clocksource);
+CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clk_src, "ezchip,nps400-timer1",
+		       nps_setup_clocksource);
+
+#ifdef CONFIG_EZNPS_MTM_EXT
+#include <soc/nps/mtm.h>
+
+/* Timer related Aux registers */
+#define NPS_REG_TIMER0_TSI	0xFFFFF850
+#define NPS_REG_TIMER0_LIMIT	0x23
+#define NPS_REG_TIMER0_CTRL	0x22
+#define NPS_REG_TIMER0_CNT	0x21
+
+/*
+ * Interrupt Enabled (IE) - re-arm the timer
+ * Not Halted (NH) - is cleared when working with JTAG (for debug)
+ */
+#define TIMER0_CTRL_IE		BIT(0)
+#define TIMER0_CTRL_NH		BIT(1)
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
+	write_aux_reg(NPS_REG_TIMER0_CNT, 0);
+
+	write_aux_reg(NPS_REG_TIMER0_CTRL, TIMER0_CTRL_IE | TIMER0_CTRL_NH);
+}
+
+/*
+ * Clear from TSI the bit for this thread (if not in periodic mode)
+ * If still there are pending HW treads set next timer event
+ */
+static void nps_clkevent_rm_thread(bool remove_thread)
+{
+	unsigned int cflags;
+	unsigned int enabled_threads = 0;
+	int thread;
+
+	hw_schd_save(&cflags);
+
+	enabled_threads = read_aux_reg(NPS_REG_TIMER0_TSI);
+
+	/* remove thread from TSI1 */
+	if (remove_thread) {
+		thread = read_aux_reg(CTOP_AUX_THREAD_ID);
+		enabled_threads &= ~(1 << thread);
+		write_aux_reg(NPS_REG_TIMER0_TSI, enabled_threads);
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
+}
+
+static void nps_clkevent_add_thread(bool set_event)
+{
+	int thread;
+	unsigned int cflags, enabled_threads;
+
+	hw_schd_save(&cflags);
+
+	/* add thread to TSI1 */
+	thread = read_aux_reg(CTOP_AUX_THREAD_ID);
+	enabled_threads = read_aux_reg(NPS_REG_TIMER0_TSI);
+	enabled_threads |= (1 << thread);
+	write_aux_reg(NPS_REG_TIMER0_TSI, enabled_threads);
+
+	/* set next timer event */
+	if (set_event)
+		write_aux_reg(NPS_REG_TIMER0_CTRL,
+			      TIMER0_CTRL_IE | TIMER0_CTRL_NH);
+
+	hw_schd_restore(cflags);
+}
+
+static int nps_clkevent_set_next_event(unsigned long delta,
+				       struct clock_event_device *dev)
+{
+	nps_clkevent_add_thread(true);
+	enable_percpu_irq(nps_timer0_irq, IRQ_TYPE_NONE);
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
+	disable_percpu_irq(nps_timer0_irq);
+
+	return 0;
+}
+
+/*
+ * For each HW thread set its relevant bit at the TSI register
+ * To arm the timer only thread 0 is needed since it is shared
+ * by all HW threads within same core.
+ */
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
+	struct clock_event_device *evt = dev_id;
+	int irq_reenable = clockevent_state_periodic(evt);
+
+	/* Remove HW thread from TSI only if NOT in periodic state */
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
+	enable_percpu_irq(nps_timer0_irq, IRQ_TYPE_NONE);
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
+	struct clk *clk;
+	int ret;
+
+	nps_timer0_irq = irq_of_parse_and_map(node, 0);
+	if (nps_timer0_irq <= 0) {
+		pr_err("clockevent: missing irq");
+		return -EINVAL;
+	}
+
+	ret = nps_get_timer_clk(node, &nps_timer0_freq, &clk);
+	if (ret)
+		return ret;
+
+	/* Needs apriori irq_set_percpu_devid() done in intc map function */
+	ret = request_percpu_irq(nps_timer0_irq, timer_irq_handler,
+				 "Timer0 (per-cpu-tick)",
+				 &nps_clockevent_device);
+	if (ret) {
+		pr_err("Couldn't request irq\n");
+		clk_disable_unprepare(clk);
+		return ret;
+	}
+
+	ret = cpuhp_setup_state(CPUHP_AP_ARC_TIMER_STARTING,
+				"clockevents/nps:starting",
+				nps_timer_starting_cpu,
+				nps_timer_dying_cpu);
+	if (ret) {
+		pr_err("Failed to setup hotplug state");
+		clk_disable_unprepare(clk);
+		free_percpu_irq(nps_timer0_irq, &nps_clockevent_device);
+		return ret;
+	}
+
+	return 0;
+}
+
+CLOCKSOURCE_OF_DECLARE(ezchip_nps400_clk_evt, "ezchip,nps400-timer0",
+		       nps_setup_clockevent);
+#endif /* CONFIG_EZNPS_MTM_EXT */
-- 
1.7.1
