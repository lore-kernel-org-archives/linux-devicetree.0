From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 2/8] RISC-V: simplify software interrupt / IPI code
Date: Sat,  4 Aug 2018 10:23:13 +0200
Message-ID: <20180804082319.5711-3-hch@lst.de>
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, anup@brainfault.org, linux-kernel@vger.kernel.org, atish.patra@wdc.com, linux-riscv@lists.infradead.org, shorne@gmail.com
List-Id: devicetree@vger.kernel.org

Rename handle_ipi to riscv_software_interrupt, drop the unused return
value and move the prototype to irq.h together with riscv_timer_interupt.
This allows simplifying the upcoming interrupt handling support.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/irq.h | 1 +
 arch/riscv/include/asm/smp.h | 3 ---
 arch/riscv/kernel/smp.c      | 6 ++----
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 4dee9d4c13c0..c871661c9df4 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -22,6 +22,7 @@
 #define INTERRUPT_CAUSE_EXTERNAL    9
 
 void riscv_timer_interrupt(void);
+void riscv_software_interrupt(void);
 
 #include <asm-generic/irq.h>
 
diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 85e4220839b0..c9395fff246f 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -44,9 +44,6 @@ void arch_send_call_function_single_ipi(int cpu);
  */
 #define raw_smp_processor_id() (*((int*)((char*)get_current() + TASK_TI_CPU)))
 
-/* Interprocessor interrupt handler */
-irqreturn_t handle_ipi(void);
-
 #endif /* CONFIG_SMP */
 
 #endif /* _ASM_RISCV_SMP_H */
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
