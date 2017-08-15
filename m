From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH 1/3] ARC: Set IO-coherency aperture base to LINUX_LINK_BASE
Date: Tue, 15 Aug 2017 21:13:53 +0300
Message-ID: <20170815181355.29937-2-Eugeniy.Paltsev@synopsys.com>
References: <20170815181355.29937-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170815181355.29937-1-Eugeniy.Paltsev@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

Most of the time we indeed use the one and only LINUX_LINK_BASE
set to 0x8000_0000. But there might be good reasons to move
the kernel to another location like 0x9z etc.

And we want IOC aperture to cover entire area used by the kernel,
so let's make its base matching link base and add required asserts:
checking IOC aperture base address and size to be supported by IOC.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/mm/cache.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index a867575..383ff77 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -1083,7 +1083,8 @@ SYSCALL_DEFINE3(cacheflush, uint32_t, start, uint32_t, sz, uint32_t, flags)
  */
 noinline void __init arc_ioc_setup(void)
 {
-	unsigned int ap_sz;
+	unsigned int ap_base;
+	long ap_size;
 
 	/* Flush + invalidate + disable L1 dcache */
 	__dc_disable();
@@ -1092,18 +1093,32 @@ noinline void __init arc_ioc_setup(void)
 	if (read_aux_reg(ARC_REG_SLC_BCR))
 		slc_entire_op(OP_FLUSH_N_INV);
 
-	/* IOC Aperture start: TDB: handle non default CONFIG_LINUX_LINK_BASE */
-	write_aux_reg(ARC_REG_IO_COH_AP0_BASE, 0x80000);
-
 	/*
-	 * IOC Aperture size:
-	 *   decoded as 2 ^ (SIZE + 2) KB: so setting 0x11 implies 512M
-	 * TBD: fix for PGU + 1GB of low mem
+	 * IOC Aperture size is equal to memory size.
+	 * TBD: fix for PGU + 1GiB of low mem
 	 * TBD: fix for PAE
 	 */
-	ap_sz = order_base_2(arc_get_mem_sz()/1024) - 2;
-	write_aux_reg(ARC_REG_IO_COH_AP0_SIZE, ap_sz);
+	ap_size = arc_get_mem_sz();
+
+	if (!is_power_of_2(ap_size) || ap_size < 4096)
+		panic("IOC Aperture size must be power of 2 larger than 4KiB");
+
+	/*
+	 * IOC Aperture size decoded as 2 ^ (SIZE + 2) KiB,
+	 * so setting 0x11 implies 512MiB, 0x12 implies 1G...
+	 */
+	write_aux_reg(ARC_REG_IO_COH_AP0_SIZE, order_base_2(ap_size / 1024) - 2);
+
+	/*
+	 * For now we assume IOC aperture to cover all the memory used by the
+	 * kernel.
+	 */
+	ap_base = CONFIG_LINUX_LINK_BASE;
+
+	if (ap_base % ap_size != 0)
+		panic("IOC Aperture start must be aligned to the size of the aperture");
 
+	write_aux_reg(ARC_REG_IO_COH_AP0_BASE, ap_base >> 12);
 	write_aux_reg(ARC_REG_IO_COH_PARTIAL, 1);
 	write_aux_reg(ARC_REG_IO_COH_ENABLE, 1);
 
-- 
2.9.3
