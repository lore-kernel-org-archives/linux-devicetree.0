From: Rob Herring <robh@kernel.org>
Subject: [PATCH] EDAC: Convert to using %pOF instead of full_name
Date: Tue, 18 Jul 2017 16:42:59 -0500
Message-ID: <20170718214339.7774-19-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that we have a custom printf format specifier, convert users of
full_name to use %pOF instead. This is preparation to remove storing
of the full path string for each node.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-edac@vger.kernel.org
---
 drivers/edac/cpc925_edac.c | 2 +-
 drivers/edac/ppc4xx_edac.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/cpc925_edac.c b/drivers/edac/cpc925_edac.c
index 837b62c4993d..afd29a5a51c3 100644
--- a/drivers/edac/cpc925_edac.c
+++ b/drivers/edac/cpc925_edac.c
@@ -618,7 +618,7 @@ static u32 cpc925_cpu_mask_disabled(void)
 		}

 		if (reg == NULL || *reg > 2) {
-			cpc925_printk(KERN_ERR, "Bad reg value at %s\n", cpunode->full_name);
+			cpc925_printk(KERN_ERR, "Bad reg value at %pOF\n", cpunode);
 			continue;
 		}

diff --git a/drivers/edac/ppc4xx_edac.c b/drivers/edac/ppc4xx_edac.c
index e55e92590106..8807f427dd69 100644
--- a/drivers/edac/ppc4xx_edac.c
+++ b/drivers/edac/ppc4xx_edac.c
@@ -1267,8 +1267,8 @@ static int ppc4xx_edac_probe(struct platform_device *op)
 	memcheck = (mcopt1 & SDRAM_MCOPT1_MCHK_MASK);

 	if (memcheck == SDRAM_MCOPT1_MCHK_NON) {
-		ppc4xx_edac_printk(KERN_INFO, "%s: No ECC memory detected or "
-				   "ECC is disabled.\n", np->full_name);
+		ppc4xx_edac_printk(KERN_INFO, "%pOF: No ECC memory detected or "
+				   "ECC is disabled.\n", np);
 		status = -ENODEV;
 		goto done;
 	}
@@ -1287,9 +1287,9 @@ static int ppc4xx_edac_probe(struct platform_device *op)
 	mci = edac_mc_alloc(ppc4xx_edac_instance, ARRAY_SIZE(layers), layers,
 			    sizeof(struct ppc4xx_edac_pdata));
 	if (mci == NULL) {
-		ppc4xx_edac_printk(KERN_ERR, "%s: "
+		ppc4xx_edac_printk(KERN_ERR, "%pOF: "
 				   "Failed to allocate EDAC MC instance!\n",
-				   np->full_name);
+				   np);
 		status = -ENOMEM;
 		goto done;
 	}
--
2.11.0
