From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH V4 05/14] irqchip: brcmstb-l2: Eliminate dependency on ARM code
Date: Thu,  6 Nov 2014 22:44:20 -0800
Message-ID: <1415342669-30640-6-git-send-email-cernekee@gmail.com>
References: <1415342669-30640-1-git-send-email-cernekee@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1415342669-30640-1-git-send-email-cernekee@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: tglx@linutronix.de, jason@lakedaemon.net, linux-sh@vger.kernel.org
Cc: arnd@arndb.de, f.fainelli@gmail.com, ralf@linux-mips.org, sergei.shtylyov@cogentembedded.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

The irq-brcmstb-l2 driver has a single dependency on the ARM code, the
do_bad_IRQ macro.  Expand this macro in-place so that the driver can be
built on non-ARM platforms.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irq-brcmstb-l2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-brcmstb-l2.c b/drivers/irqchip/irq-brcmstb-l2.c
index c15c840..c9bdf20 100644
--- a/drivers/irqchip/irq-brcmstb-l2.c
+++ b/drivers/irqchip/irq-brcmstb-l2.c
@@ -19,6 +19,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/spinlock.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
@@ -30,8 +31,6 @@
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
 
-#include <asm/mach/irq.h>
-
 #include "irqchip.h"
 
 /* Register offsets in the L2 interrupt controller */
@@ -63,7 +62,9 @@ static void brcmstb_l2_intc_irq_handle(unsigned int irq, struct irq_desc *desc)
 		~(__raw_readl(b->base + CPU_MASK_STATUS));
 
 	if (status == 0) {
-		do_bad_IRQ(irq, desc);
+		raw_spin_lock(&desc->lock);
+		handle_bad_irq(irq, desc);
+		raw_spin_unlock(&desc->lock);
 		goto out;
 	}
 
-- 
2.1.1
