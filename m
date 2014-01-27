From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 01/20] ARM: Introduce atomic MMIO modify
Date: Mon, 27 Jan 2014 12:27:01 -0300
Message-ID: <1390836440-12744-2-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1390836440-12744-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390836440-12744-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some SoC have MMIO regions that are shared across orthogonal
subsystems. This commit implements a possible solution for the
thread-safe access of such regions through a spinlock-protected API.

Concurrent access is protected with a single spinlock for the
entire MMIO address space. While this protects shared-registers,
it also serializes access to unrelated/unshared registers.

We add relaxed and non-relaxed variants, by using writel_relaxed and writel,
respectively. The rationale for this is that some users may not require
register write completion but only thread-safe access to a register.

Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Tested-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
Russell,

Can you confirm this patch is on its way to v3.14?

 arch/arm/include/asm/io.h |  6 ++++++
 arch/arm/kernel/io.c      | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/arch/arm/include/asm/io.h b/arch/arm/include/asm/io.h
index fbeb39c..8aa4cca 100644
--- a/arch/arm/include/asm/io.h
+++ b/arch/arm/include/asm/io.h
@@ -38,6 +38,12 @@
 #define isa_bus_to_virt phys_to_virt
 
 /*
+ * Atomic MMIO-wide IO modify
+ */
+extern void atomic_io_modify(void __iomem *reg, u32 mask, u32 set);
+extern void atomic_io_modify_relaxed(void __iomem *reg, u32 mask, u32 set);
+
+/*
  * Generic IO read/write.  These perform native-endian accesses.  Note
  * that some architectures will want to re-define __raw_{read,write}w.
  */
diff --git a/arch/arm/kernel/io.c b/arch/arm/kernel/io.c
index dcd5b4d..9203cf8 100644
--- a/arch/arm/kernel/io.c
+++ b/arch/arm/kernel/io.c
@@ -1,6 +1,41 @@
 #include <linux/export.h>
 #include <linux/types.h>
 #include <linux/io.h>
+#include <linux/spinlock.h>
+
+static DEFINE_RAW_SPINLOCK(__io_lock);
+
+/*
+ * Generic atomic MMIO modify.
+ *
+ * Allows thread-safe access to registers shared by unrelated subsystems.
+ * The access is protected by a single MMIO-wide lock.
+ */
+void atomic_io_modify_relaxed(void __iomem *reg, u32 mask, u32 set)
+{
+	unsigned long flags;
+	u32 value;
+
+	raw_spin_lock_irqsave(&__io_lock, flags);
+	value = readl_relaxed(reg) & ~mask;
+	value |= (set & mask);
+	writel_relaxed(value, reg);
+	raw_spin_unlock_irqrestore(&__io_lock, flags);
+}
+EXPORT_SYMBOL(atomic_io_modify_relaxed);
+
+void atomic_io_modify(void __iomem *reg, u32 mask, u32 set)
+{
+	unsigned long flags;
+	u32 value;
+
+	raw_spin_lock_irqsave(&__io_lock, flags);
+	value = readl_relaxed(reg) & ~mask;
+	value |= (set & mask);
+	writel(value, reg);
+	raw_spin_unlock_irqrestore(&__io_lock, flags);
+}
+EXPORT_SYMBOL(atomic_io_modify);
 
 /*
  * Copy data from IO memory space to "real" memory space.
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
