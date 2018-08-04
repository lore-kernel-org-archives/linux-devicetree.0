From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 3/8] RISC-V: remove INTERRUPT_CAUSE_* defines from asm/irq.h
Date: Sat,  4 Aug 2018 10:23:14 +0200
Message-ID: <20180804082319.5711-4-hch@lst.de>
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

These are only of use to the local irq controller driver, so add them in
that driver implementation instead, which will be submitted soon.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/irq.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index c871661c9df4..996b6fbe17a6 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -17,10 +17,6 @@
 
 #define NR_IRQS         0
 
-#define INTERRUPT_CAUSE_SOFTWARE    1
-#define INTERRUPT_CAUSE_TIMER       5
-#define INTERRUPT_CAUSE_EXTERNAL    9
-
 void riscv_timer_interrupt(void);
 void riscv_software_interrupt(void);
 
-- 
2.18.0
