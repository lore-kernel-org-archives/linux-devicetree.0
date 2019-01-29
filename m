Return-Path: <SRS0=zlaX=QF=linux.intel.com=thor.thayer@kernel.org>
From: thor.thayer@linux.intel.com
Subject: [PATCH 3/4] EDAC, altera: Skip DB IRQ for Stratix10
Date: Tue, 29 Jan 2019 16:03:47 -0600
Message-Id: <1548799428-10541-4-git-send-email-thor.thayer@linux.intel.com>
In-Reply-To: <1548799428-10541-1-git-send-email-thor.thayer@linux.intel.com>
References: <1548799428-10541-1-git-send-email-thor.thayer@linux.intel.com>
To: bp@alien8.de, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, james.morse@arm.com
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thor Thayer <thor.thayer@linux.intel.com>

Stratix10 Double Bit errors are configured as SErrors
so skip the Double Bit IRQ initialization if Stratix10.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 drivers/edac/altera_edac.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index c89d82aa2776..6a460c742e3f 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1924,20 +1924,25 @@ static int altr_edac_a10_device_add(struct altr_arria10_edac *edac,
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
