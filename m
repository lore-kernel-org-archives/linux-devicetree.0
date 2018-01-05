From: Rob Herring <robh@kernel.org>
Subject: [PATCH 6/7] x86: remove arch specific early_init_dt_alloc_memory_arch
Date: Fri,  5 Jan 2018 17:20:53 -0600
Message-ID: <20180105232054.27394-7-robh@kernel.org>
References: <20180105232054.27394-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180105232054.27394-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
List-Id: devicetree@vger.kernel.org

Now that the DT core code handles bootmem arches, we can remove the x86
specific early_init_dt_alloc_memory_arch function.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
This is dependent on patch 1. Please ack and I'll take or apply after
4.16-rc1.

 arch/x86/kernel/devicetree.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/x86/kernel/devicetree.c b/arch/x86/kernel/devicetree.c
index 76e07698e6d1..25de5f6ca997 100644
--- a/arch/x86/kernel/devicetree.c
+++ b/arch/x86/kernel/devicetree.c
@@ -2,7 +2,6 @@
 /*
  * Architecture specific OF callbacks.
  */
-#include <linux/bootmem.h>
 #include <linux/export.h>
 #include <linux/io.h>
 #include <linux/interrupt.h>
@@ -39,11 +38,6 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 	BUG();
 }

-void * __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
-{
-	return __alloc_bootmem(size, align, __pa(MAX_DMA_ADDRESS));
-}
-
 void __init add_dtb(u64 data)
 {
 	initial_dtb = data + offsetof(struct setup_data, data);
--
2.14.1
