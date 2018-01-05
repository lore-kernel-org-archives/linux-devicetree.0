From: Rob Herring <robh@kernel.org>
Subject: [PATCH 5/7] nios2: remove arch specific early_init_dt_alloc_memory_arch
Date: Fri,  5 Jan 2018 17:20:52 -0600
Message-ID: <20180105232054.27394-6-robh@kernel.org>
References: <20180105232054.27394-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180105232054.27394-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>, Ley Foon Tan <lftan@altera.com>, nios2-dev@lists.rocketboards.org
List-Id: devicetree@vger.kernel.org

Now that the DT core code handles bootmem arches, we can remove the nios2
specific early_init_dt_alloc_memory_arch function.

Cc: Ley Foon Tan <lftan@altera.com>
Cc: nios2-dev@lists.rocketboards.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
This is dependent on patch 1. Please ack and I'll take or apply after
4.16-rc1.

 arch/nios2/kernel/prom.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/nios2/kernel/prom.c b/arch/nios2/kernel/prom.c
index 6688576b3a47..8d7446a4b475 100644
--- a/arch/nios2/kernel/prom.c
+++ b/arch/nios2/kernel/prom.c
@@ -42,11 +42,6 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)

 }

-void * __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
-{
-	return alloc_bootmem_align(size, align);
-}
-
 int __init early_init_dt_reserve_memory_arch(phys_addr_t base, phys_addr_t size,
 					     bool nomap)
 {
--
2.14.1
