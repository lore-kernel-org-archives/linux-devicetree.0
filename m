From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 10/28] arc: use early_init_dt_scan
Date: Mon, 16 Sep 2013 18:09:06 -0500
Message-ID: <1379372965-22359-11-git-send-email-robherring2@gmail.com>
References: <1379372965-22359-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1379372965-22359-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Vineet Gupta <vgupta@synopsys.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Convert arc to use new early_init_dt_scan function.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/kernel/devtree.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
index eeb613a..1ab6f35 100644
--- a/arch/arc/kernel/devtree.c
+++ b/arch/arc/kernel/devtree.c
@@ -27,7 +27,6 @@
  */
 struct machine_desc * __init setup_machine_fdt(void *dt)
 {
-	struct boot_param_header *devtree = dt;
 	struct machine_desc *mdesc = NULL, *mdesc_best = NULL;
 	unsigned int score, mdesc_score = ~1;
 	unsigned long dt_root;
@@ -36,11 +35,9 @@ struct machine_desc * __init setup_machine_fdt(void *dt)
 	char manufacturer[16];
 	unsigned long len;
 
-	/* check device tree validity */
-	if (be32_to_cpu(devtree->magic) != OF_DT_HEADER)
+	if (!early_init_dt_scan(dt))
 		return NULL;
 
-	initial_boot_params = devtree;
 	dt_root = of_get_flat_dt_root();
 
 	/*
@@ -85,15 +82,6 @@ struct machine_desc * __init setup_machine_fdt(void *dt)
 
 	pr_info("Board \"%s\" from %s (Manufacturer)\n", model, manufacturer);
 
-	/* Retrieve various information from the /chosen node */
-	of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
-
-	/* Initialize {size,address}-cells info */
-	of_scan_flat_dt(early_init_dt_scan_root, NULL);
-
-	/* Setup memory, calling early_init_dt_add_memory_arch */
-	of_scan_flat_dt(early_init_dt_scan_memory, NULL);
-
 	clk = of_get_flat_dt_prop(dt_root, "clock-frequency", &len);
 	if (clk)
 		arc_set_core_freq(of_read_ulong(clk, len/4));
-- 
1.8.1.2
