From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 8/8] clocksource: new RISC-V SBI timer driver
Date: Sat,  4 Aug 2018 10:23:19 +0200
Message-ID: <20180804082319.5711-9-hch@lst.de>
References: <20180804082319.5711-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180804082319.5711-1-hch@lst.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: tglx@linutronix.de, palmer@sifive.com, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, Dmitriy Cherkasov <dmitriy@oss-tech.org>, anup@brainfault.org, linux-kernel@vger.kernel.org, atish.patra@wdc.com, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, shorne@gmail.com
List-Id: devicetree@vger.kernel.org

From: Palmer Dabbelt <palmer@dabbelt.com>

The RISC-V ISA defines a per-hart real-time clock and timer, which is
present on all systems.  The clock is accessed via the 'rdtime'
pseudo-instruction (which reads a CSR), and the timer is set via an SBI
call.

Contains various improvements from Atish Patra <atish.patra@wdc.com>.

Signed-off-by: Dmitriy Cherkasov <dmitriy@oss-tech.org>
Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
[hch: remove dead code, add SPDX tags, used riscv_of_processor_hart(),
 minor cleanups, merged  hotplug cpu support and other improvements
 from Atish]
Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/smp.h      |   3 -
 arch/riscv/kernel/irq.c           |   3 +
 arch/riscv/kernel/smpboot.c       |   1 -
 arch/riscv/kernel/time.c          |   9 +--
 drivers/clocksource/Kconfig       |  11 ++++
 drivers/clocksource/Makefile      |   1 +
 drivers/clocksource/riscv_timer.c | 105 ++++++++++++++++++++++++++++++
 include/linux/cpuhotplug.h        |   1 +
 8 files changed, 122 insertions(+), 12 deletions(-)
 create mode 100644 drivers/clocksource/riscv_timer.c

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index c9395fff246f..36016845461d 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -24,9 +24,6 @@
 
 #ifdef CONFIG_SMP
 
