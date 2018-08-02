From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 08/11] RISC-V: implement low-level interrupt handling
Date: Thu,  2 Aug 2018 13:50:05 +0200
Message-ID: <20180802115008.4031-9-hch@lst.de>
References: <20180802115008.4031-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180802115008.4031-1-hch@lst.de>
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

Add support for a routine that dispatches exceptions with the interrupt
flags set to either the IPI or irqdomain code (and the clock source in the
future).

Loosely based on the irq-riscv-int.c irqchip driver from the RISC-V tree.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/entry.S |  4 +--
 arch/riscv/kernel/irq.c   | 52 ++++++++++++++++++++++++++++++++-------
 2 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 9aaf6c986771..fa2c08e3c05e 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -168,8 +168,8 @@ ENTRY(handle_exception)
 
 	/* Handle interrupts */
 	move a0, sp /* pt_regs */
-	REG_L a1, handle_arch_irq
-	jr a1
+	move a1, s4 /* scause */
+	tail do_IRQ
 1:
 	/* Exceptions run with interrupts enabled */
 	csrs sstatus, SR_SIE
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 7bcdaed15703..ab5f3e22c7cc 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -1,21 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2012 Regents of the University of California
  * Copyright (C) 2017 SiFive
- *
- *   This program is free software; you can redistribute it and/or
- *   modify it under the terms of the GNU General Public License
- *   as published by the Free Software Foundation, version 2.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY; without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *   GNU General Public License for more details.
+ * Copyright (C) 2018 Christoph Hellwig
  */
 
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
 
+/*
+ * Possible interrupt causes:
+ */
+#define INTERRUPT_CAUSE_SOFTWARE    1
+#define INTERRUPT_CAUSE_TIMER       5
+#define INTERRUPT_CAUSE_EXTERNAL    9
+
+/*
+ * The high order bit of the trap cause register is always set for
+ * interrupts, which allows us to differentiate them from exceptions
+ * quickly.  The INTERRUPT_CAUSE_* macros don't contain that bit, so we
+ * need to mask it off.
+ */
+#define INTERRUPT_CAUSE_FLAG	(1UL << (__riscv_xlen - 1))
+
+asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs, unsigned long cause)
+{
+	struct pt_regs *old_regs = set_irq_regs(regs);
+
+	irq_enter();
+	switch (cause & ~INTERRUPT_CAUSE_FLAG) {
+#ifdef CONFIG_SMP
+	case INTERRUPT_CAUSE_SOFTWARE:
+		/*
+		 * We only use software interrupts to pass IPIs, so if a non-SMP
+		 * system gets one, then we don't know what to do.
+		 */
+		riscv_software_interrupt();
+		break;
+#endif
+	case INTERRUPT_CAUSE_EXTERNAL:
+		handle_arch_irq(regs);
+		break;
+	default:
+		panic("unexpected interrupt cause");
+	}
+	irq_exit();
+
+	set_irq_regs(old_regs);
+}
+
 void __init init_IRQ(void)
 {
 	irqchip_init();
-- 
2.18.0
