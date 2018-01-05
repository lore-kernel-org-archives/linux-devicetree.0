From: Rob Herring <robh@kernel.org>
Subject: [PATCH 3/7] metag: remove arch specific early DT functions
Date: Fri,  5 Jan 2018 17:14:20 -0600
Message-ID: <20180105231424.19247-4-robh@kernel.org>
References: <20180105231424.19247-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180105231424.19247-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>, James Hogan <jhogan@kernel.org>, linux-metag@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that the DT core code handles bootmem arches, we can remove the metag
specific early_init_dt_alloc_memory_arch function. As the default
early_init_dt_add_memory_arch just does a WARN, we can remove it too.

Cc: James Hogan <jhogan@kernel.org>
Cc: linux-metag@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
This is dependent on patch 1. Please ack and I'll take or apply after   
4.16-rc1.

 arch/metag/kernel/devtree.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/metag/kernel/devtree.c b/arch/metag/kernel/devtree.c
index 18dd7aea9fdc..6af749a64438 100644
--- a/arch/metag/kernel/devtree.c
+++ b/arch/metag/kernel/devtree.c
@@ -14,26 +14,12 @@
 #include <linux/init.h>
 #include <linux/export.h>
 #include <linux/types.h>
-#include <linux/bootmem.h>
-#include <linux/memblock.h>
-#include <linux/of.h>
 #include <linux/of_fdt.h>
 
 #include <asm/setup.h>
 #include <asm/page.h>
 #include <asm/mach/arch.h>
 
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
-
 static const void * __init arch_get_next_mach(const char *const **match)
 {
 	static const struct machine_desc *mdesc = __arch_info_begin;
-- 
2.14.1
