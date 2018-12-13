From: Atish Patra <atish.patra@wdc.com>
Subject: [PATCH v2 2/4] RISC-V: Support per-hart timebase-frequency
Date: Thu, 13 Dec 2018 15:14:27 -0800
Message-ID: <1544742869-19980-3-git-send-email-atish.patra@wdc.com>
References: <1544742869-19980-1-git-send-email-atish.patra@wdc.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544742869-19980-1-git-send-email-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, Dmitriy Cherkasov <dmitriy@oss-tech.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, Damien Le Moal <Damien.LeMoal@wdc.com>, Christoph Hellwig <hch@infradead.org>
List-Id: devicetree@vger.kernel.org

Follow the updated DT specs and read the timebase-frequency
from the boot cpu. Keep the old DT reading as well for backward
compatibility. This patch is rework of old patch from Palmer.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/time.c          |  9 +--------
 drivers/clocksource/riscv_timer.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 1911c8f6..225fe743 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -20,14 +20,7 @@ unsigned long riscv_timebase;
 
 void __init time_init(void)
 {
-	struct device_node *cpu;
-	u32 prop;
-
-	cpu = of_find_node_by_path("/cpus");
-	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
-		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
-	riscv_timebase = prop;
+	timer_probe();
 
 	lpj_fine = riscv_timebase / HZ;
-	timer_probe();
 }
diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
index 084e97dc..75262409 100644
--- a/drivers/clocksource/riscv_timer.c
+++ b/drivers/clocksource/riscv_timer.c
@@ -83,6 +83,35 @@ void riscv_timer_interrupt(void)
 	evdev->event_handler(evdev);
 }
 
+static void __init riscv_timebase_frequency(struct device_node *node,
+					    int hartid)
+{
+	u32 timebase;
+
+	if (!of_property_read_u32(node, "timebase-frequency", &timebase))
+		goto check;
+
+	/*
+	 * As per the DT specification, timebase-frequency should be present
+	 * under individual cpu node. Unfortunately, there are already available
+	 * HiFive Unleashed devices where the timebase-frequency entry is under
+	 * CPUs. check under parent "cpus" node to cover those devices.
+	 */
+	if (!of_property_read_u32(node->parent, "timebase-frequency",
+				  &timebase))
+		goto check;
+
+	panic("RISC-V system with no timebase-frequency in DTS for hart [%d]\n",
+	      hartid);
+
+check:
+	/* RISC-V ISA specification mandates that every cpu has a timer */
+	if (!riscv_timebase)
+		riscv_timebase = timebase;
+	else if (riscv_timebase && riscv_timebase != timebase)
+		pr_warn("RISC-V system with different timebase-frequency\n");
+}
+
 static int __init riscv_timer_init_dt(struct device_node *n)
 {
 	int cpuid, hartid, error;
@@ -90,10 +119,12 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 
 	hartid = riscv_of_processor_hartid(n);
 	cpuid = riscv_hartid_to_cpuid(hartid);
+	riscv_timebase_frequency(n, hartid);
 
 	if (cpuid != smp_processor_id())
 		return 0;
 
+	/* This should be called only for boot cpu */
 	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
 	clocksource_register_hz(cs, riscv_timebase);
 
-- 
2.7.4
