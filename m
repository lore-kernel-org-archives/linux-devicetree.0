From: thor.thayer@linux.intel.com
Subject: [PATCH 3/4] EDAC, altera: Add Stratix10 SDMMC support
Date: Tue, 23 Apr 2019 09:36:36 -0500
Message-ID: <1556030197-24534-4-git-send-email-thor.thayer@linux.intel.com>
References: <1556030197-24534-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556030197-24534-1-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Addition of SDMMC EDAC for Stratix10 which has IRQ
differences from Arria10. Update comment accordingly.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 drivers/edac/altera_edac.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index b7bc8f020df8..c2e693e34d43 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1583,8 +1583,12 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 	dci->mod_name = ecc_name;
 	dci->dev_name = ecc_name;
 
-	/* Update the IRQs for PortB */
+	/* Update the PortB IRQs - A10 has 4, S10 has 2, Index accordingly */
+#ifdef CONFIG_ARCH_STRATIX10
+	altdev->sb_irq = irq_of_parse_and_map(np, 1);
+#else
 	altdev->sb_irq = irq_of_parse_and_map(np, 2);
+#endif
 	if (!altdev->sb_irq) {
 		edac_printk(KERN_ERR, EDAC_DEVICE, "Error PortB SBIRQ alloc\n");
 		rc = -ENODEV;
@@ -1599,6 +1603,15 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 		goto err_release_group_1;
 	}
 
+#ifdef CONFIG_ARCH_STRATIX10
+	/* Use IRQ to determine SError origin instead of assigning IRQ */
+	rc = of_property_read_u32_index(np, "interrupts", 1, &altdev->db_irq);
+	if (rc) {
+		edac_printk(KERN_ERR, EDAC_DEVICE,
+			    "Error PortB DBIRQ alloc\n");
+		goto err_release_group_1;
+	}
+#else
 	altdev->db_irq = irq_of_parse_and_map(np, 3);
 	if (!altdev->db_irq) {
 		edac_printk(KERN_ERR, EDAC_DEVICE, "Error PortB DBIRQ alloc\n");
@@ -1613,6 +1626,7 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 		edac_printk(KERN_ERR, EDAC_DEVICE, "PortB DBERR IRQ error\n");
 		goto err_release_group_1;
 	}
+#endif
 
 	rc = edac_device_add_device(dci);
 	if (rc) {
-- 
2.7.4
