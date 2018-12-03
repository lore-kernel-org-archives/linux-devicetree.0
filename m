From: Atish Patra <atish.patra@wdc.com>
Subject: [PATCH 2/4] RISC-V: Support per-hart timebase-frequency
Date: Mon,  3 Dec 2018 12:57:29 -0800
Message-ID: <1543870651-16669-3-git-send-email-atish.patra@wdc.com>
References: <1543870651-16669-1-git-send-email-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <1543870651-16669-1-git-send-email-atish.patra@wdc.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Damien Le Moal <Damien.LeMoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>, Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

Follow the updated DT specs and read the timebase-frequency
from the boot cpu. Keep the old DT reading as well for backward
compatibility. This patch is rework of old patch from Palmer.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/time.c          |  9 +--------
 drivers/clocksource/riscv_timer.c | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+), 8 deletions(-)

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
index 084e97dc..96af7058 100644
--- a/drivers/clocksource/riscv_timer.c
+++ b/drivers/clocksource/riscv_timer.c
@@ -83,6 +83,26 @@ void riscv_timer_interrupt(void)
 	evdev->event_handler(evdev);
 }
 
+static long __init riscv_timebase_frequency(struct device_node *node)
+{
+	u32 timebase;
+
+	if (!of_property_read_u32(node, "timebase-frequency", &timebase))
+		return timebase;
+
+	/*
+	 * As per the DT specification, timebase-frequency should be present
+	 * under individual cpu node. Unfortunately, there are already available
+	 * HiFive Unleashed devices where the timebase-frequency entry is under
+	 * CPUs. check under parent "cpus" node to cover those devices.
+	 */
+	if (!of_property_read_u32(node->parent, "timebase-frequency",
+				  &timebase))
+		return timebase;
+
+	panic("RISC-V system with no 'timebase-frequency' in DTS\n");
+}
+
 static int __init riscv_timer_init_dt(struct device_node *n)
 {
 	int cpuid, hartid, error;
@@ -94,6 +114,8 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	if (cpuid != smp_processor_id())
 		return 0;
 
+	/* This should be called only for boot cpu */
+	riscv_timebase = riscv_timebase_frequency(n);
 	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
 	clocksource_register_hz(cs, riscv_timebase);
 
-- 
2.7.4
