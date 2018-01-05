From: Rob Herring <robh@kernel.org>
Subject: [PATCH 4/7] mips: remove arch specific early_init_dt_alloc_memory_arch
Date: Fri,  5 Jan 2018 17:14:21 -0600
Message-ID: <20180105231424.19247-5-robh@kernel.org>
References: <20180105231424.19247-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180105231424.19247-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Now that the DT core code handles bootmem arches, we can remove the MIPS
specific early_init_dt_alloc_memory_arch function.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
This is dependent on patch 1. Please ack and I'll take or apply after   
4.16-rc1.

 arch/mips/kernel/prom.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
index 0dbcd152a1a9..89950b7bf536 100644
--- a/arch/mips/kernel/prom.c
+++ b/arch/mips/kernel/prom.c
@@ -44,11 +44,6 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 	return add_memory_region(base, size, BOOT_MEM_RAM);
 }
 
-void * __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
-{
-	return __alloc_bootmem(size, align, __pa(MAX_DMA_ADDRESS));
-}
-
 int __init early_init_dt_reserve_memory_arch(phys_addr_t base,
 					phys_addr_t size, bool nomap)
 {
-- 
2.14.1
