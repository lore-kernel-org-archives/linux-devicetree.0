From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 1/6] RISC-V: simplify software interrupt / IPI code
Date: Wed, 25 Jul 2018 11:36:44 +0200
Message-ID: <20180725093649.32332-2-hch@lst.de>
References: <20180725093649.32332-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180725093649.32332-1-hch@lst.de>
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
Cc: shorne@gmail.com, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Rename handle_ipi to riscv_software_interrupt, drop the unused return
value and provide a stub for the !SMP build.  This allows simplifying
the upcoming interrupt controller driver by not providing a wrapper
for it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/smp.h | 13 +++++++++++--
 arch/riscv/kernel/smp.c      |  6 ++----
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 85e4220839b0..80ecb957fe9f 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -44,8 +44,17 @@ void arch_send_call_function_single_ipi(int cpu);
  */
 #define raw_smp_processor_id() (*((int*)((char*)get_current() + TASK_TI_CPU)))
 
-/* Interprocessor interrupt handler */
-irqreturn_t handle_ipi(void);
+/* Software interrupt handler */
+void riscv_software_interrupt(void);
+
+#else /* CONFIG_SMP */
+
+/*
+ * We currently only use software interrupts to pass inter-processor
+ * interrupts, so if a non-SMP system gets a software interrupt then we
+ * don't know what to do.
+ */
+#define riscv_software_interrupt()	WARN_ON()
 
 #endif /* CONFIG_SMP */
 
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 6d3962435720..906fe21ea21b 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -45,7 +45,7 @@ int setup_profiling_timer(unsigned int multiplier)
 	return -EINVAL;
 }
 
-irqreturn_t handle_ipi(void)
+void riscv_software_interrupt(void)
 {
 	unsigned long *pending_ipis = &ipi_data[smp_processor_id()].bits;
 
@@ -60,7 +60,7 @@ irqreturn_t handle_ipi(void)
 
 		ops = xchg(pending_ipis, 0);
 		if (ops == 0)
-			return IRQ_HANDLED;
+			return;
 
 		if (ops & (1 << IPI_RESCHEDULE))
 			scheduler_ipi();
@@ -73,8 +73,6 @@ irqreturn_t handle_ipi(void)
 		/* Order data access and bit testing. */
 		mb();
 	}
-
-	return IRQ_HANDLED;
 }
 
 static void
-- 
2.18.0
