From: Rob Herring <robh@kernel.org>
Subject: [PATCH 18/21] edac: cpc925: use for_each_of_cpu_node iterator
Date: Wed,  5 Sep 2018 14:37:35 -0500
Message-ID: <20180905193738.19325-19-robh@kernel.org>
References: <20180905193738.19325-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905193738.19325-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Use the for_each_of_cpu_node iterator to iterate over cpu nodes. This
has the side effect of defaulting to iterating using "cpu" node names in
preference to the deprecated (for FDT) device_type == "cpu".

Cc: Borislav Petkov <bp@alien8.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-edac@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take via the DT tree. This is dependent on the
first 2 patches.

 drivers/edac/cpc925_edac.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/edac/cpc925_edac.c b/drivers/edac/cpc925_edac.c
index 2c98e020df05..3c0881ac9880 100644
--- a/drivers/edac/cpc925_edac.c
+++ b/drivers/edac/cpc925_edac.c
@@ -593,8 +593,7 @@ static void cpc925_mc_check(struct mem_ctl_info *mci)
 /******************** CPU err device********************************/
 static u32 cpc925_cpu_mask_disabled(void)
 {
-	struct device_node *cpus;
-	struct device_node *cpunode = NULL;
+	struct device_node *cpunode;
 	static u32 mask = 0;

 	/* use cached value if available */
@@ -603,20 +602,8 @@ static u32 cpc925_cpu_mask_disabled(void)

 	mask = APIMASK_ADI0 | APIMASK_ADI1;

-	cpus = of_find_node_by_path("/cpus");
-	if (cpus == NULL) {
-		cpc925_printk(KERN_DEBUG, "No /cpus node !\n");
-		return 0;
-	}
-
-	while ((cpunode = of_get_next_child(cpus, cpunode)) != NULL) {
+	for_each_of_cpu_node(cpunode) {
 		const u32 *reg = of_get_property(cpunode, "reg", NULL);
-
-		if (strcmp(cpunode->type, "cpu")) {
-			cpc925_printk(KERN_ERR, "Not a cpu node in /cpus: %s\n", cpunode->name);
-			continue;
-		}
-
 		if (reg == NULL || *reg > 2) {
 			cpc925_printk(KERN_ERR, "Bad reg value at %pOF\n", cpunode);
 			continue;
@@ -633,9 +620,6 @@ static u32 cpc925_cpu_mask_disabled(void)
 				"Assuming PI id is equal to CPU MPIC id!\n");
 	}

-	of_node_put(cpunode);
-	of_node_put(cpus);
-
 	return mask;
 }

--
2.17.1
