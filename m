From: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 1/3] RISC-V: Don't include irq-riscv-intc.h
Date: Fri, 22 Jun 2018 16:20:04 -0700
Message-ID: <20180622232006.12158-2-palmer@sifive.com>
References: <20180622232006.12158-1-palmer@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180622232006.12158-1-palmer@sifive.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com
List-Id: devicetree@vger.kernel.org

This file has never existed in the upstream kernel, but it's guarded by
an #ifdef that's also never existed in the upstream kernel.  As a part
of our interrupt controller refactoring this header is no longer
necessary, but this reference managed to sneak in anyway.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/kernel/irq.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index b74cbfbce2d0..7bcdaed15703 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -16,10 +16,6 @@
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
 
-#ifdef CONFIG_RISCV_INTC
-#include <linux/irqchip/irq-riscv-intc.h>
-#endif
-
 void __init init_IRQ(void)
 {
 	irqchip_init();
-- 
2.16.4
