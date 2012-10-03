From: Nathan Fontenot <nfont@linux.vnet.ibm.com>
Subject: [PATCH 5/5] Remove the pSeries_reconfig.h file
Date: Tue, 02 Oct 2012 21:59:39 -0500
Message-ID: <506BAA1B.4090803@linux.vnet.ibm.com>
References: <506B2E63.5090900@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <506B2E63.5090900@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, cbe-oss-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Remove the pSeries_reconfig.h header file. At this point there is only one
definition in the file, pSeries_coalesce_init(), which can be
moved to rtas.h.

Signed-off-by: Nathan Fontenot <nfont@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/pSeries_reconfig.h |   15 ---------------
 arch/powerpc/include/asm/rtas.h             |    5 +++++
 arch/powerpc/kernel/rtas.c                  |    1 -
 arch/powerpc/platforms/pseries/smp.c        |    1 -
 4 files changed, 5 insertions(+), 17 deletions(-)

Index: dt-next/arch/powerpc/include/asm/pSeries_reconfig.h
===================================================================
--- dt-next.orig/arch/powerpc/include/asm/pSeries_reconfig.h	2012-10-02 09:14:01.000000000 -0500
+++ /dev/null	1970-01-01 00:00:00.000000000 +0000
@@ -1,15 +0,0 @@
-#ifndef _PPC64_PSERIES_RECONFIG_H
-#define _PPC64_PSERIES_RECONFIG_H
-#ifdef __KERNEL__
-
-#ifdef CONFIG_PPC_PSERIES
-/* Not the best place to put this, will be fixed when we move some
- * of the rtas suspend-me stuff to pseries */
-extern void pSeries_coalesce_init(void);
-#else /* !CONFIG_PPC_PSERIES */
-static inline void pSeries_coalesce_init(void) { }
-#endif /* CONFIG_PPC_PSERIES */
-
-
-#endif /* __KERNEL__ */
-#endif /* _PPC64_PSERIES_RECONFIG_H */
Index: dt-next/arch/powerpc/include/asm/rtas.h
===================================================================
--- dt-next.orig/arch/powerpc/include/asm/rtas.h	2012-10-02 09:14:01.000000000 -0500
+++ dt-next/arch/powerpc/include/asm/rtas.h	2012-10-02 09:14:40.000000000 -0500
@@ -353,8 +353,13 @@
 		return 1;
 	return 0;
 }
+
+/* Not the best place to put pSeries_coalesce_init, will be fixed when we
+ * move some of the rtas suspend-me stuff to pseries */
+extern void pSeries_coalesce_init(void);
 #else
 static inline int page_is_rtas_user_buf(unsigned long pfn) { return 0;}
+static inline void pSeries_coalesce_init(void) { }
 #endif
 
 extern int call_rtas(const char *, int, int, unsigned long *, ...);
Index: dt-next/arch/powerpc/kernel/rtas.c
===================================================================
--- dt-next.orig/arch/powerpc/kernel/rtas.c	2012-10-02 09:14:01.000000000 -0500
+++ dt-next/arch/powerpc/kernel/rtas.c	2012-10-02 09:14:40.000000000 -0500
@@ -42,7 +42,6 @@
 #include <asm/time.h>
 #include <asm/mmu.h>
 #include <asm/topology.h>
-#include <asm/pSeries_reconfig.h>
 
 struct rtas_t rtas = {
 	.lock = __ARCH_SPIN_LOCK_UNLOCKED
Index: dt-next/arch/powerpc/platforms/pseries/smp.c
===================================================================
--- dt-next.orig/arch/powerpc/platforms/pseries/smp.c	2012-10-02 09:14:01.000000000 -0500
+++ dt-next/arch/powerpc/platforms/pseries/smp.c	2012-10-02 09:14:40.000000000 -0500
@@ -38,7 +38,6 @@
 #include <asm/cputable.h>
 #include <asm/firmware.h>
 #include <asm/rtas.h>
-#include <asm/pSeries_reconfig.h>
 #include <asm/mpic.h>
 #include <asm/vdso_datapage.h>
 #include <asm/cputhreads.h>