-/* SMP initialization hook for setup_arch */
-void __init init_clockevent(void);
-
 /* SMP initialization hook for setup_arch */
 void __init setup_smp(void);
 
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index ab5f3e22c7cc..0cfac48a1272 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -30,6 +30,9 @@ asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs, unsigned long cause)
 
 	irq_enter();
 	switch (cause & ~INTERRUPT_CAUSE_FLAG) {
+	case INTERRUPT_CAUSE_TIMER:
+		riscv_timer_interrupt();
+		break;
 #ifdef CONFIG_SMP
 	case INTERRUPT_CAUSE_SOFTWARE:
 		/*
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index f741458c5a3f..56abab6a9812 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -104,7 +104,6 @@ asmlinkage void __init smp_callin(void)
 	current->active_mm = mm;
 
 	trap_init();
-	init_clockevent();
 	notify_cpu_starting(smp_processor_id());
 	set_cpu_online(smp_processor_id(), 1);
 	local_flush_tlb_all();
diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 0df9b2cbd645..1911c8f6b8a6 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -18,12 +18,6 @@
 
 unsigned long riscv_timebase;
 
-void __init init_clockevent(void)
-{
-	timer_probe();
-	csr_set(sie, SIE_STIE);
-}
-
 void __init time_init(void)
 {
 	struct device_node *cpu;
@@ -35,6 +29,5 @@ void __init time_init(void)
 	riscv_timebase = prop;
 
 	lpj_fine = riscv_timebase / HZ;
-
-	init_clockevent();
+	timer_probe();
 }
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index dec0dd88ec15..a11f4ba98b05 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -609,4 +609,15 @@ config ATCPIT100_TIMER
 	help
 	  This option enables support for the Andestech ATCPIT100 timers.
 
+config RISCV_TIMER
+	bool "Timer for the RISC-V platform"
+	depends on RISCV
+	default y
+	select TIMER_PROBE
+	select TIMER_OF
+	help
+	  This enables the per-hart timer built into all RISC-V systems, which
+	  is accessed via both the SBI and the rdcycle instruction.  This is
+	  required for all RISC-V systems.
+
 endmenu
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 00caf37e52f9..ded31f720bd9 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -78,3 +78,4 @@ obj-$(CONFIG_H8300_TPU)			+= h8300_tpu.o
 obj-$(CONFIG_CLKSRC_ST_LPC)		+= clksrc_st_lpc.o
 obj-$(CONFIG_X86_NUMACHIP)		+= numachip.o
 obj-$(CONFIG_ATCPIT100_TIMER)		+= timer-atcpit100.o
+obj-$(CONFIG_RISCV_TIMER)		+= riscv_timer.o
diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
new file mode 100644
index 000000000000..4e8b347e43e2
--- /dev/null
+++ b/drivers/clocksource/riscv_timer.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2017 SiFive
+ */
+#include <linux/clocksource.h>
+#include <linux/clockchips.h>
+#include <linux/cpu.h>
+#include <linux/delay.h>
+#include <linux/irq.h>
+#include <asm/sbi.h>
+
+/*
+ * All RISC-V systems have a timer attached to every hart.  These timers can be
+ * read by the 'rdcycle' pseudo instruction, and can use the SBI to setup
+ * events.  In order to abstract the architecture-specific timer reading and
+ * setting functions away from the clock event insertion code, we provide
+ * function pointers to the clockevent subsystem that perform two basic
+ * operations: rdtime() reads the timer on the current CPU, and
+ * next_event(delta) sets the next timer event to 'delta' cycles in the future.
+ * As the timers are inherently a per-cpu resource, these callbacks perform
+ * operations on the current hart.  There is guaranteed to be exactly one timer
+ * per hart on all RISC-V systems.
+ */
+
+static int riscv_clock_next_event(unsigned long delta,
+		struct clock_event_device *ce)
+{
+	csr_set(sie, SIE_STIE);
+	sbi_set_timer(get_cycles64() + delta);
+	return 0;
+}
+
+static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
+	.name			= "riscv_timer_clockevent",
+	.features		= CLOCK_EVT_FEAT_ONESHOT,
+	.rating			= 100,
+	.set_next_event		= riscv_clock_next_event,
+};
+
+/*
+ * It is guaranteed that all the timers across all the harts are synchronized
+ * within one tick of each other, so while this could technically go
+ * backwards when hopping between CPUs, practically it won't happen.
+ */
+static unsigned long long riscv_clocksource_rdtime(struct clocksource *cs)
+{
+	return get_cycles64();
+}
+
+static DEFINE_PER_CPU(struct clocksource, riscv_clocksource) = {
+	.name		= "riscv_clocksource",
+	.rating		= 300,
+	.mask		= CLOCKSOURCE_MASK(BITS_PER_LONG),
+	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
+	.read		= riscv_clocksource_rdtime,
+};
+
+static int riscv_timer_starting_cpu(unsigned int cpu)
+{
+	struct clock_event_device *ce = per_cpu_ptr(&riscv_clock_event, cpu);
+
+	ce->cpumask = cpumask_of(cpu);
+	clockevents_config_and_register(ce, riscv_timebase, 100, 0x7fffffff);
+
+	csr_set(sie, SIE_STIE);
+	return 0;
+}
+
+static int riscv_timer_dying_cpu(unsigned int cpu)
+{
+	csr_clear(sie, SIE_STIE);
+	return 0;
+}
+
+/* called directly from the low-level interrupt handler */
+void riscv_timer_interrupt(void)
+{
+	struct clock_event_device *evdev = this_cpu_ptr(&riscv_clock_event);
+
+	csr_clear(sie, SIE_STIE);
+	evdev->event_handler(evdev);
+}
+
+static int __init riscv_timer_init_dt(struct device_node *n)
+{
+	int cpu_id = riscv_of_processor_hart(n), error;
+	struct clocksource *cs;
+
+	if (cpu_id != smp_processor_id())
+		return 0;
+
+	cs = per_cpu_ptr(&riscv_clocksource, cpu_id);
+	clocksource_register_hz(cs, riscv_timebase);
+
+	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
+			 "clockevents/riscv/timer:starting",
+			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
+	if (error)
+		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
+		       error, cpu_id);
+	return error;
+}
+
+TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 8796ba387152..554c27f6cfbd 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -125,6 +125,7 @@ enum cpuhp_state {
 	CPUHP_AP_MARCO_TIMER_STARTING,
 	CPUHP_AP_MIPS_GIC_TIMER_STARTING,
 	CPUHP_AP_ARC_TIMER_STARTING,
+	CPUHP_AP_RISCV_TIMER_STARTING,
 	CPUHP_AP_KVM_STARTING,
 	CPUHP_AP_KVM_ARM_VGIC_INIT_STARTING,
 	CPUHP_AP_KVM_ARM_VGIC_STARTING,
-- 
2.18.0
