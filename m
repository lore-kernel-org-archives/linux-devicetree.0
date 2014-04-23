From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH v2 01/21] mips: octeon: convert to use unflatten_and_copy_device_tree
Date: Tue, 22 Apr 2014 20:18:01 -0500
Message-ID: <1398215901-25609-2-git-send-email-robherring2@gmail.com>
References: <1398215901-25609-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1398215901-25609-1-git-send-email-robherring2@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh@kernel.org>

The octeon FDT code can be simplified by using
unflatten_and_copy_device_tree function. This removes all accesses to
FDT header data by the arch code.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
v2: fix build error

 arch/mips/cavium-octeon/setup.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 331b837..f1bec00 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -1053,36 +1053,26 @@ void prom_free_prom_memory(void)
 int octeon_prune_device_tree(void);
 
 extern const char __dtb_octeon_3xxx_begin;
-extern const char __dtb_octeon_3xxx_end;
 extern const char __dtb_octeon_68xx_begin;
-extern const char __dtb_octeon_68xx_end;
 void __init device_tree_init(void)
 {
-	int dt_size;
-	struct boot_param_header *fdt;
+	const void *fdt;
 	bool do_prune;
 
 	if (octeon_bootinfo->minor_version >= 3 && octeon_bootinfo->fdt_addr) {
 		fdt = phys_to_virt(octeon_bootinfo->fdt_addr);
 		if (fdt_check_header(fdt))
 			panic("Corrupt Device Tree passed to kernel.");
-		dt_size = be32_to_cpu(fdt->totalsize);
 		do_prune = false;
 	} else if (OCTEON_IS_MODEL(OCTEON_CN68XX)) {
-		fdt = (struct boot_param_header *)&__dtb_octeon_68xx_begin;
-		dt_size = &__dtb_octeon_68xx_end - &__dtb_octeon_68xx_begin;
+		fdt = &__dtb_octeon_68xx_begin;
 		do_prune = true;
 	} else {
-		fdt = (struct boot_param_header *)&__dtb_octeon_3xxx_begin;
-		dt_size = &__dtb_octeon_3xxx_end - &__dtb_octeon_3xxx_begin;
+		fdt = &__dtb_octeon_3xxx_begin;
 		do_prune = true;
 	}
 
-	/* Copy the default tree from init memory. */
-	initial_boot_params = early_init_dt_alloc_memory_arch(dt_size, 8);
-	if (initial_boot_params == NULL)
-		panic("Could not allocate initial_boot_params");
-	memcpy(initial_boot_params, fdt, dt_size);
+	initial_boot_params = (void *)fdt;
 
 	if (do_prune) {
 		octeon_prune_device_tree();
@@ -1090,7 +1080,7 @@ void __init device_tree_init(void)
 	} else {
 		pr_info("Using passed Device Tree.\n");
 	}
-	unflatten_device_tree();
+	unflatten_and_copy_device_tree();
 }
 
 static int __initdata disable_octeon_edac_p;
-- 
1.9.1
