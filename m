From: Rob Herring <robh@kernel.org>
Subject: [PATCH 2/7] cris: remove arch specific early DT functions
Date: Fri,  5 Jan 2018 17:14:19 -0600
Message-ID: <20180105231424.19247-3-robh@kernel.org>
References: <20180105231424.19247-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180105231424.19247-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-cris-kernel@axis.com
List-Id: devicetree@vger.kernel.org

Now that the DT core code handles bootmem arches, we can remove the cris
specific early_init_dt_alloc_memory_arch function. As the default
early_init_dt_add_memory_arch just does a WARN, we can just remove the
entire devicetree.c file.

Cc: Mikael Starvik <starvik@axis.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: linux-cris-kernel@axis.com
Signed-off-by: Rob Herring <robh@kernel.org>
---
This is dependent on patch 1. Please ack and I'll take or apply after 
4.16-rc1.

 arch/cris/kernel/Makefile     | 19 -------------------
 arch/cris/kernel/devicetree.c | 15 ---------------
 2 files changed, 34 deletions(-)
 delete mode 100644 arch/cris/kernel/devicetree.c

diff --git a/arch/cris/kernel/Makefile b/arch/cris/kernel/Makefile
index af075a5fb9aa..e69de29bb2d1 100644
--- a/arch/cris/kernel/Makefile
+++ b/arch/cris/kernel/Makefile
@@ -1,19 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-# $Id: Makefile,v 1.12 2004/10/19 13:07:43 starvik Exp $
-#
-# Makefile for the linux kernel.
-#
-
-CPPFLAGS_vmlinux.lds := -DDRAM_VIRTUAL_BASE=0x$(CONFIG_ETRAX_DRAM_VIRTUAL_BASE)
-extra-y	:= vmlinux.lds
-
-obj-y   := process.o traps.o irq.o ptrace.o setup.o time.o sys_cris.o
-obj-y += devicetree.o
-obj-y += stacktrace.o
-
-obj-$(CONFIG_MODULES)    += crisksyms.o
-obj-$(CONFIG_MODULES)	 += module.o
-obj-$(CONFIG_SYSTEM_PROFILER)   += profile.o
-
-clean:
-
diff --git a/arch/cris/kernel/devicetree.c b/arch/cris/kernel/devicetree.c
deleted file mode 100644
index 36e1c658229f..000000000000
--- a/arch/cris/kernel/devicetree.c
+++ /dev/null
@@ -1,15 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/init.h>
-#include <linux/bootmem.h>
-#include <linux/printk.h>
-
-void __init early_init_dt_add_memory_arch(u64 base, u64 size)
-{
-	pr_err("%s(%llx, %llx)\n",
-	       __func__, base, size);
-}
-
-void * __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
-{
-	return alloc_bootmem_align(size, align);
-}
-- 
2.14.1
