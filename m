From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 18/21] MIPS memblock: Slightly improve buddy allocator init method
Date: Mon, 19 Dec 2016 05:07:43 +0300
Message-ID: <1482113266-13207-19-git-send-email-fancer.lancer@gmail.com>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, matt.redfearn@imgtec.com, james.hogan@imgtec.com, alexander.sverdlin@nokia.com, robh+dt@kernel.org, frowand.list@gmail.com
Cc: Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

Just add some minor changes into buddy allocator initialization.
After all the alterations it shall work just fine from now.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/mm/init.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 98680fb..13a032f 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -7,6 +7,7 @@
  * Copyright (C) 1999, 2000 Silicon Graphics, Inc.
  * Kevin D. Kissell, kevink@mips.com and Carsten Langgaard, carstenl@mips.com
  * Copyright (C) 2000 MIPS Technologies, Inc.  All rights reserved.
+ * Copyright (C) 2016 T-Platforms. All Rights Reserved.
  */
 #include <linux/bug.h>
 #include <linux/init.h>
@@ -462,22 +463,36 @@ static inline void mem_init_free_highmem(void)
 #endif
 }
 
+/*
+ * Let buddy allocator run
+ */
 void __init mem_init(void)
 {
+	/* Setup maximum number of pages of memory map array */
 #ifdef CONFIG_HIGHMEM
 #ifdef CONFIG_DISCONTIGMEM
 #error "CONFIG_HIGHMEM and CONFIG_DISCONTIGMEM dont work together yet"
 #endif
-	max_mapnr = highend_pfn ? highend_pfn : max_low_pfn;
+	set_max_mapnr(highend_pfn);
 #else
-	max_mapnr = max_low_pfn;
+	set_max_mapnr(max_low_pfn);
 #endif
-	high_memory = (void *) __va(max_low_pfn << PAGE_SHIFT);
+	/* Highmem starts right after lowmem */
+	high_memory = __va(PFN_PHYS(max_low_pfn));
 
+	/* Initialize speculative access registers - MAAR */
 	maar_init();
+
+	/* Free low memory registered within memblock allocator */
 	free_all_bootmem();
-	setup_zero_pages();	/* Setup zeroed pages.  */
+
+	/* Allocate zeroed pages */
+	setup_zero_pages();
+
+	/* Free highmemory registered in memblocks */
 	mem_init_free_highmem();
+
+	/* Print out memory areas statistics */
 	mem_init_print_info(NULL);
 
 #ifdef CONFIG_64BIT
-- 
2.6.6
