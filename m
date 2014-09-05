From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH v2 06/16] MIPS: Move MIPS_GIC_IRQ_BASE into platform irq.h
Date: Fri,  5 Sep 2014 10:30:08 -0700
Message-ID: <1409938218-9026-7-git-send-email-abrestic@chromium.org>
References: <1409938218-9026-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1409938218-9026-1-git-send-email-abrestic@chromium.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
Cc: Andrew Bresticker <abrestic@chromium.org>, Jeffrey Deans <jeffrey.deans@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Arnd Bergmann <arnd@arndb.de>, John Crispin <blogic@openwrt.org>, David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Define a generic MIPS_GIC_IRQ_BASE which is suitable for Malta and
the upcoming Danube board in <mach-generic/irq.h>.  Since Sead-3 is
different and uses a MIPS_GIC_IRQ_BASE equal to the CPU IRQ base (0),
define its MIPS_GIC_IRQ_BASE in <mach-sead3/irq.h>.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
---
No changes from v1.
---
 arch/mips/include/asm/mach-generic/irq.h     | 6 ++++++
 arch/mips/include/asm/mach-sead3/irq.h       | 1 +
 arch/mips/include/asm/mips-boards/maltaint.h | 2 --
 arch/mips/include/asm/mips-boards/sead3int.h | 2 --
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/mach-generic/irq.h b/arch/mips/include/asm/mach-generic/irq.h
index 139cd20..050e18b 100644
--- a/arch/mips/include/asm/mach-generic/irq.h
+++ b/arch/mips/include/asm/mach-generic/irq.h
@@ -36,4 +36,10 @@
 
 #endif /* CONFIG_IRQ_CPU */
 
+#ifdef CONFIG_MIPS_GIC
+#ifndef MIPS_GIC_IRQ_BASE
+#define MIPS_GIC_IRQ_BASE (MIPS_CPU_IRQ_BASE + 8)
+#endif
+#endif /* CONFIG_MIPS_GIC */
+
 #endif /* __ASM_MACH_GENERIC_IRQ_H */
diff --git a/arch/mips/include/asm/mach-sead3/irq.h b/arch/mips/include/asm/mach-sead3/irq.h
index d8106f7..52c75d5 100644
--- a/arch/mips/include/asm/mach-sead3/irq.h
+++ b/arch/mips/include/asm/mach-sead3/irq.h
@@ -1,6 +1,7 @@
 #ifndef __ASM_MACH_MIPS_IRQ_H
 #define __ASM_MACH_MIPS_IRQ_H
 
+#define MIPS_GIC_IRQ_BASE 0
 #define GIC_NUM_INTRS (24 + NR_CPUS * 2)
 #define NR_IRQS 256
 
diff --git a/arch/mips/include/asm/mips-boards/maltaint.h b/arch/mips/include/asm/mips-boards/maltaint.h
index e330732..9d23343 100644
--- a/arch/mips/include/asm/mips-boards/maltaint.h
+++ b/arch/mips/include/asm/mips-boards/maltaint.h
@@ -10,8 +10,6 @@
 #ifndef _MIPS_MALTAINT_H
 #define _MIPS_MALTAINT_H
 
-#define MIPS_GIC_IRQ_BASE	(MIPS_CPU_IRQ_BASE + 8)
-
 /*
  * Interrupts 0..15 are used for Malta ISA compatible interrupts
  */
diff --git a/arch/mips/include/asm/mips-boards/sead3int.h b/arch/mips/include/asm/mips-boards/sead3int.h
index 6b17aaf..11ebec9 100644
--- a/arch/mips/include/asm/mips-boards/sead3int.h
+++ b/arch/mips/include/asm/mips-boards/sead3int.h
@@ -14,6 +14,4 @@
 #define GIC_BASE_ADDR		0x1b1c0000
 #define GIC_ADDRSPACE_SZ	(128 * 1024)
 
-#define MIPS_GIC_IRQ_BASE	(MIPS_CPU_IRQ_BASE + 0)
-
 #endif /* !(_MIPS_SEAD3INT_H) */
-- 
2.1.0.rc2.206.gedb03e5
