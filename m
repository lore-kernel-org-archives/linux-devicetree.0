From: Christoph Hellwig <hch@lst.de>
Subject: simplified RISC-V interrupt and clocksource handling v4
Date: Thu,  9 Aug 2018 09:55:59 +0200
Message-ID: <20180809075602.989-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
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

This series tries adds support for interrupt handling and timers
for the RISC-V architecture.

The basic per-hart interrupt handling implemented by the scause
and sie CSRs is extremely simple and implemented directly in
arch/riscv/kernel/irq.c.  In addition there is a irqchip driver
for the PLIC external interrupt controller, which is called through
the set_handle_irq API, and a clocksource driver that gets its
timer interrupt directly from the low-level interrupt handling.

Compared to previous iterations this version does not try to use an
irqchip driver for the low-level interrupt handling.  This saves
a couple indirect calls and an additional read of the scause CSR
in the hot path, makes the code much simpler and last but not least
avoid the dependency on a device tree for a mandatory architectural
feature.

A git tree is available here (contains a few more patches before
the ones in this series).  The series is against the riscv for-next
tree, so using the git tree is advised

    git://git.infradead.org/users/hch/riscv.git riscv-irq-simple.4

Gitweb:

    http://git.infradead.org/users/hch/riscv.git/shortlog/refs/heads/riscv-irq-simple.4

Changes since v3:
 - more improvements to the DT bindings
 - add back the patch adding the riscv,cpu-intc binding documentation
   as it is referenced from others

Changes since v2:
 - actually use SEIE instead of STIE in the plic driver
 - rename the default compat string for the plic to sifive,u5-plic
 - various spelling fixes
 - drop a superflous derefence in the plic driver that is taken care of
   by the following loop
 - drop the patch to document the enable method - not relevant for the
   rest of the series
 - drop the patches for the per-hart timebase frequency - not relevant
   for the rest of the series.
 - use riscv_of_processor_hart in the timer driver

Changes since v1:
 - rename the plic driver to irq-sifive-plic
 - switch to a default compatible of sifive,plic0 (still supporting the
   riscv,plic0 name for compatibility)
 - add a reference for the SiFive PLIC register layout
 - fix plic_toggle addressing for large numbers of hwirqs
 - remove the call to ack_bad_irq
 - use a raw spinlock for plic_toggle_lock
 - use the irq_desc cpumask in the plic enable/disable methods
 - add back OF contexid parsing in the plic driver
 - don't allow COMPILE_TEST builds of the clocksource driver, as it
   depends on <asm/sbi.h>
 - default the clocksource driver to y
 - clean up naming in the clocksource driver
 - remove the MINDELTA and MAXDELTA #defines
 - various DT binding fixes
