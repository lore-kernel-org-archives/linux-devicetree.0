From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: [RFC PATCH] EDAC: Cleanup atomic_scrub mess
Date: Thu, 21 May 2015 20:11:57 +0200
Message-ID: <20150521181157.GF3689@pd.tnic>
References: <1431991481-25684-1-git-send-email-lho@apm.com>
 <1431991481-25684-2-git-send-email-lho@apm.com>
 <20150519170308.GL4641@pd.tnic>
 <CAPw-ZT=mTpt_vz+e=rM5ywK8feNKkJQrpEWg=noRCziJ0840TQ@mail.gmail.com>
 <20150519203336.GP4641@pd.tnic>
 <20150521180719.GE3689@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150521180719.GE3689-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Chris Metcalf <cmetcalf-d5a29ZRxExrQT0dZR+AlfA@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "Steven J. Hill" <Steven.Hill-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, ". Maciej W. Rozycki" <macro-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>

So first of all, this atomic_scrub() function's naming is bad. It looks
like an atomic_t helper. Change it to edac_atomic_scrub().

The bigger problem is that this function is arch-specific and every new
arch which doesn't necessarily need that functionality still needs to
define it, otherwise EDAC doesn't compile.

So instead of doing that and including arch-specific headers, have each
arch define an EDAC_ATOMIC_SCRUB symbol which can be used in edac_mc.c
for ifdeffery. Much cleaner.

We already are doing this with another symbol - EDAC_SUPPORT. This is
also much cleaner than having CONFIG_EDAC explicitly depend on all the
arches which need/have EDAC support and drivers.

This way I can kill the useless edac.h header in tile too.

Signed-off-by: Borislav Petkov <bp-l3A5Bk7waGM@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Cc: Chris Metcalf <cmetcalf-d5a29ZRxExrQT0dZR+AlfA@public.gmane.org>
Cc: x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: "Steven J. Hill" <Steven.Hill-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: "Maciej W. Rozycki" <macro-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---

Patch is still RFC as I need to compile in on those other arches first.
It should build though - it is simple enough ... famous last words :-P

 arch/arm/Kconfig                |  2 ++
 arch/arm/include/asm/edac.h     |  5 +++--
 arch/mips/Kconfig               |  1 +
 arch/mips/include/asm/edac.h    |  4 ++--
 arch/powerpc/Kconfig            |  2 ++
 arch/powerpc/include/asm/edac.h |  4 ++--
 arch/tile/Kconfig               |  1 +
 arch/tile/include/asm/edac.h    | 29 -----------------------------
 arch/x86/Kconfig                |  2 ++
 arch/x86/include/asm/edac.h     |  2 +-
 drivers/edac/Kconfig            |  7 ++++---
 drivers/edac/edac_mc.c          |  9 +++++++--
 12 files changed, 27 insertions(+), 41 deletions(-)
 delete mode 100644 arch/tile/include/asm/edac.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 45df48ba0b12..325d6f3a596a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -15,6 +15,8 @@ config ARM
 	select CLONE_BACKWARDS
 	select CPU_PM if (SUSPEND || CPU_IDLE)
 	select DCACHE_WORD_ACCESS if HAVE_EFFICIENT_UNALIGNED_ACCESS
+	select EDAC_SUPPORT
+	select EDAC_ATOMIC_SCRUB
 	select GENERIC_ALLOCATOR
 	select GENERIC_ATOMIC64 if (CPU_V7M || CPU_V6 || !CPU_32v6K || !AEABI)
 	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
diff --git a/arch/arm/include/asm/edac.h b/arch/arm/include/asm/edac.h
index 0df7a2c1fc3d..5189fa819b60 100644
--- a/arch/arm/include/asm/edac.h
+++ b/arch/arm/include/asm/edac.h
@@ -18,11 +18,12 @@
 #define ASM_EDAC_H
 /*
  * ECC atomic, DMA, SMP and interrupt safe scrub function.
- * Implements the per arch atomic_scrub() that EDAC use for software
+ * Implements the per arch edac_atomic_scrub() that EDAC use for software
  * ECC scrubbing.  It reads memory and then writes back the original
  * value, allowing the hardware to detect and correct memory errors.
  */
