From: Atish Patra <atish.patra@wdc.com>
Subject: [RFC 3/3] RISC-V: Parse cpu topology during boot.
Date: Thu,  8 Nov 2018 17:50:09 -0800
Message-ID: <1541728209-3224-4-git-send-email-atish.patra@wdc.com>
References: <1541728209-3224-1-git-send-email-atish.patra@wdc.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541728209-3224-1-git-send-email-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, Damien.LeMoal@wdc.com, atish.patra@wdc.com, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, robh+dt@kernel.org, sudeep.holla@arm.com, palmer@sifive.com, devicetree@vger.kernel.org, juri.lelli@arm.com, mick@ics.forth.gr, jeremy.linton@arm.com
List-Id: devicetree@vger.kernel.org

Currently, there are no topology defined for RISC-V.
Parse the cpu-map node from device tree and setup the
cpu topology.

CPU topology after applying the patch.
$cat /sys/devices/system/cpu/cpu2/topology/core_siblings_list
0-3
$cat /sys/devices/system/cpu/cpu3/topology/core_siblings_list
0-3
$cat /sys/devices/system/cpu/cpu3/topology/physical_package_id
0
$cat /sys/devices/system/cpu/cpu3/topology/core_id
3

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/Kconfig          | 1 +
 arch/riscv/kernel/smpboot.c | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 55da93f4..e2d8ddb5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -42,6 +42,7 @@ config RISCV
 	select THREAD_INFO_IN_TASK
 	select RISCV_TIMER
 	select GENERIC_IRQ_MULTI_HANDLER
+	select GENERIC_ARCH_TOPOLOGY
 	select ARCH_HAS_PTE_SPECIAL
 
 config MMU
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 18cda0e8..6fa95442 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -31,6 +31,7 @@
 #include <linux/of.h>
 #include <linux/sched/task_stack.h>
 #include <linux/sched/mm.h>
+#include <linux/arch_topology.h>
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/tlbflush.h>
@@ -42,6 +43,7 @@ void *__cpu_up_task_pointer[NR_CPUS];
 
 void __init smp_prepare_boot_cpu(void)
 {
+	init_cpu_topology();
 }
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
@@ -108,13 +110,15 @@ void __init smp_cpus_done(unsigned int max_cpus)
 asmlinkage void __init smp_callin(void)
 {
 	struct mm_struct *mm = &init_mm;
+	unsigned int cpu = smp_processor_id();
 
 	/* All kernel threads share the same mm context.  */
 	mmgrab(mm);
 	current->active_mm = mm;
 
 	trap_init();
-	notify_cpu_starting(smp_processor_id());
+	notify_cpu_starting(cpu);
+	update_siblings_masks(cpu);
 	set_cpu_online(smp_processor_id(), 1);
 	/*
 	 * Remote TLB flushes are ignored while the CPU is offline, so emit
-- 
2.7.4
