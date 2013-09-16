From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 24/28] arc: use common of_flat_dt_match_machine
Date: Mon, 16 Sep 2013 18:09:20 -0500
Message-ID: <1379372965-22359-25-git-send-email-robherring2@gmail.com>
References: <1379372965-22359-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1379372965-22359-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Vineet Gupta <vgupta@synopsys.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Convert arc to use the common of_flat_dt_match_machine function.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/kernel/devtree.c | 65 +++++++++++++----------------------------------
 1 file changed, 18 insertions(+), 47 deletions(-)

diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
index 1ab6f35..b45aa5a 100644
--- a/arch/arc/kernel/devtree.c
+++ b/arch/arc/kernel/devtree.c
@@ -18,6 +18,19 @@
 #include <asm/clk.h>
 #include <asm/mach_desc.h>
 
+static void * __init arch_get_next_mach(const char *const **match)
+{
+	static struct machine_desc *mdesc = __arch_info_begin;
+	struct machine_desc *m = mdesc;
+
+	if (m >= __arch_info_end)
+		return NULL;
+
+	mdesc++;
+	*match = m->dt_compat;
+	return m;
+}
+
 /**
  * setup_machine_fdt - Machine setup when an dtb was passed to the kernel
  * @dt:		virtual address pointer to dt blob
@@ -27,64 +40,22 @@
  */
 struct machine_desc * __init setup_machine_fdt(void *dt)
 {
-	struct machine_desc *mdesc = NULL, *mdesc_best = NULL;
-	unsigned int score, mdesc_score = ~1;
+	struct machine_desc *mdesc;
 	unsigned long dt_root;
-	const char *model, *compat;
 	void *clk;
-	char manufacturer[16];
 	unsigned long len;
 
 	if (!early_init_dt_scan(dt))
 		return NULL;
 
-	dt_root = of_get_flat_dt_root();
-
-	/*
-	 * The kernel could be multi-platform enabled, thus could have many
-	 * "baked-in" machine descriptors. Search thru all for the best
-	 * "compatible" string match.
-	 */
-	for_each_machine_desc(mdesc) {
-		score = of_flat_dt_match(dt_root, mdesc->dt_compat);
-		if (score > 0 && score < mdesc_score) {
-			mdesc_best = mdesc;
-			mdesc_score = score;
-		}
-	}
-	if (!mdesc_best) {
-		const char *prop;
-		long size;
-
-		pr_err("\n unrecognized device tree list:\n[ ");
-
-		prop = of_get_flat_dt_prop(dt_root, "compatible", &size);
-		if (prop) {
-			while (size > 0) {
-				printk("'%s' ", prop);
-				size -= strlen(prop) + 1;
-				prop += strlen(prop) + 1;
-			}
-		}
-		printk("]\n\n");
-
+	mdesc = of_flat_dt_match_machine(NULL, arch_get_next_mach);
+	if (!mdesc)
 		machine_halt();
-	}
-
-	/* compat = "<manufacturer>,<model>" */
-	compat =  mdesc_best->dt_compat[0];
-
-	model = strchr(compat, ',');
-	if (model)
-		model++;
-
-	strlcpy(manufacturer, compat, model ? model - compat : strlen(compat));
-
-	pr_info("Board \"%s\" from %s (Manufacturer)\n", model, manufacturer);
 
+	dt_root = of_get_flat_dt_root();
 	clk = of_get_flat_dt_prop(dt_root, "clock-frequency", &len);
 	if (clk)
 		arc_set_core_freq(of_read_ulong(clk, len/4));
 
-	return mdesc_best;
+	return mdesc;
 }
-- 
1.8.1.2
