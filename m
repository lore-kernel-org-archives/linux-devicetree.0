From: Rob Herring <robh@kernel.org>
Subject: [PATCH 7/7] xtensa: remove arch specific early DT functions
Date: Fri,  5 Jan 2018 17:20:54 -0600
Message-ID: <20180105232054.27394-8-robh@kernel.org>
References: <20180105232054.27394-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180105232054.27394-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org
List-Id: devicetree@vger.kernel.org

Now that the DT core code handles bootmem arches, we can remove the xtensa
specific early_init_dt_alloc_memory_arch function. The common
early_init_dt_add_memory_arch can be used too now that xtensa switched to
memblock.

Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-xtensa@linux-xtensa.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
This is dependent on patch 1. Please ack and I'll take or apply after
4.16-rc1.

 arch/xtensa/kernel/setup.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
index 08175df7a69e..82bd1a94157c 100644
--- a/arch/xtensa/kernel/setup.c
+++ b/arch/xtensa/kernel/setup.c
@@ -20,7 +20,6 @@
 #include <linux/mm.h>
 #include <linux/proc_fs.h>
 #include <linux/screen_info.h>
-#include <linux/bootmem.h>
 #include <linux/kernel.h>
 #include <linux/percpu.h>
 #include <linux/cpu.h>
@@ -218,17 +217,6 @@ static int __init xtensa_dt_io_area(unsigned long node, const char *uname,
 }
 #endif

-void __init early_init_dt_add_memory_arch(u64 base, u64 size)
-{
-	size &= PAGE_MASK;
-	memblock_add(base, size);
-}
-
-void * __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
-{
-	return __alloc_bootmem(size, align, 0);
-}
-
 void __init early_init_devtree(void *params)
 {
 	early_init_dt_scan(params);
--
2.14.1
