From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 1/8] RISC-V: remove timer leftovers
Date: Sat,  4 Aug 2018 10:23:12 +0200
Message-ID: <20180804082319.5711-2-hch@lst.de>
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

This code is currently unused and will be added back later in a different
place with the real interrupt and clocksource support.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/time.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 2463fcca719e..0df9b2cbd645 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -13,32 +13,11 @@
  */
 
 #include <linux/clocksource.h>
-#include <linux/clockchips.h>
 #include <linux/delay.h>
-
-#ifdef CONFIG_RISCV_TIMER
-#include <linux/timer_riscv.h>
-#endif
-
 #include <asm/sbi.h>
 
 unsigned long riscv_timebase;
 
-DECLARE_PER_CPU(struct clock_event_device, riscv_clock_event);
-
-void riscv_timer_interrupt(void)
-{
-#ifdef CONFIG_RISCV_TIMER
-	/*
-	 * FIXME: This needs to be cleaned up along with the rest of the IRQ
-	 * handling cleanup.  See irq.c for more details.
-	 */
-	struct clock_event_device *evdev = this_cpu_ptr(&riscv_clock_event);
-
-	evdev->event_handler(evdev);
-#endif
-}
-
 void __init init_clockevent(void)
 {
 	timer_probe();
-- 
2.18.0
