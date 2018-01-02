From: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Subject: [PATCH v5 13/15] MIPS: JZ4770: Workaround for corrupted DMA transfers
Date: Tue,  2 Jan 2018 16:08:46 +0100
Message-ID: <20180102150848.11314-13-paul@crapouillou.net>
References: <20180102150848.11314-1-paul@crapouillou.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180102150848.11314-1-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>

We have seen MMC DMA transfers read corrupted data from SDRAM when
a burst interval ends at physical address 0x10000000. To avoid this
problem, we remove the final page of low memory from the memory map.

Signed-off-by: Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>
---
 arch/mips/jz4740/setup.c | 24 ++++++++++++++++++++++++
 arch/mips/kernel/setup.c |  8 ++++++++
 2 files changed, 32 insertions(+)

 v2: No change
 v3: No change
 v4: No change
 v5: No change

diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
index afd84ee966e8..6948b133a15d 100644
--- a/arch/mips/jz4740/setup.c
+++ b/arch/mips/jz4740/setup.c
@@ -23,6 +23,7 @@
 
 #include <asm/bootinfo.h>
 #include <asm/mips_machine.h>
+#include <asm/page.h>
 #include <asm/prom.h>
 
 #include <asm/mach-jz4740/base.h>
@@ -102,6 +103,29 @@ void __init arch_init_irq(void)
 	irqchip_init();
 }
 
+/*
+ * We have seen MMC DMA transfers read corrupted data from SDRAM when a burst
+ * interval ends at physical address 0x10000000. To avoid this problem, we
+ * remove the final page of low memory from the memory map.
+ */
+void __init jz4770_reserve_unsafe_for_dma(void)
+{
+	int i;
+
+	for (i = 0; i < boot_mem_map.nr_map; i++) {
+		struct boot_mem_map_entry *entry = boot_mem_map.map + i;
+
+		if (entry->type != BOOT_MEM_RAM)
+			continue;
+
+		if (entry->addr + entry->size != 0x10000000)
+			continue;
+
+		entry->size -= PAGE_SIZE;
+		break;
+	}
+}
+
 static int __init jz4740_machine_setup(void)
 {
 	mips_machine_setup();
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 85bc601e9a0d..5a2c20145aee 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -879,6 +879,14 @@ static void __init arch_mem_init(char **cmdline_p)
 
 	parse_early_param();
 
+#ifdef CONFIG_MACH_JZ4770
+	if (current_cpu_type() == CPU_JZRISC &&
+				mips_machtype == MACH_INGENIC_JZ4770) {
+		extern void __init jz4770_reserve_unsafe_for_dma(void);
+		jz4770_reserve_unsafe_for_dma();
+	}
+#endif
+
 	if (usermem) {
 		pr_info("User-defined physical RAM map:\n");
 		print_memory_map();
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