-static inline void atomic_scrub(void *va, u32 size)
+
+static inline void edac_atomic_scrub(void *va, u32 size)
 {
 #if __LINUX_ARM_ARCH__ >= 6
 	unsigned int *virt_addr = va;
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f5016656494f..b65edf514b40 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -819,6 +819,7 @@ config CAVIUM_OCTEON_SOC
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select EDAC_SUPPORT
+	select EDAC_ATOMIC_SCRUB
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select SYS_SUPPORTS_HOTPLUG_CPU if CPU_BIG_ENDIAN
 	select SYS_HAS_EARLY_PRINTK
diff --git a/arch/mips/include/asm/edac.h b/arch/mips/include/asm/edac.h
index 94105d3f58f4..980b16527374 100644
--- a/arch/mips/include/asm/edac.h
+++ b/arch/mips/include/asm/edac.h
@@ -5,7 +5,7 @@
 
 /* ECC atomic, DMA, SMP and interrupt safe scrub function */
 
-static inline void atomic_scrub(void *va, u32 size)
+static inline void edac_atomic_scrub(void *va, u32 size)
 {
 	unsigned long *virt_addr = va;
 	unsigned long temp;
@@ -21,7 +21,7 @@ static inline void atomic_scrub(void *va, u32 size)
 
 		__asm__ __volatile__ (
 		"	.set	mips2					\n"
-		"1:	ll	%0, %1		# atomic_scrub		\n"
+		"1:	ll	%0, %1		# edac_atomic_scrub	\n"
 		"	addu	%0, $0					\n"
 		"	sc	%0, %1					\n"
 		"	beqz	%0, 1b					\n"
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 190cc48abc0c..5ef27113b898 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -153,6 +153,8 @@ config PPC
 	select NO_BOOTMEM
 	select HAVE_GENERIC_RCU_GUP
 	select HAVE_PERF_EVENTS_NMI if PPC64
+	select EDAC_SUPPORT
+	select EDAC_ATOMIC_SCRUB
 
 config GENERIC_CSUM
 	def_bool CPU_LITTLE_ENDIAN
diff --git a/arch/powerpc/include/asm/edac.h b/arch/powerpc/include/asm/edac.h
index 6ead88bbfbb8..5571e23d253e 100644
--- a/arch/powerpc/include/asm/edac.h
+++ b/arch/powerpc/include/asm/edac.h
@@ -12,11 +12,11 @@
 #define ASM_EDAC_H
 /*
  * ECC atomic, DMA, SMP and interrupt safe scrub function.
- * Implements the per arch atomic_scrub() that EDAC use for software
+ * Implements the per arch edac_atomic_scrub() that EDAC use for software
  * ECC scrubbing.  It reads memory and then writes back the original
  * value, allowing the hardware to detect and correct memory errors.
  */
-static __inline__ void atomic_scrub(void *va, u32 size)
+static __inline__ void edac_atomic_scrub(void *va, u32 size)
 {
 	unsigned int *virt_addr = va;
 	unsigned int temp;
diff --git a/arch/tile/Kconfig b/arch/tile/Kconfig
index a07e31b50d3f..59cf0b911898 100644
--- a/arch/tile/Kconfig
+++ b/arch/tile/Kconfig
@@ -28,6 +28,7 @@ config TILE
 	select HAVE_DEBUG_STACKOVERFLOW
 	select ARCH_WANT_FRAME_POINTERS
 	select HAVE_CONTEXT_TRACKING
+	select EDAC_SUPPORT
 
 # FIXME: investigate whether we need/want these options.
 #	select HAVE_IOREMAP_PROT
diff --git a/arch/tile/include/asm/edac.h b/arch/tile/include/asm/edac.h
deleted file mode 100644
index 87fc83eeaffd..000000000000
--- a/arch/tile/include/asm/edac.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/*
- * Copyright 2011 Tilera Corporation. All Rights Reserved.
- *
- *   This program is free software; you can redistribute it and/or
- *   modify it under the terms of the GNU General Public License
- *   as published by the Free Software Foundation, version 2.
- *
- *   This program is distributed in the hope that it will be useful, but
- *   WITHOUT ANY WARRANTY; without even the implied warranty of
- *   MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, GOOD TITLE or
- *   NON INFRINGEMENT.  See the GNU General Public License for
- *   more details.
- */
-
-#ifndef _ASM_TILE_EDAC_H
-#define _ASM_TILE_EDAC_H
-
-/* ECC atomic, DMA, SMP and interrupt safe scrub function */
-
-static inline void atomic_scrub(void *va, u32 size)
-{
-	/*
-	 * These is nothing to be done here because CE is
-	 * corrected by the mshim.
-	 */
-	return;
-}
-
-#endif /* _ASM_TILE_EDAC_H */
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 226d5696e1d1..482c160a9fe9 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -143,6 +143,8 @@ config X86
 	select ACPI_LEGACY_TABLES_LOOKUP if ACPI
 	select X86_FEATURE_NAMES if PROC_FS
 	select SRCU
+	select EDAC_SUPPORT
+	select EDAC_ATOMIC_SCRUB
 
 config INSTRUCTION_DECODER
 	def_bool y
diff --git a/arch/x86/include/asm/edac.h b/arch/x86/include/asm/edac.h
index e9b57ecc70c5..cf8fdf83b231 100644
--- a/arch/x86/include/asm/edac.h
+++ b/arch/x86/include/asm/edac.h
@@ -3,7 +3,7 @@
 
 /* ECC atomic, DMA, SMP and interrupt safe scrub function */
 
-static inline void atomic_scrub(void *va, u32 size)
+static inline void edac_atomic_scrub(void *va, u32 size)
 {
 	u32 i, *virt_addr = va;
 
diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 2d2530cdf99d..a90e06ac1631 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -2,15 +2,16 @@
 #	EDAC Kconfig
 #	Copyright (c) 2008 Doug Thompson www.softwarebitmaker.com
 #	Licensed and distributed under the GPL
-#
+
+config EDAC_ATOMIC_SCRUB
+	bool
 
 config EDAC_SUPPORT
 	bool
 
 menuconfig EDAC
 	bool "EDAC (Error Detection And Correction) reporting"
-	depends on HAS_IOMEM
-	depends on X86 || PPC || TILE || ARM || EDAC_SUPPORT
+	depends on HAS_IOMEM && EDAC_SUPPORT
 	help
 	  EDAC is designed to report errors in the core system.
 	  These are low-level errors that are reported in the CPU or
diff --git a/drivers/edac/edac_mc.c b/drivers/edac/edac_mc.c
index af3be1914dbb..943ed8cf71b9 100644
--- a/drivers/edac/edac_mc.c
+++ b/drivers/edac/edac_mc.c
@@ -30,11 +30,16 @@
 #include <linux/bitops.h>
 #include <asm/uaccess.h>
 #include <asm/page.h>
-#include <asm/edac.h>
 #include "edac_core.h"
 #include "edac_module.h"
 #include <ras/ras_event.h>
 
+#ifdef CONFIG_EDAC_ATOMIC_SCRUB
+#include <asm/edac.h>
+#else
+#define edac_atomic_scrub(va, size) do { } while (0)
+#endif
+
 /* lock to memory controller's control array */
 static DEFINE_MUTEX(mem_ctls_mutex);
 static LIST_HEAD(mc_devices);
@@ -874,7 +879,7 @@ static void edac_mc_scrub_block(unsigned long page, unsigned long offset,
 	virt_addr = kmap_atomic(pg);
 
 	/* Perform architecture specific atomic scrub operation */
-	atomic_scrub(virt_addr + offset, size);
+	edac_atomic_scrub(virt_addr + offset, size);
 
 	/* Unmap and complete */
 	kunmap_atomic(virt_addr);
-- 
2.3.5

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
