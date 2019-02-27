From: thor.thayer@linux.intel.com
Subject: [PATCHv2 3/5] EDAC, altera: Skip DB IRQ for Stratix10
Date: Wed, 27 Feb 2019 11:27:23 -0600
Message-ID: <1551288445-22335-4-git-send-email-thor.thayer@linux.intel.com>
References: <1551288445-22335-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551288445-22335-1-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Stratix10 Double Bit errors are configured as SErrors
so skip the Double Bit IRQ initialization if Stratix10.

Since all the ECC peripherals are handled in this routine,
the machine compatible device tree test is used here
instead of multiple ECC block device tree compatible
tests.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
v2 No change. Add explanation for machine compatible test
   in commit description.
---
 drivers/edac/altera_edac.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 3127e927bcec..a92259d8afdc 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1927,20 +1927,25 @@ static int altr_edac_a10_device_add(struct altr_arria10_edac *edac,
 		goto err_release_group1;
 	}
 
-	altdev->db_irq = irq_of_parse_and_map(np, 1);
-	if (!altdev->db_irq) {
-		edac_printk(KERN_ERR, EDAC_DEVICE, "Error allocating DBIRQ\n");
-		rc = -ENODEV;
-		goto err_release_group1;
-	}
-	rc = devm_request_irq(edac->dev, altdev->db_irq, prv->ecc_irq_handler,
-			      IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
-			      ecc_name, altdev);
-	if (rc) {
-		edac_printk(KERN_ERR, EDAC_DEVICE, "No DBERR IRQ resource\n");
-		goto err_release_group1;
+	/* Arria10 has double bit error IRQs. Stratix10 uses SErrors */
+	if (socfpga_is_a10()) {
+		altdev->db_irq = irq_of_parse_and_map(np, 1);
+		if (!altdev->db_irq) {
+			edac_printk(KERN_ERR, EDAC_DEVICE,
+				    "Error allocating DBIRQ\n");
+			rc = -ENODEV;
+			goto err_release_group1;
+		}
+		rc = devm_request_irq(edac->dev, altdev->db_irq,
+				      prv->ecc_irq_handler,
+				      IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
+				      ecc_name, altdev);
+		if (rc) {
+			edac_printk(KERN_ERR, EDAC_DEVICE,
+				    "No DBERR IRQ resource\n");
+			goto err_release_group1;
+		}
 	}
-
 	rc = edac_device_add_device(dci);
 	if (rc) {
 		dev_err(edac->dev, "edac_device_add_device failed\n");
-- 
2.7.4
