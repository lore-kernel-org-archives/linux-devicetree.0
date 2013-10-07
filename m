From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH v2 11/29] arm: use early_init_dt_scan
Date: Mon,  7 Oct 2013 11:29:19 -0500
Message-ID: <1381163377-21044-12-git-send-email-robherring2@gmail.com>
References: <1381163377-21044-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1381163377-21044-1-git-send-email-robherring2@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Convert arm to use new early_init_dt_scan function.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/kernel/devtree.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
index f35906b..e7ce175 100644
--- a/arch/arm/kernel/devtree.c
+++ b/arch/arm/kernel/devtree.c
@@ -183,7 +183,6 @@ bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
  */
 const struct machine_desc * __init setup_machine_fdt(unsigned int dt_phys)
 {
-	struct boot_param_header *devtree;
 	const struct machine_desc *mdesc, *mdesc_best = NULL;
 	unsigned int score, mdesc_score = ~1;
 	unsigned long dt_root;
@@ -196,17 +195,11 @@ const struct machine_desc * __init setup_machine_fdt(unsigned int dt_phys)
 	mdesc_best = &__mach_desc_GENERIC_DT;
 #endif
 
-	if (!dt_phys)
+	if (!dt_phys || !early_init_dt_scan(phys_to_virt(dt_phys)))
 		return NULL;
 
-	devtree = phys_to_virt(dt_phys);
-
-	/* check device tree validity */
-	if (be32_to_cpu(devtree->magic) != OF_DT_HEADER)
-		return NULL;
 
 	/* Search the mdescs for the 'best' compatible value match */
-	initial_boot_params = devtree;
 	dt_root = of_get_flat_dt_root();
 	for_each_machine_desc(mdesc) {
 		score = of_flat_dt_match(dt_root, mdesc->dt_compat);
@@ -240,13 +233,6 @@ const struct machine_desc * __init setup_machine_fdt(unsigned int dt_phys)
 		model = "<unknown>";
 	pr_info("Machine: %s, model: %s\n", mdesc_best->name, model);
 
-	/* Retrieve various information from the /chosen node */
-	of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
-	/* Initialize {size,address}-cells info */
-	of_scan_flat_dt(early_init_dt_scan_root, NULL);
-	/* Setup memory, calling early_init_dt_add_memory_arch */
-	of_scan_flat_dt(early_init_dt_scan_memory, NULL);
-
 	/* Change machine number to match the mdesc we're using */
 	__machine_arch_type = mdesc_best->nr;
 
-- 
1.8.1.2
