From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH v2 08/29] metag: use unflatten_and_copy_device_tree
Date: Mon,  7 Oct 2013 11:29:16 -0500
Message-ID: <1381163377-21044-9-git-send-email-robherring2@gmail.com>
References: <1381163377-21044-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381163377-21044-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, James Hogan <james.hogan@imgtec.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Use the common unflatten_and_copy_device_tree to copy the built-in FDT
out of init section.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Cc: James Hogan <james.hogan@imgtec.com>
---
 arch/metag/kernel/devtree.c | 16 ----------------
 arch/metag/kernel/setup.c   |  4 +---
 2 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/metag/kernel/devtree.c b/arch/metag/kernel/devtree.c
index 7cd0252..049af56 100644
--- a/arch/metag/kernel/devtree.c
+++ b/arch/metag/kernel/devtree.c
@@ -94,21 +94,5 @@ struct machine_desc * __init setup_machine_fdt(void *dt)
 	of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
 
 	return mdesc_best;
-}
 
-/**
- * copy_fdt - Copy device tree into non-init memory.
- *
- * We must copy the flattened device tree blob into non-init memory because the
- * unflattened device tree will reference the strings in it directly.
- */
-void __init copy_fdt(void)
-{
-	void *alloc = early_init_dt_alloc_memory_arch(
-			be32_to_cpu(initial_boot_params->totalsize), 0x40);
-	if (alloc) {
-		memcpy(alloc, initial_boot_params,
-		       be32_to_cpu(initial_boot_params->totalsize));
-		initial_boot_params = alloc;
-	}
 }
diff --git a/arch/metag/kernel/setup.c b/arch/metag/kernel/setup.c
index c396cd0..2c697d3 100644
--- a/arch/metag/kernel/setup.c
+++ b/arch/metag/kernel/setup.c
@@ -408,9 +408,7 @@ void __init setup_arch(char **cmdline_p)
 	cpu_2_hwthread_id[smp_processor_id()] = hard_processor_id();
 	hwthread_id_2_cpu[hard_processor_id()] = smp_processor_id();
 
-	/* Copy device tree blob into non-init memory before unflattening */
-	copy_fdt();
-	unflatten_device_tree();
+	unflatten_and_copy_device_tree();
 
 #ifdef CONFIG_SMP
 	smp_init_cpus();
-- 
1.8.1.2
