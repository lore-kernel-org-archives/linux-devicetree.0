From: Atish Patra <atish.patra@wdc.com>
Subject: [PATCH v2 4/4] RISC-V: Fix non-smp kernel boot on SMP systems
Date: Thu, 13 Dec 2018 15:14:29 -0800
Message-ID: <1544742869-19980-5-git-send-email-atish.patra@wdc.com>
References: <1544742869-19980-1-git-send-email-atish.patra@wdc.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544742869-19980-1-git-send-email-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, Dmitriy Cherkasov <dmitriy@oss-tech.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, Damien Le Moal <Damien.LeMoal@wdc.com>, Christoph Hellwig <hch@infradead.org>
List-Id: devicetree@vger.kernel.org

Currently, clocksource registration happens for an invalid cpu
for non-smp kernels. This lead to kernel panic as cpu hotplug
registration will fail for those cpus.

Do not proceed if hartid is invalid. Take this opprtunity to
print appropriate error strings for different failure cases.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 drivers/clocksource/riscv_timer.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
index c9e65086..c1e1260e 100644
--- a/drivers/clocksource/riscv_timer.c
+++ b/drivers/clocksource/riscv_timer.c
@@ -117,6 +117,11 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	int cpuid, hartid, error;
 
 	hartid = riscv_of_processor_hartid(n);
+	if (hartid < 0) {
+		pr_warn("Not valid hartid for node [%pOF] error = [%d]\n",
+			n, hartid);
+		return hartid;
+	}
 	cpuid = riscv_hartid_to_cpuid(hartid);
 	riscv_timebase_frequency(n, hartid);
 
@@ -124,14 +129,19 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 		return 0;
 
 	/* This should be called only for boot cpu */
-	clocksource_register_hz(&riscv_clocksource, riscv_timebase);
+	error = clocksource_register_hz(&riscv_clocksource, riscv_timebase);
 
+	if (error) {
+		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
+		       error, cpuid);
+		return error;
+	}
 	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
 			 "clockevents/riscv/timer:starting",
 			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
 	if (error)
-		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
-		       error, cpuid);
+		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
+		       error);
 	return error;
 }
 
-- 
2.7.4
