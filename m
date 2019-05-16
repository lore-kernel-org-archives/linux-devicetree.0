From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v3 2/3] arm64: implement update_fdt_pgprot()
Date: Thu, 16 May 2019 18:28:16 +0800
Message-ID: <20190516102817.188519-2-hsinyi@chromium.org>
References: <20190516102817.188519-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516102817.188519-1-hsinyi@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Mark Rutland <mark.rutland@arm.com>, Chintan Pandya <cpandya@codeaurora.org>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Stephen Boyd <swboyd@chromium.org>, Kees Cook <keescook@ch>
List-Id: devicetree@vger.kernel.org

Basically does similar things like __fixmap_remap_fdt(). It's supposed
to be called after fixmap_remap_fdt() is called at least once, so region
checking can be skipped. Since it needs to know dt physical address, make
a copy of the value of __fdt_pointer.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/kernel/setup.c |  2 ++
 arch/arm64/mm/mmu.c       | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 413d566405d1..207cbb5f7965 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -66,6 +66,7 @@ static int num_standard_resources;
 static struct resource *standard_resources;
 
 phys_addr_t __fdt_pointer __initdata;
+phys_addr_t fdt_pointer;
 
 /*
  * Standard memory resources
@@ -292,6 +293,7 @@ void __init setup_arch(char **cmdline_p)
 	early_fixmap_init();
 	early_ioremap_init();
 
+	fdt_pointer = __fdt_pointer;
 	setup_machine_fdt(__fdt_pointer);
 
 	parse_early_param();
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index a170c6369a68..196ab4d9e92a 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -32,6 +32,7 @@
 #include <linux/io.h>
 #include <linux/mm.h>
 #include <linux/vmalloc.h>
+#include <linux/of_fdt.h>
 
 #include <asm/barrier.h>
 #include <asm/cputype.h>
@@ -953,6 +954,22 @@ void *__init fixmap_remap_fdt(phys_addr_t dt_phys)
 	return dt_virt;
 }
 
+extern phys_addr_t fdt_pointer;
+
+/* Should be called after fixmap_remap_fdt() is called. */
+void update_fdt_pgprot(pgprot_t prot)
+{
+	u64 dt_virt_base = __fix_to_virt(FIX_FDT);
+	int offset, size;
+
+	offset = fdt_pointer % SWAPPER_BLOCK_SIZE;
+	size = fdt_totalsize((void *)dt_virt_base + offset);
+
+	update_mapping_prot(round_down(fdt_pointer, SWAPPER_BLOCK_SIZE),
+			dt_virt_base,
+			round_up(offset + size, SWAPPER_BLOCK_SIZE), prot);
+}
+
 int __init arch_ioremap_pud_supported(void)
 {
 	/* only 4k granule supports level 1 block mappings */
-- 
2.20.1
