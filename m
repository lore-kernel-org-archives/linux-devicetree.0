From: thor.thayer@linux.intel.com
Subject: [PATCHv2 5/5] EDAC, altera: Remove Stratix10 Machine compatible check
Date: Wed, 27 Feb 2019 11:27:25 -0600
Message-ID: <1551288445-22335-6-git-send-email-thor.thayer@linux.intel.com>
References: <1551288445-22335-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551288445-22335-1-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Replace the Stratix10 Machine compatible check with
specific ECC block compatible tests.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
v2 New patch
---
 drivers/edac/altera_edac.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index a92259d8afdc..3ff222a0c852 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1013,11 +1013,6 @@ static int socfpga_is_a10(void)
 	return of_machine_is_compatible("altr,socfpga-arria10");
 }
 
-static int socfpga_is_s10(void)
-{
-	return of_machine_is_compatible("altr,socfpga-stratix10");
-}
-
 static __init int __maybe_unused
 altr_init_a10_ecc_block(struct device_node *np, u32 irq_mask,
 			u32 ecc_ctrl_en_mask, bool dual_port)
@@ -1122,13 +1117,14 @@ static int __init __maybe_unused altr_init_a10_ecc_device_type(char *compat)
 	int irq;
 	struct device_node *child, *np;
 
-	if (!socfpga_is_a10() && !socfpga_is_s10())
-		return -ENODEV;
-
 	np = of_find_compatible_node(NULL, NULL,
 				     "altr,socfpga-a10-ecc-manager");
 	if (!np) {
-		edac_printk(KERN_ERR, EDAC_DEVICE, "ECC Manager not found\n");
+		/* Error only valid for Arria10 and Stratix10 */
+		if (!of_find_compatible_node(NULL, NULL,
+					     "altr,socfpga-ecc-manager"))
+			edac_printk(KERN_ERR, EDAC_DEVICE,
+				    "ECC Manager not found\n");
 		return -ENODEV;
 	}
 
@@ -1644,12 +1640,8 @@ static int __init socfpga_init_sdmmc_ecc(void)
 	int rc = -ENODEV;
 	struct device_node *child;
 
-	if (!socfpga_is_a10() && !socfpga_is_s10())
-		return -ENODEV;
-
 	child = of_find_compatible_node(NULL, NULL, "altr,socfpga-sdmmc-ecc");
 	if (!child) {
-		edac_printk(KERN_WARNING, EDAC_DEVICE, "SDMMC node not found\n");
 		return -ENODEV;
 	}
 
-- 
2.7.4
