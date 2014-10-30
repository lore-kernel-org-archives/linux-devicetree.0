From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH V2 05/15] genirq: Generic chip: Add big endian I/O accessors
Date: Wed, 29 Oct 2014 19:17:58 -0700
Message-ID: <1414635488-14137-6-git-send-email-cernekee@gmail.com>
References: <1414635488-14137-1-git-send-email-cernekee@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1414635488-14137-1-git-send-email-cernekee@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: arnd@arndb.de, f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org, lethal@linux-sh.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Use io{read,write}32be if the caller specified IRQ_GC_BE_IO when creating
the irqchip.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 include/linux/irq.h       |  1 +
 kernel/irq/generic-chip.c | 15 +++++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 8049e93..e69b7b2 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -739,6 +739,7 @@ enum irq_gc_flags {
 	IRQ_GC_INIT_NESTED_LOCK		= 1 << 1,
 	IRQ_GC_MASK_CACHE_PER_TYPE	= 1 << 2,
 	IRQ_GC_NO_MASK			= 1 << 3,
+	IRQ_GC_BE_IO			= 1 << 4,
 };
 
 /*
diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
index b2ee65d..c1890bb 100644
--- a/kernel/irq/generic-chip.c
+++ b/kernel/irq/generic-chip.c
@@ -17,16 +17,27 @@
 static LIST_HEAD(gc_list);
 static DEFINE_RAW_SPINLOCK(gc_lock);
 
+static int is_big_endian(struct irq_chip_generic *gc)
+{
+	return !!(gc->domain->gc->gc_flags & IRQ_GC_BE_IO);
+}
+
 static void irq_reg_writel(struct irq_chip_generic *gc,
 			   u32 val, int reg_offset)
 {
-	writel(val, gc->reg_base + reg_offset);
+	if (is_big_endian(gc))
+		iowrite32be(val, gc->reg_base + reg_offset);
+	else
+		writel(val, gc->reg_base + reg_offset);
 }
 
 static u32 irq_reg_readl(struct irq_chip_generic *gc,
 			 int reg_offset)
 {
-	return readl(gc->reg_base + reg_offset);
+	if (is_big_endian(gc))
+		return ioread32be(gc->reg_base + reg_offset);
+	else
+		return readl(gc->reg_base + reg_offset);
 }
 
 /**
-- 
2.1.1
